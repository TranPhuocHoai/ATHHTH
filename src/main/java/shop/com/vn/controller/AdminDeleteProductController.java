package shop.com.vn.controller;

import shop.com.vn.service.AccountService;
import shop.com.vn.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminDeleteProductController", value = "/AdminDeleteProduct")
public class AdminDeleteProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idP");
        ProductService.deleteProduct(id);
        response.sendRedirect("product-edit");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
