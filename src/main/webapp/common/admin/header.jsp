<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp" %>
<%@include file="/common/taglib.jsp"%>

        <header id="page-topbar">
            <div class="navbar-header">
                <div class="d-flex">
                    <!-- LOGO -->
                    <div class="navbar-brand-box text-center">
                        <a href="/admin" class="logo logo-dark">
                            <span class="logo-sm">
                                <img src="<c:url value='/template/admin/images/logo.png'/>" alt="logo-sm-dark" height="22">
                            </span>
                            <span class="logo-lg">
                                <img src="<c:url value='/template/admin/images/logo.png'/>" alt="logo-dark" height="24">
                            </span>
                        </a>

                        <a href="/admin" class="logo logo-light">
                            <span class="logo-sm">
                                <img src="<c:url value='/template/admin/images/logo.png'/>" alt="logo-sm-light" height="22">
                            </span>
                            <span class="logo-lg">
                                <img src="<c:url value='/template/admin/images/logo.png'/>" alt="logo-light" height="60">
                            </span>
                        </a>
                    </div>

                    <button type="button" class="btn btn-sm px-3 font-size-24 header-item waves-effect" id="vertical-menu-btn">
                        <i class="ri-menu-2-line align-middle"></i>
                    </button>

                </div>

                <div class="d-flex">
                    <div class="dropdown d-inline-block user-dropdown">
                        <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="rounded-circle header-profile-user" src="<c:url value='/template/admin/images/logo.png'/>" alt="Header Avatar">
                            <span class="d-none d-xl-inline-block ms-1">Az-News</span>
                            <i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-end">
                            <!-- item-->
                            <a class="dropdown-item text-danger" href="<c:url value="/dang-xuat"/>"><i
                                    class="ri-shut-down-line align-middle me-1 text-danger"></i>Đăng xuất</a>
                        </div>
                    </div>

                </div>
            </div>
           
        </header>