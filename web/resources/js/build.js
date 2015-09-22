/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var mitoken=null;
var _idMenuMo = null;
var _platfMenuMo = null;
var mensaje_ok = null;

$(window).ready(function(){
    

      
    ajustartam();
    defineEvents();  
    
    $("#apps_phonegap").datagrid({
        singleSelect:true,
        //url:'getApps.jsp',    
        columns:[[
        {
            field:'ck',
            checkbox:true,
            resizable:false
        },
        {
            field:'id',
            title:'Id.',
            resizable:false,
            width:'10%'
        },

        {
            field:'title',
            title:'Aplicacion',
            formatter:formatTitle,
            resizable:false,
            width:'34%'
        },
        {
            field:'version',
            title:'Apli',
            resizable:false,
            width:'5%'
        },
        {
            field:'phonegap_version',
            title:'Pho.',
            resizable:false,
            width:'5%'
        },
        {
            field:'package',
            title:'Package',
            resizable:false,
            width:'30%'
        },
        {
            field:'status_android',
            title:'And.',
            formatter:formatPlatformAndroid,
            resizable:false,
            width:'5%'
        },
        {
            field:'status_ios',
            title:'iOS',
            formatter:formatPlatformIOS,
            resizable:false,
            width:'5%'
        },
        {
            field:'status_win',
            title:'Win',
            formatter:formatPlatformWin,
            resizable:false,
            width:'5%'
        }

        ]],
        checkOnSelect:true,
        selectOnCheck:true,
        toolbar:'#tb',
        // footer:'#ft',
        onLoadSuccess:eventsAccionesApp,
        loadMsg: 'Obteniendo Informacion. Espere Por favor!!'
    });
    
    $("#menuPlatform").menu(
    {
        onClick:handlerMenu
    }
    );
    //Obtner las aplicaciones al entrar en la aplicacion.
    mitoken = getAuthorization('apps','GET',{},gestionRespuestaNoReload,gestionError);    

    $("#_dd_ff_addApp").dialog({
        title:'A&ntilde;adir aplicacion.',
        closed:true,
        modal:true,
        buttons:[{
            text:'A&ntilde;adir',
            handler:validarAddApp
        },{
            text:'Cerrar',
            handler:function(){
                $("#_dd_ff_addApp").dialog('close');
            }
        }],
        width:400
    });
    
    $("#_dd_ff_infoApp").dialog({
        title:'Informaci&oacute;n de ',
        closed:true,
        modal:true,
        buttons:[{
            text:'Cerrar',
            handler:function(){
                $("#_dd_ff_infoApp").dialog('close');
            }
        }],
        width:400
    });
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
    $("a[name='getOpc']").click(getOpcApp); 
    $("a[name='getInfo']").click(getInfoApp); 
    $("a[name='getError']").click(getErrorApp); 
}

function delApp(e){
     
    var row = $('#apps_phonegap').datagrid('getSelected');
    if (row){        
        
        $.messager.confirm('Mis Apps', 'Esta seguro de eliminar la aplicacion seleccionada?', function(r){
            if (r){
                mitoken = getAuthorization('apps/'+row.id,'DELETE',{
                    idApp:''+row.id
                },gestionRespuestaWithReload,gestionError);    
            
            }
        });
    }else{
        $.messager.alert('Mis Apps','Debe seleccionar una aplicacion','error')
    }
}


function gestionError(jqXHR, textStatus, errorThrown){
    
   
    closeProgress();
    if(jqXHR.respuesta==undefined){
        $.messager.alert('Mis Apps','Se ha generado un error al realizar la operacion','error');
    }else{
        var respuesta  = jqXHR.respuesta
        $.messager.alert('Mis Apps','Se ha generado un error al realizar la operacion. <br/> <strong style="color:red">'+respuesta.error+'</strong>','error');
    }
}

function gestionRespuestaWithReload(_data,  textStatus,  jqXHR){
    
    if(_data.status==200){
        if (mensaje_ok == null) {
            mensaje_ok = $.messager.show(
            {
                timeout: 500,
                showSpeed: 500,
                title:'Mis Apps',
                msg:'Operacion realizada con exito',
                showType:'show',
                style:{
                    right:'',
                    top:document.body.scrollTop+document.documentElement.scrollTop,
                    bottom:''
                }
            });
        }else{
            mensaje_ok.show();
        }
        closeProgress();
        reloadApp();
    }else{
        gestionError(_data,textStatus,jqXHR);
        closeProgress();
    }
    
 
    
    
}

function gestionRespuestaNoReload(_data,  textStatus,  jqXHR){
    
    if(_data.status==200){
        if (mensaje_ok == null) {
            mensaje_ok = $.messager.show(
            {
                timeout: 500,
                showSpeed: 500,                   
                title:'Mis Apps',
                msg:'Operacion realizada con exito',
                showType:'show',
                style:{
                    right:'',
                    top:document.body.scrollTop+document.documentElement.scrollTop,
                    bottom:''
                }
            });
        } 
        var respuesta = _data.respuesta;

        $('#apps_phonegap').datagrid('loadData',  respuesta);
    }else{
        gestionError(_data,textStatus,jqXHR);
    }
    closeProgress();
 
   
    
}

function reloadApp(e){
    mitoken = getAuthorization('apps','GET',{},gestionRespuestaNoReload,gestionError);  
}

function editApp(e){
    var row = $('#apps_phonegap').datagrid('getSelected');
    if (row){        
        
        $.messager.confirm('Mis Apps', 'Va a volver a generar la aplicacion para todas las plataformas?', function(r){
            if (r){
                mitoken = getAuthorization('apps/'+row.id+'/build/','POST',
                {},gestionRespuestaWithReload,gestionError);    
            
            }
        });
    }else{
        $.messager.alert('Mis Apps','Debe seleccionar una aplicacion','error')
    }
}

function muestraDetalleApp(id,index){
    $('#apps_phonegap').datagrid('selectRow',index);
    var row=$('#apps_phonegap').datagrid('getSelected');
        
    $('#_info_vapp_apli').html(row.version);
    $('#_info_vphonegap_apli').html(row.phonegap_version);
    $('#_info_desc_apli').html(row.desc);
   
        
    $("#_dd_ff_infoApp").dialog({
        title:'Informaci&oacute;n de '+row.title
    })
    .dialog("open");
}

function addApp(e){
    
    $('#_ff_addApp').form('clear');
    $("#_ff_addApp_men").html('');
    $("#_dd_ff_addApp").dialog("open");   
}

function validarAddApp(){
   
    if( $("#_ff_addApp_title").val()!='' &&  $("#_ff_addApp_url").val()!=''){
    
        _info={};
        _info.title = $("#_ff_addApp_title").val();
        _info.method = "remote_repo";
        _info.url = $("#_ff_addApp_url").val();
  
        _data = {};
        _data.datos = JSON.stringify(_info);
        
        mitoken = getAuthorization('apps','POST',_data,gestionRespuestaWithReload,gestionError);
        $("#_dd_ff_addApp").dialog("close");
    }else{
        $("#_ff_addApp_men").html('Error en los parametros introducidos. Compruebe los valores de los campos.');
        $("#_dd_ff_addApp").dialog("open");
    }
}

function formatPlatformAndroid(val,row,index){
    var platform = 'android';
      
    salida = formatPlatform(row.id, platform, val, row.download_android, row.error_android);
   
    return salida;
}

function formatPlatformIOS(val,row,index){
    var platform = 'ios';
    salida = formatPlatform(row.id, platform, val, row.download_ios, row.error_ios);

    return salida;
}

function formatPlatformWin(val,row,index){
    var platform = 'winphone';
    salida = formatPlatform(row.id, platform, val, row.download_win, row.error_win);

    return salida;
}


function formatTitle(val,row,index){
    salida = '<a href="#" class="_mas_info" id="_mas_info_'+row.id+'" onclick="muestraDetalleApp('+row.id+','+index+');return false;" >'+val+'</span>';

    return salida;
}

function formatPlatform(id,platform, estado, download,error){
    var salida = '<a  href="#" data-platform="'+platform+'" data-apli="'+id+'"'; 
    if(estado=='pending'){
        salida+='class="tool_button icon-help" name="getInfo"'
    }
    
    if(estado=='complete'){
        salida+='class="tool_button icon-ok"  name="getOpc" data-download="'+download+'"'
    }
    
    if(estado=='error'){
        salida+='class="tool_button icon-no"  name="getError" data-error="'+error+'"'
    }
    salida+='></a>';    
    return salida 
}


function getInfoApp(e){
    var platf = $(this).attr('data-platform');
    _platfMenuMo = platf;
    $.messager.alert('Mis Apps','No se ha terminado de generar la aplicacion para la plataforma '+_platfMenuMo,'info')
}
function getErrorApp(e){
    var platf = $(this).attr('data-platform');
    _platfMenuMo = platf;
    var info_error = $(this).attr('data-error');
    $.messager.alert('Mis Apps','No se ha construido la aplicacion para la plataforma '+_platfMenuMo+'. <br/> Por el siguiente error:<strong style="color:red">'+info_error+'</strong>','info')
    
}
function getOpcApp(e){
    //La aplicacion se encuentra pending
    // alert('aqui')
    var id = $(this).attr('data-apli');
    _idMenuMo = id;
    var platf = $(this).attr('data-platform');
    _platfMenuMo = platf;
     
    $("#menuPlatform").menu('show',{
        left: e.pageX,
        top: e.pageY
    });
}


function handlerMenu(item){

    if(item.text=='Build') buildApp();
    if(item.text=='Descargar') downloadApp();
}

function buildApp(e){
     
    var row = $('#apps_phonegap').datagrid('getSelected');
    if (row){        
        
        $.messager.confirm('Mis Apps', 'Va a volver a generar la aplicacion para la plataforma '+_platfMenuMo+'?', function(r){
            if (r){
                mitoken = getAuthorization('apps/'+row.id+'/build/'+_platfMenuMo,'POST',
                {},gestionRespuestaWithReload,gestionError);    
            
            }
        });
    }else{
        $.messager.alert('Mis Apps','Debe seleccionar una aplicacion','error')
    }
}


function downloadApp(e){
     
    var row = $('#apps_phonegap').datagrid('getSelected');
    if (row){                
        $.messager.confirm('Mis Apps', 'Va a descargar la aplicacion para la plataforma '+_platfMenuMo+'?', function(r){
            if (r){               
                $("#_ff_downApp_name").val(row.title);
                $("#_ff_downApp").attr("target","download_"+row.id);
                $("#_ff_downApp").attr("action",serverRest+'apps/'+row.id+'/'+_platfMenuMo);
                $("#_ff_downApp").submit();
               
            }
        });
    }else{
        $.messager.alert('Mis Apps','Debe seleccionar una aplicacion','error')
    }
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

function getAuthorization(_url,_method,_data, _gestionRespuesta, _gestionError){
    initProgress();
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
