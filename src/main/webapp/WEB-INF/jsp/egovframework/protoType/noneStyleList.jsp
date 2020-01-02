<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Title</title>
    <%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/> --%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.34/browser.js"></script>
	<script src="/js/common.js"></script>
	
</head>

<body>

asaaaaaaaaaaa : <button id="btnClick">Button</button>

<br />
<br />
<br />
<br />
<br />
<br />

<table border="1">
	<thead>
		<th>No.</th>
		<th>Col1</th>
		<th>Col2</th>
		<th>Col3</th>
		<th>Col4</th>
		<th>Col5</th>
	</thead>
	<tbody id="tbody">
	</tbody>
</table>

<script type="text/babel">
	$( document ).ready(function() {
		$('#btnClick').click(function(){
			getProtoTypeList();
		});
	});
  
	let getProtoTypeList = function(){
		_ajaxCall('/selectProtoTypeList.ajax', '', cb_protoTypeList);	
	};
  
	let cb_protoTypeList = function(data){
		let protoList = data.protoTypeList;
		
		let innerHtml = '';
		protoList.forEach((item, index) => {
			innerHtml += '<tr>';
			innerHtml += '<td>' + Number(index) + '</td>';
			innerHtml += '<td>' + item.proto1 + '</td>';
			innerHtml += '<td>' + item.proto2 + '</td>';
			innerHtml += '<td>' + item.proto3 + '</td>';
			innerHtml += '<td>' + item.proto4 + '</td>';
			innerHtml += '<td>' + item.proto5 + '</td>';
			innerHtml += '</tr>';
		});
		$('#tbody').html(innerHtml);
	};
  
</script>
</body>
</html>
