<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Orientation Top init -->

	<div ng-controller="fly-search-result-top-menu"	class="page-title-container">
		<div class="container">
			<div class="page-title pull-left">
				<h2 class="entry-title">{{titlePage}}</h2>
			</div>
			<ul class="breadcrumbs pull-right">
				<li><a href="<c:url value="/" />">HOME</a></li>
				<li class="active">{{titlePage}}</li>
			</ul>
		</div>
	</div>

<!-- Orientation Top end -->