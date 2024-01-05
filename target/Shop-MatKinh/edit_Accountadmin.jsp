<%@ page import="java.lang.reflect.Array" %>
<%@ page import="shop.com.vn.model.Account" %>
<%@ page import="shop.com.vn.service.LoginService" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/20/2022
  Time: 2:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="./css/profile.css">
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="./font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Title</title>
</head>
<body>
<div class="container-xl px-4 mt-4">


    <% Account ac = (Account) request.getAttribute("account");


    %>
    <!-- Account page navigation-->
    <div class="container container-profile" style="margin-top: 90px;">


        <nav class="nav nav-borders">
            <a class="nav-link active ms-0" href="#" target="__blank">Hồ sơ</a>
        </nav>


        <div class="row">
            <div class="col-xl-4">
                <!-- Profile picture card-->
                <div class="card mb-4 mb-xl-0">
                    <div class="card-header">Ảnh đại diện</div>
                    <div class="card-body text-center">
                        <img class="img-account-profile rounded-circle mb-2" src="<%=ac.getImg()%>" alt="">
                    </div>
                    <button class="btn btn-primary" type="button">Đổi ảnh</button>
                </div>
            </div>
            <div class="col-xl-8">
                <!-- Account details card-->
                <div class="card mb-4">
                    <div class="card-header">Hồ sơ của tôi</div>
                    <div class="card-body">
                        <form action="edit_accountadmin" method="post">
                            <!-- Form Group (username)-->
                            <input type="hidden" value="<%=ac.getId()%>" name="idAccount">
                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <div>
                                        <label class="small mb-1" for="inputUsername">Tên đăng nhập</label>
                                        <input class="form-control" id="inputUsername" type="text"
                                               placeholder="Enter your username" value="<%=ac.getUser()%>">
                                    </div>
                                    <div>
                                        <label class="small mb-1" for="inputFirstName">Tên đầy đủ</label>
                                        <input class="form-control"
                                               name="fullName"
                                               id="inputFirstName" type="text"
                                               placeholder="Enter your first name" value="<%=ac.getFullName()%>">
                                    </div>
                                    <div>
                                        <label class="small mb-1" for="inputEmailAddress">Email</label>
                                        <input class="form-control"
                                               name="email"
                                               id="inputEmailAddress" type="email"
                                               placeholder="Enter your email address" value="<%=ac.getEmail()%>">
                                    </div>
                                    <div>
                                        <label class="small mb-1" for="inputLocation">Địa chỉ</label>
                                        <input class="form-control"
                                               name="address"
                                               id="inputLocation" type="text"
                                               placeholder="Enter your location" value="<%=ac.getAddress()%>">
                                    </div>
                                    <div>
                                        <label class="small mb-1" for="inputPhone">Số điện thoại</label>
                                        <input class="form-control"
                                               name="phone"
                                               id="inputPhone" type="tel"
                                               placeholder="Enter your phone number" value="<%=ac.getPhone()%>">
                                    </div>
                                </div>
                                <div class="form-group row gx-3 mb-3">

                                    <div class="reviews-counter" style="    margin-left: 100px;">
                                        <h3>Phân quyền</h3><br>
                                        <div class="rate">

                                            <input type="checkbox"
                                                    <% if (ac.getAssistant() == 1) { %>
                                                    checked
                                                    <%}%>
                                                   id="star5" name="asistant"
                                                   value=<%=ac.getAssistant()%>/>
                                            <label for="star5" title="text">Trợ lý</label><br>

                                            <input type="checkbox"
                                                <% if(ac.getManagerAccount()==1){ %>
                                                   checked
                                                <%}%>
                                                   id="star4"
                                                   name="accountMana"
                                                   value=<%=ac.getManagerAccount()%>>
                                            <label for="star4" title="text">Quản lí tài khoản</label><br>

                                            <input type="checkbox"
                                                    <% if (ac.getManagerProduct() == 1) { %>
                                                   checked
                                                    <%}%>
                                                   id="star3"
                                                   name="productMana"
                                                   value="3"/>
                                            <label for="star3" title="text">Quản lí sản phẩm</label><br>
                                            <input type="checkbox"
                                                <% if(ac.getManagerHome()==1){ %>
                                                   checked
                                                <%}%>
                                                   id="star2"
                                                   name="homeMana"
                                                   value=<%=ac.getManagerHome()%>
                                            <label for="star2" title="text">Quản lí trang chủ</label><br>
                                            <input type="checkbox"
                                                    <% if (ac.getManagerBlog() == 1) { %>
                                                   checked
                                                    <%}%>
                                                   id="star1" name="blogMana"
                                                   value=<%=ac.getManagerBlog()%>/>
                                            <label for="star1" title="text">Quản lí Blog</label><br>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Form Row-->

                            <button class="btn btn-primary" type="submit">Lưu thông tin</button>
                            <a href="admin-reserpassword?idA=<%=ac.getId()%>" class="btn btn-primary">Cấp lại mật khẩu</a>
                            <a href="AdminDeleteAccount?idA=<%=ac.getId()%>" class="btn btn-primary" >Xóa tài khoản</a>
                            <button class="btn btn-primary" type="submit">Trang chủ</button>

                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>


</div>
</body>
</html>
