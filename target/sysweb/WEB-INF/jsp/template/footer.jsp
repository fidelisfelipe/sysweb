<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Footer init-->

	<footer id="footer">
		<div ng-controller="logo-footer-ctrl" class="bottom">
			<div class="container">
				<div class="logo pull-left">
					<a href="{{href}}" title="{{name}}"> <img src="{{path}}" alt="{{title}}" />
					</a>
				</div>
				<div class="pull-right">
					<a id="back-to-top" href="#" class="animated" data-animation-type="bounce"><i class="soap-icon-longarrow-up circle"></i></a>
				</div>
				<div class="copyright pull-right">
					<p>&copy; {{year}} {{name}}</p>
				</div>
			</div>
		</div>
	</footer>

<!-- Footer end-->
