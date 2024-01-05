<%@ page import="shop.com.vn.model.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="./css/login.css">
</head>
<body>
<%
    String active = (String) request.getAttribute("active");
    String mess1 = (String) request.getAttribute("mess1");
%>
<div class="container <%=active%>" id="container">
    <div class="form-container sign-up-container">
        <form action="signup" method="post">
            <h1>Đăng kí</h1>
            <input name="user" type="text" placeholder="Tên "/>
            <input name="pass" type="password" placeholder="Mật khẩu"/>
            <input name="repass" type="password" placeholder="Nhập lại mật khẩu"/>
            <input name="publicKey" id="publicKey" type="text" placeholder="Nhập public key"/>
            <input id="publicKeyFile" type="file" onchange="readPublicKeyFile()"/>
            <input name="privateKey" id="privateKey" type="text" placeholder="Nhập private key"/>
            <input id="privateKeyFile" type="file" onchange="readPrivateKeyFile()" />
            <div>Nếu chưa có khóa - <a style="cursor: pointer; color: darkorange" onclick="createKeys()">TẠO</a></div>
            <% if (mess1 != null) {%>
            <p style="color: red"><%=mess1%>
            </p>
            <%}%>
            <button type="submit">Đăng kí</button>
        </form>
    </div>
    <div class="form-container sign-in-container">
        <form action="login" method="post">
            <h1>Đăng nhập</h1>
            <input name="user" type="text" placeholder="Tên đăng nhập"/>
            <input name="pass" type="password" placeholder="Mật khẩu"/>
            <a href="./forgotpass.jsp">Quên mật khẩu?</a>
            <% String mess = (String) request.getAttribute("mess");
                String mess2 = (String) request.getAttribute("mess2");
            %>
            <%if (mess2!=null){
            %>
            <p style="color: green"><%=mess2%>
            </p>
            <%}%>
            <%if (mess != null) {%>
            <div class="alert-danger"
                 style="
                        color: white;
                        background-color: #ff0000;
                        font-size: 16px;
                        font-weight: 900;
                        padding: 10px;
                        margin-bottom: 15px;
                        border-radius: 5px;">
                <%= mess %>
            </div>
            <%}%>
            <button type="submit">Đăng nhập</button>
        </form>

    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>Chào mừng bạn đến DST</h1>
                <p>Đăng nhập nhanh để nhận ưu đãi nào!</p>
                <button class="ghost" id="signIn">Đăng nhập</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>Xin chào!</h1>
                <p>Nếu bạn chưa có tào khoản hãy đăng kí ngay nào!</p>
                <button class="ghost" id="signUp">Đăng kí</button>
            </div>
        </div>
    </div>
</div>

<script src="./js/login.js"></script>
<script>
    function createKeys() {
        // Tạo XMLHttpRequest
        var xhr = new XMLHttpRequest();
        var inputPublicKey = document.getElementById('publicKey')
        var inputPrivateKey = document.getElementById('privateKey')
        // Đặt sự kiện khi yêu cầu được hoàn thành
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    // Xử lý phản hồi từ máy chủ
                    var response = JSON.parse(xhr.responseText);

                    // Hiển thị khóa trên trang
                    inputPublicKey.value = response.publicKey;
                    inputPrivateKey.value = response.privateKey;

                    // Tạo một tệp JSON để tải về
                    var blob = new Blob([xhr.responseText], {type: 'application/json'});
                    var link = document.createElement('a');

                    // Thiết lập thông tin tệp
                    link.href = window.URL.createObjectURL(blob);
                    link.download = 'your-key.key';

                    // Thêm liên kết vào trang và kích hoạt sự kiện click
                    document.body.appendChild(link);
                    link.click();

                    // Loại bỏ liên kết sau khi tải về
                    document.body.removeChild(link);
                } else {
                    // Xử lý lỗi nếu có
                    console.error('Failed to fetch keys.');
                }
            }
        };

        // Mở yêu cầu GET đến URL của máy chủ
        xhr.open('GET', 'KeyController?command=createKey', true);

        // Gửi yêu cầu
        xhr.send();
    }
</script>
<script>
    function readPublicKeyFile() {
        var publicKey = document.getElementById('publicKey');
        var fileInput = document.getElementById('publicKeyFile');

        if (fileInput.files.length > 0) {
            var file = fileInput.files[0];
            var reader = new FileReader();
            reader.onload = function (e) {
                try {
                    var key = JSON.parse(e.target.result);
                    publicKey.value = key.publicKey;
                } catch (error) {
                    console.error('Error parsing JSON:', error);
                }
            };
            reader.readAsText(file);
        }
    }
    function readPrivateKeyFile() {
        var privateKey = document.getElementById('privateKey');
        var fileInput = document.getElementById('privateKeyFile');

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