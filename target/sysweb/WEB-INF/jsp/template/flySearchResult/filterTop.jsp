<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
                        	<div ng-controller="fly-search-result-filter-top" class="sort-by-section clearfix box">
                                <h4 class="sort-by-title block-sm">{{sortResultsBy}}:</h4>
                                <ul class="sort-bar clearfix block-sm">
                                    <li ng:class="{true:'active'}[sortResultsBy.active]"
                                    	ng-repeat="sortResultsBy in sortResultsByList" class="sort-by-name"><a class="sort-by-container" href="{{sortResultsBy.href}}"><span>{{sortResultsBy.title}}</span></a></li>
                                </ul>
                                
                                <ul ng-controller="fly-search-result-filter-top-selector" class="swap-tiles clearfix block-sm">
                                    <li ng-class="{active: isList}" class="swap-list">
                                        <a href="{{hrefList}}"><i class="soap-icon-list"></i></a>
                                    </li>
                                    <li ng-class="{active: isGrid}" class="swap-grid">
                                        <a href="{{hrefGrid}}"><i class="soap-icon-grid"></i></a>
                                    </li>
                                    <li class="swap-block">
                                        <a href="flight-block-view.html"><i class="soap-icon-block"></i></a>
                                    </li>
                                </ul>
                            </div>