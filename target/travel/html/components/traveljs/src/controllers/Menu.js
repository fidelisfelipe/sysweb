	/**
	 * Controllers
	 * */
	
	var controllers = angular.module('controllers-ctrl',[]);

	/**
	 * Ctrl Account
	 **/

	controllers.controller('menu-account-ctrl', [nameVarInject, setAccountCtrl]);
	function setAccountCtrl(scope){
		console.log("menu-account-ctrl");
		
		scope.name = "Minha Conta";
		scope.href = "#";
	}
	
	/**
	 * Ctrl Logo
	 */
	controllers.controller("logo-top-ctrl", [nameVarInject, setLogoTopCtrl]);
	function setLogoTopCtrl(scope){
		console.log("logo-top-ctrl");
		scope.name = "Titulo da Logo";
		scope.href = "/";
		scope.path = "html/images/logo.png";	
	}
	
	/**
	 * Ctrl Login
	 **/
	controllers.controller("menu-login-ctrl",[nameVarInject,setMenuLoginCtrl]);
	function setMenuLoginCtrl(scope){
		console.log("menu-login-ctrl");
		scope.name = "Entrar";
	}
	
	/**
	 * Ctrl Signup
	 **/
	controllers.controller("menu-signup-ctrl",[nameVarInject, setMenuSignupCtrl]);
	function setMenuSignupCtrl(scope){
		console.log("menu-signup-ctrl");
		scope.name = "Cadastre-se";
	}
	
	controllers.controller("signup-form-ctrl",[nameVarInject,setSignupFormCtrl]);
	function setSignupFormCtrl(scope){
		console.log("signup-form-ctrl");
		scope.titleButtonFacebook = "Entrar com Facebook";
		scope.titleButtonGooglePlus = "Entrar com Google+";
		scope.or = "ou";
		scope.titleButtonSignupEmail = "Entrar com Email";
		scope.termsOfService = "Ao inscrever-me, concordo com os termos de serviço, política de privacidade e termos de garantia do anfitrião."
		scope.fistName = "Primeiro Nome";
		scope.lastName = "Último Nome";
		scope.emailAddress = "Endereço de Email";
		scope.password = "Senha";
		scope.confirmPassword = "Confirmação de Senha";
		scope.infoNewsSite = "Quero ser informado de novidades do Site";
		scope.acceptTermsOfService = "Ao entrar eu aceito os Termos de serviço e políticas de privacidade informados no contrato.";
		scope.titleButtonSignup = "Cadastrar-se";
		scope.alreadyMember = "Já sou cadastrado";
		scope.titleButtonLogin = "Entrar";
		scope.forgotPassword = "Esqueceu sua senha?";
		scope.forgotLogin = "Esqueceu seu Usuário?";
		scope.rememberMe = "Lembrar minha senha";
	}

	/**Ctrl Languages */
	
	controllers.controller("menu-language-ctrl", [nameVarInject, setMenuLanguageCtrl]);
	function setMenuLanguageCtrl(scope){
		console.log("menu-language-ctrl");
		
		scope.actual = "";
		scope.languages = [];
		
		//values define
		
		scope.actual = "Português";
		
		scope.languages = 
			[
			 {name:"English", href:"?language=en"},
		     {name:"Português", href:"?language=pt_BR"},
		     {name:"Español", href:"?language=esp"}
		    ];
	}
	
	/**Ctrl Currencys */
	
	controllers.controller("menu-currency-ctrl",[nameVarInject, setMenuCurrencyCtrl]);
	function setMenuCurrencyCtrl(scope){	
		console.log("menu-currency-ctrl");
		
		scope.actual = "";
		scope.currencys = [];
		
		//values define
		
		scope.actual = "Real";
		scope.currencys = [
		                    {name:"Real", href:"?currency=REAL"},
		                    {name:"Euro", href:"?currency=EURO"},
		                    {name:"Dolar", href:"?currency=DOLAR"}
		                   ];
	}
	
	/**Ctrl Menu Middle Top*/
	controllers.controller("menu-middle-ctrl",[nameVarInject, setMenuMiddleCtrl]);
	function setMenuMiddleCtrl(scope){
		console.log("menu-middle-ctrl");
		scope.menus = [{name:"Principal", href:"/" ,
								itens:[
								       {name:"Modelo 1", href:"index.html"},
								       {name:"Modelo 2", href:"homepage2.html"}
								      ]
						},
						{name:"HoteL", href:"hotel-index.html",
							itens:[
							       {name:"Modelo 1", href:"hotel-index.html"},
							       {name:"Modelo Lista", href:"hotel-list-view.html"}
							      ]
						}
					   ];
	}
	
	/**
	 * app menu - end
	 */

	
	/**
	 * footer init
	 * */
	controllers.controller("logo-footer-ctrl", [nameVarInject, setLogoTopCtrl]);
	function setLogoTopCtrl(scope){
		console.log("logo-footer-ctrl");
		scope.name = "Titulo da Logo";
		scope.href = "/";
		scope.path = "html/images/logo.png";
		scope.year = "2015";
	}

//defines Languages

//set values - init
//Menu.prototype.setActualLanguage = function($scope,$http){
//	$http.get('html/json/language-actual.json').success(function(data) {
//		//deve receber do json
//		console.log(data);
//	});
//	$scope.Menu.language.actual = [{name:"Português", href:"?language=pt_BR"}];
//}
