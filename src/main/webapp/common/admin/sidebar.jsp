<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp" %>
        <div id="sidebar-menu">
            <!-- Left Menu Start -->
            <ul class="metismenu list-unstyled" id="side-menu">
                <li class="menu-title">Menu</li>

                <li>
                    <a href="/admin-home" class="waves-effect">
                        <i class="mdi mdi-home-variant-outline"></i>
                        <span>Trang chủ</span>
                    </a>
                </li>


                <li class="menu-title">Các thành phần</li>

                <li>
                    <a href="<c:url value='/admin-user?type=list&page=1&limit=2&sortName=fullname&sortBy=desc'/>" class="waves-effect">
                        <i class="ri-file-user-fill"></i>
                        <span>Người dùng</span>
                    </a>
                </li>

                <li>
                    <a href="javascript: void(0);" onclick="gowning()" class="waves-effect">
                        <i class="ri-printer-line"></i>
                        <span class="badge rounded-pill bg-danger float-end">3</span>
                        <span>comment</span>
                    </a>
                    <!-- <ul class="sub-menu" aria-expanded="false">
                        <li><a href="/admin-home/orders">Tất cả đơn hàng</a></li>
                        <li><a href="/admin-home/order1">Chờ xác nhận<span
                            class="badge rounded-pill bg-danger float-end">3</span></a>
                        </li>
                        <li><a href="/admin-home/order2">Đang giao hàng</a></li>
                        <li><a href="/admin-home/order3">Đã giao hàng</a></li>
                    </ul> -->
                </li>

                <li>
                    <a href="javascript: void(0);" class="has-arrow waves-effect">
                        <i class=" ri-store-fill"></i>
                        <span>Bài Viết</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="<c:url value='/admin-news?type=list&page=1&limit=2&sortName=title&sortBy=desc'/>">Danh sách Bài Viết</a></li>
                        <li><a href="<c:url value='/admin-news?type=edit'/>">Thêm Bài Viết</a></li>
                    </ul>
                </li>


            </ul>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
        <script type="text/javascript">
		const Toast = Swal.mixin({
			toast: true,
			position: 'top-end',
			showConfirmButton: false,
			timer: 3000
		})
	function gowning()
	{
		Toast.fire({
			type: "warning",
			title: 'Tính năng đang phát Triển'
		})
	}
</script>
        