//ESPECIAL ALERTAS
function validarAlerta(hashkey,idlista,JSONString){
	var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (request.readyState == 4) {
            var resp = request.responseText;
            resp = JSON.parse(resp);
            
            var errorcode = resp.response.errorCode;
            console.log(JSON.stringify(errorcode));
            
            
            
            if (errorcode == "0"){
            	//PUT
            	submitPutAlertas(JSONString);
            }else if (errorcode == "1"){
            	//POST
            	submitPostAlerta(JSONString);
            }else{
            	//POST
            	submitPostAlerta(JSONString);
            }
            
            
        }
    };
    
    request.open("GET", "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getEstadoAlertaLista/"+hashkey+"/"+idlista, true);
    console.log("http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getEstadoAlertaLista/"+hashkey+"/"+idlista);
    request.send();
}


//ESPECIAL SET FECHA GUARDADA ALERTAS
function setAlerta(hashkey,idlista){
	var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (request.readyState == 4) {
            var resp = request.responseText;
            resp = JSON.parse(resp);
            
            var errorcode = resp.response.errorCode;
            console.log(JSON.stringify(errorcode));
            
            
            if (errorcode == "0"){
            
            	var AlertaActDesact = "";
            	var idTipoN = "";
            	var HoraS = "";
            	var DiaS = "";
            	
            	for (var i = 0; i < resp.response.msg.length; i++) {
                	
            		AlertaActDesact = resp.response.msg[i].notificacion;
            		
            		//mas datos
            		idTipoN = resp.response.msg[i].idTipoNotificacion;
            		HoraS	= resp.response.msg[i].hora;
            		DiaS	= resp.response.msg[i].dia;
                	
                }
            	if (AlertaActDesact == "0") {
            		//	check false
            		aceptarTerminos.checked = false;
            		console.log("CHECKED FALSO");
            	} else if (AlertaActDesact == "1") {
            		//check false
            		aceptarTerminos.checked = true;
            		console.log("CHECKED VERDADERO");
            	}
            	
            	if (idTipoN == "1") {
            		option1.selected = true;
            		option2.selected = false;
            		option3.selected = false;
            		
            		console.log("LA HORA :" + HoraS);
            		diario.value = diario.dateFromTime(HoraS+":00");
            		
            	} else if (idTipoN == "2") {
            		option1.selected = false;
            		option2.selected = true;
            		option3.selected = false;
            		
            		diario.value = diario.dateFromTime(HoraS+":00");
            		if (DiaS == "LU") {
            			//lunes.text 	 =  "Lunes";
            			lunes.selected = true;
            		} else if (DiaS == "MA") {
            			//martes.text 	 =  "Martes";
            			martes.selected = true;
            		} else if (DiaS == "MI") {
            			//miercoles.text 	 =  "Miércoles";
            			miercoles.selected = true;
            		} else if (DiaS == "JU") {
            			//jueves.text 	 =  "Jueves";
            			jueves.selected = true;
            		} else if (DiaS == "VI") {
            			//viernes.text 	 =  "Viernes";
            			viernes.selected = true;
            		} else if (DiaS == "SA") {
            			//sabado.text 	 =  "Sábado";
            			sabado.selected = true;
            		} else if (DiaS == "DO") {
            			//domingo.text 	 =  "Domingo";
            			domingo.selected = true;
            		}
            		
            		
            	} else if (idTipoN == "3") {
            		option1.selected = false;
            		option2.selected = false;
            		option3.selected = true;
            		
            		diario.value = diario.dateFromTime(HoraS+":00");
            		var u = "u";
            		if (DiaS == "1") {
            			//lunes.text 	 =  "Lunes";
            			u1.selected = true;
            		} else if (DiaS == "2") {
            			//martes.text 	 =  "Martes";
            			u2.selected = true;
            		} else if (DiaS == "3") {
            			//miercoles.text 	 =  "Miércoles";
            			u3.selected = true;
            		} else if (DiaS == "4") {
            			//jueves.text 	 =  "Jueves";
            			u4.selected = true;
            		} else if (DiaS == "5") {
            			//viernes.text 	 =  "Viernes";
            			u5.selected = true;
            		} else if (DiaS == "6") {
            			//sabado.text 	 =  "Sábado";
            			u6.selected = true;
            		} else if (DiaS == "7") {
            			//domingo.text 	 =  "Domingo";
            			u7.selected = true;
            		} else if (DiaS == "8") {
            			//lunes.text 	 =  "Lunes";
            			u8.selected = true;
            		} else if (DiaS == "9") {
            			//martes.text 	 =  "Martes";
            			u9.selected = true;
            		} else if (DiaS == "10") {
            			//miercoles.text 	 =  "Miércoles";
            			u10.selected = true;
            		} else if (DiaS == "11") {
            			//jueves.text 	 =  "Jueves";
            			u11.selected = true;
            		} else if (DiaS == "12") {
            			//viernes.text 	 =  "Viernes";
            			u12.selected = true;
            		} else if (DiaS == "13") {
            			//sabado.text 	 =  "Sábado";
            			u13.selected = true;
            		} else if (DiaS == "14") {
            			//domingo.text 	 =  "Domingo";
            			u14.selected = true;
            		} else if (DiaS == "15") {
            			//lunes.text 	 =  "Lunes";
            			u15.selected = true;
            		} else if (DiaS == "16") {
            			//martes.text 	 =  "Martes";
            			u16.selected = true;
            		} else if (DiaS == "17") {
            			//miercoles.text 	 =  "Miércoles";
            			u17.selected = true;
            		} else if (DiaS == "18") {
            			//jueves.text 	 =  "Jueves";
            			u18.selected = true;
            		} else if (DiaS == "19") {
            			//viernes.text 	 =  "Viernes";
            			u19.selected = true;
            		} else if (DiaS == "20") {
            			//sabado.text 	 =  "Sábado";
            			u20.selected = true;
            		} else if (DiaS == "21") {
            			//domingo.text 	 =  "Domingo";
            			u21.selected = true;
            		} else if (DiaS == "22") {
            			//lunes.text 	 =  "Lunes";
            			u22.selected = true;
            		} else if (DiaS == "23") {
            			//martes.text 	 =  "Martes";
            			u23.selected = true;
            		} else if (DiaS == "24") {
            			//miercoles.text 	 =  "Miércoles";
            			u24.selected = true;
            		} else if (DiaS == "25") {
            			//jueves.text 	 =  "Jueves";
            			u25.selected = true;
            		} else if (DiaS == "26") {
            			//viernes.text 	 =  "Viernes";
            			u26.selected = true;
            		} else if (DiaS == "27") {
            			//sabado.text 	 =  "Sábado";
            			u27.selected = true;
            		} else if (DiaS == "28") {
            			//domingo.text 	 =  "Domingo";
            			u28.selected = true;
            		} else if (DiaS == "29") {
            			//viernes.text 	 =  "Viernes";
            			u29.selected = true;
            		} else if (DiaS == "30") {
            			//sabado.text 	 =  "Sábado";
            			u30.selected = true;
            		} else if (DiaS == "31") {
            			//domingo.text 	 =  "Domingo";
            			u31.selected = true;
            		}
            		//u.selected = true;
            	}

            }else if (errorcode == "1"){
            	//check true 
            	aceptarTerminos.checked = true;
            	console.log("CHECKED VERDADERO");
            }
            
            
        }
    };
    
    request.open("GET", "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getEstadoAlertaLista/"+hashkey+"/"+idlista, true);
    console.log("http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getEstadoAlertaLista/"+hashkey+"/"+idlista);
    request.send();
}


//ESPECIAL VALIDACION DE AJUSTES DE LISTA
function validarAjustesLista(hashkey,idlista){
	var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (request.readyState == 4) {
            var resp = request.responseText;
            resp = JSON.parse(resp);
            
            var errorcode = resp.response.errorCode;
            console.log(JSON.stringify(errorcode));
            
            var ruta		= resp.response.msg.rutas;
            var producto	= resp.response.msg.productos;
            var alerta		= resp.response.msg.alertas;
            
            if (errorcode == "0"){
            	//PUT
            	if (ruta == "1") {
            		txtRuta.text = "1";
            	} else {
            		txtRuta.text = "0";
            	}
            	if (producto == "1") {
            		txtProductos.text = "1";
            	} else {
            		txtProductos.text = "0";
            	}
            	
            }else if (errorcode == "1"){
            	//POST
            	
            }
            
            
        }
    };
    
    request.open("GET", "http://observatoriodeprecios.defensoria.gob.sv/v1/getNotifiacionesAlertasPorMiembro/"+hashkey+"/"+idlista+"/", true);
    console.log("http://observatoriodeprecios.defensoria.gob.sv/v1/getNotifiacionesAlertasPorMiembro/"+hashkey+"/"+idlista+"/");
    request.send();
}

//ESPECIAL MAPA
function mapaPin(hashkey,idlista){
	var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (request.readyState == 4) {
            var resp = request.responseText;
            resp = JSON.parse(resp);
            
            var errorcode = resp.response.errorCode;
            console.log(JSON.stringify(errorcode));
            
            if (errorcode == "0"){
            	
            	var url = "http://maps.google.com/maps/api/staticmap?zoom=12&size=768x1200&ma...%20";            	
            	var datos = "";
            	
            	for (var i = 0; i < resp.response.msg.length; i++) {
                	
                	datos = datos + "&markers=color:red|color:red|label:A|"+resp.response.msg[i].altitud+","+resp.response.msg[i].longitud;
                	
                	console.log("CORTE DATOS >"+ datos);
                }
            	webViewScrollable.url = url+datos+"&sensor=false";
            	//webViewScrollable.url = "http://maps.google.com/maps/api/staticmap?zoom=12&size=512x512&ma...%20&markers=color:red|color:red|label:A|13.7018003463745,-89.2323989868164&markers=color:red|color:red|label:A|13.6833000183105,-89.2220001220703&markers=color:red|color:red|label:A|13.6983003616333,-89.1949005126953&markers=color:red|color:red|label:A|13.704400062561,-89.1500015258789&markers=color:red|color:red|label:A|13.6985998153687,-89.1500015258789&sensor=false";
            	
            	console.log("URL DIRECION PINES >"+ url+datos+"&sensor=false");
            	
            }else if (errorcode == "1"){
            	
            }else{
            	
            }
            
            
        }
    };
    
    request.open("GET", "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getCotizacionEstablecimientosLista/"+hashkey+"/"+idlista, true);
    
    request.send();
}


function getDataUser(usuario,password) {
	try {
		loginToast.show();
	    var request = new XMLHttpRequest();
	    request.onreadystatechange = function() {
    	
    		//Run some code here    	  
	        if (request.readyState == 4) {
	            var resp = request.responseText;
	            resp = JSON.parse(resp);
	            
	            var errorcode = resp.response.errorCode;
	            console.log(JSON.stringify(errorcode));
	            
	            if (errorcode == "0"){
	            	bienvenidoToast.show();
	                var idmiembro = resp.response.msg.miembro.idMiembro;
	                var nombre	  = resp.response.msg.miembro.nombre;
	                var apellido  = resp.response.msg.miembro.apellido;
	                var sexo	  = resp.response.msg.miembro.sexo;
	                var correo	  = resp.response.msg.miembro.correo;
	                var hashkey	  = resp.response.msg.miembro.hashKey;
	                
	                var loginPage = loginPage_page.createObject();
	                loginPage.idmiembroN  = idmiembro;
	                loginPage.nombreN 	  = nombre;
	                loginPage.apellidoN	  = apellido;
	                loginPage.sexoN 	  = sexo;
	                loginPage.correoN 	  = correo;
	                loginPage.hashkeyN 	  = hashkey;
	                loginPage.validaruser = "0";
	                loginPage.validarUserPage("0");
	                console.log("Datos de login "+idmiembro+nombre+apellido+sexo+correo+hashkey);
	                nPMenuDC.push(loginPage);
	                
	            } else if (errorcode == "4"){
	                myQmlToast.show();
	            } else {
	            	myQmlToast.show();
	            }	            
	        }
    	  
	    };
	    
	    request.open("GET", "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getSesion/"+usuario+"/"+password, true);
	    console.log("http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getSesion/"+usuario+"/"+password);
	    request.send();
    
	} catch(err) {
		//Handle errors here
		myQmlToast.show();
		console.log("AQUI ERROR ----> "+err.message);
	}
    
}


function submitPostRegister(postString) {
	registerToast.show();	
    console.log("STRING RECIBIDO POR la funcion == "+postString);
    var request = new XMLHttpRequest();
    request.onreadystatechange=function() {
        // Need to wait for the DONE state or you'll get errors
        if(request.readyState === XMLHttpRequest.DONE) {
            if (request.status === 200) {
            	loginToast.show();
                var resp = request.responseText;
                resp = JSON.parse(resp);                
                console.log("Response = " + JSON.stringify(resp));
                
                var errorcode = resp.response.errorCode;
                console.log(JSON.stringify(errorcode));
                
                if (errorcode == "0"){
                	bienvenidoToast.show();
                    var idmiembro = resp.response.msg.idMiembro;
                    var nombre	  = resp.response.msg.nombre;
                    var apellido  = resp.response.msg.apellido;
                    var sexo	  = resp.response.msg.sexo;
                    var correo	  = resp.response.msg.correo;
                    var hashkey	  = resp.response.msg.hashKey;
                    
                    var menuPrincipal = menuPrincipal_page.createObject();
                    menuPrincipal.idmiembroN = idmiembro;
                    menuPrincipal.nombreN 	 = nombre;
                    menuPrincipal.apellidoN	 = apellido;
                    menuPrincipal.sexoN 	 = sexo;
                    menuPrincipal.correoN 	 = correo;
                    menuPrincipal.hashkeyN 	 = hashkey;
                    console.log("Datos de login "+idmiembro+nombre+apellido+sexo+correo+hashkey);
                    menuPrincipal.validaruser = "0";
                    menuPrincipal.validarUserPage("0");
                    nPMenuDC.push(menuPrincipal);
                    
                }else{
                    myQmlToast.show();
                }
            
            }
            else {
                // This is very handy for finding out why your web service won't talk to you
                console.log("Status: " + request.status + ", Status Text: " + request.statusText);
            }
        }
    };
    // This is for a POST request but GET etc. work fine too
    request.open("POST", "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/postMiembro", true); // only async supported
    request.send(postString);
}


//POST GUARDAR FAVORITOS
function submitPostFavoritos(postString) {
	waitFavoritos.show();	
    console.log("STRING RECIBIDO POR la funcion == "+postString);
    var request = new XMLHttpRequest();
    request.onreadystatechange=function() {
        // Need to wait for the DONE state or you'll get errors
        if(request.readyState === XMLHttpRequest.DONE) {
            if (request.status === 200) {
            	waitFavoritos.show();
                var resp = request.responseText;
                resp = JSON.parse(resp);                
                console.log("Response = " + JSON.stringify(resp));
                
                var errorcode = resp.response.errorCode;
                console.log(JSON.stringify(errorcode));
                
                if (errorcode == "0"){
                	saveFavoritos.show();
                	aiFavorito.imageSource = "asset:///images/btnFav1.png";
                	aiFavorito.enabled = false;
                }else{
                	errorFavoritos.show();
                	aiFavorito.imageSource = "asset:///images/btnFav1.png";
                	aiFavorito.enabled = false;
                }
            
            }
            else {
                // This is very handy for finding out why your web service won't talk to you
                console.log("Status: " + request.status + ", Status Text: " + request.statusText);
            }
        }
    };
    // This is for a POST request but GET etc. work fine too
    request.open("POST", "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/postElementosFavoritos", true); // only async supported
    request.send(postString);
}


//POST CREAR LISTA COMPRAS
function submitPostListaCompras(postString) {
	waitListaCrear.show();	
    console.log("STRING RECIBIDO POR la funcion == "+postString);
    var request = new XMLHttpRequest();
    request.onreadystatechange=function() {
        // Need to wait for the DONE state or you'll get errors
        if(request.readyState === XMLHttpRequest.DONE) {
            if (request.status === 200) {
            	waitListaCrear.show();
                var resp = request.responseText;
                resp = JSON.parse(resp);                
                console.log("Response = " + JSON.stringify(resp));
                
                var errorcode = resp.response.errorCode;
                console.log(JSON.stringify(errorcode));
                
                if (errorcode == "0"){
                	var idLista = resp.response.msg.idLista;
                	mListaCrear.show();
                	var configurarlista  = configurarlista_page.createObject();
                	configurarlista.hashkey = hashkeyN;
                	configurarlista.vuser 	= vuserN;
                	configurarlista.idlista	= idLista;
                	nPMenuDC.push(configurarlista);
                }else{
                	errorListaCrear.show();
                	
                }
            
            }
            else {
                // This is very handy for finding out why your web service won't talk to you
                console.log("Status: " + request.status + ", Status Text: " + request.statusText);
            }
        }
    };
    // This is for a POST request but GET etc. work fine too
    request.open("POST", "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/postListaDeCompras", true); // only async supported
    request.send(postString);
}


//POST AGREGAR ESTABLECIMIENTOS A RUTA DE COMPRAS
function submitPostAgregarEst(postString) {
	waitAdd.show();	
    console.log("STRING RECIBIDO POR la funcion == "+postString);
    var request = new XMLHttpRequest();
    request.onreadystatechange=function() {
        // Need to wait for the DONE state or you'll get errors
        if(request.readyState === XMLHttpRequest.DONE) {
            if (request.status === 200) {
            	waitAdd.show();
                var resp = request.responseText;
                resp = JSON.parse(resp);                
                console.log("Response = " + JSON.stringify(resp));
                
                var errorcode = resp.response.errorCode;
                console.log(JSON.stringify(errorcode));
                
                if (errorcode == "0"){
                	okSuccess.show();
                }else if (errorcode == "8"){
                	errorRepite.show();
                }else{
                	error.show();                	
                }
            
            }
            else {
                // This is very handy for finding out why your web service won't talk to you
                console.log("Status: " + request.status + ", Status Text: " + request.statusText);
            }
        }
    };
    // This is for a POST request but GET etc. work fine too
    request.open("POST", "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/postGuardarEstablecimientosLista", true); // only async supported
    
    request.send(postString);
}


//POST AGREGAR PRODUCTO DE COMPRAS
function submitPostAgregarPro(postString) {
	waitAdd.show();	
    console.log("STRING RECIBIDO POR la funcion == "+postString);
    var request = new XMLHttpRequest();
    request.onreadystatechange=function() {
        // Need to wait for the DONE state or you'll get errors
        if(request.readyState === XMLHttpRequest.DONE) {
            if (request.status === 200) {
            	waitAdd.show();
                var resp = request.responseText;
                resp = JSON.parse(resp);                
                console.log("Response = " + JSON.stringify(resp));
                
                var errorcode = resp.response.errorCode;
                console.log(JSON.stringify(errorcode));
                
                if (errorcode == "0"){
                	okSuccess.show();
                }else if (errorcode == "6"){
                	errorRepite.show();
                }else if (errorcode == "8"){
                	errorRepite.show();
                }else{
                	error.show();                	
                }
            
            }
            else {
                // This is very handy for finding out why your web service won't talk to you
                console.log("Status: " + request.status + ", Status Text: " + request.statusText);
            }
        }
    };
    // This is for a POST request but GET etc. work fine too
    request.open("POST", "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/postElementosLista", true); // only async supported
    
    request.send(postString);
}


//POST ALERTA PRODUCTO DE COMPRAS
function submitPostAlerta(postString) {
	waitAdd.show();	
    console.log("STRING RECIBIDO POR la funcion == "+postString);
    var request = new XMLHttpRequest();
    request.onreadystatechange=function() {
        // Need to wait for the DONE state or you'll get errors
        if(request.readyState === XMLHttpRequest.DONE) {
            if (request.status === 200) {
            	waitAdd.show();
                var resp = request.responseText;
                resp = JSON.parse(resp);                
                console.log("Response = " + JSON.stringify(resp));
                
                var errorcode = resp.response.errorCode;
                console.log(JSON.stringify(errorcode));
                
                if (errorcode == "0"){
                	okSuccess.show();
                }else if (errorcode == "6"){
                	errorRepite.show();
                }else if (errorcode == "8"){
                	errorRepite.show();
                }else if (errorcode == "10"){
                	errorRepite.show();
                }else{
                	error.show();                	
                }
            
            }
            else {
                // This is very handy for finding out why your web service won't talk to you
                console.log("Status: " + request.status + ", Status Text: " + request.statusText);
            }
        }
    };
    // This is for a POST request but GET etc. work fine too
    request.open("POST", "http://observatoriodeprecios.defensoria.gob.sv/v1/postGuardarAlerta", true); // only async supported
    
    request.send(postString);
}


//PUT MODIFICAR CLAVE
function submitPutClave(putString) {
	waitClave.show();	
    console.log("STRING RECIBIDO POR la funcion == "+putString);
    var request = new XMLHttpRequest();
    request.onreadystatechange=function() {
        // Need to wait for the DONE state or you'll get errors
        if(request.readyState === XMLHttpRequest.DONE) {
            if (request.status === 200) {
            	mClave.show();
                var resp = request.responseText;
                resp = JSON.parse(resp);                
                console.log("Response = " + JSON.stringify(resp));
                
                var errorcode = resp.response.errorCode;
                console.log(JSON.stringify(errorcode));
                
                if (errorcode == "0"){
                	mClave.show();
                	nPMenuDC.navigateTo(rootPage);
                	
                }else{
                	errorClave.show();
                }
            
            }
            else {
                // This is very handy for finding out why your web service won't talk to you
                console.log("Status: " + request.status + ", Status Text: " + request.statusText);
            }
        }
    };
    // This is for a POST request but GET etc. work fine too
    request.open("PUT", "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php//v1/putCambiarClave/", true); // only async supported
    request.send(putString);
}


//PUT MODIFICAR DESACTIVAR/ACTIVAR ALERTAS
function submitPutAlertasDesAc(putString) {
	desactivate.show();	
    console.log("STRING RECIBIDO POR la funcion == "+putString);
    var request = new XMLHttpRequest();
    request.onreadystatechange=function() {
        // Need to wait for the DONE state or you'll get errors
        if(request.readyState === XMLHttpRequest.DONE) {
            if (request.status === 200) {
            	desactivate.show();
                var resp = request.responseText;
                resp = JSON.parse(resp);                
                console.log("Response = " + JSON.stringify(resp));
                
                var errorcode = resp.response.errorCode;
                console.log(JSON.stringify(errorcode));
                
                if (errorcode == "0"){
                	//desactivate2.show();
                		
                	
                }else{
                	//desactivate3.show();
                }
            
            }
            else {
                // This is very handy for finding out why your web service won't talk to you
                console.log("Status: " + request.status + ", Status Text: " + request.statusText);
            }
        }
    };
    // This is for a POST request but GET etc. work fine too
    request.open("PUT", "http://observatoriodeprecios.defensoria.gob.sv/v1/putActivarDesactivarNotificacionLista/", true); // only async supported
    request.send(putString);
}


//PUT MODIFICAR ALERTAS
function submitPutAlertas(putString) {
	waitAdd.show();	
    console.log("STRING RECIBIDO POR la funcion == "+putString);
    var request = new XMLHttpRequest();
    request.onreadystatechange=function() {
        // Need to wait for the DONE state or you'll get errors
        if(request.readyState === XMLHttpRequest.DONE) {
            if (request.status === 200) {
            	desactivate.show();
                var resp = request.responseText;
                resp = JSON.parse(resp);                
                console.log("Response = " + JSON.stringify(resp));
                
                var errorcode = resp.response.errorCode;
                console.log(JSON.stringify(errorcode));
                
                if (errorcode == "0"){
                	okModified.show();
                		
                	
                }else{
                	errorRepite.show();
                }
            
            }
            else {
                // This is very handy for finding out why your web service won't talk to you
                console.log("Status: " + request.status + ", Status Text: " + request.statusText);
            }
        }
    };
    // This is for a POST request but GET etc. work fine too
    request.open("PUT", "http://observatoriodeprecios.defensoria.gob.sv/v1/putCambiarAlerta/", true); // only async supported
    request.send(putString);
}



// DELETE FAVORITOS

function deleteFavoritos(haskey,idarticulo,idestablecimiento) {
	waitFavoritos.show();
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (request.readyState == 4) {
            var resp = request.responseText;
            resp = JSON.parse(resp);
            
            var errorcode = resp.response.errorCode;
            console.log(JSON.stringify(errorcode));
            
            if (errorcode == "0"){
            	dtFavoritos.show();
                
                var detalleF = detalleF_page.createObject();
                detalleF.vuser 	= validaruser;
                detalleF.hashkey = hashkeyN;
                detalleF.nextParameter();
                nPMenuDC.push(detalleF);
                
            }else{
            	dtFavoritos.show();
            }
            
            
        }
    };
    
    request.open("DELETE", "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/deleteElementosFavoritos/"+hashkey+"/"+idarticulo+"/"+idestablecimiento, true);
    //console.log("http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getSesion/"+usuario+"/"+password);
    request.send();
}


// DELETE LISTA DE COMPRAS
function deleteListaCompras(hashkey,idlista) {
	waitEliminar.show();
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (request.readyState == 4) {
            var resp = request.responseText;
            resp = JSON.parse(resp);
            
            var errorcode = resp.response.errorCode;
            console.log(JSON.stringify(errorcode));
            
            if (errorcode == "0"){
            	okSuccess.show();
                
            	dataSource.load();
                
            }else{
            	error.show();
            	dataSource.load();
            }
            
            
        }
    };
    
    request.open("DELETE", "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/deleteListaCompras/"+hashkey+"/"+idlista, true);
    console.log("http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/deleteListaCompras/"+hashkey+"/"+idlista);
    request.send();
}


//DELETE ESTABLEMIENTOS DE RUTA DE COMPRAS
function deleteAgregarEst(hashkey,idlista,idestablecimiento) {
	waitEliminar.show();
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (request.readyState == 4) {
            var resp = request.responseText;
            resp = JSON.parse(resp);
            
            var errorcode = resp.response.errorCode;
            console.log(JSON.stringify(errorcode));
            
            if (errorcode == "0"){
            	okSuccess.show();
                
            	dataSource.load();
                
            }else{
            	error.show();
            	
            }
            
            
        }
    };
    
    request.open("DELETE", "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/deleteEstablecimientoLista/"+hashkey+"/"+idlista+"/"+idestablecimiento, true);
    //console.log("http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/deleteListaCompras/"+hashkey+"/"+idlista);
    request.send();
}


//DELETE ESTABLEMIENTOS DE RUTA DE COMPRAS
function deleteProductoCompras(hashkey,idarticulo,idlista) {
	waitEliminar.show();
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (request.readyState == 4) {
            var resp = request.responseText;
            resp = JSON.parse(resp);
            
            var errorcode = resp.response.errorCode;
            console.log(JSON.stringify(errorcode));
            
            if (errorcode == "0"){
            	okSuccess.show();
                
            	dataSource.load();
                
            }else{
            	error.show();
            	
            }
            
            
        }
    };
    
    request.open("DELETE", "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/deleteElementoLista/"+hashkey+"/"+idarticulo+"/"+idlista, true);
    //console.log("http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/deleteListaCompras/"+hashkey+"/"+idlista);
    request.send();
}


/**
*
*  Secure Hash Algorithm (SHA1)
*  http://www.webtoolkit.info/
*
**/
 
function SHA1 (msg) {
 
    function rotate_left(n,s) {
        var t4 = ( n<<s ) | (n>>>(32-s));
        return t4;
    };
 
    function lsb_hex(val) {
        var str="";
        var i;
        var vh;
        var vl;
 
        for( i=0; i<=6; i+=2 ) {
            vh = (val>>>(i*4+4))&0x0f;
            vl = (val>>>(i*4))&0x0f;
            str += vh.toString(16) + vl.toString(16);
        }
        return str;
    };
 
    function cvt_hex(val) {
        var str="";
        var i;
        var v;
 
        for( i=7; i>=0; i-- ) {
            v = (val>>>(i*4))&0x0f;
            str += v.toString(16);
        }
        return str;
    };
 
 
    function Utf8Encode(string) {
        string = string.replace(/\r\n/g,"\n");
        var utftext = "";
 
        for (var n = 0; n < string.length; n++) {
 
            var c = string.charCodeAt(n);
 
            if (c < 128) {
                utftext += String.fromCharCode(c);
            }
            else if((c > 127) && (c < 2048)) {
                utftext += String.fromCharCode((c >> 6) | 192);
                utftext += String.fromCharCode((c & 63) | 128);
            }
            else {
                utftext += String.fromCharCode((c >> 12) | 224);
                utftext += String.fromCharCode(((c >> 6) & 63) | 128);
                utftext += String.fromCharCode((c & 63) | 128);
            }
 
        }
 
        return utftext;
    };
 
    var blockstart;
    var i, j;
    var W = new Array(80);
    var H0 = 0x67452301;
    var H1 = 0xEFCDAB89;
    var H2 = 0x98BADCFE;
    var H3 = 0x10325476;
    var H4 = 0xC3D2E1F0;
    var A, B, C, D, E;
    var temp;
 
    msg = Utf8Encode(msg);
 
    var msg_len = msg.length;
 
    var word_array = new Array();
    for( i=0; i<msg_len-3; i+=4 ) {
        j = msg.charCodeAt(i)<<24 | msg.charCodeAt(i+1)<<16 |
        msg.charCodeAt(i+2)<<8 | msg.charCodeAt(i+3);
        word_array.push( j );
    }
 
    switch( msg_len % 4 ) {
        case 0:
            i = 0x080000000;
        break;
        case 1:
            i = msg.charCodeAt(msg_len-1)<<24 | 0x0800000;
        break;
 
        case 2:
            i = msg.charCodeAt(msg_len-2)<<24 | msg.charCodeAt(msg_len-1)<<16 | 0x08000;
        break;
 
        case 3:
            i = msg.charCodeAt(msg_len-3)<<24 | msg.charCodeAt(msg_len-2)<<16 | msg.charCodeAt(msg_len-1)<<8    | 0x80;
        break;
    }
 
    word_array.push( i );
 
    while( (word_array.length % 16) != 14 ) word_array.push( 0 );
 
    word_array.push( msg_len>>>29 );
    word_array.push( (msg_len<<3)&0x0ffffffff );
 
 
    for ( blockstart=0; blockstart<word_array.length; blockstart+=16 ) {
 
        for( i=0; i<16; i++ ) W[i] = word_array[blockstart+i];
        for( i=16; i<=79; i++ ) W[i] = rotate_left(W[i-3] ^ W[i-8] ^ W[i-14] ^ W[i-16], 1);
 
        A = H0;
        B = H1;
        C = H2;
        D = H3;
        E = H4;
 
        for( i= 0; i<=19; i++ ) {
            temp = (rotate_left(A,5) + ((B&C) | (~B&D)) + E + W[i] + 0x5A827999) & 0x0ffffffff;
            E = D;
            D = C;
            C = rotate_left(B,30);
            B = A;
            A = temp;
        }
 
        for( i=20; i<=39; i++ ) {
            temp = (rotate_left(A,5) + (B ^ C ^ D) + E + W[i] + 0x6ED9EBA1) & 0x0ffffffff;
            E = D;
            D = C;
            C = rotate_left(B,30);
            B = A;
            A = temp;
        }
 
        for( i=40; i<=59; i++ ) {
            temp = (rotate_left(A,5) + ((B&C) | (B&D) | (C&D)) + E + W[i] + 0x8F1BBCDC) & 0x0ffffffff;
            E = D;
            D = C;
            C = rotate_left(B,30);
            B = A;
            A = temp;
        }
 
        for( i=60; i<=79; i++ ) {
            temp = (rotate_left(A,5) + (B ^ C ^ D) + E + W[i] + 0xCA62C1D6) & 0x0ffffffff;
            E = D;
            D = C;
            C = rotate_left(B,30);
            B = A;
            A = temp;
        }
 
        H0 = (H0 + A) & 0x0ffffffff;
        H1 = (H1 + B) & 0x0ffffffff;
        H2 = (H2 + C) & 0x0ffffffff;
        H3 = (H3 + D) & 0x0ffffffff;
        H4 = (H4 + E) & 0x0ffffffff;
 
    }
 
    var temp = cvt_hex(H0) + cvt_hex(H1) + cvt_hex(H2) + cvt_hex(H3) + cvt_hex(H4);
 
    return temp.toLowerCase();
 
}


/*function getDataEstablecimiento(a) {
        
        var request = new XMLHttpRequest();
        request.onreadystatechange = function() {
            if (request.readyState == 4) {
                var resp = request.responseText;
                resp = JSON.parse(resp);
                var resp2 = resp.response.msg.miembro.nombre;
                console.log(JSON.stringify(resp2));
                //resp2 = JSON.parse(resp2)
                // var addressComponents = resp2.msg[0]
                
                for (var i = 0; i < resp2.length; i ++) {
                    var option = optionControlDefinition.createObject();
                    option.text = resp2[i].tipoSondeo
                    option.value = resp2[i].idTipoSondeo
                    dropDown.add(option)
                    
                }
            }
        }
        
        // I have used goole's web service url, you can replace with your url
        //request.open("GET", "http://maps.googleapis.com/maps/api/geocode/json?address=" + "Ahmedabad" + "&sensor=false", true)
        request.open("GET", "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getSesion/"+a+"/8af2c4dc7e66b3cbca8f8c30ba70750825b9dcc2", true);
        console.log("http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getSesion/"+a+"/8af2c4dc7e66b3cbca8f8c30ba70750825b9dcc2");
        request.send();
    }*/