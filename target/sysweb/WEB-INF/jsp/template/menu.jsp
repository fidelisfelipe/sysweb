<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
<!-- Menu Init -->
		
        <header id="header" class="navbar-static-top">
    
    <!-- Menu Top init --> 
              
            <div class="topnav hidden-xs">
                <div class="container">
                    <ul class="quick-menu pull-left">
                        <li ng-controller="menu-account-ctrl" ><a href="{{href}}" ng-bind="name" ></a></li>
                        <li ng-controller="menu-language-ctrl" class="ribbon">
                            <a href="#" ng-bind="actual"></a>
                            <ul  class="menu mini">
                                <li ng-repeat="language in languages"><a href="{{language.href}}" title="{{language.name}}" ng-bind="language.name"></a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="quick-menu pull-right">
                        <li ng-controller="menu-login-ctrl"><a href="#travelo-login" class="soap-popupbox" ng-bind="name"></a></li>
                        <li ng-controller="menu-signup-ctrl"><a href="#travelo-signup" class="soap-popupbox" ng-bind="name"></a></li>
                        <li ng-controller="menu-currency-ctrl" class="ribbon currency">
                            <a href="#" title="{{actual}}" ng-bind="actual"></a>
                            <ul class="menu mini">
                                <li ng-repeat="currency in currencys" ><a href="{{currency.href}}" title="{{currency.name}}" ng-bind="currency.name"></a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            
    <!-- Menu Top end -->
            
    <!-- Menu Middle init -->
         
            <div class="main-header">
                
                
      <!-- Menu Toogle Mobile Button init -->    
      
                <a href="#mobile-menu-01" data-toggle="collapse" class="mobile-menu-toggle">
                    <!-- menu toogle for mobile -->
                </a>
                
      <!-- Menu Toogle Mobile Button end -->  
      
                <div class="container">
          
          <!-- Menu Left logo init -->
          
                    <h1 ng-controller="logo-top-ctrl" class="logo navbar-brand">
                        <a href="{{href}}" title="{{name}}">
                            <img ng-src="{{path}}" alt="{{name}}" />
                        </a>
                    </h1>
                    
                    <!-- Menu Left logo end -->
                    
                    
                    <!-- Menu Main Navegabled init -->
                    
                    <nav id="main-menu" role="navigation">
                        <ul ng-controller="menu-middle-ctrl" class="menu">
                        
                            <!-- Menu Simple init-->
                            
                            <li ng-repeat="menu in menus" class="menu-item-has-children">
                                <a href="{{menu.href}}" ng-bind="menu.name"></a>
                                <ul>
                                    <li ng-repeat="item in menu.itens"><a href="{{item.href}}" ng-bind="item.name"></a></li>
                                </ul>
                            </li>
                            
                            <!-- Menu Simple end-->
                            
                            <!-- Menu Pages init-->
                            
                            <li class="menu-item-has-children megamenu-menu">
                                <a href="#">Pages</a>
                                <div class="megamenu-wrapper container" data-items-per-column="8">
                                    <div class="megamenu-holder">
                                        <ul class="megamenu">
                                            <li ng-repeat="menu in menus" class="menu-item-has-children">
                                                <a href="{{menu.href}}" ng-bind="menu.name"></a>
                                                <ul class="clearfix">
                                                    <li ng-repeat="item in menu.itens"><a href="{{item.href}}" ng-bind="item.name"></a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            
                            <!-- Menu Pages end-->
                            
                            <!-- Menu Pages Tree init-->
                            
                            <li class="menu-item-has-children">
                                <a href="#">Menu Tree</a>
                                <ul>
                                    <li ng-repeat="menu in menus" class="menu-item-has-children">
                                        <a href="#" ng-bind="menu.name"></a>
                                        <ul>
                                            <li ng-repeat="item in menu.itens"><a href="{{item.href}}" ng-bind="item.name"></a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            
                            <!-- Menu Pages Tree end-->
                            
                        </ul>
                    </nav>
                    
                    <!-- Menu Main Navegabled end -->
                    
                </div>
            <!-- Menu Middle end -->
            
            
            <!-- Menu Mobile init -->          
                <nav id="mobile-menu-01" class="mobile-menu collapse">
                
                    <ul ng-controller="menu-middle-ctrl" id="mobile-primary-menu" class="menu">
                        <li ng-repeat="menu in menus" class="menu-item-has-children">
                            <a href="{{menu.name}}" ng-bind="menu.name"></a>
                            <ul>
                                <li ng-repeat="item in menu.itens"><a href="{{item.href}}" ng-bind="item.name"></a></li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="#">Pages</a>
                            <ul>
                                <li ng-repeat="menu in menus" class="menu-item-has-children">
                                    <a href="#" ng-bind="menu.name"></a>
                                    <ul>
                                        <li ng-repeat="item in menu.itens"><a href="{{item.href}}" ng-bind="item.name"></a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="#">Menu Tree</a>
                            <ul>
                                <li ng-repeat="menu in menus" class="menu-item-has-children">
                                    <a href="#" ng-bind="menu.name"></a>
                                    <ul>
                                        <li ng-repeat="item in menu.itens"><a href="{{item.href}}" ng-bind="item.name"></a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    
                    <ul class="mobile-topnav container">
                        <li ng-controller="menu-account-ctrl" ><a href="{{href}}" ng-bind="name"></a></li>
                        <li ng-controller="menu-language-ctrl" class="ribbon language menu-color-skin">
                            <a href="#" data-toggle="collapse" ng-bind="actual"></a>
                            <ul class="menu mini">
                                <li ng-repeat="language in languages"><a href="{{language.href}}" title="{{language.name}}" ng-bind="language.name"></a></li>
                            </ul>
                        </li>
                        <li ng-controller="menu-login-ctrl"><a href="#travelo-login" class="soap-popupbox" ng-bind="name"></a></li>
                        <li ng-controller="menu-signup-ctrl"><a href="#travelo-signup" class="soap-popupbox" ng-bind="name"></a></li>
                        <li ng-controller="menu-currency-ctrl" class="ribbon currency menu-color-skin">
                            <a href="#" ng-bind="actual"></a>
                            <ul class="menu mini">
                                <li ng-repeat="currency in currencys"><a href="#" title="{{currency.name}}" ng-bind="currency.name"></a></li>
                            </ul>
                        </li>
                    </ul>
                    
                </nav>
                
            <!-- Menu Mobile end -->    
                
            </div>
            
  <!-- Menu Middle end -->


<!-- Signup Form init -->
            
            <div ng-controller="signup-form-ctrl" id="travelo-signup" class="travelo-signup-box travelo-box">
                <div class="login-social">
                    <a href="#" class="button login-facebook"><i class="soap-icon-facebook"></i>{{titleButtonFacebook}}</a>
                    <a href="#" class="button login-googleplus"><i class="soap-icon-googleplus"></i>{{titleButtonGooglePlus}}</a>
                </div>
                <div class="seperator"><label>{{or}}</label></div>
                <div class="simple-signup">
                    <div class="text-center signup-email-section">
                        <a href="#" class="signup-email"><i class="soap-icon-letter"></i>Sign up with Email</a>
                    </div>
                    <p class="description">{{termsOfService}}</p>
                </div>
                <div class="email-signup">
                    <form>
                        <div class="form-group">
                            <input type="text" class="input-text full-width" placeholder="{{firstName}}">
                        </div>
                        <div class="form-group">
                            <input type="text" class="input-text full-width" placeholder="{{lastName}}">
                        </div>
                        <div class="form-group">
                            <input type="text" class="input-text full-width" placeholder="{{emailAddress}}">
                        </div>
                        <div class="form-group">
                            <input type="password" class="input-text full-width" placeholder="{{password}}">
                        </div>
                        <div class="form-group">
                            <input type="password" class="input-text full-width" placeholder="{{confirmPassword}}">
                        </div>
                        <div class="form-group">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox">{{infoNewsSite}}
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <p class="description">{{acceptTermsOfService}}</p>
                        </div>
                        <button type="submit" class="full-width btn-medium">{{titleButtonSignup}}</button>
                    </form>
                </div>
                <div class="seperator"></div>
                <p>{{alreadyMember}} <a href="#travelo-login" class="goto-login soap-popupbox">{{titleButtonLogin}}</a></p>
            </div>
            
  <!-- Signup Form end -->
            
  <!-- Login Form init -->
            
            <div ng-controller="signup-form-ctrl" id="travelo-login" class="travelo-login-box travelo-box">
                <div class="login-social">
                    <a href="#" class="button login-facebook"><i class="soap-icon-facebook"></i>{{titleButtonFacebook}}</a>
                    <a href="#" class="button login-googleplus"><i class="soap-icon-googleplus"></i>{{titleButtonGooglePlus}}</a>
                </div>
                <div class="seperator"><label>{{or}}</label></div>
                <form>
                    <div class="form-group">
                        <input type="text" class="input-text full-width" placeholder="{{emailAddress}}">
                    </div>
                    <div class="form-group">
                        <input type="password" class="input-text full-width" placeholder="{{password}}">
                    </div>
                    <div class="form-group">
                        <a href="#" class="forgot-password pull-right">{{forgotPassword}}</a>
                        <div class="checkbox checkbox-inline">
                            <label>
                                <input type="checkbox"> {{rememberMe}}
                            </label>
                        </div>
                    </div>
                </form>
                <div class="seperator"></div>
                <p>{{forgotLogin}}<a href="#travelo-signup" class="goto-signup soap-popupbox">  {{titleButtonSignup}}</a></p>
            </div>
            
        <!-- Login Form end -->

        </header>
	
<!-- Menu end -->
		