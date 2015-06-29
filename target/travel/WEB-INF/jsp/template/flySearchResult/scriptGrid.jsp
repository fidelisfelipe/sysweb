<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Javascript -->
    <script type="text/javascript" src="html/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="html/js/jquery.noconflict.js"></script>
    <script type="text/javascript" src="html/js/modernizr.2.7.1.min.js"></script>
    <script type="text/javascript" src="html/js/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="html/js/jquery.placeholder.js"></script>
    <script type="text/javascript" src="html/js/jquery-ui.1.10.4.min.js"></script>
    
    <!-- Twitter Bootstrap -->
    <script type="text/javascript" src="html/js/bootstrap.js"></script>
    
    <!-- load revolution slider scripts -->
    <script type="text/javascript" src="components/revolution_slider/js/jquery.themepunch.plugins.min.js"></script>
    <script type="text/javascript" src="components/revolution_slider/js/jquery.themepunch.revolution.min.js"></script>
    
    <!-- load BXSlider scripts -->
    <script type="text/javascript" src="components/jquery.bxslider/jquery.bxslider.min.js"></script>
    
    <!-- load FlexSlider scripts -->
    <script type="text/javascript" src="components/flexslider/jquery.flexslider-min.js"></script>
    
    <!-- Google Map Api -->
    <script type='text/javascript' src="http://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script>
    <script type="text/javascript" src="html/js/gmap3.min.js"></script>
    
    <!-- parallax -->
    <script type="text/javascript" src="html/js/jquery.stellar.min.js"></script>
    
    <!-- waypoint -->
    <script type="text/javascript" src="html/js/waypoints.min.js"></script>

    <!-- load page Javascript -->
    <script type="text/javascript" src="html/js/theme-scripts.js"></script>
    <script type="text/javascript" src="html/js/scripts.js"></script>
    
    <script type="text/javascript">
        tjq(document).ready(function() {
            tjq("#price-range").slider({
                range: true,
                min: 0,
                max: 1000,
                values: [ 100, 800 ],
                slide: function( event, ui ) {
                    tjq(".min-price-label").html( "$" + ui.values[ 0 ]);
                    tjq(".max-price-label").html( "$" + ui.values[ 1 ]);
                }
            });
            tjq(".min-price-label").html( "$" + tjq("#price-range").slider( "values", 0 ));
            tjq(".max-price-label").html( "$" + tjq("#price-range").slider( "values", 1 ));

            function convertTimeToHHMM(t) {
                var minutes = t % 60;
                var hour = (t - minutes) / 60;
                var timeStr = (hour + "").lpad("0", 2) + ":" + (minutes + "").lpad("0", 2);
                var date = new Date("2014/01/01 " + timeStr + ":00");
                var hhmm = date.toLocaleTimeString(navigator.language, {hour: '2-digit', minute:'2-digit'});
                return hhmm;
            }
            tjq("#flight-times").slider({
                range: true,
                min: 0,
                max: 1440,
                step: 5,
                values: [ 360, 1200 ],
                slide: function( event, ui ) {
                    
                    tjq(".start-time-label").html( convertTimeToHHMM(ui.values[0]) );
                    tjq(".end-time-label").html( convertTimeToHHMM(ui.values[1]) );
                }
            });
            tjq(".start-time-label").html( convertTimeToHHMM(tjq("#flight-times").slider( "values", 0 )) );
            tjq(".end-time-label").html( convertTimeToHHMM(tjq("#flight-times").slider( "values", 1 )) );
        });
    </script>
    
    <!-- angular -->
	<script type="text/javascript" src="html/components/angular/angular.js"></script>
	<!-- app -->
	<script type="text/javascript" src="html/components/traveljs/src/apps/app.js"></script>
	<!-- menus -->
	<script type="text/javascript" src="html/components/traveljs/src/controllers/Menu.js"></script>
	<!--Fly Grid and List -->
	<script type="text/javascript" src="html/components/traveljs/src/controllers/flySearchResult.js"></script>
	<script type="text/javascript" src="html/components/traveljs/src/controllers/flySearchResultGrid.js"></script>