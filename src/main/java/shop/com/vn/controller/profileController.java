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

@WebServlet(name = "profileController", value = "/profile")
public class profileController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            HttpSession session = request.getSession();
            String command = request.getParameter("command");
            String url ="profile.jsp";
            try {
                switch (command) {
                    case "edit":
                        url = "edit-profile";
                        break;
                    case  "logout":
                        session.invalidate();
                        url= "home";
                        break;

                    default:
                        break;
                }
            }catch (Exception e){

            }


        request.getRequestDispatcher(url).forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
