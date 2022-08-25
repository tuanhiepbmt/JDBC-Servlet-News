<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp" %>
<main>
        <!-- Trending Area Start -->
        <div class="trending-area fix">
            <div class="container">
                <div class="trending-main">
                    <div class="row" style="margin-top: 30px">
                        <div class="col-lg-8">
                            <!-- Trending Top -->
                            <div class="trending-top mb-30">
                                <div class="trend-top-img">
                                    <img src="${ tt.getThumbnail() }" alt="">
                                    <div class="trend-top-cap">
                                        <span>${ tt.getCategory().getName() }</span>
                                        <h2><a href="<c:url value='/details' />?id=${ tt.getId() }">${ tt.getTitle() }</a></h2>
                                    </div>
                                </div>	
                            </div>
                            <!-- Trending Bottom -->
                            <div class="trending-bottom">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="single-bottom mb-35">
                                            <div class="trend-bottom-img mb-30">
                                                <img src="${ tt.getThumbnail() }" alt="">
                                            </div>
                                            <div class="trend-bottom-cap">
                                                <span class="color1">${ tt.getCategory().getName() }</span>
                                                <h4><a href="<c:url value='/details' />?id=${ tt.getId() }">${ tt.getTitle() }</a></h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="single-bottom mb-35">
                                            <div class="trend-bottom-img mb-30">
                                                <img src="${ tt.getThumbnail() }" alt="">
                                            </div>
                                            <div class="trend-bottom-cap">
                                                <span class="color2">${ tt.getCategory().getName() }</span>
                                                    <h4><a href="<c:url value='/details' />?id=${ tt.getId() }">${ tt.getTitle() }</a></h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="single-bottom mb-35">
                                            <div class="trend-bottom-img mb-30">
                                                <img src="${ tt.getThumbnail() }" alt="">
                                            </div>
                                            <div class="trend-bottom-cap">
                                                <span class="color3">${ tt.getCategory().getName() }</span>
                                                <h4><a href="<c:url value='/details' />?id=${ tt.getId() }"> ${ tt.getTitle() }</a></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Riht content -->
                        <div class="col-lg-4">
                            <div class="trand-right-single d-flex">
                                <div class="trand-right-img">
                                    <img style="max-width: 190px;max-height: 107px" src="${ tt.getThumbnail() }" alt="">
                                </div>
                                <div class="trand-right-cap">
                                    <span class="color1">${ tt.getCategory().getName() }</span>
                                    <h4><a href="<c:url value='/details' />?id=${ tt.getId() }">${ tt.getTitle() }</a></h4>
                                </div>
                            </div>
                            <div class="trand-right-single d-flex">
                                <div class="trand-right-img">
                                    <img style="max-width: 190px;max-height: 107px" src="${ tt.getThumbnail() }" alt="">
                                </div>
                                <div class="trand-right-cap">
                                    <span class="color3">${ tt.getCategory().getName() }</span>
                                    <h4><a href="<c:url value='/details' />?id=${ tt.getId() }">${ tt.getTitle() }</a></h4>
                                </div>
                            </div>
                            <div class="trand-right-single d-flex">
                                <div class="trand-right-img">
                                    <img style="max-width: 190px;max-height: 107px" src="${ tt.getThumbnail() }" alt="">
                                </div>
                                <div class="trand-right-cap">
                                    <span class="color2">${ tt.getCategory().getName() }</span>
                                    <h4><a href="<c:url value='/details' />?id=${ tt.getId() }">${ tt.getTitle() }</a></h4>
                                </div>
                            </div>
                            <div class="trand-right-single d-flex">
                                <div class="trand-right-img">
                                    <img style="max-width: 190px;max-height: 107px" src="${ tt.getThumbnail() }" alt="">
                                </div>
                                <div class="trand-right-cap">
                                    <span class="color4">${ tt.getCategory().getName() }</span>
                                    <h4><a href="<c:url value='/details' />?id=${ tt.getId() }">${ tt.getTitle() }</a></h4>
                                </div>
                            </div>
                            <div class="trand-right-single d-flex">
                                <div class="trand-right-img">
                                    <img style="max-width: 190px;max-height: 107px" src="${ tt.getThumbnail() }" alt="">
                                </div>
                                <div class="trand-right-cap">
                                    <span class="color1">${ tt.getCategory().getName() }</span>
                                    <h4><a href="<c:url value='/details' />?id=${ tt.getId() }">${ tt.getTitle() }</a></h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End pagination  -->
    </main>