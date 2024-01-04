package shop.com.vn.controller;

import shop.com.vn.model.Product;
import shop.com.vn.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditProductAdminController", value = "/edit_productadmin")
public class EditProductAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("pid");
        Product p = ProductService.getProductById(id);
        request.setAttribute("product", p);
        request.getRequestDispatcher("edit_Productadmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProduct = request.getParameter("idProduct");
        String name = request.getParameter("name");
        String introduce = request.getParameter("introduce");
        String price = request.getParameter("price");
        String inventory = request.getParameter("inventory");
        ProductService.editProductById(idProduct, name, price, introduce,inventory);
        response.sendRedirect("product-edit");


    }
}
