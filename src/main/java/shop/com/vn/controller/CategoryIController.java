package shop.com.vn.controller;

import shop.com.vn.model.Category;
import shop.com.vn.model.ListCategoryItem;
import shop.com.vn.model.Product;
import shop.com.vn.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryI", value = "/categoryi")
public class CategoryIController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String idI = request.getParameter("idI");
        List<Product> listPByIdi = ProductService.getListItemCatById(idI);
        ListCategoryItem lci = ProductService.getItemName(Integer.parseInt(idI));
        Category c = ProductService.getNameC(lci.getIdc());

        request.setAttribute("c", c);
        request.setAttribute("lci", lci);
        request.setAttribute("listPByIdi", listPByIdi);
        request.getRequestDispatcher("categoryItem.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
