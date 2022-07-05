<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><tiles:insertAttribute name="title" /></title>
<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.ico" />
<tiles:useAttribute id="list" name="styles" classname="java.util.List" />
<c:forEach var="item" items="${list}">
	<tiles:insertAttribute value="${item}" />
</c:forEach>
<tiles:useAttribute id="list" name="javascripts" classname="java.util.List" />
<c:forEach var="item" items="${list}">
	<tiles:insertAttribute value="${item}" />
</c:forEach>
</head>