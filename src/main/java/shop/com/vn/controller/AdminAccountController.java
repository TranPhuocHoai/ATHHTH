package shop.com.vn.controller;

import shop.com.vn.model.Account;
import shop.com.vn.model.IsAdmin;
import shop.com.vn.service.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AccountAdminController", value = "/account-edit")
public class AdminAccountController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account ac = (Account) request.getSession().getAttribute("auth");

        List<Account> listAccount = AccountService.getAllAccount();

        request.setAttribute("listAccount", listAccount);
        request.getRequestDispatcher("adminAccount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
