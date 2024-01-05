<%@ page import="java.util.List" %>
<%@ page import="shop.com.vn.model.Payment" %>
<%@ page import="shop.com.vn.model.Account" %>
<%@ page import="shop.com.vn.service.LoginService" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="shop.com.vn.model.Cart" %>
<%@ page import="shop.com.vn.model.Product" %>
<%@ page import="shop.com.vn.service.ProductService" %><
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="./image/logo/DST%20(1089%20×%20371%20px)%20(4).png" rel="icon"/>
    <link rel="stylesheet" href="./font/themify-icons/themify-icons.css">
    <link href="cssAdmin/css/bootstrap.min.css" rel="stylesheet">
    <link href="cssAdmin/css/font-awesome.min.css" rel="stylesheet">
    <link href="cssAdmin/css/datepicker3.css" rel="stylesheet">
    <link href="cssAdmin/css/admin.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/checkout.css">
    <title>Title</title>
</head>

<body>
<!-- Form Wrapper -->
<form id="form-wrapper" action="checkout" method="post">
    <div id="form-left-wrapper">
        <div id="form-tab-menu">
            <div class="tab-menu-item current shipping-tab">Thanh toán</div>

        </div>
        <!-- Body of the Form -->
        <div id="form-body">
            <div id="shipping-body">
                <div id="contact-details">
                    <% Account ac = (Account) request.getSession().getAttribute("auth");

                        Account a1 = LoginService.getAccoutById(String.valueOf(ac.getId()));

                    %>
                    <div class='form-input input-small'>
                        <label>Họ </label><br/>
                        <input type='text' name='firstName' placeholder='Họ' id='firstname-input'
                               class='name-input'/>
                    </div>
                    <div class='form-input input-small'>
                        <label>Tên</label><br/>
                        <input type='text' name='lastName' placeholder='Tên' id='lastname-input'
                               class='name-input'
                        />
                    </div>
                    <div class='form-input input-small'>
                        <label>Email</label><br/>
                        <input type='email' name='email'
                               value="<%=a1.getEmail() != null ? a1.getEmail():""%>"
                               placeholder='Địa chỉ email' id='email-input'
                               class='email-input'/>
                    </div>
                </div>
                <div class='hr'></div>
                <div id="Address-details">
                    <div class='form-input input-small'>
                        <label>Số điện thoại</label><br/>
                        <input type='text' name='phone'
                               value="<%=a1.getPhone() != null ? a1.getPhone():""%>"
                               placeholder='Số điện thoại' id='contact-input'
                               class='number-input'/>
                    </div>
                    <div class='form-input input-small'>
                        <label>Địa chỉ</label><br/>
                        <input type='text' name='address'
                               value="<%=a1.getAddress() != null ? a1.getAddress():""%>"
                               placeholder='Địa chỉ' id='address-input'
                               class='address-input'/>
                    </div>
                    <div class='form-input input-small'>
                        <label>Phương thức thanh toán</label><br/>


                        <select name="payment" style="min-width: 233px; min-height: 42px">
                            <%
                                List<Payment> listPm = (List<Payment>) request.getAttribute("listPm");
                                for (Payment pm : listPm) {
                            %>
                            <option value="<%=pm.getIdPm()%> "><%=pm.getNamePm()%>
                            </option>

                            <%}%>
                        </select>

                    </div>
                    <div class='hr' style='margin-bottom: 5px;'></div>
                    <div class='form-input input-medium'>
                        <label>Private key **</label><br/>
                        <input type='text' name='privateKey' id='privateKey' placeholder='Nhập private key của bạn'
                               class='country-input'/>
                        <input id="fileInput" type="file" onchange="readPrivateKeyFile()">
                    </div>

                </div>
                <div id="form-submit">
                    <input type='submit' value=' Xác nhận'/>
                </div>
            </div>


        </div>
    </div>
    <!-- Shopping Cart Menu -->
    <div id="form-cart-menu">
        <div class="shopping-cart-head">
            <h1> Giỏ hàng</h1>
        </div>
        <table id="shopping-cart-menu">
            <%
                NumberFormat nf = NumberFormat.getInstance();
                nf.setMinimumFractionDigits(0);
                int totalPrice = 0;

                List<Cart> cartList = (List<Cart>) request.getAttribute("listCart");
                for (Cart c : cartList) {
                    Product p = ProductService.getProductById(String.valueOf(c.getIdProduct()));
                    totalPrice += p.getPrice() * c.getQuantity();

            %>

            <tr class='shopping-cart-item'>
                <input name="idCart" type="hidden" value="<%=c.getIdCart()%>">
                <td class='cart-title'><%=p.getName()%>
                </td>
                <td class='cart-title'><%=c.getQuantity()%>
                </td>
                <td class='cart-title'><%=nf.format(p.getPrice())%>đ</td>

            </tr>
            <%}%>
            <tr class='shopping-cart-total'>
                <td class='cart-total'>Tổng tiền</td>
                <td class='cart-price-total'><%=nf.format(totalPrice)%>đ</td>
            </tr>
        </table>
    </div>
</form>
<script src="./js/checkout.js"></script>
<script>
    function readPrivateKeyFile() {
        var privateKey = document.getElementById('privateKey');
        var fileInput = document.getElementById('fileInput');

        if (fileInput.files.length > 0) {
            var file = fileInput.files[0];
            var reader = new FileReader();
            reader.onload = function (e) {
                try {
                    var key = JSON.parse(e.target.result);
                    privateKey.value = key.privateKey;
                } catch (error) {
                    console.error('Error parsing JSON:', error);
                }
            };
            reader.readAsText(file);
        }
    }
</script>
</body>
</html>
