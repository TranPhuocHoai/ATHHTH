package shop.com.vn.controller;

import shop.com.vn.db.JDBiConnector;
import shop.com.vn.model.Account;
import shop.com.vn.model.Category;
import shop.com.vn.model.ListCategoryItem;
import shop.com.vn.service.AccountService;
import shop.com.vn.service.LoginService;
import shop.com.vn.service.ProductService;
import shop.com.vn.tools.Encode;
import shop.com.vn.tools.RSA;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "SignUpController", value = "/signup")
public class SignUpController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String re_pass = request.getParameter("repass");
        String publicKey = request.getParameter("publicKey");
        String privateKey = request.getParameter("privateKey");
        RSA rsa = new RSA();
        LoginService lg = new LoginService();
        Account account = lg.checkAccount(user);
        String testKey = "";
        try {
            String encrypt = rsa.encrypt(user, privateKey);
            testKey = rsa.decrypt(encrypt, publicKey);
        } catch (Exception e) {
            request.setAttribute("mess1", "Khóa không hợp lệ, hãy thử lại!");
        }
        if (user.equals(testKey)) {
            if (user == null || pass == null || re_pass == null) {
                response.sendRedirect("login.jsp");
            } else {
                if (account == null) {
                    if (pass.equals(re_pass)) {
                        lg.signUpA(user, Encode.enCodeMD5(pass));
                        List<Account> list = AccountService.getAllAccount();
                        lg.addKeyUpA(list.get(list.size() - 1).getId(), publicKey, getDateNow());
                        request.setAttribute("mess2", "Đăng ký thành công, hãy đăng nhập");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    } else {
                        response.sendRedirect("login.jsp");
                    }
                } else {
                    response.sendRedirect("login.jsp");
                }
            }
        } else {
            request.setAttribute("active", "right-panel-active");
            request.setAttribute("mess1", "Khóa không hợp lệ, hãy thử lại!");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        }
    }
}
