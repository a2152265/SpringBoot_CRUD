<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='<spring:url value='/' />/css/styles.css' type="text/css" />
<style type="text/css">
span.error {
	color: red;
	display: inline-block;
	font-size: 5pt;
}

.fieldset-auto-width {
	display: inline-block;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  function confirmDelete(id){
	  var result = confirm("確定刪除此筆記錄(帳號:" + id.trim() + ")?");
	  if (result) {
		  document.forms[0].putOrDelete.name = "_method";
		  document.forms[0].putOrDelete.value = "DELETE";
		  document.forms[0].action = "<c:url value='/_01_customer/customers/" + id + "' />";
	      return true;
	  }
	  return false;
  }
  function confirmUpdate(id){
	  document.forms[0].putOrDelete.name = "_method";
	  document.forms[0].putOrDelete.value = "PUT";
	  document.forms[0].action = "<c:url value='/_01_customer/customers/" + id + "' />";
	  return true;
  }
</script>

</head>
<body>
	<div align="center">
		<form:form method='POST' modelAttribute="customerBean" >
					<!--  -->
			<input type="hidden" name="_method"  id='putOrDelete'   value="DELETE" >
    	
    		<c:if test='${customerBean.customerId != null}'>
               <form:hidden path="customerId" /><br>&nbsp;
			</c:if>
			<fieldset class="fieldset-auto-width">
				<legend>客戶資料</legend>
				<table>
					<tr>
						<td align='right'>姓名：<br>&nbsp;</td>
						<td><form:input path="name" size="25" /><br>&nbsp;
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
						<td><form:input path="birthday" size="10" /><br>&nbsp;
						    <form:errors path="birthday" cssClass="error" />
						</td>
					</tr>
					<tr>
						<td align='right'>最後發表時間<font size='-3' color='blue'>(yyyy-MM-dd
								HH:mm:ss)</font>：<br>&nbsp;
						</td>
						<td><form:input path="lastPostTime"  size="25" /><br>&nbsp;
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
							<input type='submit' value='修改' name='updateBtn' onclick="return confirmUpdate('${customerBean.customerId}');">&nbsp; 	
							<input type='submit' value='刪除' name='deleteBtn' onclick="return confirmDelete('${customerBean.customerId}');" >
						</td>
					</tr>

				</table>
			</fieldset>
		</form:form>
		<a href="<c:url value='/_01_customer/index' />">回首頁</a>
	</div>
</body>
</html>