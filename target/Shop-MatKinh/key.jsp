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
<jsp:include page="header.jsp"></jsp:include>
<div class="container-xl px-4 mt-4">
    <!-- Account page navigation-->
    <div class="container container-profile" style="margin-top: 90px;">
        <div class="row" style="height: 70%; justify-content: center;align-items: baseline;">
            <div class="col-xl-8">
                <!-- Account details card-->
                <div class="card mb-4">
                    <div class="card-header">Hồ sơ của tôi</div>
                    <div class="card-body">
                        <form action="KeyController" method="post">
                            <!-- Form Group (username)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="publicKey">Public key</label>
                                <input class="form-control" id="publicKey" name="publicKey" type="text"
                                       placeholder="Nhập public key" value="">
                                <input id="publicKeyFile" type="file" onchange="readPublicKeyFile()"/>
                            </div>
                            <div class="mb-3">
                                <label class="small mb-1" for="privateKey">Private key</label>
                                <input class="form-control" id="privateKey" name="privateKey" type="text"
                                       placeholder="NHập private key" value="">
                                <input id="privateKeyFile" type="file" onchange="readPrivateKeyFile()" />
                            </div>
                            <div>Nếu chưa có khóa - <a style="cursor: pointer; color: darkorange"
                                                       onclick="createKeys()">TẠO</a></div>
                            <% String mes = (String) request.getAttribute("mess");%>
                            <div class="mb-3">
                                <p style="color: red"><%=mes != null ? mes : ""%>
                                </p>
                            </div>
                            <!-- Save changes button-->
                            <button class="btn btn-primary" type="submit">Hoàn thành</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>
<jsp:include page="footer.jsp"></jsp:include>
<script> function createKeys() {
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
}</script>
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
