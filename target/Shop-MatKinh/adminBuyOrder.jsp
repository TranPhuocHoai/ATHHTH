<%@ page import="java.util.List" %>
<%@ page import="shop.com.vn.service.CartService" %>
<%@ page import="shop.com.vn.service.ProductService" %>
<%@ page import="shop.com.vn.model.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Các thẻ meta và link stylesheet -->
</head>
<body>
<!-- Phần header của trang -->
<jsp:include page="headeradmin.jsp"></jsp:include>

<!-- Cột sidebar và nút đăng xuất -->
<div class="row tm-content-row">
    <!-- Sidebar -->
    <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
        <!-- Phần hiển thị thông tin người dùng -->
        <div class="profile-sidebar">
            <!-- Avatar và tên người dùng -->
        </div>

        <!-- Form tìm kiếm -->
        <form role="search">
            <div class="form-group">
                <!-- Input tìm kiếm -->
            </div>
        </form>

        <!-- Menu sidebar -->
        <jsp:include page="adminMenu.jsp"></jsp:include>

        <!-- Nút đăng xuất -->
        <ul class="nav menu">
            <li><a href="profile?command=logout"><em class="fa fa-power-off">&nbsp;</em> Đăng xuất</a></li>
        </ul>
    </div>

    <!-- Cột chính -->
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
        <div class="row">
            <!-- Breadcrumbs -->
        </div>

        <!-- Danh sách đơn hàng -->
        <div class="tm-bg-primary-dark tm-block tm-block-products">
            <h2 class="tm-block-title">Danh sách đơn hàng</h2>
            <div class="tm-product-table-container">
                <table class="table table-hover tm-table-small tm-product-table" style="overflow-y: auto">
                    <!-- Header của bảng -->
                    <thead>
                    <tr>
                        <th scope="col">Mã đơn hàng</th>
                        <th scope="col">Họ và tên</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col">Hành động</th>
                    </tr>
                    </thead>
                    <!-- Dữ liệu của bảng -->
                    <tbody>
                    <%-- Duyệt qua danh sách đơn hàng và hiển thị thông tin --%>
                    <%
                        List<Order> orderList = (List<Order>) request.getAttribute("list");
                        for (Order order : orderList) {
                            int id = order.getIdorder();
                            int status = order.getStatus();
                            String statusString = "";
                            if (status == 0) {
                                statusString = "Chờ xác nhận";
                            }
                            if (status == 1) {
                                statusString = "Đang giao hàng";
                            }
                            if (status == 2) {
                                statusString = "Thánh công";
                            }
                            if (status == 3) {
                                statusString = "Đã hủy";
                            }
                    %>
                    <tr>
                        <!-- Hiển thị thông tin của mỗi đơn hàng -->
                        <td><%=order.getIdorder()%></td>
                        <td>
                            <a href="" style="color: #111111">
                                <%=order.getLastName() + order.getFirstName()%>
                            </a>
                        </td>
                        <td class='form-input input-small' id="status<%=id%>">
                            <%=statusString%>
                        </td>
                        <!-- Nút kiểm tra đơn hàng -->
                        <td>
                            <button id="btn<%=id%>" type="button" onclick="checkBill<%=id%>(<%=id%>)">
                                Kiểm tra
                            </button>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Script JavaScript -->
<script>
    <%-- Duyệt qua danh sách đơn hàng và tạo hàm kiểm tra động cho mỗi đơn hàng --%>
    <% for (Order order : orderList) { %>
 // Bước 11: Gửi yêu cầu kiểm tra đơn hàng từ trang web
    function checkBill<%=order.getIdorder()%>(id) {
        var status = document.getElementById("status" + id);
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
// Bước 12: Hiển thị kết quả trực tiếp từ servlet
                document.getElementById("btn<%=order.getIdorder()%>").innerHTML = this.responseText;
                if (this.responseText.includes("Đơn không hợp lệ")) {
                    status.innerHTML = "Đã hủy";
                }
            }
        };
        // Gửi yêu cầu kiểm tra đơn hàng đến servlet CheckOrderController
        xhr.open('GET', 'CheckOrderController?id=' + id, true);
        xhr.send();
    }
    <% } %>
</script>
</body>
</html>
