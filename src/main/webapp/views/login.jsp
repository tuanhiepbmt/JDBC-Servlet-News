<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp" %>
<div class="bg-overlay"></div>
    <div class="account-pages my-5 pt-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-4 col-lg-6 col-md-8">
                    <div class="card">
                        <div class="card-body p-4">
                            <div class="">
                                <div class="text-center">
                                    <a href="/" class="">
                                        <img src="<c:url value='/template/admin/images/logo-dark.png'/>" alt="" height="24" class="auth-logo logo-dark mx-auto">
                                        <img src="<c:url value='/template/admin/images/logo-light.png'/>" alt="" height="24" class="auth-logo logo-light mx-auto">
                                    </a>
                                </div>
                                <!-- end row -->
                                <h4 class="font-size-18 text-muted mt-2 text-center">Chào mừng quản trị viên</h4>
                                <p class="mb-5 text-center">Đăng nhập để vào trang quản trị.</p>
								<form action="<c:url value="/dang-nhap"/>" method="post">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-4">
                                            <label class="form-label" for="username">Email</label>
                                            <input type="text" class="form-control" id="username" name="username" placeholder="Email">
                                        </div>
                                        <div class="mb-4">
                                            <label class="form-label" for="userpassword">Mật khẩu</label>
                                            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                                            <p style="color: red;text-align:center;"><c:if test="${ not empty message }">${	message }</c:if>
                                        </div>

                                        <div class="row">
                                            <div class="col">
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="customControlInline">
                                                    <label class="form-label" class="form-check-label" for="customControlInline">Ghi nhớ</label>
                                                </div>
                                            </div>
                                            <div class="col-7">
                                                <div class="text-md-end mt-3 mt-md-0">
                                                    <a href="auth-recoverpw.html" class="text-muted"><i class="mdi mdi-lock"></i> Quên mật khẩu</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-grid mt-4">
                                            <button class="btn btn-primary waves-effect waves-light" type="submit">Đăng nhập</button>
                                        </div>
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end row -->
        </div>
    </div>