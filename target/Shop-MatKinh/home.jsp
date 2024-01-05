<%@ page import="java.util.List" %>
<%@ page import="shop.com.vn.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="shop.com.vn.model.Slider" %>
<%@ page import="java.text.NumberFormat" %>
<!DOCTYPE html>
<html lang="en">

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

    <title>DST-Mắt kính hàng đầu Việt Nam</title>


</head>

<body>
<div id="main">
    <!-- begin header -->

    <jsp:include page="header.jsp"></jsp:include>
    <!-- slide trang chủ -->

    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">

        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100"
                     src="https://bizweb.dktcdn.net/100/419/181/themes/809341/assets/slider_3.jpg?1616119031236"
                     alt="First slide">

            </div>
            <%
                List<Slider> listSlider = (List<Slider>) request.getAttribute("listSlider");
                for (Slider s : listSlider) {
            %>
            <div class="carousel-item">
                <img class="d-block w-100" src="<%=s.getImgSlide()%>" alt="Second slide">
            </div>
            <%}%>

        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <!-- mobile -->

    <!--sản phẩm-->
    <div id="wrapper">
        <div class="container pc-tablet">

            <div class="headline">

                <h3 class="section-title section-title-center">

                    <span class="section-title-main">Sản phẩm mới</span>

                </h3>

            </div>
            <ul class="products" id="contentProduct">
                <%
                    NumberFormat nf = NumberFormat.getInstance();
                    nf.setMinimumFractionDigits(0);
                    List<Product> list = (List<Product>) request.getAttribute("list");
                    for (Product p : list) {
                %>
                <li>
                    <div class="product-item-mobile listproduct">
                        <div class="product-top">
                            <a href="detail?id=<%=p.getId()%>" class="product-thumb">
                                <img src="<%=p.getImg()%>" alt="">
                            </a>

                        </div>
                        <div class="product-info">
                            <a href="" class="product-name"><%=p.getName()%>
                            </a>
                            <div class="product-price"><%=nf.format(p.getPrice())%>đ
                            </div>
                            <!--btn lựa chọn nhanh-->
                        </div>
                        <%
                            if (p.getInventory() == 0) {
                        %>
                        <div class="quantityLast">Hết hàng</div>
                        <%}%>
                    </div>
                </li>
                <% }%>
            </ul>
            <div class="product-all-shop">

                <button onclick="loadMore()">Xem thêm</button>

            </div>

        </div>
        <!-- mobile -->
        <div class="container mobile">

            <div class="headline-mobile">

                <h3 class="section-title-mobile section-title-center">
                    <b></b>
                    <span class="section-title-main-mobile" style="color:rgba(76, 110, 43, 0.913);">Sản phẩm
                            mới</span>
                    <b></b>
                </h3>

            </div>
            <ul class="products-mobile">
                <% List<Product> list1 = (List<Product>) request.getAttribute("list");
                    for (Product p : list1) {
                %>
                <li>
                    <div class="product-item-mobile">
                        <div class="product-top-mobile">
                            <a href="" class="product-thumb-mobile">
                                <img src="detail?id=<%=p.getId()%>" alt="">
                            </a>
                        </div>
                        <div class="product-info-mobile">
                            <a href="" class="product-name-mobile"><%=p.getName()%>
                            </a>
                            <div class="product-price"><%=nf.format(p.getPrice())%>đ
                            </div>
                            <!--btn lựa chọn nhanh-->
                        </div>
                    </div>
                </li>
                <%}%>
            </ul>


            <div class="product-all-shop-mobile">
                <a href="./product.html" class="all-product-mobile button">
                    <span>Xem toàn bộ</span>
                </a>
            </div>
        </div>

        <div class="home-blog" id="hombl">
            <div class="container">
                <div class="headline-blog">
                    <div class="section-title-blog">
                        <span class="section-titlebl">Góc DST</span>

                    </div>
                </div>
                <div class="row">
                    <div id="carousel" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel" data-slide-to="1"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="d-none d-lg-block">
                                    <div class="slide-box">
                                        <img src="./image/blog/blog-hom1.jpeg" alt="First slide">
                                        <img src="./image/blog/blog-hom2.png" alt="First slide">
                                        <img src="./image/blog/blog-hom3.png" alt="First slide">
                                        <img src="./image/blog/blog-hom4.png" alt="First slide">
                                    </div>
                                </div>
                                <div class="d-none d-md-block d-lg-none">
                                    <div class="slide-box">
                                        <img src="./image/blog/bolg-hom5.png" alt="First slide">
                                        <img src="./image/blog/bolg-hom6.png" alt="First slide">
                                        <img src="./image/blog/bolg-hom7.png" alt="First slide">
                                    </div>
                                </div>
                                <div class="d-none d-sm-block d-md-none">
                                    <div class="slide-box">
                                        <img src="./image/blog/blog-hom3.png" alt="First slide">
                                        <img src="./image/blog/blog-hom4.png" alt="First slide">
                                    </div>
                                </div>
                                <div class="d-block d-sm-none">
                                    <img class="d-block w-100" src="./image/blog/blog-hom1.jpeg"
                                         alt="First slide">
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="d-none d-lg-block">
                                    <div class="slide-box">
                                        <img src="./image/blog/blog-hom3.png" alt="Second slide">
                                        <img src="./image/blog/blog-hom2.png" alt="Second slide">
                                        <img src="./image/blog/blog-hom1.jpeg" alt="Second slide">
                                        <img src="./image/blog/bolg-hom7.png" alt="Second slide">
                                    </div>
                                </div>
                                <div class="d-none d-md-block d-lg-none">
                                    <div class="slide-box">
                                        <img src="./image/blog/bolg-hom6.png" alt="Second slide">
                                        <img src="./image/blog/bolg-hom5.png" alt="Second slide">
                                        <img src="./image/blog/blog-hom4.png" alt="Second slide">
                                    </div>
                                </div>
                                <div class="d-none d-sm-block d-md-none">
                                    <div class="slide-box">
                                        <img src="./image/blog/blog-hom3.png" alt="Second slide">
                                        <img src="./image/blog/blog-hom2.png" alt="Second slide">
                                    </div>
                                </div>
                                <div class="d-block d-sm-none">
                                    <img class="d-block w-100" src="h./image/blog/blog-hom1.jpeg"
                                         alt="Second slide">
                                </div>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- chính sách bảo hành -->
        <div class="benefit-shop">
            <div class="home-policy">
                <div class="container">
                    <div class="row-1">
                        <div class="main-policy">
                            <div class="headline">

                                <h3 class="section-title section-title-center">

                                    <span class="section-title-main">CHÍNH SÁCH SHOP</span>

                                </h3>

                            </div>
                            <div class="row">
                                <div class="row-item col-md-6  col-sm col-12">
                                    <div class="item-warrent">
                                        <h2>Chính sách bảo hành</h2>
                                        <p>Chúng tôi tự tin là đơn vị có chế độ hậu mãi tốt nhất Việt Nam khi áp
                                            dụng
                                            chính sách bảo hành một năm và đổi trả sản phẩm không cần lí do trong 30
                                            ngày. Hệ thống dữ liệu được cập nhật liên tục và chính xác để dễ dàng
                                            tra
                                            cứu thông tin.</p>
                                    </div>
                                </div>
                                <div class="row-item  col-md-6  col-sm col-12">
                                    <div class="item-warrent">
                                        <h2>Thu cũ - đổi mới</h2>
                                        <p>Thay vì bỏ ra một số tiền lớn để mua kính mắt với dịch vụ “Thu Cũ Đổi
                                            Mới”-
                                            GIẢM 10%" đơn hàng kính mắt của DST, quý khách hàng sẽ được hỗ trợ thu
                                            lại
                                            kính mắt và tròng cũ với giá cực kỳ ưu đãi, tiết kiệm chi phí nhất có
                                            thể.
                                        </p>
                                    </div>
                                </div>
                                <div class="row-item col-md-6  col-sm col-12">
                                    <div class="item-warrent">
                                        <h2>
                                            Khám mắt miễn phí</h2>
                                        <p>thực hiện đo khám mắt miễn phí cho khách hàng khi đặt lịch trước 24
                                            tiếng.
                                            Với các bác sĩ chuyên khoa, trình độ chuyên môn cao. Tư vấn kính mắt phù
                                            với
                                            từng loại bệnh về mắt cho khách hàng.</p>
                                    </div>
                                </div>
                                <div class="row-item col-md-6  col-sm col-12">
                                    <div class="item-warrent">
                                        <h2>Vệ sinh và bảo quản mắt kính</h2>
                                        <p>nhận biết được vấn đề này của mọi người, vậy nên hôm nay DST sẽ hướng dẫn
                                            bạn
                                            cách lau chùi, vệ sinh chiếc kính của bạn thật sạch sẽ mỗi ngày, để có
                                            một
                                            tầm mình thật sáng rõ và tươi mới.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="main-policy-mobile">
                            <div class="headline">

                                <h3 class="section-title section-title-center">
                                    <b></b>
                                    <span class="section-title-main" style="color:rgba(76, 110, 43, 0.913);">CHÍNH
                                            SÁCH
                                            SHOP</span>
                                    <b></b>
                                </h3>

                            </div>
                            <div class="row-mobile">
                                <div class="row-item-mobile col-md-6  col-sm col-12">
                                    <div class="item-warrent-mobile">
                                        <h2>Chính sách bảo hành</h2>
                                        <p>Chúng tôi tự tin là đơn vị có chế độ hậu mãi tốt nhất Việt Nam khi áp
                                            dụng
                                            chính sách bảo hành một năm và đổi trả sản phẩm không cần lí do trong 30
                                            ngày. Hệ thống dữ liệu được cập nhật liên tục và chính xác để dễ dàng
                                            tra
                                            cứu thông tin.</p>
                                    </div>
                                </div>
                                <div class="row-item-mobile  col-md-6  col-sm col-12">
                                    <div class="item-warrent-mobile">
                                        <h2>Thu cũ - đổi mới</h2>
                                        <p>Thay vì bỏ ra một số tiền lớn để mua kính mắt với dịch vụ “Thu Cũ Đổi
                                            Mới”-
                                            GIẢM 10%" đơn hàng kính mắt của DST, quý khách hàng sẽ được hỗ trợ thu
                                            lại
                                            kính mắt và tròng cũ với giá cực kỳ ưu đãi, tiết kiệm chi phí nhất có
                                            thể.
                                        </p>
                                    </div>
                                </div>
                                <div class="row-item-mobile col-md-6  col-sm col-12">
                                    <div class="item-warrent-mobile">
                                        <h2>
                                            Khám mắt miễn phí</h2>
                                        <p>thực hiện đo khám mắt miễn phí cho khách hàng khi đặt lịch trước 24
                                            tiếng.
                                            Với các bác sĩ chuyên khoa, trình độ chuyên môn cao. Tư vấn kính mắt phù
                                            với
                                            từng loại bệnh về mắt cho khách hàng.</p>
                                    </div>
                                </div>
                                <div class="row-item-mobile col-md-6  col-sm col-12">
                                    <div class="item-warrent-mobile">
                                        <h2>Vệ sinh và bảo quản mắt kính</h2>
                                        <p>nhận biết được vấn đề này của mọi người, vậy nên hôm nay DST sẽ hướng dẫn
                                            bạn
                                            cách lau chùi, vệ sinh chiếc kính của bạn thật sạch sẽ mỗi ngày, để có
                                            một
                                            tầm mình thật sáng rõ và tươi mới.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal modal-js">
    <div class="modal-contrainer">
        <div class="close-modal close-modal-js">
            <i class="ti-close"></i>
        </div>

        <div class="header-modal">
            <h4>MK DST1</h4>
        </div>
        <div class="modal-content1 ">

            <div class="modal-left content-item">
                <div class="product-modal">
                    <img src="" alt="">
                </div>
            </div>
            <div class="modal-right content-item">
                <div class="inf-modal">
                    <h5>60</h5>
                    <ul class="introduct">
                        <li>Kính mát unisex bền và tính đàn hồi cao. Ốc vặn được gia công kỹ lưỡng và cẩn thận.</li>
                        <li>Đệm mũi êm ái, tạo cảm giác dễ chịu khi đeo, cân đối giữa hai bên thái dương, mắt và
                            sống mũi.
                        </li>
                        <li>Càng kính chắc chắn, không gây ra vết hằn khó chịu trên da.</li>
                        <li>Dễ phối đồ với nhiều phong cách khác nhau.</li>
                    </ul>
                    <label for="cars">Màu sắc: </label>
                    <select name="cars" id="cars">
                        <option value="volvo">Xám</option>
                        <option value="saab">Hồng</option>
                        <option value="opel">Đen</option>
                        <option value="audi">Xanh</option>
                    </select>
                    <div class="buttons_added">
                        <input class="minus is-form" type="button" value="-">
                        <input aria-label="quantity" class="input-qty" max="Số tối đa" min="Số tối thiểu" name=""
                               type="number" value="">
                        <input class="plus is-form" type="button" value="+">
                        <a href="./cart.html" class="addC">Thêm vào giỏ hàng</a>
                    </div>
                    <div class="footer-modal">
                        <p class="id-modal">Ma 01</p>
                        <p>Danh mục: kính mát</p>
                        <p>Từ khóa: kính mát, Kính mát nam , kính mát nữ</p>
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>
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

<script src="./js/QuickViewButton.js"></script>
<script>
    const watchBtns = document.querySelectorAll('.quick-view-js')
    const modal = document.querySelector('.modal-js')
    const modalClose = document.querySelector('.modal-js')


    function showWatch() {
        modal.classList.add('open')
    }

    function hideWatch() {
        modal.classList.remove('open')
    }


    for (const watBtn of watchBtns) {
        watBtn.addEventListener('click', showWatch)
    }
    modalClose.addEventListener('click', hideWatch)

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