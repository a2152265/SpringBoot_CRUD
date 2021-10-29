<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>	
<!DOCTYPE html>
<html>
<head> 
<link rel='stylesheet' href="<c:url value='/css/styles.css' />" type="text/css" />
<meta charset="UTF-8">
<title>Spring Boot</title>
</head>   
<body>
	<h2 style="text-align:center">Spring Boot 課堂練習</h2>
	<h3 style="text-align:center">新增、刪除、修改、查詢</h3>
	<p style="text-align:center"><font  color='red'>${DataReset}</font>&nbsp;</p>
	<div align='center'>
	<font size='+0'>&nbsp;</font>
	</div>
	<hr/>
	<div style="text-align:center">
    <a href="<c:url value='/_01_customer/index' />">處理客戶(Customer)資料</a><br><br>
	</div>
</body>
</html>