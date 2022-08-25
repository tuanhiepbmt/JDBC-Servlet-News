<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="<c:url value='/template/admin/images/favicon.ico'/>" />
<link href="<c:url value='/template/admin/libs/jqvmap/jqvmap.min.css'/>" rel="stylesheet" />
<link href="<c:url value='/template/admin/css/bootstrap.min.css'/>" id="bootstrap-style" rel="stylesheet" type="text/css" />
<link href="<c:url value='/template/admin/css/app.min.css'/>" id="app-style" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value='/template/paging/jquery.twbsPagination.js' />"></script>
</head>
<body>
		
				<!-- end page title -->

				<div class="row">
					<div class="col-xl-3 col-sm-6">
						<div class="card">
							<div class="card-body">
								<div class="d-flex text-muted">
									<div class="flex-shrink-0 me-3 align-self-center">
										<div id="radialchart-1" class="apex-charts" dir="ltr"></div>
									</div>
									<div class="flex-grow-1 overflow-hidden">
										<p class="mb-1">Khách hàng</p>
										<h5 class="mb-3">1.5k</h5>
										<p class="text-truncate mb-0">
											<span class="text-success me-2"> 0.02% <i
												class="ri-arrow-right-up-line align-bottom ms-1"></i></span> So với
											hôm qua
										</p>
									</div>
								</div>
							</div>
							<!-- end card-body -->
						</div>
						<!-- end card -->
					</div>

					<div class="col-xl-3 col-sm-6">
						<div class="card">
							<div class="card-body">
								<div class="d-flex">
									<div class="flex-shrink-0 me-3 align-self-center">
										<div id="radialchart-2" class="apex-charts" dir="ltr"></div>
									</div>
									<div class="flex-grow-1 overflow-hidden">
										<p class="mb-1">Lượt xem sản phẩm</p>
										<h5 class="mb-3">50</h5>
										<p class="text-truncate mb-0">
											<span class="text-success me-2"> 1.7% <i
												class="ri-arrow-right-up-line align-bottom ms-1"></i></span> So với
											hôm qua
										</p>
									</div>
								</div>
							</div>
							<!-- end card-body -->
						</div>
						<!-- end card -->
					</div>

					<div class="col-xl-3 col-sm-6">
						<div class="card">
							<div class="card-body">
								<div class="d-flex text-muted">
									<div class="flex-shrink-0 me-3 align-self-center">
										<div id="radialchart-3" class="apex-charts" dir="ltr"></div>
									</div>
									<div class="flex-grow-1 overflow-hidden">
										<p class="mb-1">Lượt mua hàng</p>
										<h5 class="mb-3">24.03 %</h5>
										<p class="text-truncate mb-0">
											<span class="text-danger me-2"> 0.01% <i
												class="ri-arrow-right-down-line align-bottom ms-1"></i></span> So
											với hôm qua
										</p>
									</div>
								</div>
							</div>
							<!-- end card-body -->
						</div>
						<!-- end card -->
					</div>
					<!-- end col -->

					<div class="col-xl-3 col-sm-6">
						<div class="card">
							<div class="card-body">
								<div class="d-flex text-muted">
									<div class="flex-shrink-0  me-3 align-self-center">
										<div class="avatar-sm">
											<div
												class="avatar-title bg-light rounded-circle text-primary font-size-20">
												<i class="ri-group-line"></i>
											</div>
										</div>
									</div>
									<div class="flex-grow-1 overflow-hidden">
										<p class="mb-1">Sản phẩm mới</p>
										<h5 class="mb-3">10</h5>
										<p class="text-truncate mb-0">
											<span class="text-success me-2"> 0.01% <i
												class="ri-arrow-right-up-line align-bottom ms-1"></i></span> So với
											hôm qua
										</p>
									</div>
								</div>
							</div>
							<!-- end card-body -->
						</div>
						<!-- end card -->
					</div>
				</div>
</body>
</html>