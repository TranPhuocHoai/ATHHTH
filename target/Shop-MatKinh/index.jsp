<%@ page import="shop.com.vn.model.Account" %><%
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" href="">

</head>
<body>

<%--<% User auth= (User) session.getAttribute("auth"); %>--%>
<%--<% if(auth==null){%>--%>
<%--<p>Bạn chưa đăng nhập</p>--%>
<%--<% }else{ %>--%>
<%--<p>Chào bạn: <%= auth.getFullName()%> </p>--%>
<%--<% } %>--%>

<%--<%@include file="layout/header.jsp" %>--%>

<%-- Main content --%>

<c:set var="auth" value="${sessionScope.auth}"/>
<c:if test="${auth == null}">
    <p>Vui lòng đăng nhập</p>
</c:if>
<c:if test="${auth != null}">
    <p>Xin chào bạn ${auth.fullName}</p>
    <%--    <c:if test="${auth.role>=1}">--%>
    <%--        <p> Vào trang quản trị</p>--%>
    <%--    </c:if>--%>
</c:if>

<c:set var="loginMes" value="${sessionScope.login}"></c:set>
<p class="alert alert-primary"> ${loginMes}</p>

<%----%>
<%--<%@include file="layout/menu.jsp" %>--%>
<%--<%@include file="layout/footer.jsp" %>--%>
</body>
</html>
