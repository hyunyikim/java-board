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
                            	<td id="td_title"><a href="boardDetail.do?b_num=${vo.b_num }">${vo.b_title }</a></td>	
                            </c:if>
                            <c:if test="${vo.b_dept != 0}">
                            	<td id="td_title">
	                            	<c:forEach var="i" begin="1" end="${vo.b_dept}" step="1">
                            			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            		</c:forEach>
	                            	<img src="${pageContext.request.contextPath}/resources/img/icon_reply.png" alt="iconReply" title="iconReply" class="icon_reply">
	                            	<a href="boardDetail.do?b_num=${vo.b_num }">${vo.b_title }</a>
	                            </td>	
                            </c:if>
                            <td id="td_writer">${vo.b_writer }</td>
                            <td id="td_date">${vo.b_date }</td>
                            <td id="td_view">${vo.b_hit }</td>
                          </tr>
                        </c:forEach>
                        </tbody>
                      </table>
                </div>
            </div>
        </div>
        <!-- /#page-wrapper -->