package shop.com.vn.controller;

import shop.com.vn.model.Product;
import shop.com.vn.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchControl", value = "/SearchControl")
public class SearchControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           String  keyWordStr = request.getParameter("keyWord");
           HttpSession session = request.getSession();
            List<Product> listSearch = ProductService.getListByKeyWord(keyWordStr);
            if(keyWordStr == null || keyWordStr.equals("")){
               response.sendRedirect("home.jsp");
            }else{
                session.setAttribute("listSearch",listSearch);
                response.sendRedirect("Search.jsp");
            }
//           System.out.println(keyWordStr);
           request.setAttribute("listSearch", listSearch);
           request.setAttribute("keyWordStr",keyWordStr);
           request.getAttribute(keyWordStr);
           request.getRequestDispatcher("Search.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
