package shop.com.vn.controller;



import shop.com.vn.model.Account;
import shop.com.vn.service.LoginService;
import shop.com.vn.tools.Encode;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        Account ac = LoginService.getAccout(user, Encode.enCodeMD5(pass) );

        if(ac == null){
            request.setAttribute("mess", "Sai user hoặc mật khẩu!");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
        else {
            HttpSession session = request.getSession();
            session.setAttribute("auth", ac);
            response.sendRedirect("home");

        }
    }
}
