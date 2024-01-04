package shop.com.vn.controller;

import shop.com.vn.model.ListCategoryItem;
import shop.com.vn.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddProduct", value = "/AddProduct")
public class AddProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ListCategoryItem>listCategoryItems =ProductService.getListC();
        System.out.println(listCategoryItems);
        request.setAttribute("listCategoryItems", listCategoryItems);
        request.getRequestDispatcher("adminAddProduct.jsp").forward(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String introduce = request.getParameter("introduce");
        String price = request.getParameter("price");
        String inventory = request.getParameter("quantity");
        String img = request.getParameter("img");
        String idC= request.getParameter("category");
        String promotion = request.getParameter("promotion");
        String isNew = request.getParameter("isNew");
        ProductService.addProductAdmin(name,img,price,promotion,isNew,introduce,idC,inventory);
        response.sendRedirect("product-edit");
    }
}
