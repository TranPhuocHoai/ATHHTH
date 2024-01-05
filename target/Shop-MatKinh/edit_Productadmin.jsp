<%@ page import="java.lang.reflect.Array" %>
<%@ page import="shop.com.vn.model.Account" %>
<%@ page import="shop.com.vn.model.Product" %>

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


    <%
        Product p = (Product) request.getAttribute("product");

    %>
    <!-- Account page navigation-->
    <div class="container container-profile" style="margin-top: 90px;">



        <div class="row">
            <div class="col-xl-4">
                <!-- Profile picture card-->
                <div class="card mb-4 mb-xl-0">
                    <div class="card-header">Hình ảnh</div>
                    <div class="card-body text-center">
                        <img class="img-account-profile rounded-circle mb-2" src="<%=p.getImg()%>" alt="">
                    </div>
                    <button class="btn btn-primary" type="button">Đổi ảnh</button>
                </div>
            </div>
            <div class="col-xl-8">
                <!-- product details -->
                <div class="card mb-4">
                    <div class="card-header">Thông tin sản phẩm</div>
                    <div class="card-body">
                        <form action="edit_productadmin" method="post">
                            <!-- Form Group (username)-->
                            <input type="hidden" value="<%=p.getId()%>" name="idProduct">
                            <div class="mb-3">
                                <label class="small mb-1" for="inputUsername">Tên sản pẩm</label>
                                <input class="form-control" id="inputUsername" type="text"
                                       name="name"
                                       placeholder="Enter your username" value="<%=p.getName()%>">
                            </div>
                            <!-- Form Row-->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (first name)-->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputFirstName">Giá</label>
                                    <input class="form-control"
                                           name="price"
                                           id="cost" type="text"
                                           placeholder="Enter your first name" value="<%=p.getPrice()%>">
                                </div>
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputFirstName">Số lượng</label>
                                    <input class="form-control"
                                           name="inventory"
                                           id="inputFirstName" type="text"
                                           placeholder="Enter your first name" value="<%=p.getInventory()%>">
                                </div>

                            </div>
                            <!-- Form Row        -->
                            <div class="mb-3">
                                <label class="small mb-1" for="inputEmailAddress">Khuyến mãi</label>
                                <input class="form-control"
                                       name="pass"
                                       id="inputPass" type="text"
                                       placeholder="Enter your email address" value="<%=p.isPromo()%>">
                            </div>

                            <!-- Form Group (email address)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="inputEmailAddress">Trạng thái</label>
                                <input class="form-control"
                                       name="text"
                                       id="inputEmailAddress" type="text"
                                       placeholder="Enter your email address" value="<%=p.isNew()%>">
                            </div>
                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputLocation">Mô tả</label>
                                    <input class="form-control"
                                           name="introduce"
                                           id="inputLocation" type="text"
                                           placeholder="Enter your location" value="<%=p.getInformation()%>">
                                </div>
                            </div>


                            <!-- Save changes button-->
                            <button class="btn btn-primary" type="submit">Lưu thông tin</button>
                            <a href="AdminDeleteProduct?idP=<%=p.getId()%>" class="btn btn-primary" type="submit">Xóa </a>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>


</div>
</body>
</html>
