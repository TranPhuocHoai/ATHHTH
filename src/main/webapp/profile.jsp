<%@ page import="shop.com.vn.model.Account" %>
<%@ page import="shop.com.vn.service.LoginService" %>
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
    <jsp:include page="header.jsp"></jsp:include>

    <% Account ac = (Account) request.getSession().getAttribute("auth");
        Account a1 = LoginService.getAccoutById(String.valueOf(ac.getId()));
    %>
    <!-- Account page navigation-->
    <div class="container container-profile" style="margin-top: 90px;">


        <nav class="nav nav-borders">
            <a class="nav-link active ms-0" href="profile">Hồ sơ</a>
            <a class="nav-link" href="buyOrder">Đơn mua</a>
            <a class="nav-link" href="#">Thông báo</a>
        </nav>


        <div class="row">
            <div class="col-xl-4">
                <!-- Profile picture card-->
                <div class="card mb-4 mb-xl-0">
                    <div class="card-header">Ảnh đại diện</div>
                    <div class="card-body text-center">

                        <img class="img-account-profile rounded-circle mb-2" src="<%=a1.getImg()%>" alt="">

                        <div class="small font-italic text-muted mb-4">Dụng lượng file tối đa 1 MB</div>
                        <div class="small font-italic text-muted mb-4">Định dạng:.JPEG, .PNG</div>


                        <button class="btn btn-primary" type="button">Chọn ảnh</button>
                    </div>
                </div>
            </div>
            <div class="col-xl-8">
                <!-- Account details card-->
                <div class="card mb-4">
                    <div class="card-header">Hồ sơ của tôi</div>
                    <div class="card-body">
                        <form action="edit-profile">
                            <!-- Form Group (username)-->
                            <input type="hidden" value="<%=ac.getId()%>" name="idAccount">
                            <% String mes = (String) request.getAttribute("mess");%>
                            <div class="mb-3">
                                <p style="color: green"><%=mes != null ? mes : ""%>
                                </p>
                            </div>
                            <div class="mb-3">
                                <label class="small mb-1" for="inputUsername">Tên đăng nhập</label>
                                <input class="form-control" id="inputUsername" type="text"
                                       placeholder="Enter your username" value="<%=ac.getUser()%>">
                            </div>
                            <!-- Form Row-->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (first name)-->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputFirstName">Tên đầy đủ</label>
                                    <input class="form-control"
                                           name="fullName"
                                           id="inputFirstName" type="text"
                                           placeholder="Nhập họ và tên"
                                           value="<%=a1.getFullName() != null ? a1.getFullName() : ""%>">
                                </div>

                            </div>
                            <!-- Form Group (email address)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="inputEmailAddress">Email</label>
                                <input class="form-control"
                                       name="email"
                                       id="inputEmailAddress" type="email"
                                       placeholder="Nhập gmail"
                                       value="<%=a1.getEmail() != null ? a1.getEmail() : ""%>">
                            </div>
                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputLocation">Địa chỉ</label>
                                    <input class="form-control"
                                           name="address"
                                           id="inputLocation" type="text"
                                           placeholder="Nhập địa chỉ"
                                           value="<%=a1.getAddress() != null ? a1.getAddress() : ""%>">
                                </div>
                            </div>
                            <!-- Form Row-->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (phone number)-->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputPhone">Số điện thoại</label>
                                    <input class="form-control"
                                           name="phone"
                                           id="inputPhone" type="tel"
                                           placeholder="Nhập số điện thoại"
                                           value="<%=a1.getPhone() != null ? a1.getPhone() : ""%>">
                                </div>
                                <!-- Form Group (birthday)-->

                            </div>
                            <!-- Save changes button-->
                            <button class="btn btn-primary" type="submit">Lưu thông tin</button>

                            <button class="btn btn-primary" type="button"><a href="profile?command=logout"
                                                                             style=" color: #fff;">Đăng xuất</a>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>
