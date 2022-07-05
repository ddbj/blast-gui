<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<h1>
	${program_title}
	<span style="float: right; margin-right: 20px;">
		<a href="http://www.ddbj.nig.ac.jp/search/help/blasthelp-${language_code}.html" style="font-size: 125%; text-align: center; text-decoration: none; text-shadow: 0px 0px 1px #000, 0px 0px 5px #000, 0px 0px 5px #000;"><spring:message code="label.heading.help" /></a>
	</span>
</h1>
<input type="hidden" id="program" name="program" value="${program}" />
<input type="hidden" name="language_code" value="${language_code}" />
<input type="hidden" name="language_code2" value="${language_code2}" />