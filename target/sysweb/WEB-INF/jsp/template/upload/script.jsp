<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!--Init Javascript -->

    <script type="text/javascript" src="${path}/html/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${path}/html/js/jquery.noconflict.js"></script>
    <script type="text/javascript" src="${path}/html/js/modernizr.2.7.1.min.js"></script>
    <script type="text/javascript" src="${path}/html/js/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="${path}/html/js/jquery.placeholder.js"></script>
    <script type="text/javascript" src="${path}/html/js/jquery-ui.1.10.4.min.js"></script>
    <script type="text/javascript" src="${path}/html/components/jquery.uploadify-v3.2.1/jquery.uploadify.js"></script>

    
    <!-- Twitter Bootstrap -->
    <script type="text/javascript" src="${path}/html/js/bootstrap.js"></script>
    
    <!-- load revolution slider scripts -->
    <script type="text/javascript" src="${path}/html/components/revolution_slider/js/jquery.themepunch.plugins.min.js"></script>
    <script type="text/javascript" src="${path}/html/components/revolution_slider/js/jquery.themepunch.revolution.min.js"></script>

    <!-- Flex Slider -->
    <script type="text/javascript" src="${path}/html/components/flexslider/jquery.flexslider-min.js"></script>
    
    <!-- load BXSlider scripts -->
    <script type="text/javascript" src="${path}/html/components/jquery.bxslider/jquery.bxslider.min.js"></script>
    
    <!-- parallax -->
    <script type="text/javascript" src="${path}/html/js/jquery.stellar.min.js"></script>
    
    <!-- waypoint -->
    <script type="text/javascript" src="${path}/html/js/waypoints.min.js"></script>

    <!-- load page Javascript -->
    <script type="text/javascript" src="${path}/html/js/theme-scripts.js"></script>
    <script type="text/javascript" src="${path}/html/js/scripts.js"></script>
    
    <script type="text/javascript">
        tjq(".flexslider").flexslider({
            animation: "fade",
            controlNav: false,
            animationLoop: true,
            directionNav: false,
            slideshow: true,
            slideshowSpeed: 5000
        });
    </script>
    
    <!-- angular -->
	<script type="text/javascript" src="${path}/html/components/angular/angular.js"></script>
	<!-- app -->
	<script type="text/javascript" src="${path}/html/components/sysweb/src/apps/app.js"></script>
	<!-- menus -->
	<script type="text/javascript" src="${path}/html/components/sysweb/src/controllers/Menu.js"></script>
	<!-- upload -->
	<script type="text/javascript" src="${path}/html/components/sysweb/src/controllers/Upload.js"></script>
	<script type="text/javascript">
	(function($) {
		$("#arquivos").uploadify({
				  "swf"       : '${path}/html/components/jquery.uploadify-v3.2.1/uploadify.swf',
				  'uploader'       : '${path}/${contexto}/${object.id}',
				  'buttonText'	   : 'Selecionar arquivos',
				  'folder'         : '${path}/upload',
				  'fileObjName'    : 'arquivos',
				  'fileTypeExts'   : '${tipoArquivoString}',
				  'fileSizeLimit'  : '${tamanho}',
				  'uploadLimit'	   : ${uploadLimit},
				  'onQueueComplete' : function(queueData) {
			            alert(queueData.uploadsSuccessful + ' arquivos enviados com sucesso!');
			            location.href = "${path}/${contexto}/${object.id}";
			       },
			       'onUploadError' : function(file, errorCode, errorMsg, errorString) {
			            alert('O arquivo ' + file.name + ' não pode ser enviado. Erro: ' + errorString);
			            location.href = "${path}/${contexto}/${object.id}";
			       }
		});

			$("#envio").hide();
			
			$("#envio").click(function(){
				$("#arquivos").uploadify("upload");
			});
			$("#adicionarImagem").click(function (){
				$("#camposImagem").show(1000);
			});
	});
	</script>
	
<!--End Javascript -->
