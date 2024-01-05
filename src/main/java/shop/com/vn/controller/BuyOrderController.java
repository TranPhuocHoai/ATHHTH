package shop.com.vn.controller;

import shop.com.vn.model.Account;
import shop.com.vn.model.Order;
import shop.com.vn.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BuyOrderController", value = "/buyOrder")
public class BuyOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Account ac = (Account) request.getSession().getAttribute("auth");
        List<Order> listOrder = OrderService.getAllOrderById(String.valueOf(ac.getId()));

        request.setAttribute("listOrder", listOrder);
        request.getRequestDispatcher("buyOrder.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
