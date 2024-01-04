<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="shop.com.vn.service.OrderService" %>
<%@ page import="shop.com.vn.service.ProductService" %>
<%@ page import="shop.com.vn.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
    <link rel="stylesheet" href="./css/profile.css">
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="./css/order.css">
    <link rel="stylesheet" href="./font/themify-icons/themify-icons.css">

    <title>Document</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="main" style="height: 480px">
    <nav class="nav menu container" style="margin-top: 100px">
        <a class="nav-link active ms-0" href="profile">Hồ sơ</a>
        <a class="nav-link" href="buyOrder">Đơn hàng</a>
    </nav>

    <div class="container">
        <header class="card-header1"> Đơn hàng của tôi</header>
        <%
            List<Order> orderList = (List<Order>) request.getAttribute("listOrder");
            for (Order order : orderList) {
                List<DetailOrder> listDetailOrder = OrderService.getAllOrderDetailById(order.getIdorder());
                int status = order.getStatus();
                String statusString = "";
                if (status == 0) {
                    statusString = "Chờ xác nhận";
                }
                if (status == 1) {
                    statusString = "Đang giao hàng";
                }
                if (status == 2) {
                    statusString = "Thánh công";
                }
                if (status == 3) {
                    statusString = "Đã hủy";
                }
        %>
        <div class="card-body">
            <h6>Mã đơn hàng: <%=order.getIdorder()%>
            </h6>
            <article class="card">
                <div class="card-body row">
                    <div class="col"><strong>Thời gian dự kiến giao:</strong> <br>29 nov 2019</div>
                    <div class="col"><strong>Giao hàng bởi:</strong> <br> DST express, | <i class="fa fa-phone"></i>
                        <%=order.getPhone()%>
                    </div>
                    <div class="col"><strong>Trạng thái:</strong> <br><%=statusString%>
                    </div>
                </div>
            </article>

            <hr>
            <ul class="row">
                <%
                    for (DetailOrder deo : listDetailOrder) {
                        Product p = ProductService.getProductById(String.valueOf(deo.getIdProduct()));
                %>
                <li class="col-md-4">
                    <figure class="itemside mb-3">
                        <div class="aside"><img style="width: 70px; height: 70px" src="<%=p.getImg()%>"></div>
                        <figcaption class=" info align-self-center">
                            <p class="title"><%=p.getName()%><br>Số lượng: <%=deo.getQuantity()%>
                            </p> <span
                                class="text-muted"><%=deo.getPrice()%></span>
                        </figcaption>
                    </figure>
                </li>
                <%}%>
            </ul>
            <hr>

        </div>
        <%}%>
        <%--        <a href="home" class="btn btn-warning" data-abc="true"> <i class="fa fa-chevron-left"></i> Trang chủ</a>--%>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>
