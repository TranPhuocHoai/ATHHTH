package shop.com.vn.controller;

import shop.com.vn.service.AccountService;
import shop.com.vn.tools.Encode;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "adminresetpassword", value = "/admin-reserpassword")
public class adminresetpassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idA = request.getParameter("idA");
        AccountService.resetPassword(Encode.enCodeMD5("111111"), idA);
        response.sendRedirect("account-edit");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
