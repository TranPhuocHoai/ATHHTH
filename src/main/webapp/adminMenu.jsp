<%@ page import="shop.com.vn.model.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<ul class="nav menu" style="flex-direction: column">
    <%
        Account ac = (Account) request.getSession().getAttribute("auth");
        if (ac.getAssistant() == 1) {
    %>

    <li><a href="admin-overview"><em class="fa fa-dashboard">&nbsp;</em> Tổng quan</a></li>
    <%}%>
    <%if (ac.getManagerAccount() == 1) {%>
    <li><a href="account-edit"><em class="fa fa-calendar">&nbsp;</em> Quản lí tài khoản</a></li>
    <%}%>
    <%if (ac.getManagerProduct() == 1) {%>
    <li><a href="product-edit"><em class="fa fa-toggle-off">&nbsp;</em> Quản lý sản phẩm</a></li>
    <%}%>
    <%if (ac.getManagerHome() == 1) {%>
    <li><a href=""><em class="fa fa-toggle-off">&nbsp;</em> Quản lý cửa hàng</a></li>
    <%}%>
    <%if (ac.getManagerOrder() == 1) {%>
    <li><a href="admin-buy-order"><em class="fa fa-toggle-off">&nbsp;</em> Quản lý đơn hàng</a></li>
    <%}%>
    <%if (ac.getManagerBlog() == 1) {%>
    <li><a href=""><em class="fa fa-toggle-off">&nbsp;</em> Quản lý đơn hàng</a></li>
    <%}%>

    </li>
</ul>
</body>
</html>
