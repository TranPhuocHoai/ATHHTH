package shop.com.vn.controller;


import shop.com.vn.model.*;
import shop.com.vn.service.FooterService;
import shop.com.vn.service.ProductService;
import shop.com.vn.service.SliderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> list = ProductService.get8Product();

        List<Slider> listSlider = SliderService.getListSlider();


        request.setAttribute("list", list);
        request.setAttribute("listSlider", listSlider);

        request.getRequestDispatcher("home.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
