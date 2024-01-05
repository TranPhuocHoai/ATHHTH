<%@ page import="java.util.List" %>

<%@ page import="shop.com.vn.service.CartService" %>
<%@ page import="shop.com.vn.service.ProductService" %>
<%@ page import="shop.com.vn.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./image/logo/DST%20(1089%20×%20371%20px)%20(4).png" rel="icon"/>
    <link rel="stylesheet" href="./font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<%--    <link rel="stylesheet" href="./css/templatemo-style.css"/>--%>

    <title>Title</title>
</head>
<body>
<jsp:include page="headeradmin.jsp"></jsp:include>
<% List<Product> productList = (List<Product>) request.getAttribute("productList");


%>
<%--<div class="container mt-5">--%>
<!-- row -->
<div class="row tm-content-row">
    <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
        <div class="profile-sidebar">
            <div class="profile-userpic">
                <img src="http://placehold.it/50/30a5ff/fff" class="img-responsive" alt="">
            </div>
            <div class="profile-usertitle">
                <div class="profile-usertitle-name">Tên tài khoản</div>
                <div class="profile-usertitle-status"><span class="indicator label-success"></span>đang hoạt động</div>
            </div>
            <div class="clear"></div>
        </div>
        <div class="divider"></div>
        <form role="search">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Tìm kiếm">
            </div>
        </form>
        <jsp:include page="adminMenu.jsp"></jsp:include>
        <ul class="nav menu">


            <li><a href="profile?command=logout"><em class="fa fa-power-off">&nbsp;</em> Đăng xuất</a></li>
        </ul>
    </div><!--/.sidebar-->
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
        <div class="row">
            <ol class="breadcrumb">
                <li><a href="admin">
                    <em class="fa fa-home"></em>
                </a></li>
                <li class="active">Tổng quan</li>
            </ol>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
            <div class="tm-bg-primary-dark tm-block tm-block-products">
                <h2 class="tm-block-title">Danh sách sản phẩm</h2>
                <div class="tm-product-table-container">
                    <table class="table table-hover tm-table-small tm-product-table" style="overflow-y: auto">
                        <thead>
                        <tr>
                            <th scope="col">TÊN SẢN PHẨM</th>
                            <th scope="col">SỐ LƯỢNG KHO</th>
                            <th scope="col">PHÂN LOẠI</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for (Product p : productList) {
                        %>
                        <tr>
                            <td>
                                <a href="edit_productadmin?pid=<%=p.getId()%>" style="color: #111111">
                                    <%=p.getName()%>
                                </a>
                            </td>
                            <td><%=p.getInventory()%>
                            </td>
                            <td><%=ProductService.getItemName(p.getCiditem()).getname()%>
                            </td>

                        </tr>
                        <%}%>


                        </tbody>
                    </table>
                </div>
                <!-- table container -->
            </div>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
            <div class="tm-bg-primary-dark tm-block tm-block-product-categories" style="min-height: 725px;">
                <h2 class="tm-block-title">Danh mục sản phẩm</h2>
                <div class="tm-product-table-container">
                    <table class="table tm-table-small tm-product-table">
                        <tbody>
                        <% List<ListCategoryItem> listCategoryItems = (List<ListCategoryItem>) request.getAttribute("listCategoryItems");
                            for (ListCategoryItem item : listCategoryItems) {
                        %>
                        <tr>
                            <td class="tm-product-name">
                                <%=item.getname()%>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>
                <!-- table container -->
                <a
                        href="AddProduct"
                        class="btn btn-primary btn-block text-uppercase mb-3"
                >Thêm sản phẩm mới</a
                >
            </div>
        </div>
    </div>

</div>

</body>
</html>
