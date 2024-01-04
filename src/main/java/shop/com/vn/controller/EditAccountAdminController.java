package shop.com.vn.controller;

import shop.com.vn.model.Account;
import shop.com.vn.model.Product;
import shop.com.vn.service.AccountService;
import shop.com.vn.service.LoginService;
import shop.com.vn.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditAccountAdminController", value = "/edit_accountadmin")
public class EditAccountAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idA = request.getParameter("idA");
        Account acc =  AccountService.getAccount(idA);
        request.setAttribute("account", acc);
        request.getRequestDispatcher("edit_Accountadmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idAccount");
        String pass = request.getParameter("pass");
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String asistant = request.getParameter("asistant");
        String accountMana = request.getParameter("accountMana");
        String productMana = request.getParameter("productMana");
        String homeMana = request.getParameter("homeMana");
        String blogMana = request.getParameter("blogMana");
        String orderMana= request.getParameter("orderMana");


        if(asistant == null ){
            AccountService.editManagerAssistant("0",id);
        }else{
            AccountService.editManagerAssistant("1",id);
        }


        if( accountMana== null ){
            AccountService.editManaAccount("0",id);
        }else{
            AccountService.editManaAccount("1",id);
        }

        if(productMana == null ){
            AccountService.editManaProduct("0",id);
        }else{
            AccountService.editManaProduct("1",id);
        }

        if(homeMana == null ){
            AccountService.editManaHome("0",id);
        }else{
            AccountService.editManaHome("1",id);
        }


        if(blogMana == null ){
            AccountService.editManaBlog("0",id);
        }else{
            AccountService.editManaBlog("1",id);
        }
        if(orderMana == null ){
            AccountService.editManagerOrder("0",id);
        }else{
            AccountService.editManagerOrder("1",id);
        }
        AccountService.editAcountById(email, phone,fullName,address,id);
        response.sendRedirect("account-edit");


    }

}
