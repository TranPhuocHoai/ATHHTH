package shop.com.vn.controller;

import shop.com.vn.service.AccountService;
import shop.com.vn.service.LoginService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditProfileController", value = "/edit-profile")
public class EditProfileController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idAccount");
        String pass = request.getParameter("pass");
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        AccountService.editProfileAcountById(pass,email,phone,fullName,address,id);
        response.sendRedirect("profile");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
