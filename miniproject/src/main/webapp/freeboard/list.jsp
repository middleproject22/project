<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
    <link rel="stylesheet" href="../css/index.css">
    <title>Document</title>

</head>

<body>
    <nav class="navbar navbar-expand-lg py-3 sicky-top bgc shadow-lg">
        <div class="container">
            <div class="col col-md-3 text-start">
                <sapn class="text_margine"><a href="#">나의 냉장고</a></sapn>
                <span class="text_margine"><a href="#">레시피</a></span>
                <span class="text_margine"><a href="${pageContext.request.contextPath }/freeboard/list.do">게시판</a></span>
            </div>
            <div class="col col-md-6 text-center">
                <nav class="navbar-brand">
                    <a href="index.html"><img class="logo" src="../imgs/logo3.png"></a>
                </nav>
            </div>
            <div class="col col-md-3 text-end">
               <span class="text_margine"><a href="#">로그인</a></span>
                <span class="text_margine"><a href="#">회원가입</a></span>
            </div>
        </div>
    </nav>
<h3>자유게시판</h3>
<table border="1">
<tr><th>전체</th><th>잡담</th><th>후기</th><th>요청</th></tr>
</table>
<table border="1">
<tr><th>작성자</th><th>글내용</th><th>추천수</th></tr>
</table>
<table border="1">
<tr><th>글내용</th><th>글내용</th><th>추천수</th></tr>
</table>
<table border="1">
<a href="${pageContext.request.contextPath }/freeboard/add.do">글작성</a><br/>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>