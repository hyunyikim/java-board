<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>카페홈</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

	<!-- Summernote editer -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
  
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
 
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.js"></script>
    
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
</head>

<body>
    <div id="wrapper">
		<tiles:insertAttribute name="header" />
        <tiles:insertAttribute name="content" />
        <tiles:insertAttribute name="footer" />
    </div>
    <!-- /#wrapper -->

    

	<script>
		$(document).ready(function(){
			$('#btn_write').click(function(){
				location.href = "boardWrite.do";
			});
			
			// boardWrite.jsp 
			$('#b_content').summernote({
				placeholder: '게시글을 작성해주세요',
		        tabsize: 2,
		        height: 400
			});
			
			$.ajax({ 
				url : "boardCate.do",
				type : "get",
				success : function(data){
					html = ""; 
					$.each(data, function(index, entry){
						html += "<option value='"+data[index].bcate_num+"'>"+data[index].bcate_title+"</option>";
					});
					$('#boardCate_option').after(html);
					
					html2 = "";
					$.each(data, function(index, entry){
						html2 += "<li><a href='board.do?bcate_num="+data[index].bcate_num+"'>"+data[index].bcate_title+"</a></li>";
					});
					$('#li_cateAll').after(html2);
				}
			});
			
			// boardReplay.jsp 
			$('#btn_reply').click(function(){
				location.href = "boardReply.do?b_num=${vo.b_num}";
			});
			
			// 조회수 증가 
			$('.a_bTitle').click(function(){
				var b_num = $(this).attr("id");
				$.ajax({ 
					url : "addHit.do?b_num="+b_num,
					type : "get",
					success : function(data){
						console.log(data);
					}
				});
			});
			
			// 댓글 등록 
			$('#btn_commentWrite').click(function(){
				var b_num = $('#b_num').val();
				var c_content = $('#ta_boardDetail').val();
				$('#ta_boardDetail').val("");
				$.ajax({ 
					url : "commentWrite.do",
					data : {
						"b_num" : b_num,
						"c_content" : c_content 
					},
					type : "post",
					success : function(data){
						/* <div class="col-lg-12" id="div_comment">너무 좋은 내용 감사합니다 :)<hr></div> */
						console.log(data);
					}
				}); 
			});
		});
		
		// 페이징 함수 
		function fn_paging(curPage){
			location.href = "${pageContext.request.contextPath}/board.do?curPage="+curPage;
		}
	</script>
</body>

</html>
