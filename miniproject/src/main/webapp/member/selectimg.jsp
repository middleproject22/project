<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/miniproject/css/selectimg.css">
</head>
<body>
<form action="${pageContext.request.contextPath }/member/selectimg.do" method="post" enctype="multipart/form-data">
<div><img id="tempImage" src=""></div>
<div class="filebox">
 <input type="file" class="file" name="file" id="file" onchange="imageView(this)">
 <label for ="file">내사진 올리기</label>
 </div>
 <h3>기본 이미지</h3>
<span style="display:block; border-top:1px solid black"></span> 
 <table>
 
<c:forEach var="img" items="${list }" varStatus="status">
<c:if test = '${status.index%3 ==0}'>
<tr>
</c:if>
 <td class="view_img"  style="border:none" id="${status.index}" onclick="b(${status.index})"><img src='${ img.imgpath}' style="width:200px;height:230px;" onclick="select('${img.imgpath}')" ></td>
 <c:if test = '${status.index%3==2 }'>
 </tr>
 
 </c:if>
</c:forEach>
</table>
<input type="hidden" id="path" name="path" value="" >
<button type="submit">선택</button>
</form>


<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
let path = document.getElementById("path")
function select(imgpath) {
	path.value = imgpath;
	
}
window.onload=function(){
	if('${ck}'=="ck"){
		opener.location.reload();
		window.close();
	}
}

function b(num){
	for(let i=0;i<9;i++){
		let bordline = document.getElementById(i);
		if(num == i){
			bordline.style.border='2px solid blue'
		}else if(num!=i){
			bordline.style.border= '';
		}
	}
}


function imageView(input) {
       if (input.files && input.files[0]) {
           var reader = new FileReader();

           reader.onload = function(e) {
               $('#tempImage').attr('src', e.target.result)
                .width(200)
                .height(230);
           }

           reader.readAsDataURL(input.files[0]);
       }
   }


</script>
</body>
</html>