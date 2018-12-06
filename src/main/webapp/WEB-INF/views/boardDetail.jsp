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
			<div class="col-lg-12"><b>${vo.b_title}</b>&nbsp;&nbsp;|&nbsp;&nbsp;${cateVo.bcate_title} 게시판</div>
			<hr id="hr_boardDetail">	
			<div class="col-lg-12">
				<table id="table_boardDetail">
					<tr><td id="td_boardDetailWriter">글쓴이&nbsp;&nbsp;<b>${vo.b_writer}</b></td></tr>
					<tr><td id="td_boardDetail">${vo.b_content}</td></tr>
				</table>
			</div>
			<div class="col-lg-12"><hr></div>
			<div class="col-lg-12" id="div_comment">너무 좋은 내용 감사합니다 :)<hr></div>
			<div class="col-lg-12">
				<input type="hidden" name="b_num" value="${vo.b_num}" id="b_num" >
				<textarea class="form-control" name="c_content" id="ta_boardDetail"></textarea>
				<input type="submit" id="btn_commentWrite" class="btn btn-default" value="댓글 등록">
			</div>	
			<div class="box_btn">
				<button type="button" id="" class="btn btn-default">글 수정</button>
				<button type="button" id="btn_reply" class="btn btn-default">답글 달기</button>
				<button type="button" id="" class="btn btn-default">글 삭제</button>
			</div>
		</div>
	</div>
</div>