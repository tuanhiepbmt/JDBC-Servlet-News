<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
        <div class="row">
            <div class="col-12">
                <div class="card">
                
                    <div class="card-body">
                        <h4 class="card-title">
                            <c:if test="${ not empty model }">Cập Nhập Bài Viết</c:if>
                            <c:if test="${ empty model }">Thêm Bài Viết</c:if>
                        </h4><form action="" id="formSubmit">
                        <div class="mb-3 row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="idModel">ID</label>
                                    <input type="text" class="form-control" id="idModel" value="${model.getId()}" disabled>
                                    <input type="hidden" name="id" class="form-control" id="idModel" value="${model.getId()}">
                                </div>
                            </div>
                            <div class="col-md-9">
                                <div class="form-group">
                                 	<label for="title">Tiêu đề</label>
                                    <input type="text" class="form-control" id="title" name="title" value="${model.getTitle()}">
                                </div>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <div class="col-md-4">
                                <div class="form-group">
                                 	<label for="thumbnail">Ảnh bìa</label>
                                    <input type="text" class="form-control" id="thumbnail" name="thumbnail" value="${model.getThumbnail()}">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                 <label for="categoryId">Thể Loại</label>
                                    <select class="form-control select2" id="categoryId" name="categoryId">
                                        <option value="">Chọn Thể Loại</option>
                                    <c:forEach var="item" items="${ category }">
                                    <option <c:if test="${ model.getCategoryId()==item.getId() }">selected</c:if> value="${ item.getId() }">${ item.getName() }</option></c:forEach>
                                </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">		
                                 	<label for="shortdescripsion">Mô Tả Ngắn</label>
                                    <input type="text" class="form-control" id="shortdescripsion" name="shortdescripsion" value="${model.getShortdescripsion()}">
                                </div>
                            </div>
                        </div>
                       
                        <div class="mb-3 row">
                            <div class="form-group">
                                 	<label for="content">Nội Dung</label>
                                <textarea rows="7" class="form-control " id="content" name="content">${ model.getContent()}</textarea>
                            </div>
                        </div></form>
                        <button id="edit" class="btn btn-success waves-effect waves-light ">
                        		<i class="ri-save-fill "></i> Xác Nhận
                    		</button>
                    </div> 
                </div>
            </div>
        </div>
        <c:url var="APIurl" value="/api-admin-news" />
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