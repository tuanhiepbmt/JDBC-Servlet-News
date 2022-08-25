<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp" %>
<header>
        <!-- Header Start -->
        <div class="header-area">
            <div class="main-header ">
                <div class="header-top black-bg d-none d-md-block">
                    <div class="container">
                        <div class="col-xl-12">
                            <div class="row d-flex justify-content-between align-items-center">
                                <div class="header-info-left">
                                    <ul>
                                        <li><img src="<c:url value='/template/client/img/icon/header_icon1.png'/>" alt="">34ºc, Sunny </li>
                                        <li><img src="<c:url value='/template/client/img/icon/header_icon1.png'/>" alt="">Tuesday, 18th June, 2019</li>
                                    </ul>
                                </div>
                                <div class="header-info-right">
                                    <ul class="header-social">
                                        <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                                        <li> <a href="#"><i class="fab fa-pinterest-p"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="header-mid d-none d-md-block">
                    <div class="container">
                        <div class="row d-flex align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-3 col-lg-3 col-md-3">
                                <div class="logo">
                                    <a href="<c:url value='/' />"><img src="<c:url value='/template/client/img/logo/logo.png'/>" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-9 col-lg-9 col-md-9">
                                <div class="header-banner f-right ">
                                    <img src="<c:url value='/template/client/img/hero/header_card.jpg'/>" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="header-bottom header-sticky">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-xl-10 col-lg-10 col-md-12 header-flex">
                                <!-- sticky -->
                                <div class="sticky-logo">
                                    <a href="<c:url value='/' />"><img src="<c:url value='/template/client/img/logo/logo.png'/>" alt=""></a>
                                </div>
                                <!-- Main-menu -->
                                <div class="main-menu d-none d-md-block">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a href='<c:url value="/"/>'>Trang chủ</a></li>
                                            <li><a href="<c:url value="list?categoryid=1&limit=3&page=1&sortName=title&sortBy=desc"/>">Thể Thao</a></li>
                                            <li><a href="<c:url value="list?categoryid=2&limit=3&page=1&sortName=title&sortBy=desc"/>">Thế Giới</a></li>
                                            <li><a href="<c:url value="list?categoryid=3&limit=3&page=1&sortName=title&sortBy=desc"/>">Chính Trị</a></li>
                                            <li><a href="<c:url value="list?categoryid=4&limit=3&page=1&sortName=title&sortBy=desc"/>">Thời Sự</a></li>
                                            <li><a href="<c:url value="list?categoryid=5&limit=3&page=1&sortName=title&sortBy=desc"/>">Góc Nhìn</a>
                                                <!-- <ul class="submenu">
                                                    <li><a href="elements.html">Element</a></li>
                                                    <li><a href="blog.html">Blog</a></li>
                                                    <li><a href="single-blog.html">Blog Details</a></li>
                                                    <li><a href="details.html">Categori Details</a></li>
                                                </ul> -->
                                            </li>
                                            <li><a href="#"><c:if test="${empty USER }">Đăng nhập / Đăng kí</c:if>
                                            				<c:if test="${ not empty USER }">${ USER.fullName }</c:if>
                                            	</a>
                                                <ul class="submenu">
                                                    <c:if test="${empty USER }">
			                                            <li><a href="dang-nhap"><i class="fas fa-sign-in-alt"> Đăng nhập</i></a></li>
			                                            <li><a href="blog.html"><i class="fas fa-registered"> Đăng kí</i></a></li>
                                                    </c:if>
                                                    <c:if test="${ not empty USER }">
                                                    	<li><a style="cursor: pointer;" href="#" onclick="logout()"><i class="fas fa-sign-out-alt"> Đăng xuất</i></a></li>
                                                    </c:if>
                                                    
                                                </ul>
                                            </li>
                                    
                                    
                                        </ul>
                                        <form id="logout" action="dang-xuat" method="post"></form>
                                    </nav>
                                </div>
                                
                            </div>
                            
                            <div class="col-xl-2 col-lg-2 col-md-4">
                                <div class="header-right-btn f-right d-none d-lg-block">
                                    <i class="fas fa-search special-tag"></i>
                                    <div class="search-box">
                                        <form action="#">
                                            <input type="text" placeholder="Search">

                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-md-none"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
    </header>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
function logout()
{
	$("#logout").submit();
}
</script>