<%@ page import="java.util.List" %>
<%@ page import="shop.com.vn.model.Product" %>
<%@ page import="shop.com.vn.model.Account" %>
<%@ page import="shop.com.vn.service.AccountService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DST EYESWEAR - ADMIN</title>
    <link href="cssAdmin/css/bootstrap.min.css" rel="stylesheet">
    <link href="cssAdmin/css/font-awesome.min.css" rel="stylesheet">
    <link href="cssAdmin/css/datepicker3.css" rel="stylesheet">
    <link href="cssAdmin/css/admin.css" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#sidebar-collapse"><span class="sr-only">Thanh điều hướng</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span></button>
            <a class="navbar-brand" href="#"><span>DST</span>Admin</a>
            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown"><a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                    <em class="fa fa-envelope"></em><span class="label label-danger">15</span>
                </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <div class="dropdown-messages-box"><a href="profile.jsp" class="pull-left">
                                <img alt="image" class="img-circle" src="http://placehold.it/40/30a5ff/fff">
                            </a>
                                <div class="message-body"><small class="pull-right">3 phút trước</small>
                                    <a href="#"><strong>Hồng Siêm</strong> đã bình luận <strong>ảnh của
                                        bạn</strong>.</a>
                                    <br/><small class="text-muted">1:24 chiều - 25/03/2015</small></div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="dropdown-messages-box"><a href="profile.jsp" class="pull-left">
                                <img alt="image" class="img-circle" src="http://placehold.it/40/30a5ff/fff">
                            </a>
                                <div class="message-body"><small class="pull-right">1 giờ trước</small>
                                    <a href="#">Tin nhắn mới từ <strong>Ngọc Trúc</strong>.</a>
                                    <br/><small class="text-muted">12:27 chiều - 25/03/2015</small></div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="all-button"><a href="#">
                                <em class="fa fa-inbox"></em> <strong>Xem tất cả</strong>
                            </a></div>
                        </li>
                    </ul>
                </li>
                <li class="dropdown"><a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                    <em class="fa fa-bell"></em><span class="label label-info">5</span>
                </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li><a href="#">
                            <div><em class="fa fa-envelope"></em> 1 Tin nhắn mới
                                <span class="pull-right text-muted small">3 phút trước</span></div>
                        </a></li>
                        <li class="divider"></li>
                        <li><a href="#">
                            <div><em class="fa fa-heart"></em> 12 lượt thích mới
                                <span class="pull-right text-muted small">4 phút trước</span></div>
                        </a></li>
                        <li class="divider"></li>
                        <li><a href="#">
                            <div><em class="fa fa-user"></em> 5 Người theo dõi mới
                                <span class="pull-right text-muted small">4 phút trước</span></div>
                        </a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div><!-- /.container-fluid -->
</nav>
</body>
</html>
