<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

				<tiles:insertAttribute name="filterLeft" />

                        <div class="col-sm-8 col-md-9">
                            
                            <tiles:insertAttribute name="filterTop" />
                            
                            <div ng-controller="fly-search-result-middle" 
                            	class="flight-list listing-style3 flight">
                                <article ng-repeat="result in resultList"
                                	class="box">
                                    <figure class="col-xs-3 col-sm-2">
                                        <span><img alt="" src="{{result.imgSrc}}"></span>
                                    </figure>
                                    <div class="details col-xs-9 col-sm-10">
                                        <div class="details-wrapper">
                                            <div class="first-row">
                                                <div>
                                                    <h4 class="box-title">{{result.city}}<small>{{result.airLineName}}</small></h4>
                                                    <a class="button btn-mini stop">{{result.scale}}</a>
                                                    <div class="amenities">
                                                    	<!-- TODO: estes icones devem ser dinamicos, ainda não sei como -->
                                                        <i class="soap-icon-wifi circle"></i>
                                                        <i class="soap-icon-entertainment circle"></i>
                                                        <i class="soap-icon-fork circle"></i>
                                                        <i class="soap-icon-suitcase circle"></i>
                                                    </div>
                                                </div>
                                                <div>
                                                    <span class="price"><small>{{person}}</small>{{result.value}}</span>
                                                </div>
                                            </div>
                                            <div class="second-row">
                                                <div class="time">
                                                    <div class="take-off col-sm-4">
                                                        <div class="icon"><i class="soap-icon-plane-right yellow-color"></i></div>
                                                        <div>
                                                            <span class="skin-color">{{takeOff}}</span><br />{{result.dateTakeOff}}<br />{{result.hourTakeOff}}
                                                        </div>
                                                    </div>
                                                    <div class="landing col-sm-4">
                                                        <div class="icon"><i class="soap-icon-plane-right yellow-color"></i></div>
                                                        <div>
                                                            <span class="skin-color">{{landing}}</span><br />{{result.dateLanding}}<br />{{result.hourLanding}}
                                                        </div>
                                                    </div>
                                                    <div class="total-time col-sm-4">
                                                        <div class="icon"><i class="soap-icon-clock yellow-color"></i></div>
                                                        <div>
                                                            <span class="skin-color">{{totalTime}}</span><br />{{result.totalTime}}
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="action">
                                                    <a href="flight-detailed.html" class="button btn-small full-width">{{selectNow}}</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                            <a class="button uppercase full-width btn-large">load more listings</a>
                        </div>