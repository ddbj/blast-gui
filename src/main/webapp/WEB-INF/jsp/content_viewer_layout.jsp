<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div id="subContent">
	<div id="breadcrumb">
		<tiles:insertAttribute name="breadcrumb" />
	</div>
	<div id="content-body" class="content-body page type-page status-publish hentry">
		<form method="post" action="result" enctype="multipart/form-data">
		<tiles:insertAttribute name="heading" />
			<table class="layout" style="width:100%;">
			<tr>
				<td style="border:0px; vertical-align:top; padding-top:15px;">
					<tiles:insertAttribute name="sidemenu" />
				</td>
				<td style="border:0px; width:100%; vertical-align:top; padding-top:0px">
					<tilesx:useAttribute id="list" name="content-body" classname="java.util.List" />
					<c:forEach var="item" items="${list}">
						<tiles:insertAttribute value="${item}" />
					</c:forEach>
				</td>
			</tr>
			</table>
		</form>
	</div>
</div>
