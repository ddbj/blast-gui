<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<ul>
	<li><a href="http://www.ddbj.nig.ac.jp/<c:url value="index-${language_code}.html"/>"><spring:message code="label.breadcrumb.home" /></a></li>
	<li>&gt;</li>
	<li><a href="http://www.ddbj.nig.ac.jp/<c:url value="searches-${language_code}.html"/>"><spring:message code="label.breadcrumb.analysis" /></a></li>
	<li>&gt;</li>
	<li>BLAST</li>
</ul>