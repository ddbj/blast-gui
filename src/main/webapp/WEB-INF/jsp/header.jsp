<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<div class="logo_area">
	<div class="logo">
		<a href="http://www.ddbj.nig.ac.jp/<c:url value="index-${language_code}.html"/>"><img src="resources/images/logo.png" /></a>
	</div>
	<div id="language-box">
		<tiles:insertAttribute name="language_chooser" />
	</div>
	<div class="searchBar">
		<!--// google search //-->
		<div id="search-box">
			<form action="http://www.google.com/cse" id="cse-search-box">
				<div>
					<input type="hidden" name="cx" value="007882158733737608102:0tkctvbmv90" />
					<input type="hidden" name="ie" value="UTF-8" />
					<input type="text" name="q" class="search-text"/>
					<input type="submit" name="sa" value="Search" class="search-go"/>
				</div>
			</form>
		</div> <!-- search-box end -->
		<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=cse-search-box&lang=${fn:escapeXml(language_code2)}"></script>
		<!-- google search end -->
	</div> <!-- searchBar end -->
</div>

<div id="navi" class="menu-header-menu-${fn:escapeXml(language_code2)}-container">
	<ul id="menu-header-menu-${fn:escapeXml(language_code2)}" class="menu">
		<li id="menu-item-29087" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-29087">
			<a href="http://www.ddbj.nig.ac.jp/<c:url value="intro-${language_code}.html"/>"><spring:message code="label.header.intro" /></a>
		</li>
		<li id="menu-item-29093" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-29093">
			<a href="http://www.ddbj.nig.ac.jp/<c:url value="ddbjingtop-${language_code}.html"/>"><spring:message code="label.header.ddbjingtop" /></a>
		</li>
		<li id="menu-item-29092" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-29092">
			<a href="http://www.ddbj.nig.ac.jp/<c:url value="documents-${language_code}.html"/>"><spring:message code="label.header.documents" /></a>
		</li>
		<li id="menu-item-29088" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-29088">
			<a href="http://www.ddbj.nig.ac.jp/faq/<c:url value="faq-${language_code}.html"/>"><spring:message code="label.header.faq" /></a>
		</li>
		<li id="menu-item-29090" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-29090">
			<a href="http://www.ddbj.nig.ac.jp/<c:url value="addresses-${language_code}.html"/>"><spring:message code="label.header.addresses" /></a>
		</li>
	</ul>
</div>
