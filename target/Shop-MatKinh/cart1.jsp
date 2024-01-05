<%@ page import="shop.com.vn.model.Product" %>
<%@ page import="shop.com.vn.model.Cart" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="shop.com.vn.service.ProductService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/cart.css">
    <link href="./image/logo/DST%20(1089%20×%20371%20px)%20(4).png" rel="icon"/>
    <link rel="stylesheet" href="./font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="./css/styles.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Giỏ hàng</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">


</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<!-- Search Wrapper Area Start -->
<%--<div class="search-wrapper section-padding-100">--%>
<%--    <div class="search-close">--%>
<%--        <i class="fa fa-close" aria-hidden="true"></i>--%>
<%--    </div>--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-12">--%>
<%--                <div class="search-content">--%>
<%--                    <form action="#" method="get">--%>
<%--                        <input type="search" name="search" id="search" placeholder="Type your keyword...">--%>
<%--                        <button type="submit"><img src="img/core-img/search.png" alt=""></button>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- Search Wrapper Area End -->

<!-- ##### Main Content Wrapper Start ##### -->
<div class="main-content-wrapper  clearfix">

    <!-- Mobile Nav (max width 767px)-->
    <div class="mobile-nav">
        <!-- Navbar Brand -->
        <div class="amado-navbar-brand">
            <a href="index.html"><img src="img/core-img/logo.png" alt=""></a>
        </div>
        <!-- Navbar Toggler -->
        <div class="amado-navbar-toggler">
            <span></span><span></span><span></span>
        </div>
    </div>


    <div class="cart-table-area ">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 col-lg-8">
                    <div class="cart-title mt-50">
                        <h2>Giỏ hàng</h2>
                    </div>

                    <div class="cart-table clearfix">
                        <table class="table table-responsive">
                            <thead>
                            <tr>
                                <th></th>
                                <th>Tên</th>
                                <th>Đơn giá</th>
                                <th>Số lượng</th>
                                <th>Tổng giá</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>



                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-12 col-lg-4">
                    <div class="cart-summary">
                        <h5>Tổng thanh toán</h5>
                        <ul class="summary-table">
                            <li style="text-transform: none"><span>Tổng tiền hàng:</span> 0đ
                            </li>
                            <li><span>Vận chuyển:</span> <span>Miễn phí</span></li>
                            <li style="text-transform: none"><span>Tổng thanh toán:</span>0đ
                            </li>
                        </ul>
                        <div class="cart-btn mt-100">


                            <p class="btn amado-btn w-100">Giỏ hàng của bạn không có sản phẩm</p>


                            <a href="checkout" class="btn amado-btn w-100">Thanh toán</a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<!-- ##### Main Content Wrapper End ##### -->

<!-- ##### Newsletter Area Start ##### -->


<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
<script src="js/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="js/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="js/bootstrap.min.js"></script>
<!-- Plugins js -->
<script src="js/plugins.js"></script>
<!-- Active js -->
<script src="js/active.js"></script>

</body>

</html>