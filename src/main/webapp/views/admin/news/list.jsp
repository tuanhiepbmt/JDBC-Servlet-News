<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>



        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">

                        <h4 class="card-title"><c:if test="${ not empty users }">Danh Sách Tài Khoản</c:if><c:if test="${ empty users }">Danh Sách Sản Phẩm</c:if></h4>
                        <div class="table-rep-plugin">
                            <div class="table-responsive mb-0" data-pattern="priority-columns">
                                <form action="<c:if test='${ not empty users }'><c:url value='admin-user'/></c:if><c:if test='${ empty users }'><c:url value='admin-news'/></c:if>" id="formSubmit" method="get">
                                    <div id="td">
                                        <table id="tech-companies-1" class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>id</th>
                                                    <c:if test="${ empty users }">
                                                    <th data-priority="1">Ảnh bìa</th>
                                                    <th data-priority="1">Tiêu đề</th>
                                                    <th data-priority="3">thể Loại</th>
                                                    <th data-priority="1">Mô tả ngắn</th>
                                                    <th data-priority="3">Ngày đăng</th>
                                                    <th data-priority="3">Tác giả</th>
                                                    <th data-priority="3"><a id="delete" style="cursor: pointer;"><i
                                                        class='fas fa-trash-alt'></i></a></th>
                                                    </c:if>
                                                    <c:if test="${ not empty users }">
                                                    <th data-priority="1">Họ và tên</th>
                                                    <th data-priority="1">Tên đăng nhập</th>
                                                    <th data-priority="3">Trạng thái</th>
                                                    <th data-priority="1">role</th>
                                                    <th data-priority="3"><a id="delete" style="cursor: pointer;"><i
                                                        class='fas fa-trash-alt'></i></a></th>
                                                    </c:if>
                                                </tr>
                                            </thead>
                                            <c:if test="${ empty users }">
                                            <c:forEach var="item" items="${list}">
                                                <tr>
                                                    <td><input style="display: none;" type="checkbox" class="deleteCheckBox" value="${item.getId()}"></td>
                                                    <td>${item.getId()}</td>
                                                    <td>${item.getTitle()}</td>
                                                    <td>${item.getCategoryId()}</td>
                                                    <td>${item.getContent()}</td>
                                                    <td>${item.getShortdescripsion()}</td>
                                                    <td>${item.getCreatedDate()}</td>
                                                    <td>${item.getCreatedBy()}</td>
                                                    <td>
                                                        <a href="<c:url value="/admin-news?type=edit&id=${item.getId()}"/>"><i
                                                        class="fas fa-edit"></i></a></td>
                                                </tr>
                                            </c:forEach>
                                            </c:if>
                                            <c:if test="${ not empty users }">
                                            <c:forEach var="item" items="${users}">
                                                <tr>
                                                    <td><input style="display: none;" type="checkbox" class="deleteCheckBox" value="${item.getId()}"></td>
                                                    <td>${item.getId()}</td>
                                                    <td>${item.getFullName()}</td>
                                                    <td>${item.getUserName()}</td>
                                                    <td>${item.getStatus()}</td>
                                                    <td>${item.getRole().getName()}</td>
                                                    <td>
                                                        <a href="<c:url value="/admin-user?type=edit&id=${item.getId()}"/>"><i
                                                        class="fas fa-edit"></i></a></td>
                                                </tr>
                                                </c:forEach>
                                            </c:if>
                                            

                                        </table>
                                    </div>
                                    <input type="hidden" name="limit" value="" id="limit">
                                    <input type="hidden" name="page" value="" id="page">
                                    <input type="hidden" name="sortName" value="" id="sortName">
                                    <input type="hidden" name="sortBy" value="" id="sortBy">
                                    <input type="hidden" name="type" value="" id="type">
                                </form>
                                <div style="display: flex;justify-content: space-between;">
                                    <ul class="pagination" id="pagination"></ul>
                                    <button onclick="deleteCheckBox()" id="deleteButton" style="display:none;height: 39px;width: 60px;margin-right: 14px" class="btn btn-danger waves-effect waves-light ">
                                <i style="margin-top: 3px" class="ri-delete-bin-6-line"></i>
                            </button>
                                </div>
                                <script>
                                    function handleUpdateProduct(value) {
                                        $(location).attr(
                                            'href',
                                            '/admin/update-product/' +
                                            value);
                                    }
                                </script>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
            <!-- end col -->
        </div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
        <c:if test="${ not empty users }">
        	<c:url var="APIurl" value="/api-admin-user" />
        	<c:url var="NewUrl" value="/admin-user" />
        	<c:set var="sortName" value="fullname"/>
        </c:if>
        <c:if test="${ empty users }">
        	<c:url var="APIurl" value="/api-admin-news" />
        	<c:url var="NewUrl" value="/admin-news" />
        	<c:set var="sortName" value="title"/>
        </c:if>
        <script type="text/javascript">
            var limit = 2;
            $('#pagination').twbsPagination({
                totalPages: ${
                    model.totalPage
                },
                visiblePages: 3,
                startPage: ${
                    model.page
                },
                next: 'Next',
                prev: 'Prev',
                onPageClick: function(event, page) {
                    if (page != ${
                            model.page
                        }) {
                        $('#limit').val(limit);
                        $('#page').val(page);
                        $('#sortName').val("${model.sortName}");
                        $('#sortBy').val("desc");
                        $('#type').val("list");
                        $('#formSubmit').submit();
                    }
                }
            });
            $('.deleteCheckBox').click(() => {
                if ($('.deleteCheckBox').is(':checked')) {
                    document.getElementById('deleteButton').style.display = 'block'
                } else {
                    document.getElementById('deleteButton').style.display = 'none'
                }
            })
            $("#delete").click(() => {
                const element = document.getElementById("td")
                var length = element.getElementsByClassName('deleteCheckBox').length
                if (element.getElementsByClassName('deleteCheckBox')[0].style.display == 'block') {
                    for (let index = 0; index < length; index++) {
                        element.getElementsByClassName('deleteCheckBox')[index].style.display = 'none'
                    }
                } else {
                    for (let index = 0; index < length; index++) {
                        element.getElementsByClassName('deleteCheckBox')[index].style.display = 'block'
                    }
                }
            })

            function deleteCheckBox() {
                let ids = []
                var index = 0
                document.getElementsByClassName("deleteCheckBox").forEach(element => {


                    if (element.checked) {
                        ids[index] = Number(element.value)
                        index++
                    }

                })

                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: 'btn btn-success',
                        cancelButton: 'btn btn-danger'
                    },
                    buttonsStyling: false
                })
                swalWithBootstrapButtons.fire({
                    title: 'Bạn có chắc chắn không',
                    text: "Hãy suy nghĩ thật kĩ trước khi xóa nó",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Đồng ý',
                    cancelButtonText: 'Hủy bỏ',
                    reverseButtons: true
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: "${APIurl}",
                            type: 'DELETE',
                            data: JSON.stringify({
                                ids: ids
                            }),
                            success: function(data) {
                                const Toast = Swal.mixin({
                                    toast: true,
                                    position: 'top-end',
                                    showConfirmButton: true,
                                    timer: 3000
                                })
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Your work has been saved',
                                    showConfirmButton: true,
                                    timer: 15000000
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                            location.replace(
                                                '${NewUrl}?limit=2&page=1&sortName=${sortName}&sortBy=desc&type=list'
                                            )
                                    }
                                })
                            }

                        })
                    }
                })

            }
        </script>