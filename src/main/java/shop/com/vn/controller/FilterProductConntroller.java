package shop.com.vn.controller;

import shop.com.vn.model.Category;
import shop.com.vn.model.Product;
import shop.com.vn.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FilterProductConntroller", value = "/filter-product")
public class FilterProductConntroller extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] price = request.getParameterValues("price");
        String cid = request.getParameter("cid");
        List<Product> list = ProductService.getListCById(cid);
        Category ca = ProductService.getNameC(Integer.parseInt(cid));
        List<Product> listProByPrice = new ArrayList<>();
        String checked = "checked";
        for (String price0 : price) {
            int price1 = Integer.parseInt(price0);
            int price2 = price1 + 300000;
            for (Product p : list) {
                if (price1==1) {
                    listProByPrice.add(p);
                    request.setAttribute("checked4", checked);
                }
                if (p.getPrice() > price1 && p.getPrice() < price2) {
                    listProByPrice.add(p);
                }
            }
            if (price1 == 0) {
                request.setAttribute("checked0", checked);
            }
            if (price1 == 300000) {
                request.setAttribute("checked1", checked);
            }
            if (price1 == 600000) {
                request.setAttribute("checked2", checked);
            }
            if (price1 == 900000) {
                request.setAttribute("checked3", checked);
            }

        }

        request.setAttribute("list", listProByPrice);
        request.setAttribute("nameC", ca);
        request.getRequestDispatcher("category.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
