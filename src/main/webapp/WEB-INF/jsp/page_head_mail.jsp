<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<tiles:insertTemplate template="/WEB-INF/jsp/page_head_template.jsp">
	<tiles:putAttribute name="title"><spring:message code="label.page_title.mail" /></tiles:putAttribute>
	<tiles:putListAttribute name="styles">
		<tiles:addAttribute value="/WEB-INF/jsp/style_basic.jsp" />
	</tiles:putListAttribute>
	<tiles:putListAttribute name="javascripts">
		<tiles:addAttribute value="/WEB-INF/jsp/function_basic.jsp" />
		<tiles:addAttribute value="/WEB-INF/jsp/function_mail.jsp" />
	</tiles:putListAttribute>
</tiles:insertTemplate>