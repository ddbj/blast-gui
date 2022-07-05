<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div id="footer_nav" class="menu-footer-menu-${fn:escapeXml(language_code2)}-container">
	<ul id="menu-footer-menu-${fn:escapeXml(language_code2)}" class="menu">
		<li id="menu-item-29100" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-29100">
			<a href="http://www.ddbj.nig.ac.jp/<c:url value="DDBJ_site-${language_code}.html"/>"><spring:message code="label.footer.site-map" /></a>
		</li>
		<li id="menu-item-29101" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-29101">
			<a href="http://www.ddbj.nig.ac.jp/<c:url value="sitepolicy-${language_code}.html"/>"><spring:message code="label.footer.site-policy" /></a>
		</li>
		<li id="menu-item-29102" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-29102">
			<a href="http://www.ddbj.nig.ac.jp/<c:url value="calendar-e.html"/>"><spring:message code="label.footer.calendar" /></a>
		</li>
		<li id="menu-item-29103" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-29103">
			<a href="http://www.ddbj.nig.ac.jp/<c:url value="faq/41382-${language_code}.html"/>"><spring:message code="label.footer.browser" /></a>
		</li>
	</ul>
</div>

<div class="lastmod">
	<spring:message code="label.footer.last_modified" />
</div>

<div class="licence">
	<a rel="license" href="http://creativecommons.org/licenses/by/2.1/jp/"><img alt="<spring:message code="label.footer.license.image.alt" />" style="border-width:0" src="http://i.creativecommons.org/l/by/2.1/jp/88x31.png"></a>  <span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">DDBJ Home Page</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="." property="cc:attributionName" rel="cc:attributionURL">DDBJ</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/2.1/jp/"><spring:message code="label.footer.license" /></a>
</div>

<address><spring:message code="label.footer.copyright" /></address>
