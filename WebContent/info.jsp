<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>身份认证成功</title>  
  <link rel="icon" href="img/timg.jpg" type="image/x-icon"/>
  <link href="${pageContext.request.contextPath }/css/main.d8e0d294.css" rel="stylesheet"/>
  <script language="javascript"> 
  if(${UserName}!=null){
   alert(${UserName}+"身份认证成功！");
  }
  </script>

</head>
<body>

<div class="background-color-layer" style="background-image: url('${pageContext.request.contextPath }/img/p2.png')"></div>
<main class="content-wrapper">

<header class="white-text-container section-container">
  <div class="text-center">
     <h1>身份认证成功</h1>
  </div>
</header>

<div class="container">

  <div class="card">
   <div class="card-block">
    <h2 align="center">UserName:${UserName}</h2>
    <h2 align="center">UserUnit:${UserUnit}</h2>
    <h2 align="center">UserType:${UserType}</h2> 
   <div align="center">
    <form action="${pageContext.request.contextPath }/info/get.do" method="post" enctype="x-www-form-urlencoded">
    <input type="hidden" name="UserName" value="${UserName}"><br/>
    <input type="hidden" name="PassWord" value="${PassWord}"><br/>
    <input type="submit"  value="获取用户信息" >
    </form>
   </div>
   </div>
  </div> 
 </div>
</main>
<footer class="footer-container white-text-container text-center">
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <p><small>&copy; Copyright 2018-2019 hsxdy123. All Rights Reserved</small></p>
      </div>
    </div>
  </div>
</footer>
		
<script>
  document.addEventListener("DOMContentLoaded", function (event) {
     scrollRevelation('.card');
  });
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/main.bc58148c.js"></script>

</body>
</html>