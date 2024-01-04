package shop.com.vn.controller;

import shop.com.vn.model.Account;
import shop.com.vn.model.Cart;
import shop.com.vn.model.Order;
import shop.com.vn.model.Status;
import shop.com.vn.service.CartService;
import shop.com.vn.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminBuy-OrderController", value = "/admin-buy-order")
public class AdminBuyOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order>orderList = OrderService.getAllOrder();
        Account ac = (Account) request.getSession().getAttribute("auth");
        List<Cart> listCart = CartService.getAllByIda(String.valueOf(ac.getId()));
        List<Status> listSta = OrderService.getAllStatus();
        request.setAttribute("listSta", listSta);
        request.setAttribute("listCart",listCart);
        request.setAttribute("list",orderList);
        request.getRequestDispatcher("adminBuyOrder.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
