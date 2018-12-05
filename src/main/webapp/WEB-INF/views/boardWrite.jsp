<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">게시글 작성</h3>
		</div> 
	</div>
	<div class="row">
		<div class="col-lg-12">
			<form method="post">
				<div class="row">
					<div class="col-lg-2 div_middle"><label>게시판 선택</label></div>
					<div class="col-lg-10">
						<select class="form-control" id="boardCate_select" name="bcate_num">
							<option id="boardCate_option">게시판을 선택하세요</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-2 div_middle"><label>글쓴이</label></div>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="b_writer" name="b_writer">
					</div>
				</div>
				<div class="row">
					<div class="col-lg-2 div_middle"><label>글 제목</label></div>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="b_title" name="b_title">
					</div>
				</div>
				<textarea id="b_content" name="b_content"></textarea>
				<input type="hidden" name="" value="">
			<div class="box_btn">
				<button type="submit" class="btn btn-default">글 작성하기</button>
			</div>
			</form>
		</div>
	</div>
</div>