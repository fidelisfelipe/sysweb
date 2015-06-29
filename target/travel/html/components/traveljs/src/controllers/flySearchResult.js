	//TOP MENU

	controllers.controller("fly-search-result-top-menu",[nameVarInject, setFlySeachResultTitlePage]);
	function setFlySeachResultTitlePage(scope){
		console.log("fly-search-result-top-menu");
		scope.titlePage = "Resultado de busca de vôos";
	}

	//Filter Left
	
	controllers.controller("fly-search-result-filter-left",[nameVarInject, setFlySeachResultFilterLeft]);
	function setFlySeachResultFilterLeft(scope){
		console.log("fly-search-result-filter-left");
		scope.resultFoundTitle = "resultados";
		scope.resultFoundTotal = "1,950";
		
		scope.price = "Preço";
		scope.flightTimes = "Tempo de vôo";
		scope.flightStops = "Escalas";
		scope.flightStopsList = [];
		
		//values define
		
		scope.flightStopsList = 
			[
			 {href:"#", title:"1 parada", active:true},
		     {href:"#", title:"2 paradas", active:false},
		     {href:"#", title:"3 paradas", active:false},
		     {href:"#", title:"várias paradas", active:false}
		    ];
		
		scope.airLines = "Companhias aéreas";
		scope.airLinesButtonMore = "Mais";
		scope.airLinesList = [];
		
		//values define
		
		scope.airLinesList = 
			[
			 {href:"#", title:"United Airlines", active:"false"},
		     {href:"#", title:"Delta airlines", active:"false"},
		     {href:"#", title:"Alitalia", active:"false"},
		     {href:"#", title:"US airways", active:"true"},
		     {href:"#", title:"Air France", active:"true"},
		     {href:"#", title:"Air tahiti nui", active:"true"}
		    ];
		
		scope.flightType = "Tipo de vôo";
		scope.flightTypeList = [];
		
		//values define
		
		scope.flightTypeList = 
			[
			 {href:"#", title:"Executivo", active:"false"},
		     {href:"#", title:"Primeira Classe", active:"false"},
		     {href:"#", title:"Economico", active:"true"},
		    ];
		
		scope.inflightExperience = "Experiência de voô";
		scope.inflightExperienceList = [];
		
		//values define
		
		scope.inflightExperienceList = 
			[
			 {href:"#", title:"Jantar a bordo", active:"false"},
		     {href:"#", title:"Musica", active:"false"},
		     {href:"#", title:"Compras a bordo", active:"true"},
		     {href:"#", title:"Wi-fi", active:"true"},
		     {href:"#", title:"Assentos de cabine", active:"true"},
		    ];
		
		scope.modifySearch = "Modificar busca";
		scope.leavingFrom = "Saindo de";
		scope.titleLeavingFrom = "cidade, estado ou aeroporto específico";
		scope.departureOn = "Saindo em";
		scope.arrivingOn = "Chega em";
		scope.searchAgain = "Buscar novamente";
		
	}
	
	//Filter TOP

	controllers.controller("fly-search-result-filter-top",[nameVarInject, setFlySeachResultTop]);
	function setFlySeachResultTop(scope){
		console.log("fly-search-result-filter-top");
		scope.hrefGrid = "flyGridSearchResult";
		scope.hrefList = "flyListSearchResult";
		scope.sortResultsBy = "Ordenar Resultados por";
		scope.sortResultsByList = [];
		
		//values define
		
		scope.sortResultsByList = 
			[
			 {href:"#", title:"Nome", active:"false"},
		     {href:"#", title:"Preço", active:"false"},
		     {href:"#", title:"Duração", active:"true"},
		    ];
	}
	
	//Middle result
	
	controllers.controller("fly-search-result-middle",[nameVarInject, setFlySeachResultMiddle]);
	function setFlySeachResultMiddle(scope){
		console.log("fly-search-result-middle");
		scope.takeOff = "Decolagem";
		scope.landing = "Desembarque";
		scope.totalTime = "Duração Total";
		scope.selectNow = "Selecione Agora";
		scope.person = "Por pessoa";
		
		scope.resultList = [];
		
		//values define
		
		scope.resultList = 
			[
			 {href:"#",imgSrc: "http://placehold.it/270x160", value:"R$320", city:"Recife",airLineName:"Tam",dateLanding:"Qua Nov 14",hourLanding:"4:50 Am", dateTakeOff: "Qua Nov 13", hourTakeOff:"7:50 Am", totalTime:"3 horas e 00 minutos", scale: "1 parada" },
			 {href:"#",imgSrc: "http://placehold.it/270x160", value:"R$300", city:"Recife",airLineName:"Tam",dateLanding:"Qua Nov 14",hourLanding:"4:10 Am", dateTakeOff: "Qua Nov 13", hourTakeOff:"7:50 Am", totalTime:"3 horas e 40 minutos", scale: "2 parada" }
		    ];
	}
	
	
	