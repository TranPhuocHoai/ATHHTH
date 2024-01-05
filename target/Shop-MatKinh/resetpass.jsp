<%@ page import="java.util.List" %>
<%@ page import="shop.com.vn.model.Product" %>
<%@ page import="shop.com.vn.model.Account" %>
<%@ page import="shop.com.vn.service.AccountService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>DST-Mắt kính hàng đầu Việt Nam</title>
    <link rel="stylesheet" href="./css/formDky.css">

</head>
<body>

<!-- begin header -->

<jsp:include page="header.jsp"></jsp:include>

<div class="form-login">
    <div class="title">
        <h2>Đặt lại mật khẩu của bạn </h2>
    </div>

    <div class="form-container">


        <form>
            <div class="form-group">
                <label for="exampleInputEmail1">Nhập mail</label>
                <input type="mail" class="form-control" id="exampleInputEmail1" aria-describedby="mail"
                       placeholder="mail">
            </div>
        </form>


        <div style="margin-top: 200px">
            <a href="home" class="px-2 py-2 mr-md-1 rounded1 ">
                <span class="ion-logo-facebook mr-2"></span> Thoát
            </a>

            <a href="./forgotpassword.jsp" class="px-2 py-2 ml-md-1 rounded1">
                <span class="ion-logo-twitter mr-2"></span> Tiếp tục
            </a>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>