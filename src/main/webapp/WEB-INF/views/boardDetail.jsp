<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">게시글 보기</h3>
		</div> 
	</div>
	<div class="row">
		<div class="col-lg-12"> 
			<table class="boardTable">
				<tr>
					<td id="td_bcateTitle">게시판</td>
					<td>${cateVo.bcate_title}</td>
				</tr>
				<tr>
					<td>글제목</td>
					<td>${vo.b_title}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${vo.b_writer}</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${vo.b_date}</td>
				</tr>
				<tr>
					<td>글내용</td>
					<td id="td_b_content">${vo.b_content}</td>
				</tr>
			</table>
			<div class="box_btn">
				<button type="button" id="" class="btn btn-default">글 수정</button>
				<button type="button" id="btn_reply" class="btn btn-default">답글 달기</button>
				<button type="button" id="" class="btn btn-default">글 삭제</button>
			</div>
		</div>
	</div>
</div>