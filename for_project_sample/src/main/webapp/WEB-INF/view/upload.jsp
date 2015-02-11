<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<title>파일 업로드</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).ready(function(){
		var cp="<%=request.getContextPath()%>/";
		var target = $("#imghere");
		var file2 = $("#id");
		// form
		$("#fileinfo").submit(function(ev){
			var fd = new FormData(document.forms.namedItem("fileinfo"));
			$.ajax({
				url:cp+"upload",
				data:fd,
				type:"post",
				processData:false,
				contentType:false,
				success:function(responseTxt){
					target.html("<img src='"+cp+responseTxt+"'>");
				}
			});
			ev.preventDefault();
		});
		// single field
		$("#send").click(function(){
			var fd = new FormData();
			fd.append("file", $("#file")[0].files[0]);
			//fd.append("file", document.querySelector("#file").files[0]);
			fd.append("id","은서");
			$.ajax({
				url:cp+"upload",
				data:fd,
				type:"post",
				processData:false,
				contentType:false,
				success:function(responseTxt){
					target.html("<img src='"+cp+responseTxt+"'>");
				}
			});
		});
		// 로컬 이미지 확인
		$("#view").click(function(){
			if(window.FileReader){
				var reader = new FileReader();
				reader.onload=function(ev){
					target.html("<img src='"+ev.target.result+"'>");
				};
				reader.readAsDataURL($("#file")[0].files[0]);
			}
		});
	});
</script>
</head>
<body>
	<form enctype="multipart/form-data" method="post" name="fileinfo" id="fileinfo">
		<label>ID</label> 
		<input type="text" name="id" id="id"  value="124"/><br /> 
		<label>파일 선택:</label> 
		<input id="file" type="file" name="file" required value="111"/> 
		<input type="button" name="view" id="view" value="확인"/>
		<input type="button" name="send" id="send" value="전송"/>
		<input type="submit" value="Stash the file!" />
	</form>
	<div id="imghere"></div>
</body>
</html>