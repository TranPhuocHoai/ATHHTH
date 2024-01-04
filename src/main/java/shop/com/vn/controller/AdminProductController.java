package shop.com.vn.controller;

import shop.com.vn.model.*;
import shop.com.vn.service.AccountService;
import shop.com.vn.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminProductController", value = "/product-edit")
public class AdminProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        List<Product> productList = ProductService.getAllProduct();
        List<Category> listCategories = ProductService.getListCategories();
        List<ListCategoryItem>listCategoryItems =ProductService.getListC();
        request.setAttribute("listCategories", listCategories);
        request.setAttribute("productList", productList);
        request.setAttribute("listCategoryItems", listCategoryItems);
        request.getRequestDispatcher("adminProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
