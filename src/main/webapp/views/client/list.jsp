<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<main>
   <!-- Whats New Start -->
    <section class="whats-news-area pt-50 pb-20">
        <div class="container">
            <div class="row">
            <div class="col-lg-12">
                <div class="row d-flex justify-content-between">
                    <div class="col-lg-3 col-md-3">
                        <div class="section-tittle mb-30">
                            <h3>Whats New</h3>
                        </div>
                    </div>
                </div>
              <form id="formSubmit" method="get" action='<c:url value="/list"/>'>
                <div class="row">
                    <div class="col-12">
                        <!-- Nav Card -->
                        <div class="tab-content" id="nav-tabContent">
                            <!-- card one -->
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">           
                                <div class="whats-news-caption">
                                    <div class="row">
                                      <c:forEach var="item" items="${ list }">
                                        <div class="col-lg-4 col-md-4">
                                            <div class="single-what-news mb-100">
                                                <div class="what-img">
                                                    <a href="<c:url value="/details?id="/>${ item.getId() }"><img style="object-fit: cover;max-height: 208px;max-width: 370px" src="${item.getThumbnail() }" alt=""></a>
                                                </div>
                                                <div class="what-cap">
                                                    <a href="#"><span class="color1">${item.getCategory().getName() }</span></a>
                                                   <h4><a href="<c:url value="/datails?id="/>${ item.getId() }">${item.getTitle() }</a></h4>
                                                </div>
                                            </div>
                                        </div>
                                      </c:forEach>
                                       <input type="hidden" name="limit" value="" id="limit">
                                    <input type="hidden" name="page" value="" id="page">
                                    <input type="hidden" name="sortName" value="" id="sortName">
                                    <input type="hidden" name="sortBy" value="" id="sortBy">
                                    <input type="hidden" name="categoryid" value="" id="categoryid">
                                      
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               </form>
            </div>
            
            </div>
        </div>
    </section>
    <!-- Whats New End -->


    <!--Start pagination -->
     <div class="pagination-area pb-45 text-center">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="single-wrap d-flex justify-content-center">    
    					<ul class="pagination" id="pagination"></ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End pagination  -->
    </main>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript"
	src="<c:url value='/template/paging/jquery.twbsPagination.js' />"></script>
    <script type="text/javascript">
    var limit = 3;
    $('#pagination').twbsPagination({
        totalPages: ${
            model.getTotalPage()
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
                $('#categoryid').val(${list[0].getCategoryId()});
                $('#formSubmit').submit();
            }
        }
    });
    </script>
</body>
</html>