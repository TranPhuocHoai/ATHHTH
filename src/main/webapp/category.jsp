<%@ page import="shop.com.vn.model.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="shop.com.vn.model.Product" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="shop.com.vn.service.ProductService" %>
<%@ page import="shop.com.vn.model.ListCategoryItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/GongKinh.css">
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


    <title>Gọng kính DST</title>
</head>

<body>
<div id="main">
    <!--        test push branch-->
    <!-- begin header -->

    <jsp:include page="header.jsp"></jsp:include>
    <!-- end header -->
    <!-- content -->
    <%
        String cid = request.getParameter("cid");
        List<Product> arr = ProductService.getListCById(cid);
        int start =0, end = 8;
        if(arr.size() < 8){
            end = arr.size();
        }
        if(request.getParameter("start") != null){
            start = Integer.parseInt(request.getParameter("start"));
        }
        if(request.getParameter("end") != null){
            end = Integer.parseInt(request.getParameter("end"));
        }
        List<Product> list =  ProductService.getListProductByPage(arr,start,end);
        request.setAttribute("list",list);
    %>

    <!-- content -->
    <div class="shop-page-title category-page-title page-title ">
        <div class="page-title-inner flex-row  medium-flex-wrap container">
            <div class="flex-col flex-grow medium-text-center">
                <div class="is-large">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">

                            <li class="breadcrumb-item"><a href="home">TRANG CHỦ</a></li>
                            <%
                                Category ca = (Category) request.getAttribute("nameC");

                            %>
                            <li class="breadcrumb-item active" aria-current="page"><%=ca.getNameC()%>
                            </li>

                        </ol>
                    </nav>
                </div>
                <!-- <div class="category-filtering category-filter-row show-for-medium">
                    <a href="#" data-open="#shop-sidebar" data-visible-after="true" data-pos="left"
                        class="filter-button uppercase plain">
                        <i class="icon-equalizer"></i>
                        <strong>Lọc</strong>
                    </a>
                    <div class="inline-block">
                    </div>
                </div> -->
            </div>
            <div class="flex-col medium-text-center">
                <!-- <p class="woocommerce-result-count hide-for-medium">
                    Hiển thị tất cả 11 kết quả</p> -->
                <%--                <form class="woocommerce-ordering" method="get">--%>
                <%--                    <select name="orderby" class="orderby" aria-label="Đơn hàng của cửa hàng">--%>
                <%--                        <option value="popularity" selected='selected'>Thứ tự theo mức độ phổ biến</option>--%>
                <%--                        <option value="rating">Thứ tự theo điểm đánh giá</option>--%>
                <%--                        <option value="date">Mới nhất</option>--%>
                <%--                        <option value="price">Thứ tự theo giá: thấp đến cao</option>--%>
                <%--                        <option value="price-desc">Thứ tự theo giá: cao xuống thấp</option>--%>
                <%--                    </select>--%>
                <%--                    <input type="hidden" name="paged" value="1"/>--%>
                <%--                </form>--%>
            </div>
        </div>
    </div>
    <!--  nọi dung chính của trang -->
    <div id="content">
        <!-- chia trang thành 2 phần 1 phần là list product, 1 phần là danh mục sp -->
        <div class="category-page-row container">
            <!-- content trái -->
            <div class="left-category">
                <div class="shop-container">
                    <!--  chia 4 -->
                    <div class="list-product">
                        <ul class="products">
                            <%
                                NumberFormat nf = NumberFormat.getInstance();
                                nf.setMinimumFractionDigits(0);
                               // List<Product> list = (List<Product>) request.getAttribute("list");
                                for (Product p : list) {
                            %>
                            <li>
                                <div class="product-item">
                                    <div class="product-top">
                                        <a href="detail?id=<%=p.getId()%>" class="product-thumb">
                                            <img src="<%=p.getImg()%>" alt="">
                                        </a>

                                    </div>
                                    <div class="product-info">
                                        <a href="" class="product-name"><%=p.getName()%>
                                        </a>
                                        <div class="product-price"><%=nf.format(p.getPrice())%>đ
                                        <!--btn lựa chọn nhanh-->
                                    </div>
                                </div>
                                </div>
                            </li>
                            <%}%>
                        </ul>

                    </div>
                </div>

                <div style="clear: both"></div>
                <ul class = "pagination" style ="justify-content: center">
                   <%
                    int a, b;
                    int limit = arr.size()/8;
                    if(limit * 8 < arr.size()){
                        limit +=1;
                    }
                    for(int i = 1; i <= limit; i++){
                        a = (i-1) *8;
                        b = i * 8;
                        if(b > arr.size()){
                            b = arr.size();
                        }
                    %>
                    <li class="page-item " ><a class = "page-link"href="category?cidstart<%=a%>&end<%=b%>"><%=i%></a></li>
                    <%
                        }
                    %>
                </ul>
            </div>
            <!--  content phải -->
            <div class="right-category">
                <div id="shop-sidebar" class="sidebar-inner">
                    <div class="inner-category">
                        <h6 class="widget-title">Danh mục sản phẩm</h6>
                        <div class="is-divider"></div>
                        <% List<Category> listCate = ProductService.getListCategories();
                            List<ListCategoryItem> listItem = ProductService.getListC();
                            for(Category c : listCate) {
                        %>
                        <ul class="product-category">

                            <li class="cat-item cat-parent cat-item-1 has-child">
                                <a href="category?cid=<%=c.getIdCategory()%>"> <%=c.getNameC()%></a>
                                <button class="toggle collapsed" data-toggle="collapse1" data-target="#collapse1"
                                        aria-expanded="false" aria-controls="collapse1">
                                    <i class="ti-angle-down"></i>
                                </button>
                                <ul class="children collapse" id="collapse1">
                                    <%
                                        for(ListCategoryItem cc : listItem){
                                            if(cc.getIdc() == c.getIdCategory()){
                                    %>
                                    <li class="cat-item item-1-children1 item-public">
                                        <a href="category?cid=<%=cc.getId()%>"><%=cc.getname()%></a>
                                    </li>
                                    <%}%>
                                    <%}%>
                                </ul>
                            </li>
<!--
                          <li class="cat-item cat-parent cat-item-2  has-child">
                                <a href="./KinhMat.html">Kính mát</a>
                                <button class="toggle collapsed" data-toggle="collapse" data-target="#collapse2"
                                        aria-expanded="false" aria-controls="collapse2">
                                    <i class="ti-angle-down"></i>
                                </button>
                                <ul class="children collapse" id="collapse2">
                                    <li class="cat-item item-2-children1 item-public">
                                        <a href="./KinhMatEmBe.html">Kính mát em bé</a>
                                    </li>
                                    <li class="cat-item item-2-children2 item-public">
                                        <a href="./KinhMatNam.html">Kính mát nam</a>
                                    </li>
                                    <li class="cat-item item-2-children3 item-public">
                                        <a href="./KinhMatNu.html">Kính mát nữ</a>
                                    </li>
                                </ul>
                            </li>

                            <li class="cat-item cat-parent cat-item-3  has-child">
                                <a href="TrongKinh.jsp">Tròng kính</a>
                                <button class="toggle collapsed" data-toggle="collapse" data-target="#collapse3"
                                        aria-expanded="false" aria-controls="collapse3">
                                    <i class="ti-angle-down"></i>
                                </button>
                                <ul class="children collapse" id="collapse3">
                                    <li class="cat-item item-3-children1 item-public">
                                        <a href="./TrongCan.html">Tròng cận</a>
                                    </li>
                                    <li class="cat-item item-3-children2 item-public">
                                        <a href="./TrongChongASXanh.html">Tròng chống ánh xanh</a>
                                    </li>
                                    <li class="cat-item item-3-children3 item-public">
                                        <a href="./TrongNgayDem.html">Tròng chốt chói ngày & đêm</a>
                                    </li>
                                    <li class="cat-item item-3-children3 item-public">
                                        <a href="./TrongChongUV.HTML">Tròng chốt tia UV</a>
                                    </li>
                                    <li class="cat-item item-3-children3 item-public">
                                        <a href="./TrongDoiMau.html">Tròng đổi màu</a>
                                    </li>
                                    <li class="cat-item item-3-children3 item-public">
                                        <a href="./TrongSieuMong.html">Tròng siêu mỏng</a>
                                    </li>
                                </ul>
                            </li>
-->
                        </ul>
                        <%}%>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- footer -->
    <jsp:include page="footer.jsp"></jsp:include>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        $('.check').click(function () {
            $('.check').not(this).prop('checked', false);
        });
    });
    $(document).ready(function () {
        $('.check1').click(function () {
            $('.check1').not(this).prop('checked', false);
        });
    });
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
    function loadMore() {
        var amount = document.getElementsByClassName("listproduct").length;
        $.ajax({
            url: "load-more-product",
            type: "get", //send it through get method
            data: {
                exits: amount
            },
            success: function (response) {
                var productList = document.getElementById("contentProduct");
                productList.innerHTML += response;

            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
</script>
</body>

</html>