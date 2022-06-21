<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" id="msg" value="${msgCode}">
<input type="hidden" id="url" value="${returnUrl}">
<script>
alert($("#msg").val());
location.href=$("#url").val();
</script>
</body>
</html>