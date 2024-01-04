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
<div class="main-content-wrapper  clearfix">

    <!-- Mobile Nav (max width 767px)-->=
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
                            <%
                                NumberFormat nf = NumberFormat.getInstance();
                                nf.setMinimumFractionDigits(0);
                                int totalPrice = 0;

                                List<Cart> cartList = (List<Cart>) request.getAttribute("listCart");
                                for (Cart c : cartList) {
                                    Product p = ProductService.getProductById(String.valueOf(c.getIdProduct()));
                                    totalPrice += p.getPrice() * c.getQuantity();

                            %>
                            <tr>
                                <td class="cart_product_img">
                                    <a href="detail?id=<%=p.getId()%>"><img src="<%=p.getImg()%>" alt="Product"></a>
                                </td>
                                <td class="cart_product_desc">
                                    <a href="detail?id=<%=p.getId()%>"><%=p.getName()%>
                                    </a>
                                </td>
                                <td class="price">
                                    <%=nf.format(p.getPrice())%>
                                </td>
                                <td class="qty">
                                    <div class="qty-btn d-flex">

                                        <div class="quantity">
                                            <div class="cart-quantity-btn">

                                                <a href="cart?command=subItem&product_id=<%=c.getIdProduct()%> "
                                                   class="btn11"
                                                   style="text-decoration: none;background-color: #fd7e14; padding: 4px">
                                                    <i class="ti-minus" style="color: #FFFFFF"></i>
                                                </a>

                                                <input class="cart-quantity-input" type="text"
                                                       value="<%=c.getQuantity()%>"
                                                       autocomplete="off" size="2" disabled="">

                                                <a href="cart?command=addItem&product_id=<%=c.getIdProduct()%>"
                                                   class="btn11"
                                                   style="text-decoration: none; background-color: #fd7e14;  padding: 4px">
                                                    <i class="ti-plus" style="color: #FFFFFF"></i>
                                                </a>

                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="cart_product_desc">
                                    <%=nf.format(c.getQuantity() * p.getPrice())%>
                                </td>
                                <td class="cart_product_desc">
                                    <a href="cart?command=deleteItem&product_id=<%=c.getIdProduct()%> "
                                       class="btn btn-sm btn-primary btn-minus"
                                       style="text-decoration: none;background-color: #fd7e14">
                                        <i class="ti-close"></i>
                                    </a>
                                </td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-12 col-lg-4">
                    <div class="cart-summary">
                        <h5>Tổng thanh toán</h5>
                        <ul class="summary-table">
                            <li style="text-transform: none"><span>Tổng tiền hàng:</span> <%=nf.format(totalPrice)%>đ
                            </li>
                            <li><span>Vận chuyển:</span> <span>Miễn phí</span></li>
                            <li style="text-transform: none"><span>Tổng thanh toán:</span><%=nf.format(totalPrice)%>đ
                            </li>
                        </ul>
                        <div class="cart-btn mt-100">
                            <%
                                if (cartList.size() == 0) { %>
                            <p class="btn amado-btn w-100">Giỏ hàng của bạn không có sản phẩm</p>
                            <%} else {%>

                            <a href="checkout" class="btn amado-btn w-100">Thanh toán</a>
                            <%}%>
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