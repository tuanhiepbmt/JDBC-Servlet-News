<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
        <div class="row">
            <div class="col-12">
                <div class="card">
                
                    <div class="card-body">
                        <h4 class="card-title">
                            <c:if test="${ not empty userModel }">Cập Nhập Tài Khoản</c:if>
                            <c:if test="${ empty model }">Tạo Tài Khoản</c:if>
                        </h4><form action="" id="formSubmit">
                        <div class="mb-3 row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="idModel">ID</label>
                                    <input type="text" name="id" class="form-control" id="idModel" value="${userModel.getId()}" disabled>
                                    <input type="hidden" name="id" class="form-control" id="idModel" value="${userModel.getId()}">
                                </div>
                            </div>
                            <div class="col-md-9">
                                <div class="form-group">
                                 	<label for="title">Họ và Tên</label>
                                    <input type="text" class="form-control" id="fullName" name="fullName" value="${userModel.getFullName()}">
                                </div>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <div class="col-md-4">
                                <div class="form-group">
                                 	<label for="title">Tên Đăng nhập</label>
                                    <input type="text" class="form-control" id="userName" name="userName" value="${userModel.getUserName()}">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                <label for="thumbnail">Quyền</label>
                                 	<select class="form-control select2" id="roleId" name="roleId">
                                        <option value="">Chọn Quyền</option>
                                    <option <c:if test="${ userModel.getRoleId()==1 }">selected</c:if> value="${ userModel.getRoleId() }">ADMIN</option>
                                    <option <c:if test="${ userModel.getRoleId()==2 }">selected</c:if> value="${ userModel.getRoleId() }">USER</option>
                                	</select>
                                </div>
                            </div>
                             <div class="col-md-4">
                                <div class="form-group">
                                <label for="status">Trạng Thái</label>
                                 	<select class="form-control select2" id="" name="status">
                                        <option value="">Chọn Trạng Thái</option>
                                    <option <c:if test="${ userModel.getStatus()==0 }">selected</c:if> value="${ userModel.getStatus() }">Hoạt động</option>
                                    <option <c:if test="${ userModel.getStatus()==1 }">selected</c:if> value="${ userModel.getStatus() }">Đã xóa</option>
                                	</select>
                                </div>
                            </div>
                        </div>
                       </form>
                        <button id="edit" class="btn btn-success waves-effect waves-light ">
                        		<i class="ri-save-fill "></i> Xác Nhận
                    		</button>
                    </div> 
                </div>
            </div>
        </div>
        <c:url var="APIurl" value="/api-admin-user" />
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
        <script type="text/javascript">
            $("#edit").click(() => {
                var method = $("#idModel").val() != "" ? "PUT" : "POST"
                	var data = {};
                var formData = $('#formSubmit').serializeArray();
                $.each(formData, function (i, v) {
                    data[""+v.name+""] = v.value;
                });
                $.ajax({
                    url: "${APIurl}",
                    type: method,
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify(data),
                    success: function(data) {
                        const Toast = Swal.mixin({
                            toast: true,
                            position: 'top-end',
                            showConfirmButton: false,
                            timer: 3000
                        })
                        if (data.id != null) {
                            Swal.fire(
                                '',
                                'Thêm thành công.',
                                'success',
                                'success'
                            )
                            //window.location.reload()
                        } else {
                            Swal.fire(
                                '',
                                'Sửa thành công.',
                                'success',
                                'success'
                            )
                        }
                        window.location.reload()
                    }
                })

            })
        </script>