/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(window).ready(function(){
    ajustartam();
    defineEvents();  
    
    // $("#_opc_avan_android").hide();
    $("#_bt_avan_option_ios").change();
    $("#_bt_icon_option_ios").change();
    $("#_bt_splash_option_ios").change();
   
    $("img[id^='_img_icon_'],img[id^='_img_splash_']").each(function(){
        $(this).parent().append('<p>'+$(this).attr('alt')+'</p>');
    });
    
    reiniciarFormAcceso();
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
    $("#_opciones_guardar").click(generarXml);    
    $("li > a[id!='_opciones_guardar']").click(accederOpciones);
    console.log($("input[type='radio'][name='_bt_avan_rad']").size())
    $("input[type='radio'][name='_bt_avan_rad']").change(grupoOpciones);
    $("input[type='radio'][name='_bt_icon_rad']").change(grupoOpciones);
    $("input[type='radio'][name='_bt_splash_rad']").change(grupoOpciones);
    
    $("span[id^='_bt_del_']").click(dialogoDelIcon);   
    $('.btn-file :file').on('fileselect', handleFileSelect);
    $("#_bt_perm_add_acc").click(anadirAcceso);
    $("#_bt_perm_del_acc").click(eliminarAcceso);
    $("#_bt_perm_mod_acc").click(editarAcceso);
    
    
}

function generarXml(){
    console.log('generarXml');
    $("#form_guardar").submit();
}

function accederOpciones(){
    // console.log('accederOpciones')
    _this = $(this).parent();
    // console.log('accederOpciones1')
    if(!_this.hasClass('active')){
        // console.log('accederOpciones 2 --> ')
        $("li[class~='active']").removeClass('active');
        _this.addClass('active');
    //console.log('accederOpciones 3')
    $("#bs-example-navbar-collapse-1").collapse('hide');
    }
}

function grupoOpcionesAvanzadas(){
    _this=$(this);
    console.log(this.id)
    if(this.id=='_bt_avan_option_ios'){
        $("#_opc_avan_ios").show();
        $("#_opc_avan_android").hide();
    }
    if(this.id=='_bt_avan_option_android'){
        $("#_opc_avan_ios").hide();
        $("#_opc_avan_android").show();
    }
    
}

function grupoOpciones(){
    console.log(this.name)
    var radios =$("[name='"+$(this).attr('name')+"']");
    console.log(this.id)
    for(i=0; i< radios.size(); i++){
        console.log(radios[i].id)
        if($(radios[i]).attr('id')==this.id) $("#"+$(radios[i]).attr('value')).show();
        else  $("#"+$(radios[i]).attr('value')).hide();
    }
        
}

function handleFileSelect(evt,numFiles, label) {
  
    //console.log('handleFileSelect(evt) --> ' +this.id)
    var _id_opc = this.id;
    var files = evt.target.files; // FileList object
    var _id_img = _id_opc.replace('opc','img');
    var _id_text = _id_opc.replace('opc','text');
    //  console.log(_id_img)
    // Loop through the FileList and render image files as thumbnails.
    for (var i = 0, f; f = files[i]; i++) {

        console.log(f.type);
        console.log();

        // Only process image files.
        if (!f.type.match('image.*') && $("#"+_id_img).attr('src')!=undefined) {
            alert("debe selecionar una archivo de imagen.")
            continue;
        }
        
        if(!f.type.match('text.*') && $("#"+_id_img).attr('src')==undefined) {
            alert("debe selecionar una archivo de texto plano.")
            continue;
        }
        
        var reader = new FileReader();

        // Closure to capture the file information.
        reader.onload = (function(theFile) {
            return function(e) {             
                if($("#"+_id_img).attr('src')!=undefined){
                    $("#"+_id_img).attr('data-original', $("#"+_id_img).attr('src'));    
                    $("#"+_id_img).attr('src', e.target.result);     
                }
                //  $("#"+_id_text).html(label);     
                $("#"+_id_text).val(label);     
            };
        })(f);

        // Read in the image file as a data URL.
        reader.readAsDataURL(f);   
      
    }
    
}

function dialogoDelIcon(){
    var _id_opc = this.id;    
    var _id_file = _id_opc.replace('_bt_del_','_opc_');
    var _id_img = _id_file.replace('opc','img');
    var _id_text = _id_file.replace('opc','text');
    console.log(_id_opc+'   '+_id_file+'   '+_id_text)
    $("#"+_id_file).val('');
    $("#"+_id_img).attr('src',$("#"+_id_img).attr('data-original'));
    $("#"+_id_text).val(''); 
    
     
}


$(document).on('change', '.btn-file :file', function() {
    var input = $(this),
    numFiles = input.get(0).files ? input.get(0).files.length : 1,
    label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    input.trigger('fileselect', [numFiles, label]);
});

var _permisos_sin_acceso = null;
var _indice_acceso = 0;
function anadirAcceso(){
    
    var _url = $("#_opc_perm_defacc_url").val();
    if(_url.trim()==''){
        console.log('No se ha especificado la url.')
        alert('No se ha especificado la url.');
        return;
    }
    
    var _tr_acc = $("#_tb_perm_access > tbody > tr > td[name='url'");
    
    for(i=0;i< _tr_acc.size();i++){
        if($(_tr_acc[i]).html() == _url){
            console.log('Se ha especfiicado acceso para la url indicada')
            alert('Se ha especificado previamente acceso para la url indicada');
            return;
        }
    }
    
    
    var perm_sin_accesos =$("#_perm_sin_accesos");
    
    if(perm_sin_accesos.size()!=0){
        _permisos_sin_acceso = perm_sin_accesos.clone();
        perm_sin_accesos.remove();
    }
    
    var _brow = $("#_opc_perm_defacc_external").prop( "checked" );
    var _sDom = $("#_opc_perm_defacc_subdomains").prop( "checked" );
    _indice_acceso++;
    var _iUrl = $("<input type='hidden' id='_opc_perm_acceso_"+_indice_acceso+"_url' name='_opc_perm_acceso_"+_indice_acceso+"_url'  value='"+_url+"'/>");
    var _iSDom = $("<input type='hidden' id='_opc_perm_acceso_"+_indice_acceso+"_subdomains' name='_opc_perm_acceso_"+_indice_acceso+"_subdomains'  value='"+_sDom+"'/>");
    var _iBrow = $("<input type='hidden' id='_opc_perm_acceso_"+_indice_acceso+"_external' name='_opc_perm_acceso_"+_indice_acceso+"_external' value='"+_brow+"'/>");
    var _fila_acces = $("<tr id='_opc_perm_fila_acceso_"+_indice_acceso+"' data-i='"+_indice_acceso+"'><td name='url'>"+_url+"</td><td name='subdomains'>"+_sDom+"</td><td name='external'><span>"+_brow+"</span></td></tr>")
    $("#_tb_perm_access > tbody").append(_fila_acces);
    _fila_acces.children("td[name='external']").append(_iUrl);
    _fila_acces.children("td[name='external']").append(_iSDom);
    _fila_acces.children("td[name='external']").append(_iBrow);
    _fila_acces.click(seleccionarAcceso);
    reiniciarFormAcceso();
}




function reiniciarFormAcceso(){
    $("#_opc_perm_defacc_indice").val('')
    $("#_opc_perm_defacc_url").val('');
    $("#_opc_perm_defacc_external").removeProp( "checked" );
    $("#_opc_perm_defacc_subdomains").removeProp( "checked" );
    $("#_bt_perm_add_acc").prop('disabled',false);
    $("#_bt_perm_add_acc").removeClass('disabled');
    $("#_bt_perm_del_acc").prop('disabled',true);
    $("#_bt_perm_del_acc").addClass('disabled');    
    $("#_bt_perm_mod_acc").prop('disabled',true);
    $("#_bt_perm_mod_acc").addClass('disabled');
}


function seleccionarAcceso(){
    var _this = $(this) 
    $("#_tb_perm_access > tbody > tr").removeClass("success");
    _this.addClass('success');
    
    var _indice = _this.attr('data-i');
    console.log('seleccionarAcceso indice --> '+_indice)
    $("#_opc_perm_defacc_indice").val(_indice);
        
    $("#_opc_perm_defacc_url").val($("#_opc_perm_acceso_"+_indice+"_url").val());
    $("#_opc_perm_defacc_external").prop( "checked", ($("#_opc_perm_acceso_"+_indice+"_external").val()==='true'));
    $("#_opc_perm_defacc_subdomains").prop( "checked", ($("#_opc_perm_acceso_"+_indice+"_subdomains").val()==='true'));
    $("#_bt_perm_del_acc").prop('disabled',false);
    $("#_bt_perm_del_acc").removeClass('disabled');    
    $("#_bt_perm_mod_acc").prop('disabled',false);
    $("#_bt_perm_mod_acc").removeClass('disabled');
    $("#_bt_perm_add_acc").prop('disabled',true);
    $("#_bt_perm_add_acc").addClass('disabled');
    console.log('fin seleccionarAcceso indice --> '+_indice)
}


function eliminarAcceso(){
    var _indice =  $("#_opc_perm_defacc_indice").val();
    $("#_opc_perm_fila_acceso_"+_indice).remove();
    if($("#_tb_perm_access > tbody > tr").size()==0){
        $("#_tb_perm_access > tbody").append(_permisos_sin_acceso);
    }
    reiniciarFormAcceso();
}

function editarAcceso(){

    var _brow = $("#_opc_perm_defacc_external").prop( "checked" );
    var _sDom = $("#_opc_perm_defacc_subdomains").prop( "checked" );
    var _url = $("#_opc_perm_defacc_url").val();
    var _indice =  $("#_opc_perm_defacc_indice").val();
    
    console.log($("#_opc_perm_acceso_"+_indice+"_url").val());
    $("#_opc_perm_acceso_"+_indice+"_url").val(''+_url);
    console.log($("#_opc_perm_acceso_"+_indice+"_url").val());
    $("#_opc_perm_acceso_"+_indice+"_external").val(''+_brow);
    $("#_opc_perm_acceso_"+_indice+"_subdomains").val(''+_sDom)
    $("#_tb_perm_access > tbody > tr[data-i='"+_indice+"'] > td[name='url']").html(_url);
    $("#_tb_perm_access > tbody > tr[data-i='"+_indice+"'] > td[name='subdomains']").html(' '+_sDom);
    $("#_tb_perm_access > tbody > tr[data-i='"+_indice+"'] > td[name='external'] > span").html(' '+_brow);
    $("#_tb_perm_access > tbody > tr").removeClass("success");
    reiniciarFormAcceso();
}