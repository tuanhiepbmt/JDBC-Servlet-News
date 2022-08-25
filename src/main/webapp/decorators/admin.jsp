<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<link rel="shortcut icon" href="<c:url value='/template/admin/images/favicon.ico'/>" />
<link href="<c:url value='/template/admin/libs/jqvmap/jqvmap.min.css'/>" rel="stylesheet" />
<link href="<c:url value='/template/admin/css/bootstrap.min.css'/>" id="bootstrap-style" rel="stylesheet" type="text/css" />
<link href="<c:url value='/template/admin/css/app.min.css'/>" id="app-style" rel="stylesheet" type="text/css" />
<link href="<c:url value='/template/admin/css/icons.min.css'/>" rel="stylesheet" type="text/css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="<c:url value='/template/paging/jquery.twbsPagination.js' />"></script>

</head>

<body data-sidebar="dark">
	<div id="layout-wrapper">

		<%@include file="/common/admin/header.jsp"%>
		<div class="vertical-menu">

			<div data-simplebar class="h-100">


				<%@include file="/common/admin/sidebar.jsp"%>
			</div>
		</div>
		<div class="main-content">
			<div class="page-content">
				<div class="container-fluid">

						<!-- start page title -->
						<div class="row">
							<div class="col-12">
								<div
									class="page-title-box d-sm-flex align-items-center justify-content-between">
									<h4 class="mb-sm-0">STUNNED</h4>

								</div>
							</div>
						</div>
					</div>
					<decorator:body />
					<%@include file="/common/admin/footer.jsp"%>

			</div>
		</div>
	</div>

	<%@include file="/common/admin/plugin.jsp"%>
</body>

</html>