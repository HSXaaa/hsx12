<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>华南师范大学身份认证</title>  
<link rel="icon" href="img/timg.jpg" type="image/x-icon"/>
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery1.42.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/Validform_v5.3.2_min.js"></script>

<script language="javascript"> 
  var error ='<%=request.getParameter("error")%>';
  if(error=='error'){
	 alert("身份认证失败！您输入的账号或者密码错误，请输入正确的账号密码");   
  }  
</script>

<script language="javascript">
   $(function(){   	
    $("#login").submit(function(){
    	if($("#name").val()==""){	
    		alert("学号不能为空！");
    		return false;
    	}else if($("#pwd").val()==""){	
    		alert("学工系统密码不能为空！");
    		return false;
    	}else{
    		return true;
    	}
    })
  })
</script>

</head>
<body>

 <div class="body"></div>
	<div class="grad"></div>
	<div class="header">
	<div>身份认证</div>
 </div>
 <br/>	
 <div class="login">
 <form action="${pageContext.request.contextPath }/identity/send.do" method="post" id="login" enctype="x-www-form-urlencoded">
    <input type="text" name="UserName" id="name" value="" placeholder="学号" ><br/>
    <input type="password" name="PassWord" id="pwd" value="" placeholder="学工系统密码"><br/>
    <input type="submit"  value="身份认证" >
 </form>
 </div>

</body>
</html>