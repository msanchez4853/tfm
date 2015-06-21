/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var mitoken=null;

/*
var createCORSRequest = function(method, url) {
    var xhr = new XMLHttpRequest();
     xhr.withCredentials = false;
    if ("withCredentials" in xhr) {
        // Most browsers.
      //  xhr.setRequestHeader("Content-Type", "application/json");
      //  xhr.setRequestHeader("Access-Control-Allow-Methods","GET, PUT, POST, DELETE, OPTIONS"),
        
       // xhr.setRequestHeader("X-Requested-With","XMLHttpRequest");
     //   xhr.setRequestHeader("Accept","application/json");
        xhr.open(method, url, true);
        xhr.setRequestHeader('Access-Control-Allow-Origin', '*');
        xhr.setRequestHeader("Access-Control-Allow-Methods","GET, PUT, POST, DELETE, OPTIONS");
        xhr.setRequestHeader("Accept","application/json");
         xhr.setRequestHeader("Content-Type", "application/json");
         xhr.setRequestHeader("X-Requested-With","XMLHttpRequest");
    } else if (typeof XDomainRequest != "undefined") {
        // IE8 & IE9
        xhr = new XDomainRequest();
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.setRequestHeader("Access-Control-Allow-Methods","GET, PUT, POST, DELETE, OPTIONS"),
        xhr.setRequestHeader('Access-Control-Allow-Origin', '*');
       // xhr.setRequestHeader("X-Requested-With","XMLHttpRequest");
        xhr.setRequestHeader("Accept","application/json");
        xhr.open(method, url);
    } else {
        // CORS not supported.
        xhr = null;
    }
    return xhr;
};

var url = 'https://build.phonegap.com//authorize/token?client_id=7c533be0f63a942b02c1&code';
var method = 'POST';
var xhr = createCORSRequest(method, url);

xhr.onload = function() {
    // Success code goes here.
    };

xhr.onerror = function() {
    // Error code goes here.
    };

  

xhr.send();
*/

$(window).ready(function(){
    
    /*   var url = 'http://api.alice.com/cors';
var xhr = createCORSRequest('GET', url);
xhr.send();
*/
      mitoken = getAuthorization();
    //  ajustartam();
    // defineEvents();  
    
    /*  $("#apps_phonegap").datagrid({
        singleSelect:true,
        url:'getApps.jsp',    
        columns:[[
        {
            field:'ck',
            checkbox:true
        },
        {
            field:'id',
            title:'Id.'
        },

        {
            field:'title',
            title:'Aplicacion'
        },

        {
            field:'package',
            title:'Paqckage'
        },

        {
            field:'install_url',
            title:'Donwload'
        },
        {
            field:'status_android',
            title:'Android',
            formatter:formatPlatform
        },
        {
            field:'status_ios',
            title:'iOS',
            formatter:formatPlatform
        },
        {
            field:'status_win',
            title:'WinPhone',
            formatter:formatPlatform
        }
        ]],
        checkOnSelect:true,
        selectOnCheck:true,
        toolbar:'#tb',
        footer:'#ft',
        onLoadSuccess:eventsAccionesApp,
        loadMsg: 'Obteniendo Informacion. Espere Por favor!!'
    });
    
    $("#menuPlatform").menu();*/
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
    
    $("a[name='del']").click(delApp); 
    $("a[name='add']").click(addApp); 
    $("a[name='edit']").click(editApp); 
    eventsAccionesApp();
    
}

function eventsAccionesApp(){
    $("a[name='reload']").click(reloadApp); 
    $("a[name='getApli']").click(getApliApp); 
}

function delApp(e){
     
    var row = $('#apps_phonegap').datagrid('getSelected');
    if (row){        
        $.messager.confirm('Mis Apps', 'Esta seguro de eliminar la aplicacion seleccionada?', function(r){
            if (r){
                initProgress();
                $.ajax({
                    url:'deleteApp.jsp',
                    data:{
                        idApp:''+row.id
                    },
                    datatype:'json',
                    method:'POST',
                    success:gestionRespuesta,
                    error:gestionError
                })
            }
        });
    }else{
        $.messager.alert('Mis Apps','Debe seleccionar una aplicacion','error')
    }
}


function gestionError(jqXHR, textStatus, errorThrown){
    console.log(jqXHR);
    console.log(textStatus);
    closeProgress();
    $.messager.alert('Mis Apps','Se ha generado un error al realizar la operacion','error');
}

function gestionRespuesta(data,  textStatus,  jqXHR){
    $.messager.show(
    {
        title:'Mis Apps',
        msg:'Operacion realizada con exito',
        showType:'show',
        style:{
            right:'',
            top:document.body.scrollTop+document.documentElement.scrollTop,
            bottom:''
        }
    });
    console.log(data)
    $('#apps_phonegap').datagrid('reload');
    closeProgress();
}

function reloadApp(e){
    $('#apps_phonegap').datagrid('reload');
}

function editApp(e){
    alert("va e editar");
}

function addApp(e){
    initProgress();
    $.ajax({
        url:'addApp.jsp',
        data:{
            idApp:''
        },
        datatype:'json',
        method:'POST',
        success:gestionRespuesta,
        error:gestionError
    })
}


function formatPlatform(val,row,index){
    var platform = $(this).attr('field');
    platform = platform.replace('status_','');
    var salida = '<a  href="#" data-platform="'+platform+'" data-apli="'+row.id+'"'; 
    if(val=='pending'){
        salida+='class="tool_button icon-help" name="getInfo"'
    }
    
    if(val=='complete'){
        salida+='class="tool_button icon-ok"  name="getApli"'
    }
    
    if(val=='error'){
        salida+='class="tool_button icon-no"  name="getInfo"'
    }
    salida+='></a>';    
    return salida;
}

function getApliApp(e){
    //La aplicacion se encuentra pending
    // alert('aqui')
    /* var id = $(this).attr('data-apli');
    $("#getApli").window({
        title:'Inf. Apli'+id,
        modal:true,
        toolbar:[{
            text:'Build',
            iconCls:'icon-edit',
            handler:function(){
                alert('build')
            }
        },{
            text:'Help',
            iconCls:'icon-help',
            handler:function(){
                alert('help')
            }
        }],
        buttons:[{
            text:'Cerrar',
            handler:function(){
                $("#getApli").window('close')
                }
        }],
    onResize:function(){
                $(this).window('hcenter');
            }
    });*/
    
    $("#menuPlatform").menu('show',{
        left: e.pageX,
        top: e.pageY
    });
}

function initProgress(){
    var win = $.messager.progress({
        title:'Realizando Operacion ',
        msg:'Espere por favor!!!'
    });

}

function closeProgress(){
    $.messager.progress('close');
}

function getAuthorization(){
    if($.support.cors){
        $.ajax({
            url:'https://build.phonegap.com/authorize/token',
            method:'OPTIONS',
            data:{
                client_id:"7c533be0f63a942b02c1",
                code:"b3511beac8a433bcb2f5e652e8",
                client_secret:"3e5e7f2c079f5902eac4e64247261556d80b8467"
            },
            success:function(  data,  textStatus, jqXHR){
                console.log(data)
            },
            xhrFields: {
                // The 'xhrFields' property sets additional fields on the XMLHttpRequest.
                // This can be used to set the 'withCredentials' property.
                // Set the value to 'true' if you'd like to pass cookies to the server.
                // If this is enabled, your server must respond with the header
                // 'Access-Control-Allow-Credentials: true'.
                withCredentials: false
            },
            crossDomain: true,
            dataType: 'json',
            
            error:function(jqXHR, textStatus, error){
                console.log(jqXHR+''+error)
            },
            beforeSend: setHeader
        
        })
    }else{
        console.log('No soportado')
    }
}
function setHeader(xhr) {

    //xhr.setRequestHeader('Authorization', token);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.setRequestHeader("Access-Control-Allow-Methods","GET, PUT, POST, DELETE, OPTIONS"),
    xhr.setRequestHeader('Access-Control-Allow-Origin', '*');
  
    xhr.setRequestHeader("X-Requested-With","XMLHttpRequest");
    xhr.setRequestHeader("Accept","application/json");
}
/*
function createCORSRequest(method, url) {
  var xhr = new XMLHttpRequest();
  if ("withCredentials" in xhr) {

    // Check if the XMLHttpRequest object has a "withCredentials" property.
    // "withCredentials" only exists on XMLHTTPRequest2 objects.
    xhr.open(method, url, true);

  } else if (typeof XDomainRequest != "undefined") {

    // Otherwise, check if XDomainRequest.
    // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
    xhr = new XDomainRequest();
    xhr.open(method, url);

  } else {

    // Otherwise, CORS is not supported by the browser.
    xhr = null;

  }
  return xhr;
}

var xhr = createCORSRequest('GET', 'https://build.phonegap.com/authorize?client_id=7c533be0f63a942b02c1');
if (!xhr) {
  throw new Error('CORS not supported');
}

xhr.onload = function() {
 var responseText = xhr.responseText;
 console.log(responseText);
 // process the response.
};

xhr.onerror = function() {
  console.log('There was an error!');
};

xhr.send();*/