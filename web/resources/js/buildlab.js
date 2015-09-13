/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var mitoken=null;
var _pasActivo=null
var lab_id;
var lab_experiment_id;
var nPlatform = 0;
$(window).ready(function(){
    

      
    ajustartam();
    defineEvents();  
    
    lab_id= $("#_ff_lab_id").val();
    lab_experiment_id= $("#_ff_lab_experiment_id").val();
        
    $("#_dd_ff_infoApp").hide();
    iniciaGeneracionApp(lab_id,lab_experiment_id);
}
    
);


$(window).resize(function(){
    ajustartam();
        
}
);

function ajustartam(){
    var h_contenido = $(window).height() -170;
    $("#navegacion").height(40)
    $("#pie").height(60)
    $("#contenido").height(h_contenido);
    $("div.panel").height(h_contenido+20);
    $("div.panel-body").height(h_contenido-65);
}

function defineEvents(){
         
}

function iniciaGeneracionApp(lab_id,lab_experiment_id){
    //Obtner las aplicaciones al entrar en la aplicacion.
    pasoActivo ="p_p_1";
    startPaso();
    mitoken = getAuthorization('apps/check/'+lab_id+'/'+lab_experiment_id,'GET',{},gestionRespuestaPaso1,gestionError);       
}


function gestionRespuestaPaso1(_data,  textStatus,  jqXHR){
    console.log(_data)
    console.log(textStatus)
    $('#'+pasoActivo).progressbar('setValue', 100);
    tr_paso = $('#'+$('#'+pasoActivo).attr('data-paso'));
    pasoActivo=null; //parar barra de progreso
    console.log('gestionRespuestaPaso1');
    if(_data.status=='ok'){
        tr_paso.addClass("success");
        pasoActivo ="p_p_2";
        //Iniciamos el paso 2
        mitoken = getAuthorization('apps/pkg/'+lab_id+'/'+lab_experiment_id,'GET',{},gestionRespuestaPaso2,gestionError);       
    }else{
        //No se ha encontrado el fichero config.xml.
        tr_paso.addClass("warning");
    }
}

function gestionRespuestaPaso2(_data,  textStatus,  jqXHR){
    console.log(_data)
    console.log(textStatus)
    $('#'+pasoActivo).progressbar('setValue', 100);
    tr_paso = $('#'+$('#'+pasoActivo).attr('data-paso'));
    pasoActivo=null; //parar barra de progreso
    console.log('gestionRespuestaPaso2');
    if(_data.status=='ok'){
        tr_paso.addClass("success");
        pasoActivo ="p_p_3";
        //Iniciamos el paso 3
        mitoken = getAuthorization('apps/build/'+lab_id+'/'+lab_experiment_id,'GET',{},gestionRespuestaPaso3,gestionError);       
    }else{
        //No se ha encontrado el fichero config.xml.
        tr_paso.addClass("warning");
    }
}

function gestionRespuestaPaso3(_data,  textStatus,  jqXHR){
    console.log(_data)
    console.log(textStatus)
    $('#'+pasoActivo).progressbar('setValue', 100);
    tr_paso = $('#'+$('#'+pasoActivo).attr('data-paso'));
    pasoActivo=null; //parar barra de progreso
    console.log('gestionRespuestaPaso3');
    if(_data.status=='ok'){        
        tr_paso.addClass("success");        
        mostrarLab(_data.info_apli);
    }else{
        //No se ha encontrado el fichero config.xml.
        tr_paso.addClass("warning");
    }
}


function mostrarLab(infoLab){
     
    console.log('mostrarLab')
    console.log(infoLab)
     
     
    if(infoLab.status==201){
        nPlatform=0;
        //Se ha creado correctamente
        var respuesta = infoLab.respuesta;
        $("#_info_name_apli").html(respuesta.title);
        $("#_info_vapp_apli").html(respuesta.version);
        $("#_info_vphonegap_apli").html(respuesta.phonegap_version);
        $("#_info_package_apli").html(respuesta.package);
        //respuesta.private
        $("#_info_idphonegap_apli").html(respuesta.id);
        $("#_info_desc_apli").html(respuesta.descripcion);
        var idApli = respuesta.id;
        var status = respuesta.status;
        var error = respuesta.error;
        comprobarInfoPlatform(idApli,'android',status.android, error.android);
        comprobarInfoPlatform(idApli,'ios',status.ios, error.ios);
        comprobarInfoPlatform(idApli,'winphone',status.winphone, error.winphone);
        
         
    }else{
    //No se ha creado correctamente
    }
     
    $("#_dd_ff_infoApp").show();
     
}

function comprobarInfoPlatform(idApli,platform,status, error){

    if(status=='pending'){
        nPlatform++;
        comprobarEstado(idApli,platform);
    }
    if(status=='error'){
        $("#_info_"+platform+"_apli").html("No se ha podido generar la aplicacion. Motivo: "+error);
    }
    if(status=='complete'){
        nPlatform++;
        obtenerApli(idApli,platform);        
    }

}

function comprobarEstado(idApli,platform){
    mitoken = getAuthorization('apps/download/'+lab_id+'/'+lab_experiment_id+'/'+idApli+'/'+platform,'GET',{
        name:$("#_info_name_apli")
    },gestionComprobarEstado,gestionError); 
    
}

function obtenerApli(idApli,platform){
        mitoken = getAuthorization('apps/download/'+lab_id+'/'+lab_experiment_id+'/'+idApli+'/'+platform,'GET',{
        name:$("#_info_name_apli")
    },gestionObtenerApli,gestionError); 
}

function startPaso(){
    
    if(pasoActivo!=null){
        
        var value = $('#'+pasoActivo).progressbar('getValue');
        var aumento = (value <50)?8:(value>50 && value < 70 ? 4:2 );
        var tmp = (value < 50)?300:(value >50 && value < 70 ? 400:500 );
        
        if (value < 100){
            value += Math.floor(Math.random() * aumento);
            $('#'+pasoActivo).progressbar('setValue', value);
            setTimeout(arguments.callee, tmp);
        }
    }
    
};
     



function gestionError(jqXHR, textStatus, errorThrown){
    pasoActivo=null;
    console.log(jqXHR);
    console.log(textStatus);
    closeProgress();
    $.messager.alert('Mis Apps','Se ha generado un error al realizar la operacion','error');
}


    


function getAuthorization(_url,_method,_data, _gestionRespuesta, _gestionError){
    // initProgress();
    if($.support.cors){
        $.ajax({        
            //url:'http://localhost:8084/tfm/webservices/'+_url,
            url:serverRest+_url,
            method:_method,
            data:_data,
            success:_gestionRespuesta,
            xhrFields: {
                // The 'xhrFields' property sets additional fields on the XMLHttpRequest.
                // This can be used to set the 'withCredentials' property.
                // Set the value to 'true' if you'd like to pass cookies to the server.
                // If this is enabled, your server must respond with the header
                // 'Access-Control-Allow-Credentials: true'.
                withCredentials: false
            },
            //crossDomain: true,                    
            error:_gestionError,
            beforeSend: setHeader
        })
    }else{
        console.log('No soportado');
        closeProgress();
    }
}

function setHeader(xhr) {

    //xhr.setRequestHeader('Authorization', token);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
    //xhr.setRequestHeader("Content-Type", "application/json");
    xhr.setRequestHeader("Access-Control-Allow-Methods","GET, PUT, POST, DELETE, OPTIONS"),
    xhr.setRequestHeader('Access-Control-Allow-Origin', '*');
  
    //   xhr.setRequestHeader("X-Requested-With","XMLHttpRequest");
    xhr.setRequestHeader("Accept","application/json");
}



JSON.stringify = JSON.stringify || function (obj) {
    var t = typeof (obj);
    if (t != "object" || obj === null) {
        // simple data type
        if (t == "string") obj = '"'+obj+'"';
        return String(obj);
    }
    else {
        // recurse array or object
        var n, v, json = [], arr = (obj && obj.constructor == Array);
        for (n in obj) {
            v = obj[n];
            t = typeof(v);
            if (t == "string") v = '"'+v+'"';
            else if (t == "object" && v !== null) v = JSON.stringify(v);
            json.push((arr ? "" : '"' + n + '":') + String(v));
        }
        return (arr ? "[" : "{") + String(json) + (arr ? "]" : "}");
    }
};
