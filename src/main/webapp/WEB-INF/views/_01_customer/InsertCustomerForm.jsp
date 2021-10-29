<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='<spring:url value='/' />/css/styles.css' type="text/css" />
<style type="text/css">
span.error {
	color: red;
	display: inline-block;
	font-size: 8pt;
}

.fieldset-auto-width {
	display: inline-block;
}
</style>
<meta charset="UTF-8">
<title>新增客戶資料</title>
</head>
<body>
	<div align="center">
		<form:form method='POST' modelAttribute="customerBean" action='customers'>
			<c:if test='${customerBean.customerId != null}'>
                 <form:hidden path="customerId" /><br>&nbsp;
			</c:if>
			<fieldset class="fieldset-auto-width">
				<legend>客戶資料</legend>
				<table>
					<tr>
						<td align='right'>姓名：<br>&nbsp;</td>
						<td width='280'><form:input path="name" size="25"/><br>&nbsp;
							<form:errors path="name" cssClass="error" />
						</td>
					</tr>
					<tr>
						<td align='right'>密碼：<br>&nbsp;
						</td>
						<td><form:input path="password" size="25" /><br>&nbsp;
						    <form:errors path="password" cssClass="error" />
						</td>
					</tr>
					<tr>
						<td align='right'>確認密碼：<br>&nbsp;
						</td>
						<td><form:input path="password1" size="25" /><br>&nbsp;
						    <form:errors path="password1" cssClass="error" />
						</td>
					</tr>
					<tr>
						<td align='right'>Email：<br>&nbsp;
						</td>
						<td><form:input path="email" size="30" /><br>&nbsp;
						    <form:errors path="email" cssClass="error" />
						</td>
					</tr>
					<tr>
						<td align='right'>生日<font size='-3' color='blue'>(yyyy-MM-dd)</font>：<br>&nbsp;
						</td>
						<td><form:input path="birthday" size="10" /><br>	&nbsp;
						    <form:errors path="birthday" cssClass="error" />
						</td>
					</tr>
					<tr>
						<td align='right'>最後發表時間<font size='-3' color='blue'>(yyyy-MM-dd
								HH:mm:ss)</font>：<br>&nbsp;
						</td>
						<td><form:input path="lastPostTime" size="25" /><br>&nbsp;
							<form:errors path="lastPostTime" cssClass="error" />
						</td>
					</tr>
					<tr>
						<td align='right'>總付款金額：<br>&nbsp;</td>
						<td><form:input path="totalPayment" size="10" /><br>&nbsp;
							<form:errors path="totalPayment" cssClass="error" />
						</td>
					</tr>
					<tr>
						<td colspan='2' align='center'>
						<input type='submit' value='提交'></td>
					</tr>
				</table>
			</fieldset>
		</form:form>
		<br> <a href="<c:url value='/_01_customer/index' />">回首頁</a>
	</div>
</body>
</html>