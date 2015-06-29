	/**
	 * body init
	 */
	
	controllers.controller("body-background-index-ctrl",[nameVarInject, setBodyBackgroundIndex]);
	function setBodyBackgroundIndex(scope){
		console.log("body-background-index-ctrl");
	}
	
	controllers.controller("body-tab-index-ctrl",[nameVarInject, setBodyTabIndexCtrl]);
	function setBodyTabIndexCtrl(scope){
		console.log("body-tab-index-ctrl");
		scope.titleBackground = "Voe conosco confortavelmente...";
		scope.titleDescriptionBackground = "Nós estamos trazendo-lhe uma experiência de voo moderna, confortável e integrada.";
		scope.hotels = "Hotéis";
		scope.flights = "Voôs";
	}
	
	controllers.controller("body-tab-index-fly-ctrl",[nameVarInject, setBodyTabIndexFlyCtrl]);
	function setBodyTabIndexFlyCtrl(scope){
		console.log("body-tab-index-fly-ctrl");
		scope.whereDoYouWantToGo = "Onde você quer ir?";
		scope.leavingFrom = "Saindo de (cidade, estado ou aeroporto específico)";
		scope.goingTo = "Indo para (cidade, estado ou aeroporto específico)";
		scope.checkIn = "Chegada";
		scope.checkOut = "Saída";
		scope.timesDefaultIn = "Qualquer Horário";
		scope.timesIn = [{title:"Manhã", value: 1 }, {title:"Tarde", value: 2 }, {title:"Noite", value: 3 }, {title:"Madrugada", value: 4 }];
		scope.timesDefaultOut = "Qualquer Horário";
		scope.timesOut = [{title:"Manhã", value: 1 }, {title:"Tarde", value: 2 }, {title:"Noite", value: 3 }, {title:"Madrugada", value: 4 }];
		scope.adultsTitleIn = "Adultos";
		scope.adultsIn = [{title:"01", value: 1 }, {title:"02", value: 2 }, {title:"03", value: 3 }, {title:"04", value: 4 }];
		scope.adultsTitleOut = "Adultos";
		scope.adultsOut = [{title:"01", value: 1 }, {title:"02", value: 2 }, {title:"03", value: 3 }, {title:"04", value: 4 }];
		scope.kidsTitleIn = "Crianças";
		scope.kidsIn = [{title:"01", value: 1 }, {title:"02", value: 2 }, {title:"03", value: 3 }, {title:"04", value: 4 }];
		scope.kidsTitleOut = "Crianças";
		scope.kidsOut = [{title:"01", value: 1 }, {title:"02", value: 2 }, {title:"03", value: 3 }, {title:"04", value: 4 }];
		scope.action = "flyListSearchResult";
		scope.method = "get";
		scope.searchNow = "Pesquisar";
	}
	
	controllers.controller("body-tab-index-hotels-ctrl",[nameVarInject, setBodyTabIndexHotelCtrl]);
	function setBodyTabIndexHotelCtrl(scope){
		console.log("body-tab-index-hotels-ctrl");
		scope.whereDoYouWantToGo = "Onde você quer ir?";
		scope.placeCitys = "Roma, Paris, Nova York...";
		scope.checkIn = "Chegada";
		scope.checkOut = "Saída";
		scope.titleRoom = "Quartos";
		scope.rooms = [{title:"1 Quarto", value: 1 }, {title:"2 Quarto", value: 2 }, {title:"3 Quarto", value: 3 }, {title:"4 Quarto", value: 4 }];
		scope.titleGuest = "Convidados";
		scope.guests = [{title:"1 Convidado", value: 1 }, {title:"2 Convidado", value: 2 }, {title:"3 Convidado", value: 3 }, {title:"4 Convidado", value: 4 }];
		scope.searchNow = "Pesquisar";
		scope.action = "hotelListSearchResult";
		scope.method = "post";
	}
	
	/**
	 * body end
	 */