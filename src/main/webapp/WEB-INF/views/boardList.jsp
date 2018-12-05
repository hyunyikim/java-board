<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Page Content -->
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header">전체글 보기</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <table class="table">
                        <thead>
                          <tr>
                            <th></th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회</th>
                          </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="vo" items="${voList}">
                          <tr>
                            <td id="td_num">${vo.b_num }</td>
                            <c:if test="${vo.b_dept == 0}"> 
                            	<td id="td_title"><a href="boardDetail.do?b_num=${vo.b_num }"><span id="${vo.b_num }" class="a_bTitle">${vo.b_title }</span></a></td>	
                            </c:if>
                            <c:if test="${vo.b_dept != 0}">
                            	<td id="td_title">
	                            	<c:forEach var="i" begin="1" end="${vo.b_dept}" step="1">
                            			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            		</c:forEach>
	                            	<img src="${pageContext.request.contextPath}/resources/img/icon_reply.png" alt="iconReply" title="iconReply" class="icon_reply">
	                            	<a href="boardDetail.do?b_num=${vo.b_num }"><span class="a_bTitle">${vo.b_title }</span></a>
	                            </td>	
                            </c:if>
                            <td id="td_writer">${vo.b_writer }</td>
                            <td id="td_date">${vo.b_date }</td>
                            <td id="td_view">${vo.b_hit }</td>
                          </tr>
                        </c:forEach>
                        </tbody>
                      </table>
                      <div class="col-lg-10" id="box_btnSearch">
                      		<select class="form-control" id="boardCate_select" name="bcate_num">
								<option value="b_all">전체</option>
								<option value="b_title">글제목</option>
								<option value="b_writer">글쓴이</option>
							</select>
                      		<input type="text" class="form-control" placeholder="Search..." id="input_search">
                      		<button class="btn btn-default" type="button" id="btn_search">검색 </button>
                       </div>
                       <div class="col-lg-2" id="box_btnWrite">
                       		<button class="btn btn-default" type="button" id="btn_write">새글 작성</button>
                      </div>
                </div>
            </div>
        </div>
        <!-- /#page-wrapper -->