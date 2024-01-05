<%@ page import="shop.com.vn.model.Footer" %>
<%@ page import="shop.com.vn.service.FooterService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="footer">
    <div class="footer-wrap">
        <div id="block_3">
            <div class="ro  container" id="row-1713151878">
                <%
                    Footer footer = FooterService.getFooter();
                %>
                <div id="footer1" class="item-footer">
                    <div class="col-inner1">

                        <h4 style="font-size: 20px;color: #111111!important;">GIỚI THIỆU</h4>
                        <span style="font-size: 15px; color: #FFFFFF!important;">
                               <%=footer.getIntroduce()%>
                            </span>

                    </div>
                </div>

                <div id="footer2" class="item-footer">
                    <div class="col-inner2">
                        <h4 style="font-size: 20px;color: #111111!important;">LIÊN KẾT</h4>
                        <div class="ux-menu stack stack-col justify-start ux-menu--divider-solid">
                            <div class="ux-menu-link flex menu-item">
                                <a class="ux-menu-link__link flex">
                                        <span class="ux-menu-link__text">
                                              <%=footer.getCertify()%>
                                        </span>
                                </a>
                            </div>

                            <div class="ux-menu-link flex menu-item">
                                <a class="ux-menu-link__link flex">
                                        <span class="ux-menu-link__text">
                                              <%=footer.getPay()%>
                                        </span>
                                </a>
                            </div>

                            <div class="ux-menu-link flex menu-item">
                                <a class="ux-menu-link__link flex">
                                        <span class="ux-menu-link__text">
                                              <%=footer.getPromotion()%>
                                        </span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="footer3" class="item-footer">
                    <div class="col-inner">
                        <h4 style="font-size: 20px;color: #111111!important;">THÔNG TIN LIÊN HỆ</h4>

                        <div class="phone-shop">
                            <a class="ux-menu-link__link flex">
                                    <span class="ux-menu-link__text">
                                        SĐT:   <%=footer.getPhone()%>
                                    </span>
                            </a>
                        </div>
                        <div class="address-shop">
                            <a class="ux-menu-link__link flex">
                                    <span class="ux-menu-link__text">
                                        Địa chỉ:   <%=footer.getAddress()%>
                                    </span>
                            </a>
                            <div class="mail-shop">
                                <a class="ux-menu-link__link flex">
                                    <span class="ux-menu-link__text">
                                        Email:   <%=footer.getEmail()%>
                                    </span>
                                </a>
                            </div>
                            <div class="social-icons follow-icons" style="font-size:115%">
                                <a href="#" class="slow_fade social_button "><img
                                        src="assets/image/social_icons/yt.png"></a>
                                <a href="#" class="slow_fade social_button"><img
                                        src="assets/image/social_icons/twitter.png"></a>
                                <a href="#" class="slow_fade social_button"><img
                                        src="assets/image/social_icons/facebook.png"></a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>
