<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Home</title>
	
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="/js/common.js"></script>
</head>
<body>
<h1>Home!</h1>

<%-- 
<sec:authorize access="hasRole('ROLE_USER')">
<p><a href="<c:url value="/login/loginForm.do" />">USER</a></p>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<p><a href="<c:url value="/login/loginForm.do" />">ADMIN</a></p>
</sec:authorize>



 --%>
<sec:authorize access="isAnonymous()">
<p><a href="<c:url value="/login/loginForm.do" />">로그인</a></p>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
<form:form action="${pageContext.request.contextPath}/logout" method="POST">
    <input type="submit" value="로그아웃" />
</form:form>
</sec:authorize>

<h3>
	<!-- <button id="btnClick">aJaaaaaaaaaax</button> -->
    [<a href="<c:url value="/protoType/noneStyleList.do" />">소개 페이지</a>]
    [<a href="<c:url value="/admin/adminHome.do" />">관리자 홈</a>]
</h3>

    
    
<!-- <script type="text/babel"> -->
<script type="text/javascript">
	$( document ).ready(function() {

		$('#btnClick').click(function(){
			getProtoTypeList();
		});
	});


	let getProtoTypeList = function(){

		_ajaxCall('/createPdf.ajax', '', cb_protoTypeList);	
	};
  
	let cb_protoTypeList = function(data){
		console.log(data);
		$('#btnClick').text(data.result);
	};
  
</script>

</body>
</html>
