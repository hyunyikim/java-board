<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">답글 작성</h3>
		</div> 
	</div>
	<div class="row">
		<div class="col-lg-12">
			<form method="post">
				<div class="row">
					<div class="col-lg-2 div_middle"><label>게시판</label></div>
					<div class="col-lg-10" id="div_cateTitle">
						${cateVo.bcate_title}
					</div>
				</div>
				<div class="row">
					<div class="col-lg-2 div_middle"><label>답글 제목</label></div>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="b_title" name="b_title">
					</div>
				</div>
				<textarea id="b_content" name="b_content"></textarea>
				<input type="hidden" name="b_grp" value="${b_num}">
				<input type="hidden" name="bcate_num" value="${cateVo.bcate_num}">
			<div class="box_btn">
				<button type="submit" class="btn btn-default">답글 작성하기</button>
			</div>
			</form>
		</div>
	</div>
</div>