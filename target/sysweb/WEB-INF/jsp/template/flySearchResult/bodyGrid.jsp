<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
						
				<tiles:insertAttribute name="filterLeft" />

                        <div class="col-sm-8 col-md-9">
                            
                            <tiles:insertAttribute name="filterTop" />
                            
                            <div ng-controller="fly-search-result-middle" 
                            	class="row flight-list image-box flight listing-style1">
                                <div ng-repeat="result in resultList" 
                                	class="col-sm-6 col-lg-4">
                                    <article class="box">
                                        <figure>
                                            <span><img alt="" src="{{result.imgSrc}}"></span>
                                        </figure>
                                        <div class="details">
                                            <span class="price"><small>{{person}}</small>{{result.value}}</span>
                                            <h4 class="box-title">{{result.city}}<small>{{result.airLineName}}</small></h4>
                                            <div class="time">
                                                <div class="take-off">
                                                    <div class="icon"><i class="soap-icon-plane-right yellow-color"></i></div>
                                                    <div>
                                                        <span class="skin-color">{{takeOff}}</span><br />{{result.dateTakeOff}}<br />{{result.hourTakeOff}}
                                                    </div>
                                                </div>
                                                <div class="landing">
                                                    <div class="icon"><i class="soap-icon-plane-right yellow-color"></i></div>
                                                    <div>
                                                        <span class="skin-color">{{landing}}</span><br />{{result.dateLanding}}<br />{{result.hourLanding}}
                                                    </div>
                                                </div>
                                            </div>
                                            <p class="duration"><span class="skin-color">{{totalTime}} </span>{{result.totalTime}}</p>
                                            <div class="action">
                                                <a class="button btn-small full-width" href="flight-detailed.html">{{selectNow}}</a>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                            <a class="button uppercase full-width btn-large">load more listings</a>
                        </div>
