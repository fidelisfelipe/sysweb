<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
                        <div ng-controller="fly-search-result-filter-left" class="col-sm-4 col-md-3">
                            <h4 class="search-results-title"><i class="soap-icon-search"></i><b>{{resultFoundTotal}}</b> {{resultFoundTitle}}</h4>
                            <div class="toggle-container filters-container">
                                <div class="panel style1 arrow-right">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" href="#price-filter" class="collapsed">{{price}}</a>
                                    </h4>
                                    <div id="price-filter" class="panel-collapse collapse">
                                        <div class="panel-content">
                                            <div id="price-range"></div>
                                            <br />
                                            <span class="min-price-label pull-left"></span>
                                            <span class="max-price-label pull-right"></span>
                                            <div class="clearer"></div>
                                        </div><!-- end content -->
                                    </div>
                                </div>
                                
                                <div class="panel style1 arrow-right">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" href="#flight-times-filter" class="collapsed">{{flightTimes}}</a>
                                    </h4>
                                    <div id="flight-times-filter" class="panel-collapse collapse">
                                        <div class="panel-content">
                                            <div id="flight-times" class="slider-color-yellow"></div>
                                            <br />
                                            <span class="start-time-label pull-left"></span>
                                            <span class="end-time-label pull-right"></span>
                                            <div class="clearer"></div>
                                        </div><!-- end content -->
                                    </div>
                                </div>
                                
                                <div class="panel style1 arrow-right">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" href="#flight-stops-filter" class="collapsed">{{flightStops}}</a>
                                    </h4>
                                    <div id="flight-stops-filter" class="panel-collapse collapse">
                                        <div class="panel-content">
                                            <ul class="check-square filters-option">
                                                <li ng:class="{true:'active', false:''}[flightStop.active]"
                                                	ng-repeat="flightStop in flightStopsList" ><a href="{{flightStop.href}}">{{flightStop.title}}</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="panel style1 arrow-right">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" href="#airlines-filter" class="collapsed">{{airLines}}</a>
                                    </h4>
                                    <div id="airlines-filter" class="panel-collapse collapse">
                                        <div class="panel-content">
                                            <ul class="check-square filters-option">
                                                <li ng:class="{true:'active', false:''}[airLine.active]"
                                                 ng-repeat="airLine in airLinesList"><a href="{{airLine.href}}">{{airLine.title}}<small></small></a></li>
                                            </ul>
                                            <a class="button btn-mini">{{airLinesButtonMore}}</a>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="panel style1 arrow-right">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" href="#flight-type-filter" class="collapsed">{{flightType}}</a>
                                    </h4>
                                    <div id="flight-type-filter" class="panel-collapse collapse">
                                        <div class="panel-content">
                                            <ul class="check-square filters-option">
                                                <li ng:class="{true:'active', false:''}[flightType.active]"
                                                	ng-repeat="flightType in flightTypeList"><a href="{{flightType.href}}">{{flightType.title}}</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel style1 arrow-right">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" href="#inflight-experience-filter" class="collapsed">{{inflightExperience}}</a>
                                    </h4>
                                    <div id="inflight-experience-filter" class="panel-collapse collapse">
                                        <div class="panel-content">
                                            <ul class="check-square filters-option">
                                                <li ng:class="{true:'active', false:''}[inflightExperience.active]"
                                                	ng-repeat="inflightExperience in inflightExperienceList">
                                                	<a href="{{inflightExperience.href}}">{{inflightExperience.title}}</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="panel style1 arrow-right">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" href="#modify-search-panel" class="collapsed">{{modifySearch}}</a>
                                    </h4>
                                    <div id="modify-search-panel" class="panel-collapse collapse">
                                        <div class="panel-content">
                                            <form method="post">
                                                <div class="form-group">
                                                    <label>{{leavingFrom}}</label>
                                                    <input type="text" class="input-text full-width" placeholder="" value="{{titleLeavingFrom}}" />
                                                </div>
                                                <div class="form-group">
                                                    <label>{{departureOn}}</label>
                                                    <div class="datepicker-wrap">
                                                        <input type="text" name="date_from" class="input-text full-width" placeholder="mm/dd/yy" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>{{arrivingOn}}</label>
                                                    <div class="datepicker-wrap">
                                                        <input type="text" name="date_to" class="input-text full-width" placeholder="mm/dd/yy" />
                                                    </div>
                                                </div>
                                                <br />
                                                <button class="btn-medium icon-check uppercase full-width">{{searchAgain}}</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>