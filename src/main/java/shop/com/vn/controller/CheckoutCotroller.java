package shop.com.vn.controller;

import shop.com.vn.model.Account;
import shop.com.vn.model.Cart;
import shop.com.vn.model.Payment;
import shop.com.vn.model.Product;
import shop.com.vn.service.CartService;
import shop.com.vn.service.OrderService;
import shop.com.vn.service.ProductService;
import shop.com.vn.tools.RSA;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "CheckoutCotroller", value = "/checkout")
public class CheckoutCotroller extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account ac = (Account) request.getSession().getAttribute("auth");
        List<Cart> listCart = CartService.getAllByIda(String.valueOf(ac.getId()));
        request.setAttribute("listCart", listCart);
        List<Payment> listPm = OrderService.getAllPayment();
        request.setAttribute("listPm", listPm);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);

    }
    public static String getDateNow() {
        ZoneId vietnamZone = ZoneId.of("Asia/Ho_Chi_Minh");
        ZonedDateTime nowInVietnam = ZonedDateTime.now(vietnamZone);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy a hh:mm:ss");
        String formattedDate = nowInVietnam.format(formatter);
        return formattedDate;
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String payment = request.getParameter("payment");
        String privateKey = request.getParameter("privateKey");
        Account ac = (Account) request.getSession().getAttribute("auth");
        List<Cart> listCart = OrderService.getListProductCartByIdAcc(ac.getId());
        RSA rsa = new RSA();
        String listProductByOrder = "";
        String infoOrder = "";
        for (Cart c : listCart) {
            listProductByOrder += c.getIdProduct() + c.getQuantity();
        }
        infoOrder = listProductByOrder + firstName + lastName + email + phone + address + payment + getDateNow();
        String hashInforOrder = "";
        try {
            hashInforOrder = rsa.encrypt(infoOrder.replaceAll("\\s", ""), privateKey);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        System.out.println(infoOrder);
        System.out.println(hashInforOrder);
        OrderService.insertOrderByIdAcc(firstName, lastName, phone, email, address, payment, String.valueOf(ac.getId()), hashInforOrder, getDateNow());
        int id = OrderService.getAllOrder().get(OrderService.getAllOrder().size() - 1).getIdorder();
        for (Cart c : listCart) {
            Product p = ProductService.getProductById(String.valueOf(c.getIdProduct()));
            OrderService.insertOrderDetailIdAcc(id, c.getIdProduct(), p.getPrice(), c.getQuantity());
        }
        OrderService.deleteProductByIdCart(String.valueOf(ac.getId()));
        response.sendRedirect("home");
    }
}
