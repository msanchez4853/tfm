<%-- 
    Document   : opc_iconos
    Created on : 09-may-2015, 19:46:37
    Author     : adrastea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="panel panel-success" id="_opciones_iconos"  data-config="seccion">
    <div class="panel-heading">
        <h3 class="panel-title">Iconos&nbsp; 
            <span class="_mostrar_info glyphicon glyphicon-question-sign" data-alert="iconos" data-toggle="tooltip" title="Muestra /oculta informacion adicional">&nbsp;</span></h3>
    </div>
    <div class="panel-body panel_contenido">
        <div class="container-fluid">  
            <div class="row">
                <div class="col-md-12">
                    <div id="info_iconos" class="jumbotron img-rounded" >
                        <button type="button" class="_mostrar_info close" data-alert="iconos"><span aria-hidden="true">&times;</span></button>
                        <strong>Iconos.</strong> Nos permite definir para cada una de las plataformas los iconos de nuestra aplicación. 
                        <br/>
                        Para asegurar compatibilidad es recomendable que las imágenes utilizadas sean en formato .png o el indicado en su defecto.
                        <br/>
                        Por defecto las imágenes se buscaran en el raíz salvo que el campo path recurso se especifique la ruta realativa.

                        <br/>
                        Mas informacion en Phonegap build:  <a href="http://docs.build.phonegap.com/en_US/configuring_icons_and_splash.md.html#Icons%20and%20Splash%20Screens" class="alert-link" target="_blank">Icons and Splash Screens</a>
                    </div>
                </div>
            </div>
            <div id="_acc_avan_option" class="row" style="text-align: center; margin-bottom: 5px">
                <div class="btn-group col-md-12" data-toggle="buttons">
                    <label class="col-md-3 col-sm-6 col-xs-12 btn btn-primary active" data-toggle="popover"> 
                        <span class="data-content glyphicon glyphicon-question-sign" >
                            Muestra para la plataformas iOS disponibles actualmente las distintas resoluciones que se pueden definir. 
                        </span>                           
                        <input type="radio" name="_bt_icon_rad" id="_bt_icon_option_ios" value="_opc_icon_ios" checked  data-text="_text_icon_selec" > 
                        <span class="data-title"> iOS</span>
                    </label>
                    <label class="col-md-3 col-sm-6 col-xs-12 btn btn-primary " data-toggle="popover"> 
                        <span class="data-content glyphicon glyphicon-question-sign" >
                            Muestra para la plataforma Android disponibles actualmente las distintas resoluciones que se pueden definir. 
                        </span>   
                        <input type="radio" name="_bt_icon_rad" id="_bt_icon_option_android"  value="_opc_icon_android"  data-text="_text_icon_selec" >
                        <span class="data-title"> Android</span>
                    </label>  
                    <label class="col-md-3 col-sm-6 col-xs-12 btn btn-primary " data-toggle="popover"> 
                        <span class="data-content glyphicon glyphicon-question-sign" >
                            Muestra para la plataforma Windows Phone las distintas resoluciones que se pueden definir. 
                        </span>  
                        <input type="radio" name="_bt_icon_rad" id="_bt_icon_option_win"  value="_opc_icon_win"   data-text="_text_icon_selec" > 
                        <span class="data-title">Windows Phone</span>
                    </label>
                    <label class="col-md-3 col-sm-6 col-xs-12 btn btn-primary " data-toggle="popover"> 
                        <span class="data-content glyphicon glyphicon-question-sign" >
                            Permite definir el icono por defecto para nuestra aplicacion.
                        </span>  
                        <input type="radio" name="_bt_icon_rad" id="_bt_icon_option_default"  value="_opc_icon_default" data-text="_text_icon_selec" > 
                        <span class="data-title">Default</span>
                    </label>
                </div>

            </div>
            <div class='row'>
                <div class="col-md-12 jumbotron img-rounded" style='padding-top: 18px;padding-bottom: 18px;' >
                    <strong>Definiendo iconos para</strong>:  <span id="_text_icon_selec"></span>
                </div>
            </div>
            <div id="_opc_icon_ios">
                <div class="row">
                    <div class="col-md-12"> 
                        <div class="row">
                            <div class="col-md-12 col-sm-12"> 
                                <div class="row  form-group">
                                    <label for="_opc_icon_ios_path" data-toggle="popover"> 
                                        <span class="data-content glyphicon glyphicon-question-sign" >
                                            Path relativo donde se encuentran los archivos a partir del directorio de nuestra aplicacion.
                                            <br/>
                                            <strong>Importante</strong><em>La ruta de directorios se formara utilizando como separador de directorios el caracter / </em>
                                            <br/>
                                            <em><strong>Por defecto</strong>El raiz de nuestra aplicacion.</em>
                                        </span>
                                        <span class="data-title">Path Relativo (iOS)</span>:</label>
                                    <input data-path type="text" name="_opc_icon_ios_path" id="_opc_icon_ios_path"  class="form-control" placeholder="Path relativo donde se encuentra los iconos para iOS. Por ejemplo /res/ios/"/>
                                </div>
                            </div>
                        </div>
                        <div class="row form-group">
                            <label >iOS 6</label>
                            <div class="row form-control form_agrupa">
                                <div class="col-md-2 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_icons">
                                        &nbsp;
                                        <img style="width:60px;height:60px" src="../resources/imagenes/default.png" alt="29x29 <br/> (iPhone Spotlight and Settings Icon)"  id="_img_icon_ios6_29"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_ios6_29">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_ios6_29" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_icon_ios6_29" id="_opc_icon_ios6_29" data-ext="png"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_icon_ios6_29" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_icons">
                                        &nbsp;
                                        <img style="width:60px;height:60px" src="../resources/imagenes/default.png" alt="50x50 <br/> (iPad Spotlight and Settings Icon)"  id="_img_icon_ios6_50"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_ios6_50">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_ios6_50" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_icon_ios6_50" id="_opc_icon_ios6_50"  data-ext="png"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_icon_ios6_50" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-2 col-md-offset-1 thumbnail ">
                                    <div class="row text-center img_icons ">
                                        <img style="width:60px;height:60px" src="../resources/imagenes/default.png" alt="57X57 <br/> (iPhone / iPod Touch)"  id="_img_icon_ios6_57"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_ios6_57">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_ios6_57" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file"  name="_opc_icon_ios6_57" id="_opc_icon_ios6_57" data-ext="png"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_icon_ios6_57" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_icons">
                                        &nbsp;
                                        <img style="width:60px;height:60px" src="../resources/imagenes/default.png" alt="58x58 <br/> (iPhone Spotlight and Settings Icon)"  id="_img_icon_ios6_58"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_ios6_58">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_ios6_58" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_icon_ios6_58" id="_opc_icon_ios6_58" data-ext="png"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_icon_ios6_58" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_icons ">
                                        <img style="width:72px;height:72px" src="../resources/imagenes/default.png" alt="72x72 <br/> (iPad)"  id="_img_icon_ios6_72"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_ios6_72">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_ios6_72" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_icon_ios6_72" id="_opc_icon_ios6_72" data-ext="png"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_icon_ios6_72" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_icons ">
                                        <img style="width:72px;height:72px" src="../resources/imagenes/default.png" alt="100x100 <br/> (iPad Spotlight and Settings Icon)"  id="_img_icon_ios6_100"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_ios6_100">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_ios6_100" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_icon_ios6_100" id="_opc_icon_ios6_100" data-ext="png"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_icon_ios6_100" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_icons ">
                                        <img style="width:114px;height:114px" src="../resources/imagenes/default.png" alt="114x114 <br/> (iPhone / iPod Touch)"  id="_img_icon_ios6_114"/>                                        
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_ios6_114">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_ios6_114" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_icon_ios6_114" id="_opc_icon_ios6_114" data-ext="png"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_icon_ios6_114" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_icons ">
                                        <img style="width:144px;height:144px" src="../resources/imagenes/default.png" alt="144x144 <br/> (iPad)"  id="_img_icon_ios6_144"/>     
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_ios6_144">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_ios6_144" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_icon_ios6_144" id="_opc_icon_ios6_144" data-ext="png"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_icon_ios6_144" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>                    
                </div>
                <div class="row">
                    <div class="col-md-12"> 
                        <div class="row form-group">
                            <label >iOS 7+</label>
                            <div class="row form-control form_agrupa">
                                <div class="col-md-2 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_icons">
                                        &nbsp;
                                        <img style="width:60px;height:60px" src="../resources/imagenes/default.png" alt="29x29 <br/> (Settings Icon)"  id="_img_icon_ios7_29"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_ios7_29">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_ios7_29" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_icon_ios7_29" id="_opc_icon_ios7_29" data-ext="png"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_icon_ios7_29" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_icons">
                                        &nbsp;
                                        <img style="width:60px;height:60px" src="../resources/imagenes/default.png" alt="40x40 <br/> (Spotlight Icon)"  id="_img_icon_ios7_40"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_ios7_40">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_ios7_40" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_icon_ios7_40" id="_opc_icon_ios7_40" data-ext="png"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_icon_ios7_40" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_icons">
                                        &nbsp;
                                        <img style="width:60px;height:60px" src="../resources/imagenes/default.png" alt="58x58 <br/> (Settings Icon)"  id="_img_icon_ios7_58"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_ios7_58">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_ios7_58" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_icon_ios7_58" id="_opc_icon_ios7_58" data-ext="png"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_icon_ios7_58" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_icons">
                                        &nbsp;
                                        <img style="width:60px;height:60px" src="../resources/imagenes/default.png" alt="60x60 <br/> (iPhone / iPod Touch)"  id="_img_icon_ios7_60"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_ios7_60">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_ios7_60" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_icon_ios7_60" id="_opc_icon_ios7_60" data-ext="png"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_icon_ios7_60" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_icons">
                                        &nbsp;
                                        <img style="width:80px;height:80px" src="../resources/imagenes/default.png" alt="80x80 <br/> (Spotlight Icon)"  id="_img_icon_ios7_80"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_ios7_80">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_ios7_80" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_icon_ios7_80" id="_opc_icon_ios7_80" data-ext="png"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_icon_ios7_80" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_icons">
                                        &nbsp;
                                        <img style="width:76px;height:76px" src="../resources/imagenes/default.png" alt="76X76 <br/> (iPad)"  id="_img_icon_ios7_76"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_ios7_76">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_ios7_76" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_icon_ios7_76" id="_opc_icon_ios7_76" data-ext="png"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_icon_ios7_76" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_icons">
                                        <img style="width:120px;height:120px" src="../resources/imagenes/default.png" alt="120x120 <br/> (iPhone / iPod Touch)"  id="_img_icon_ios7_120"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_ios7_120">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_ios7_120" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_icon_ios7_120" id="_opc_icon_ios7_120" data-ext="png"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_icon_ios7_120" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_icons">
                                        <img style="width:152px;height:152px" src="../resources/imagenes/default.png" alt="152x152 <br/> (iPad)"  id="_img_icon_ios7_152"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_ios7_152">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_ios7_152" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_icon_ios7_152" id="_opc_icon_ios7_152" data-ext="png"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_icon_ios7_152" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>                                
                            </div>
                        </div>
                    </div>                    
                </div>                                                         
            </div>
            <div id="_opc_icon_android">
                <div class="row">
                    <div class="col-md-12"> 
                        <div class="row">
                            <div class="col-md-12 col-sm-12"> 
                                <div class="row  form-group">
                                    <label for="_opc_icon_android_path" data-toggle="popover"> 
                                        <span class="data-content glyphicon glyphicon-question-sign" >
                                            Path relativo donde se encuentran los archivos a partir del directorio de nuestra aplicacion.
                                            <br/>
                                            <strong>Importante</strong><em>La ruta de directorios se formara utilizando como separador de directorios el caracter / </em>
                                            <br/>
                                            <em><strong>Por defecto</strong>El raiz de nuestra aplicacion.</em>
                                        </span>
                                        <span class="data-title">Path Relativo (Android)</span>:</label>
                                    <input data-path type="text" name="_opc_icon_android_path" id="_opc_icon_android_path"  class="form-control" placeholder="Path relativo donde se encuentra los iconos para Android. Por ejemplo /res/android/"/>
                                </div>
                            </div>
                        </div>
                        <div class="row form-group">
                            <label >Android</label>
                            <div class="row form-control form_agrupa">  
                                <div class="row col-md-12">
                                    <div class="col-md-2 thumbnail">
                                        <div class="row text-center img_icons">                                           
                                            <img style="width:144px;height:144px" src="../resources/imagenes/default.png" alt="ldpi"  id="_img_icon_android_ldpi"/>
                                        </div>
                                        <div class="caption">
                                            <div class="input-group col-md-12">
                                                <span class="input-group-btn">
                                                    <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_android_ldpi">
                                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                    </span>
                                                    <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_android_ldpi" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                        <input type="file" name="_opc_icon_android_ldpi" id="_opc_icon_android_ldpi" data-ext="png"/>
                                                    </span> 
                                                </span>
                                                <input class=" form-control" id="_text_icon_android_ldpi" type="text"  readonly>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2 col-md-offset-1 thumbnail">
                                        <div class="row text-center img_icons">
                                            <img style="width:144px;height:144px" src="../resources/imagenes/default.png" alt="mdpi"  id="_img_icon_android_mdpi"/>
                                        </div>
                                        <div class="caption">
                                            <div class="input-group col-md-12">
                                                <span class="input-group-btn">
                                                    <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_android_mdpi">
                                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                    </span>
                                                    <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_android_mdpi" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                        <input type="file"  name="_opc_icon_android_mdpi" id="_opc_icon_android_mdpi" data-ext="png"/>
                                                    </span> 
                                                </span>
                                                <input class=" form-control" id="_text_icon_android_mdpi" type="text"  readonly>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2 col-md-offset-1 thumbnail">
                                        <div class="row text-center img_icons">
                                            <img style="width:144px;height:144px" src="../resources/imagenes/default.png" alt="hdpi"  id="_img_icon_android_hdpi"/>
                                        </div>
                                        <div class="caption">
                                            <div class="input-group col-md-12">
                                                <span class="input-group-btn">
                                                    <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_android_hdpi">
                                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                    </span>
                                                    <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_android_hdpi" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                        <input type="file"  name="_opc_icon_android_hdpi" id="_opc_icon_android_hdpi" data-ext="png"/>
                                                    </span> 
                                                </span>
                                                <input class=" form-control" id="_text_icon_android_hdpi" type="text"  readonly>
                                            </div>
                                        </div>
                                    </div>  
                                </div>
                                <div class="row col-md-12">
                                    <div class="col-md-2 thumbnail">
                                        <div class="row text-center img_icons">
                                            &nbsp;
                                            <img style="width:144px;height:144px" src="../resources/imagenes/default.png" alt="xhdpi"  id="_img_icon_android_xhdpi"/>
                                        </div>
                                        <div class="caption">
                                            <div class="input-group col-md-12">
                                                <span class="input-group-btn">
                                                    <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_android_xhdpi">
                                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                    </span>
                                                    <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_android_xhdpi" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                        <input type="file" name="_opc_icon_android_xhdpi" id="_opc_icon_android_xhdpi" data-ext="png"/>
                                                    </span> 
                                                </span>
                                                <input class=" form-control" id="_text_icon_android_xhdpi" type="text"  readonly>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2 col-md-offset-1 thumbnail">

                                        <div class="row text-center img_icons">
                                            <img style="width:144px;height:144px" src="../resources/imagenes/default.png" alt="xxhdpi"  id="_img_icon_android_xxhdpi"/>
                                        </div>
                                        <div class="caption">
                                            <div class="input-group col-md-12">
                                                <span class="input-group-btn">
                                                    <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_android_xxhdpi">
                                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                    </span>
                                                    <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_android_xxhdpi" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                        <input type="file" name="_opc_icon_android_xxhdpi" id="_opc_icon_android_xxhdpi" data-ext="png"/>
                                                    </span> 
                                                </span>
                                                <input class=" form-control" id="_text_icon_android_xxhdpi" type="text"  readonly>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2 col-md-offset-1 thumbnail">
                                        <div class="row text-center img_icons">
                                            <img style="width:144px;height:144px" src="../resources/imagenes/default.png" alt="fr-xxhdpi"  id="_img_icon_android_fr-xxhdpi"/>
                                        </div>
                                        <div class="caption">
                                            <div class="input-group col-md-12">
                                                <span class="input-group-btn">
                                                    <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_android_fr-xxhdpi">
                                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                    </span>
                                                    <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_android_fr-xxhdpi" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                        <input type="file" name="_opc_icon_android_fr-xxhdpi" id="_opc_icon_android_fr-xxhdpi" data-ext="png"/>
                                                    </span> 
                                                </span>
                                                <input class=" form-control" id="_text_icon_android_fr-xxhdpi" type="text"  readonly>
                                            </div>
                                        </div>
                                    </div> 
                                </div>
                            </div>
                        </div>
                    </div>                    
                </div>

            </div>
            <div id="_opc_icon_win">
                <div class="row">
                    <div class="col-md-12"> 
                        <div class="row">
                            <div class="col-md-12 col-sm-12"> 
                                <div class="row  form-group">
                                    <label for="_opc_icon_win_path" data-toggle="popover"> 
                                        <span class="data-content glyphicon glyphicon-question-sign" >
                                            Path relativo donde se encuentran los archivos a partir del directorio de nuestra aplicacion.
                                            <br/>
                                            <strong>Importante</strong><em>La ruta de directorios se formara utilizando como separador de directorios el caracter / </em>
                                            <br/>
                                            <em><strong>Por defecto</strong>El raiz de nuestra aplicacion.</em>
                                        </span>
                                        <span class="data-title">Path Relativo (Windows Phone)</span>:</label>
                                    <input data-path type="text" name="_opc_icon_win_path" id="_opc_icon_win_path"  class="form-control" placeholder="Path relativo donde se encuentra los iconos para Windows Phone. Por ejemplo /res/win/"/>
                                </div>
                            </div>
                        </div>
                        <div class="row form-group">

                            <label >WinPhone</label>
                            <div class="row form-control form_agrupa">

                                <div class="col-md-2 thumbnail">
                                    <div class="row text-center img_icons">
                                        <img style="width:173px;height:173px" src="../resources/imagenes/default.png" alt="Icon"  id="_img_icon_win_role_"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_win_role_">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_win_role_" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_icon_win_role_" id="_opc_icon_win_role_" data-ext="png"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control"  id="_text_icon_win_role_" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_icons">
                                        <img style="width:173px;height:173px" src="../resources/imagenes/default.png" alt="BackGround"  id="_img_icon_win_role_background"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_win_role_background">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_win_role_background" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_icon_win_role_background" id="_opc_icon_win_role_background" data-ext="png"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_icon_win_role_background" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>                                
                            </div>
                        </div>
                    </div>                    
                </div>                                                         
            </div>
            <div id="_opc_icon_default">
                <div class="row">
                    <div class="col-md-12"> 
                        <div class="row">
                            <div class="col-md-12 col-sm-12"> 
                                <div class="row  form-group">
                                    <label for="_opc_icon_default_path" data-toggle="popover"> 
                                        <span class="data-content glyphicon glyphicon-question-sign" >
                                            Path relativo donde se encuentran los archivos a partir del directorio de nuestra aplicacion.
                                            <br/>
                                            <strong>Importante</strong><em>La ruta de directorios se formara utilizando como separador de directorios el caracter / </em>
                                            <br/>
                                            <em><strong>Por defecto</strong>El raiz de nuestra aplicacion.</em>
                                        </span>
                                        <span class="data-title">Path Relativo (Default)</span>:</label>
                                    <input data-path type="text" name="_opc_icon_default_path" id="_opc_icon_default_path"  class="form-control" placeholder="Path relativo donde se encuentra el icono por defecto. Por ejemplo /res/icons/default/"/>
                                </div>
                            </div>
                        </div>
                        <div class="row form-group">
                            <label >Default</label>
                            <div class="row form-control form_agrupa">

                                <div class="col-md-2 thumbnail">
                                    <div class="row text-center img_icons">
                                        <img style="width:120px;height:120px" src="../resources/imagenes/default.png" alt="Default"  id="_img_icon_default_1"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_icon_default_1">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_icon_default_1" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_icon_default_1" id="_opc_icon_default_1" data-ext="png"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_icon_default_1" type="text"  readonly >
                                        </div>
                                    </div>
                                </div>                                                             
                            </div>
                        </div>
                    </div>                    
                </div>                                                         
            </div>
        </div>
    </div>
</div>