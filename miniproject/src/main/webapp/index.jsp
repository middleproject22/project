<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>�Խ���</h3>
	<a href="${pageContext.request.contextPath }/freeboard/list.do">�۸��</a><br /> 
</body>
=======
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
    <link rel="stylesheet" href="./css/index.css">
    <title>Document</title>

</head>

<body>
    <nav class="navbar navbar-expand-lg py-3 sicky-top bgc shadow-lg">
        <div class="container">
            <div class="col col-md-3 text-start">
                <sapn class="text_margine"><a href="#">나의 냉장고</a></sapn>
                <span class="text_margine"><a href="#">레시피</a></span>
                <span class="text_margine"><a href="#">게시판</a></span>
            </div>
            <div class="col col-md-6 text-center">
                <nav class="navbar-brand">
                    <a href="index.html"><img class="logo" src="./imgs/logo3.png"></a>
                </nav>
            </div>
            <div class="col col-md-3 text-end">
               <span class="text_margine"><a href="#">로그인</a></span>
                <span class="text_margine"><a href="#">회원가입</a></span>
            </div>
        </div>
    </nav>
    <div class="main">
        <div class="row ">
            <div class="col col-md-8 m-auto">
                <div class="recommandlist" style="display: flex; justify-content: space-evenly;  height: 291px;">
                    <div class="userpick">1</div>
                    <div class="userpick">2</div>
                    <div class="userpick">3</div>
                    <div class="userpick">4</div>
                    <div class="userpick">5</div>
                    <div class="userpick">6</div>
                </div>
            </div>
        </div>

    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="./js/index.js"></script>


    <script>
        $(document).ready(function () {
            $('.recommandlist').slick({
                slidesToShow: 3,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 2000,
            });
        })

    </script>
    <script>
        let pre = document.querySelector('button.slick-prev.slick-arrow')
        let html ='<i class="fa-sharp fa-solid fa-arrow-left"></i>'
        pre.innerHTML= html;
    </script>
</body>

>>>>>>> refs/heads/master
</html>