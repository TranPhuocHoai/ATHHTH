package shop.com.vn.controller;

import shop.com.vn.model.Product;
import shop.com.vn.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.List;

@WebServlet(name = "LoadMoreProduct", value = "/load-more-product")
public class LoadMoreProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String amount = request.getParameter("exits");
        List<Product> productList = ProductService.getNextTop12Product(Integer.parseInt(amount));
        NumberFormat nf = NumberFormat.getInstance();
        nf.setMinimumFractionDigits(0);
        PrintWriter out = response.getWriter();
        for (Product p : productList) {
            String isNew = "";
//            if (p.getIsNew() == 1) {
//                isNew = "<div class=\"is-new\">\n" +
//                        "            <h5 class=\"new-item\">New</h5>\n" +
//                        "        </div>";
//            } else {
//                isNew = "";
//            }
            out.println(" <li>\n" +
                    "                    <div class=\"product-item-mobile listproduct\">\n" +
                    "                        <div class=\"product-top\">\n" +
                    "                            <a href=\"detail?id="+p.getId()+"\" class=\"product-thumb\">\n" +
                    "                                <img src=\""+p.getImg()+"\" alt=\"\">\n" +
                    "                            </a>\n" +
                    "\n" +
                    "                        </div>\n" +
                    "                        <div class=\"product-info\">\n" +
                    "                            <a href=\"\" class=\"product-name\">"+p.getName()+"\n" +
                    "                            </a>\n" +
                    "                            <div class=\"product-price\">"+nf.format(p.getPrice())+"đ\n" +
                    "                            </div>\n" +
                    "                            <!--btn lựa chọn nhanh-->\n" +
                    "                        </div>\n" +
                    "                    </div>\n" +
                    "                </li>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
