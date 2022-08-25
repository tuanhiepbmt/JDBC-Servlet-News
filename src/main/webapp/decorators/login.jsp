<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Bootstrap Css -->
    <link href="<c:url value='/template/admin/css/bootstrap.min.css'/>" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="<c:url value='/template/admin/css/icons.min.css'/>" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="<c:url value='/template/admin/css/app.min.css'/>" id="app-style" rel="stylesheet" type="text/css" />

</head>

<body class="bg-pattern">
	<decorator:body/>
	
    <script src="<c:url value='/template/admin/libs/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/template/admin/libs/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
    <script src="<c:url value='/template/admin/libs/metismenu/metisMenu.min.js'/>"></script>
    <script src="<c:url value='/template/admin/libs/simplebar/simplebar.min.js'/>"></script>
    <script src="<c:url value='/template/admin/libs/node-waves/waves.min.js'/>"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    <script src="<c:url value='/template/admin/js/app.js'/>"></script>
    <script src="./public<c:url value='/template/admin/js/pages/main.js'/>"></script>
  <!--  <script>

        function login() {
            $.ajax({
                url: '/admin/login',
                type: 'POST',
                data: {
                    email: $('#useremail').val(),
                    password: $('#userpassword').val()
                },
                success: function(data) {
                    if (data.message != 'Sai tên đăng nhập hoặc mật khẩu') {
                        setCookie('tokenAdmin', data.token, 1)
                        location.replace("/admin");
                    } else {
                        const Toast = Swal.mixin({
                            toast: true,
                            position: 'top-end',
                            showConfirmButton: false,
                            timer: 3000
                        })
                        Toast.fire({
                            type: "warning",
                            title: data.message
                        })
                    }
                }
            })
        }
    </script>
    -->
</body>

</html>