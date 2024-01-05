package shop.com.vn.controller;

import shop.com.vn.model.DetailOrder;
import shop.com.vn.model.Key;
import shop.com.vn.model.Order;
import shop.com.vn.service.OrderService;
import shop.com.vn.tools.RSA;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "CheckOrderController", value = "/CheckOrderController")
public class CheckOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 // Bước 1: Nhận tham số
        // Lấy ID đơn hàng từ tham số request
        String id = request.getParameter("id");
        // Tạo đối tượng RSA để sử dụng trong quá trình giải mã
        RSA rsa = new RSA();
// Bước 3: Lấy thông tin đơn hàng từ cơ sở dữ liệu
        // Lấy thông tin đơn hàng từ cơ sở dữ liệu dựa trên ID
        Order order = OrderService.getOrderById(id);
        try {
// Bước 4: Lấy mã hash từ đơn hàng
            // Lấy mã hash đã lưu trữ trong đơn hàng
            String hashInfo = order.getHashInfOrder();

// Bước 5: Lấy chi tiết đơn hàng và xây dựng thông tin đơn hàng hiện tại
            // Lấy chi tiết đơn hàng từ cơ sở dữ liệu
            List<DetailOrder> detailOrderList = OrderService.getAllOrderDetailById(order.getIdorder());
            String listProductByOrder = "";
            String infoOrder = "";
            // Xây dựng một chuỗi thông tin đơn hàng từ các chi tiết sản phẩm và thông tin khác
            for (DetailOrder deo : detailOrderList) {
                listProductByOrder += deo.getIdProduct() + deo.getQuantity();
            }
            infoOrder = listProductByOrder + order.getLastName() + order.getFirstName()  + order.getEmail() + order.getPhone()
                    + order.getAddress() + order.getPayment() + order.getCreate_date();
// Bước 6: Lấy khóa mã hóa
            // Lấy khóa mã hóa liên quan đến đơn hàng
            Key key = getKeyByOrder(order);
            String keyTest = OrderService.getKeyByIdAStillValid(order.getIdAcc());
            // Nếu có khóa mới, sử dụng khóa mới
            if (key != null) {
                keyTest = key.getKey_text();
            }
// Bước 7: Giải mã mã hash
            // Giải mã mã hash để so sánh với thông tin đơn hàng đã xây dựng
            String infoDecrypt = rsa.decrypt(hashInfo, keyTest);
// Bước 8: So sánh thông tin
            response.setCharacterEncoding("UTF-8");
            // So sánh thông tin giải mã với thông tin đơn hàng
            if (infoDecrypt.equals(infoOrder.replaceAll("\\s", ""))) {
// Bước 9: Hiển thị kết quả cho người dùng
                // Nếu thông tin khớp, gửi phản hồi là đơn hàng hợp lệ
                response.getWriter().write(" <button type=\"button\">\n" +
                        "                                Đơn hợp lệ\n" +
                        "                            </button>");
            } else {
// Bước 10: Hủy đơn hàng và hiển thị kết quả
                // Nếu thông tin không khớp, hủy đơn hàng và gửi phản hồi là đơn hàng không hợp lệ
                OrderService.canceOderByid(order.getIdorder());
                response.getWriter().write(" <button type=\"button\">\n" +
                        "                                Đơn không hợp lệ\n" +
                        "                            </button>");
            }
        } catch (Exception e) {
            // Xử lý ngoại lệ và hủy đơn hàng khi có lỗi
            OrderService.canceOderByid(order.getIdorder());
            response.getWriter().write(" <button type=\"button\">\n" +
                    "                                Đơn không hợp lệ\n" +
                    "                            </button>");
        }

    }
    // Phương thức để lấy khóa liên quan đến đơn hàng
    public static Key getKeyByOrder(Order order) throws ParseException {
        Key key = null;
        String pattern = "dd/MM/yyyy a hh:mm:ss";
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        Date day_order = formatter.parse(order.getCreate_date());

        // Lấy danh sách tất cả các khóa liên quan đến tài khoản
        for (Key key1 : OrderService.getAllKeyByIDA(order.getIdAcc())) {
            Date day_create = formatter.parse(key1.getCreate_date());
            Date day_expired = formatter.parse(key1.getExpirate_date());
            // Kiểm tra xem khóa có hiệu lực trong khoảng thời gian của đơn hàng không
            if (day_order.after(day_create) && day_order.before(day_expired)) {
                key = key1;
                break;
            }

        }
        return key;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
