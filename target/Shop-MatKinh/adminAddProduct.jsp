<%@ page import="shop.com.vn.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="shop.com.vn.model.ListCategoryItem" %>
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


    <div class="container container-profile" style="margin-top: 90px;">


        <div class="row">

            <div class="col-xl-8">
                <!-- product details -->
                <div class="card mb-4">
                    <div class="card-header">Thông tin sản phẩm</div>
                    <div class="card-body">
                        <form action="AddProduct" method="post">
                            <!-- Form Group (username)-->
                            <input type="hidden" value="" name="idProduct">
                            <div class="mb-3">
                                <label class="small mb-1" for="inputUsername">Tên sản pẩm</label>
                                <input class="form-control" id="inputUsername" type="text"
                                       name="name"
                                       placeholder="Tên sản phẩm" value="">
                            </div>
                            <!-- Form Row-->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (first name)-->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputFirstName">Giá</label>
                                    <input class="form-control"
                                           name="price"
                                           id="cost" type="number"
                                           placeholder="Giá" value="">
                                </div>
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputFirstName">Số lượng</label>
                                    <input class="form-control"
                                           name="quantity"
                                           id="inputFirstName" type="number"
                                           placeholder="Số lượng" value="">
                                </div>

                            </div>
                            <!-- Form Row        -->
                            <div class="mb-3">
                                <label class="small mb-1" >Khuyến mãi</label>
                                <select   name="promotion">
                                    <option value="0">Khuyến mãi </option>
                                    <option value="1">Không khuyến mãi</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="small mb-1" for="inputEmailAddress1">Hình ảnh</label>
                                <input class="form-control"
                                       name="img"
                                       id="inputEmailAddress1" type="text"
                                       placeholder="hinh ảnh" value="">
                            </div>

                            <!-- Form Group (email address)-->
                            <div class="mb-3">
                                <label class="small mb-1" >Trạng thái</label>
                                <select   name="isNew">

                                    <option value="0">Sản phẩm mới</option>
                                    <option value="1">Sản phẩm tồn kho</option>
                                </select>

                            </div>
                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputLocation">Mô tả</label>
                                    <input class="form-control"
                                           name="introduce"
                                           id="inputLocation" type="text"
                                           placeholder="Mô tả" value="">
                                </div>
                            </div>
                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputLocation">Phân loại</label>
                                    <select name="category">

                                        <% List<ListCategoryItem> listCategoryItems = (List<ListCategoryItem>) request.getAttribute("listCategoryItems");
                                            for (ListCategoryItem item : listCategoryItems) {
                                        %>
                                        <option value="<%=item.getId()%>"><%=item.getname()%></option>
                                        <%}%>
                                    </select>
                                </div>
                            </div>

                            <!-- Save changes button-->
                            <button class="btn btn-primary" type="submit">Thêm sản phẩm</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>


</div>
</body>
</html>
