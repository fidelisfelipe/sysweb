<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Inner Middle Body init-->
		
	<section id="content" class="slideshow-bg">
		<div ng-controller="body-background-index-ctrl" id="slideshow">
			<div class="flexslider">
				<ul class="slides">
					<li>
						<div class="slidebg" style="background-image: url('html/images/tour/home/travel-time.jpeg');"></div>
					</li>
					<li>
						<div class="slidebg" style="background-image: url('html/images/tour/home/travel-bg.jpg');"></div>
					</li>
				</ul>
			</div>
		</div>
	<div ng-controller="body-tab-index-ctrl" class="container">
                <div id="main">
                    <h1 class="page-title">{{titleBackground}}</h1>
                    <h2 class="page-description col-md-6 no-float no-padding">{{titleDescriptionBackground}}</h2>
                    <div class="search-box-wrapper style2">
                        <div class="search-box">
                            <ul class="search-tabs clearfix">
                                <li class="active"><a href="#flights-tab" data-toggle="tab"><i class="soap-icon-plane-right takeoff-effect"></i><span>{{flights}}</span></a></li>
                                <li><a href="#hotels-tab" data-toggle="tab"><i class="soap-icon-hotel"></i><span>{{hotels}}</span></a></li>
                            </ul>
                            <div class="visible-mobile">
                                <ul id="mobile-search-tabs" class="search-tabs clearfix">
                                    <li class="active"><a href="#flights-tab">{{flights}}</a></li>
                                    <li><a href="#hotels-tab">{{hotels}}</a></li>
                                </ul>
                            </div>
                            
                            <div class="search-tab-content">
                                
                                <div ng-controller="body-tab-index-fly-ctrl" class="tab-pane fade active in" id="flights-tab">
                                    <form action="{{action}}" method="{{method}}">
                                        <h4 class="title">{{whereDoYouWantToGo}}</h4>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input type="text" class="input-text full-width" placeholder="{{leavingFrom}}" />
                                                </div>
                                                <div class="form-group">
                                                    <input type="text" class="input-text full-width" placeholder="{{goingTo}}" />
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <div class="col-xs-6">
                                                        <div class="datepicker-wrap">
                                                            <input type="text" name="date_from" class="input-text full-width" placeholder="{{checkIn}}" />
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        <div class="selector">
                                                            <select class="full-width">
                                                            	<option value="">{{timesDefaultIn}}</option>
                                                                <option ng-repeat="time in timesIn" value="{{time.value}}">{{time.title}}</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-xs-6">
                                                        <div class="datepicker-wrap">
                                                            <input type="text" name="date_to" class="input-text full-width" placeholder="{{checkOut}}" />
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        <div class="selector">
                                                            <select class="full-width">
                                                                <option value="">{{timesDefaultOut}}</option>
                                                                <option ng-repeat="time in timesOut" value="{{time.value}}">{{time.title}}</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="form-group row">
                                                    <div class="col-xs-3">
                                                        <div class="selector">
                                                            <select class="full-width">
                                                                <option value="">{{adultsTitleIn}}</option>
                                                                <option ng-repeat="adult in adultsIn" value="{{adult.value}}">{{adult.title}}</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <div class="selector">
                                                            <select class="full-width">
                                                                <option value="">{{kidsTitleIn}}</option>
                                                                <option ng-repeat="kids in kidsIn" value="{{kids.value}}">{{kids.title}}</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-xs-3">
                                                        <div class="selector">
                                                            <select class="full-width">
                                                                <option value="">{{adultsTitleOut}}</option>
                                                                <option ng-repeat="adult in adultsOut" value="{{adult.value}}">{{adult.title}}</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <div class="selector">
                                                            <select class="full-width">
                                                                <option value="">{{kidsTitleOut}}</option>
                                                                <option ng-repeat="kids in kidsOut" value="{{kids.value}}">{{kids.title}}</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-6 pull-right">
                                                        <button class="full-width">{{searchNow}}</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                
                                <div ng-controller="body-tab-index-hotels-ctrl" class="tab-pane fade" id="hotels-tab">
                                    <form action="{{action}}" method="{{method}}">
                                        <h4 class="title">{{whereDoYouWantToGo}}</h4>
                                        <div class="row">
                                            <div class="form-group col-sm-6 col-md-3">
                                                <input type="text" class="input-text full-width" placeholder="{{placeCitys}}" />
                                            </div>
                                            <div class="form-group col-sm-6 col-md-4">
                                                <div class="row">
                                                    <div class="col-xs-6">
                                                        <div class="datepicker-wrap">
                                                            <input type="text" name="date_from" class="input-text full-width" placeholder="{{checkIn}}" />
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        <div class="datepicker-wrap">
                                                            <input type="text" name="date_to" class="input-text full-width" placeholder="{{checkOut}}" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-5">
                                                <div class="row">
                                                    <div class="col-xs-4">
                                                        <div class="selector">
                                                            <select class="full-width">
                                                            	<option value="">{{titleRoom}}</option>
                                                                <option ng-repeat="room in rooms" value="{{room.value}}">{{room.title}}</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <div class="selector">
                                                            <select class="full-width">
                                                            	<option value="">{{titleGuest}}</option>
                                                                <option ng-repeat="guest in guests" value="{{guest.value}}">{{guest.title}}</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-4">
                                                    <!-- TODO: este buton está desabilitado com cor alterada -->
                                                        <button type="submit" class="full-width" style="background: #d9d9d9;" disabled>{{searchNow}}</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <!-- demais abas aki -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	</section>
        
<!-- Inner Middle Body end-->