/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var mitoken=null;


$(window).ready(function(){
    

      
    //  ajustartam();
    // defineEvents();  
    
    $("#apps_phonegap").datagrid({
        singleSelect:true,
        //url:'getApps.jsp',    
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
    
    $("#menuPlatform").menu();
    mitoken = getAuthorization('apps','GET',{},gestionRespuesta,gestionError);    

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

function gestionRespuesta(_data,  textStatus,  jqXHR){
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
    console.log(_data)
    $('#apps_phonegap').datagrid('loadData',  _data);
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
    getAuthorization(url,method,data, gestionRespuesta, gestionError)
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
    var id = $(this).attr('data-apli');
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
    });
    
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

function getAuthorization(_url,_method,_data, _gestionRespuesta, _gestionError){
      initProgress();
    if($.support.cors){
        $.ajax({        
            url:'http://localhost:8080/tfm_final/webservices/'+_url,
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
            crossDomain: true,                    
            error:_gestionError,
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
