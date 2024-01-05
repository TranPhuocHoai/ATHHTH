<%@ page import="shop.com.vn.model.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="shop.com.vn.model.ListCategoryItem" %>
<%@ page import="shop.com.vn.model.Account" %>
<%@ page import="shop.com.vn.service.ProductService" %>
<%@ page import="shop.com.vn.model.Cart" %>
<%@ page import="shop.com.vn.service.CartService" %>
<%@ page import="com.sun.org.apache.xpath.internal.compiler.Keywords" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header id="header">
    <div class="header-wrapper">
        <div class="header-main nav-dark">
            <div class="header-inner container">
                <div class=" list-nav" id="logo">
                    <a href="./index.html" title="DST Eyewear - Mắt Kính Chính Hãng, Gía tốt #1">

                        <img src="assets/image/slideHome/logo.png" class="logo-header-dark" alt="">

                    </a>
                </div>
                <div class="list-nav" id="nav">
                    <ul class="center-nav">
                        <li>
                            <a href="home">Trang chủ</a>
                        </li>
                        <% List<Category> listC = ProductService.getListCategories();
                            List<ListCategoryItem> listCC = ProductService.getListC();
                            for (Category c : listC) {
                        %>
                        <li>
                            <a href="category?cid=<%=c.getIdCategory()%>"><%= c.getNameC()%>
                                <i class="ti-angle-down"></i>
                            </a>
                            <ul class="subnav">
                                <%
                                    for (ListCategoryItem cc : listCC) {
                                        if (cc.getIdc() == c.getIdCategory()) {
                                %>
                                <li><a href="categoryi?idI=<%=cc.getId()%>"><%= cc.getname() %>
                                </a></li>
                                <% } %>
                                <% }%>
                            </ul>
                        </li>
                        <%}%>
                        <!-- Tròng kính -->

                        <li>
                            <a href="blog.jsp">Blog</a>
                        </li>
                    </ul>
                </div>


                <div class="list-nav" id="right-header">
                    <ul class="right-nav">
<%--                        <%--%>
<%--                            String keyWordStr = request.getParameter("keyWord");--%>
<%--                            if(keyWordStr == null){--%>
<%--                                keyWordStr ="";--%>

<%--                        %>--%>
<%--                            <li class="item-nav box">--%>
<%--                                <div class="container-1">--%>
<%--                                    <button class="icon" type="submit">--%>
<%--                                        <i class="ti-search"></i>--%>
<%--                                    </button>--%>
<%--                                    <form id="search" action="/SearchControl" method="post" >--%>

<%--                                    <input type="text" value="<%=keyWordStr%>" name="keyWord"  placeholder="Tìm kiếm..."/>--%>
<%--                                    </form>--%>

<%--                                </div>--%>
<%--                            </li>--%>
<%--                        <%--%>
<%--                            }--%>
<%--                        %>--%>
                        <%
                            Account ac = (Account) request.getSession().getAttribute("auth");
                            if (ac == null) {
                        %>
                        <li class="item-nav user">
                            <a href="login.jsp" class="true">
                                <i class="ti-user"> ĐĂNG NHẬP</i>
                            </a>
                        </li>
                        <% }%>

                        <%
                            if (ac != null) {
//                            phân quyền
                                if (ac.getAssistant() == 0 && ac.getManagerHome() == 0 && ac.getManagerBlog() == 0
                                        && ac.getManagerProduct() == 0 && ac.getManagerAccount() == 0) {
                        %>
                        <li class="item-nav user">
                            <a href="profile" class="ue">
                               <%=ac.getUser()%>
                            </a>
                        </li>
                        <% } else {%>
                        <li class="item-nav user" style="margin-left: 10px">
                            <a href="admin-overview" class="ue">
                                Admin
                            </a>
                        </li>
                        <% }}%>

                        <li class="item-nav ">

                            <%if (ac == null) {%>
                            <a href="cart1.jsp" class="cart-header" title="giỏ hàng">
                                <i class="ti-shopping-cart"></i>
                            </a>
                            <div class="numberOfCart">0</div>
                            <% }%>
                            <%
                                if (ac != null) {
                                    List<Cart> c = CartService.getAllItemCart(String.valueOf(ac.getId()));
                            %>
                            <a href="show-cart" class="cart-header" title="giỏ hàng">
                                <i class="ti-shopping-cart"></i>
                            </a>

                            <div class="numberOfCart"><%=c.size()%></div>
                            <% }%>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
    <label for="nav-mobile-input" class="nav-bar-btn">
        <div class="mobile-header">

            <div class="icon-menu">
                <i class="  ti-menu-alt"></i>
            </div>
            <div class="nav-mobile-logo">
                <a href="home">
                    <img src="./image/logo/DST (1089 × 371 px) (4).png" alt="">
                </a>
            </div>
            <div class="nav-mobile-cart">
                <i class="ti-shopping-cart"></i>
            </div>
        </div>
    </label>

    <input type="checkbox" name="" class="nav__input" id="nav-mobile-input">
    <label for="nav-mobile-input" class="nav__overlay">
    </label>

    <!-- nav mobile -->
    <div class="nav__mobile">
        <label for="nav-mobile-input" class="nav__mobile__close">
            <i class="ti-close"></i>
        </label>
        <div class="nav__list__mobile">
            <div class="nav__inner__mobile container">
                <div class=" list__nav__item">
                    <a href="home" class="mobile-link icon"
                       title="DST Eyewear - Mắt Kính Chính Hãng, Gía tốt #1">
                        <img src="./image/logo/DST (1089 × 371 px) (4).png"
                             class="logo-header-dark-mobile" alt="">
                    </a>
                </div>
                <div class="list__nav__item">
                    <ul class="right-nav-mob">
                        <li class="item-nav box">
                            <div class="container-1">
                                        <span class="icon">
                                            <i class="ti-search"></i>
                                        </span>
                                <input type="search" id="search" placeholder="Tìm kiếm..."/>
                            </div>
                        </li>

                    </ul>
                </div>
                <div class="list__nav__item">
                    <ul class="center-nav-mobile">
                        <li>
                            <a href="home" class="mobile-link">Trang chủ</a>
                        </li>
                        <!-- Gọng kính -->
                        <li class="cat-item-mobile cat-parent cat-item-1 has-child">
                            <a href="category.jsp">Gọng kính</a>
                            <button class="toggle collapsed" data-toggle="collapse" data-target="#collapse1"
                                    aria-expanded="false" aria-controls="collapse1">
                                <i class="ti-angle-down"></i>
                            </button>

                        </li>
                        <li>
                            <a href="blog" class="mobile-link">Blog</a>
                        </li>
                    </ul>
                </div>


            </div>

        </div>

    </div>
</header>