package shop.com.vn.controller;

import shop.com.vn.service.AccountService;
import shop.com.vn.tools.Encode;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminDeleteAccountController", value = "/AdminDeleteAccount")
public class AdminDeleteAccountController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idA");
        AccountService.deleteAccount(id);
        response.sendRedirect("account-edit");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
