<%-- 
    Document   : opc_iconos
    Created on : 09-may-2015, 19:46:37
    Author     : adrastea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="panel panel-success" id="_opciones_splash"  data-config="seccion">
    <div class="panel-heading">
        <h3 class="panel-title">Splash Screen&nbsp; 
            <span class="_mostrar_info glyphicon glyphicon-question-sign" data-alert="splash" data-toggle="tooltip" title="Muestra /oculta informacion adicional">&nbsp;</span></h3>
    </div>
    <div class="panel-body panel_contenido">
        <div class="container-fluid">  
            <div class="row">
                <div class="col-md-12">
                    <div id="info_splash" class="jumbotron img-rounded" >
                        <button type="button" class="_mostrar_info close" data-alert="splash"><span aria-hidden="true">&times;</span></button>
                       <strong>Splash Screen.</strong> Nos permite definir para cada una de las plataformas los splash Screen de nuestra aplicación. 
                        <br/>
                        Para asegurar compatibilidad es recomendable que las imágenes utilizadas sean en formato .png o el indicado en su defecto.
                        <br/>
                        Por defecto las imágenes se buscaran en el raíz salvo que el campo path se especifique la ruta relativa.

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
                        <input type="radio" name="_bt_splash_rad" id="_bt_splash_option_ios" value="_opc_splash_ios" checked  data-text="_text_splash_selec" > 
                        <span class="data-title"> iOS</span>
                    </label>
                    <label class="col-md-3 col-sm-6 col-xs-12 btn btn-primary " data-toggle="popover"> 
                        <span class="data-content glyphicon glyphicon-question-sign" >
                            Muestra para la plataforma Android disponibles actualmente las distintas resoluciones que se pueden definir. 
                        </span> 
                        <input type="radio" name="_bt_splash_rad" id="_bt_splash_option_android"  value="_opc_splash_android"   data-text="_text_splash_selec" >
                        <span class="data-title"> Android</span>
                    </label>  
                    <label class="col-md-3 col-sm-6 col-xs-12 btn btn-primary " data-toggle="popover"> 
                        <span class="data-content glyphicon glyphicon-question-sign" >
                            Muestra para la plataforma Windows Phone las distintas resoluciones que se pueden definir. 
                        </span>
                        <input type="radio" name="_bt_splash_rad" id="_bt_splash_option_win"  value="_opc_splash_win"   data-text="_text_splash_selec" > 
                        <span class="data-title">Windows Phone</span>
                    </label>
                    <label class="col-md-3 col-sm-6 col-xs-12 btn btn-primary " data-toggle="popover"> 
                        <span class="data-content glyphicon glyphicon-question-sign" >
                            Permite definir el icono por defecto para nuestra aplicacion.
                        </span>  
                        <input type="radio" name="_bt_splash_rad" id="_bt_splash_option_default"  value="_opc_splash_default" data-text="_text_splash_selec" > 
                        <span class="data-title">Default</span>
                    </label>
                </div>
            </div>
            <div class='row'>
                <div class="col-md-12 jumbotron img-rounded" style='padding-top: 18px;padding-bottom: 18px;' >
                    <strong>Definiendo iconos para</strong>:  <span id="_text_splash_selec"></span>
                </div>
            </div>
            <div id="_opc_splash_ios">
                <div class="row">
                    <div class="col-md-12"> 
                        <div class="row">
                            <div class="col-md-12 col-sm-12"> 
                                <div class="row  form-group">
                                    <label for="_opc_splash_ios_path" data-toggle="popover"> 
                                        <span class="data-content glyphicon glyphicon-question-sign" >
                                            Path relativo donde se encuentran los archivos a partir del directorio de nuestra aplicacion.
                                            <br/>
                                            <strong>Importante</strong><em>La ruta de directorios se formara utilizando como separador de directorios el caracter / </em>
                                            <br/>
                                            <em><strong>Por defecto</strong>El raiz de nuestra aplicacion.</em>
                                        </span>
                                        <span class="data-title">Path Relativo (iOS)</span>:</label>
                                    <input data-path type="text" name="_opc_splash_ios_path" id="_opc_splash_ios_path"  class="form-control" placeholder="Path relativo donde se encuentra los iconos para iOS. Por ejemplo /res/ios/"/>
                                </div>
                            </div>
                        </div>
                        <div class="row form-group">
                            <label >iOS - iPhone 3/4/4S </label>
                            <div class="row form-control form_agrupa">
                                <div class="col-md-2 thumbnail ">
                                    <div class="row text-center img_splash ">
                                        <img style="width:32px;height:48px" src="../resources/imagenes/default.png" alt="iPhone 3/4/4S: 320x480"  id="_img_splash_ios_320x480"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_splash_ios_320x480">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_splash_ios_320x480" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_splash_ios_320x480" id="_opc_splash_ios_320x480"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_splash_ios_320x480" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_splash ">
                                        <img style="width:48px;height:32px" src="../resources/imagenes/default.png" alt="iPhone 3/4/4S: 480x320"  id="_img_splash_ios_480x320"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_splash_ios_480x320">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_splash_ios_480x320" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_splash_ios_480x320" id="_opc_splash_ios_480x320"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_splash_ios_480x320" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_splash ">
                                        <img style="width:64px;height:96px" src="../resources/imagenes/default.png" alt="iPhone 3/4/4S: 640x960"  id="_img_splash_ios_640x960"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_splash_ios_640x960">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_splash_ios_640x960" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_splash_ios_640x960" id="_opc_splash_ios_640x960"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_splash_ios_640x960" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_splash ">
                                        <img style="width:96px;height:64px" src="../resources/imagenes/default.png" alt="iPhone 3/4/4S: 960x640"  id="_img_splash_ios_960x640"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_splash_ios_960x640">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_splash_ios_960x640" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_splash_ios_960x640" id="_opc_splash_ios_960x640"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_splash_ios_960x640" type="text"  readonly>
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
                            <label >iOS - iPhone 5 / iPod Touch (5th Generation) </label>
                            <div class="row form-control form_agrupa">
                                <div class="col-md-2 thumbnail ">
                                    <div class="row text-center img_splash ">
                                        <img style="width:64px;height:113px" src="../resources/imagenes/default.png" alt="iPhone 5: 640x1136"  id="_img_splash_ios_640x1136"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_splash_ios_640x1136">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_splash_ios_640x1136" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_splash_ios_640x1136" id="_opc_splash_ios_640x1136"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_splash_ios_640x1136" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_splash ">
                                        <img style="width:113px;height:64px" src="../resources/imagenes/default.png" alt="iPhone 5: 1136x640"  id="_img_splash_ios_1136x640"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_splash_ios_1136x640">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_splash_ios_1136x640" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_splash_ios_1136x640" id="_opc_splash_ios_1136x640"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_splash_ios_1136x640" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>                                                                                             
                            </div>
                        </div>
                    </div>                    
                </div>
                <div class="row">
                    <div class="col-md-5"> 
                        <div class="row form-group">
                            <label >iOS - iPad </label>
                            <div class="row form-control form_agrupa">
                                <div class="col-md-5 thumbnail ">
                                    <div class="row text-center img_splash ">
                                        <img style="width:76px;height:102px" src="../resources/imagenes/default.png" alt="iPad: 768x1024"  id="_img_splash_ios_768x1024"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_splash_ios_768x1024">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_splash_ios_768x1024" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_splash_ios_768x1024" id="_opc_splash_ios_768x1024"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_splash_ios_768x1024" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_splash ">
                                        <img style="width:102px;height:76px" src="../resources/imagenes/default.png" alt="iPad: 1024x768"  id="_img_splash_ios_1024x768"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_splash_ios_1024x768">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_splash_ios_1024x768" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_splash_ios_1024x768" id="_opc_splash_ios_1024x768"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_splash_ios_1024x768" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>                                                                                             
                            </div>
                        </div>
                    </div> 
                    <div class="col-md-5 col-md-offset-1"> 
                        <div class="row form-group">
                            <label >iOS - Retina iPad </label>
                            <div class="row form-control form_agrupa">
                                <div class="col-md-5 thumbnail ">
                                    <div class="row text-center img_splash ">
                                        <img style="width:133px;height:180px" src="../resources/imagenes/default.png" alt="Retina iPad: 1536x2048"  id="_img_splash_ios_1536x2048"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_splash_ios_1536x2048">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_splash_ios_1536x2048" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_splash_ios_1536x2048" id="_opc_splash_ios_1536x2048"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_splash_ios_1536x2048" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5 col-md-offset-1 thumbnail">
                                    <div class="row text-center img_splash ">
                                        <img style="width:204px;height:153px" src="../resources/imagenes/default.png" alt=" Retina iPad: 2048x1536"  id="_img_splash_ios_2048x1536"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_splash_ios_2048x1536">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_splash_ios_2048x1536" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_splash_ios_2048x1536" id="_opc_splash_ios_2048x1536"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_splash_ios_2048x1536" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>                                                                                             
                            </div>
                        </div>
                    </div>                    
                </div>

            </div>
            <div id="_opc_splash_android">
                <div class="row">
                    <div class="col-md-12"> 
                        <div class="row">
                            <div class="col-md-12 col-sm-12"> 
                                <div class="row  form-group">
                                    <label for="_opc_splash_android_path" data-toggle="popover"> 
                                        <span class="data-content glyphicon glyphicon-question-sign" >
                                            Path relativo donde se encuentran los archivos a partir del directorio de nuestra aplicacion.
                                            <br/>
                                            <strong>Importante</strong><em>La ruta de directorios se formara utilizando como separador de directorios el caracter / </em>
                                            <br/>
                                            <em><strong>Por defecto</strong>El raiz de nuestra aplicacion.</em>
                                        </span>
                                        <span class="data-title">Path Relativo (Android)</span>:</label>
                                    <input data-path type="text" name="_opc_splash_android_path" id="_opc_splash_android_path"  class="form-control" placeholder="Path relativo donde se encuentra los iconos para Android. Por ejemplo /res/android/"/>
                                </div>
                            </div>
                        </div>
                        <div class="row form-group">
                            <label >Android</label>
                            <div class="row form-control form_agrupa">  
                                <div class="row col-md-12">
                                    <div class="col-md-2 thumbnail">
                                        <div class="row text-center img_icons">                                           
                                            <img style="width:144px;height:144px" src="../resources/imagenes/default.png" alt="ldpi"  id="_img_splash_android_ldpi"/>
                                        </div>
                                        <div class="caption">
                                            <div class="input-group col-md-12">
                                                <span class="input-group-btn">
                                                    <span class="btn btn-default " aria-label="Borrar" id="_bt_del_splash_android_ldpi">
                                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                    </span>
                                                    <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_splash_android_ldpi" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                        <input type="file" name="_opc_splash_android_ldpi" id="_opc_splash_android_ldpi"/>
                                                    </span> 
                                                </span>
                                                <input class=" form-control" id="_text_splash_android_ldpi" type="text"  readonly>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2 col-md-offset-1 thumbnail">
                                        <div class="row text-center img_icons">
                                            <img style="width:144px;height:144px" src="../resources/imagenes/default.png" alt="mdpi"  id="_img_splash_android_mdpi"/>
                                        </div>
                                        <div class="caption">
                                            <div class="input-group col-md-12">
                                                <span class="input-group-btn">
                                                    <span class="btn btn-default " aria-label="Borrar" id="_bt_del_splash_android_mdpi">
                                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                    </span>
                                                    <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_splash_android_mdpi" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                        <input type="file"  name="_opc_splash_android_mdpi" id="_opc_splash_android_mdpi"/>
                                                    </span> 
                                                </span>
                                                <input class=" form-control" id="_text_splash_android_mdpi" type="text"  readonly>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2 col-md-offset-1 thumbnail">
                                        <div class="row text-center img_icons">
                                            <img style="width:144px;height:144px" src="../resources/imagenes/default.png" alt="hdpi"  id="_img_splash_android_hdpi"/>
                                        </div>
                                        <div class="caption">
                                            <div class="input-group col-md-12">
                                                <span class="input-group-btn">
                                                    <span class="btn btn-default " aria-label="Borrar" id="_bt_del_splash_android_hdpi">
                                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                    </span>
                                                    <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_splash_android_hdpi" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                        <input type="file"  name="_opc_splash_android_hdpi" id="_opc_splash_android_hdpi"/>
                                                    </span> 
                                                </span>
                                                <input class=" form-control" id="_text_splash_android_hdpi" type="text"  readonly>
                                            </div>
                                        </div>
                                    </div>  
                                    <div class="col-md-2  col-md-offset-1 thumbnail">
                                        <div class="row text-center img_icons">
                                            &nbsp;
                                            <img style="width:144px;height:144px" src="../resources/imagenes/default.png" alt="xhdpi"  id="_img_splash_android_xhdpi"/>
                                        </div>
                                        <div class="caption">
                                            <div class="input-group col-md-12">
                                                <span class="input-group-btn">
                                                    <span class="btn btn-default " aria-label="Borrar" id="_bt_del_splash_android_xhdpi">
                                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                    </span>
                                                    <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_splash_android_xhdpi" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                        <input type="file" name="_opc_splash_android_xhdpi" id="_opc_splash_android_xhdpi"/>
                                                    </span> 
                                                </span>
                                                <input class=" form-control" id="_text_splash_android_xhdpi" type="text"  readonly>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row col-md-12">

                                    <div class="col-md-2  thumbnail">

                                        <div class="row text-center img_icons">
                                            <img style="width:144px;height:144px" src="../resources/imagenes/default.png" alt="xxhdpi"  id="_img_splash_android_xxhdpi"/>
                                        </div>
                                        <div class="caption">
                                            <div class="input-group col-md-12">
                                                <span class="input-group-btn">
                                                    <span class="btn btn-default " aria-label="Borrar" id="_bt_del_splash_android_xxhdpi">
                                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                    </span>
                                                    <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_splash_android_xxhdpi" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                        <input type="file" name="_opc_splash_android_xxhdpi" id="_opc_splash_android_xxhdpi"/>
                                                    </span> 
                                                </span>
                                                <input class=" form-control" id="_text_splash_android_xxhdpi" type="text"  readonly>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2 col-md-offset-1 thumbnail">
                                        <div class="row text-center img_icons">
                                            <img style="width:144px;height:144px" src="../resources/imagenes/default.png" alt="fr-xxhdpi"  id="_img_splash_android_fr-xxhdpi"/>
                                        </div>
                                        <div class="caption">
                                            <div class="input-group col-md-12">
                                                <span class="input-group-btn">
                                                    <span class="btn btn-default " aria-label="Borrar" id="_bt_del_splash_android_fr-xxhdpi">
                                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                    </span>
                                                    <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_splash_android_fr-xxhdpi" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                        <input type="file" name="_opc_splash_android_fr-xxhdpi" id="_opc_splash_android_fr-xxhdpi"/>
                                                    </span> 
                                                </span>
                                                <input class=" form-control" id="_text_splash_android_fr-xxhdpi" type="text"  readonly>
                                            </div>
                                        </div>
                                    </div> 
                                    <div class="col-md-2 col-md-offset-1 thumbnail">
                                        <div class="row text-center img_icons">
                                            <img style="width:144px;height:144px" src="../resources/imagenes/default.png" alt="port-xxhdpi"  id="_img_splash_android_port-xxhdpi"/>
                                        </div>
                                        <div class="caption">
                                            <div class="input-group col-md-12">
                                                <span class="input-group-btn">
                                                    <span class="btn btn-default " aria-label="Borrar" id="_bt_del_splash_android_port-xxhdpi">
                                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                    </span>
                                                    <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_splash_android_port-xxhdpi" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                        <input type="file" name="_opc_splash_android_port-xxhdpi" id="_opc_splash_android_port-xxhdpi"/>
                                                    </span> 
                                                </span>
                                                <input class=" form-control" id="_text_splash_android_port-xxhdpi" type="text"  readonly>
                                            </div>
                                        </div>
                                    </div> 
                                    <div class="col-md-2 col-md-offset-1 thumbnail">
                                        <div class="row text-center img_icons">
                                            <img style="width:144px;height:144px" src="../resources/imagenes/default.png" alt="land-xxhdpi"  id="_img_splash_android_land-xxhdpi"/>
                                        </div>
                                        <div class="caption">
                                            <div class="input-group col-md-12">
                                                <span class="input-group-btn">
                                                    <span class="btn btn-default " aria-label="Borrar" id="_bt_del_splash_android_land-xxhdpi">
                                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                    </span>
                                                    <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_splash_android_land-xxhdpi" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                        <input type="file" name="_opc_splash_android_land-xxhdpi" id="_opc_splash_android_land-xxhdpi"/>
                                                    </span> 
                                                </span>
                                                <input class=" form-control" id="_text_splash_android_land-xxhdpi" type="text"  readonly>
                                            </div>
                                        </div>
                                    </div> 
                                </div>
                            </div>
                        </div>
                    </div>                    
                </div>

            </div>

            <div id="_opc_splash_win">
                <div class="row">
                    <div class="col-md-12"> 
                        <div class="row">
                            <div class="col-md-12 col-sm-12"> 
                                <div class="row  form-group">
                                    <label for="_opc_splash_win_path" data-toggle="popover"> 
                                        <span class="data-content glyphicon glyphicon-question-sign" >
                                            Path relativo donde se encuentran los archivos a partir del directorio de nuestra aplicacion.
                                            <br/>
                                            <strong>Importante</strong><em>La ruta de directorios se formara utilizando como separador de directorios el caracter / </em>
                                            <br/>
                                            <em><strong>Por defecto</strong>El raiz de nuestra aplicacion.</em>
                                        </span>
                                        <span class="data-title">Path Relativo (Windows Phone)</span>:</label>
                                    <input data-path type="text" name="_opc_splash_win_path" id="_opc_splash_win_path"  class="form-control" placeholder="Path relativo donde se encuentra los iconos para Windows Phone. Por ejemplo /res/win/"/>
                                </div>
                            </div>
                        </div>
                        <div class="row form-group">
                            <label >WinPhone</label>
                            <div class="row form-control form_agrupa">

                                <div class="col-md-2 thumbnail">
                                    <div class="row text-center img_splash">
                                        <img style="width:80px;height:80px" src="../resources/imagenes/default.png" alt="Splash Winphone (.jpg)"  id="_img_splash_win_"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_splash_win_">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_splash_win_" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_splash_win_" id="_opc_splash_win_"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_splash_win_" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>                    
                </div>                                                         
            </div>
            <div id="_opc_splash_default">
                <div class="row">
                    <div class="col-md-12"> 
                        <div class="row">
                            <div class="col-md-12 col-sm-12"> 
                                <div class="row  form-group">
                                    <label for="_opc_splash_default_path" data-toggle="popover"> 
                                        <span class="data-content glyphicon glyphicon-question-sign" >
                                            Path relativo donde se encuentran los archivos a partir del directorio de nuestra aplicacion.
                                            <br/>
                                            <strong>Importante</strong><em>La ruta de directorios se formara utilizando como separador de directorios el caracter / </em>
                                            <br/>
                                            <em><strong>Por defecto</strong>El raiz de nuestra aplicacion.</em>
                                        </span>
                                        <span class="data-title">Path Relativo (Default)</span>:</label>
                                    <input data-path type="text" name="_opc_splash_default_path" id="_opc_splash_default_path"  class="form-control" placeholder="Path relativo donde se encuentra el icono por defecto. Por ejemplo /res/icons/default/"/>
                                </div>
                            </div>
                        </div>
                        <div class="row form-group">
                            <label >Default</label>
                            <div class="row form-control form_agrupa">

                                <div class="col-md-2 thumbnail">
                                    <div class="row text-center img_splash">
                                        <img style="width:80px;height:80px" src="../resources/imagenes/default.png" alt="Default"  id="_img_splash_default_"/>
                                    </div>
                                    <div class="caption">
                                        <div class="input-group col-md-12">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default " aria-label="Borrar" id="_bt_del_splash_default_">
                                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </span>
                                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_add_splash_default_" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                                    <input type="file" name="_opc_splash_default_" id="_opc_splash_default_"/>
                                                </span> 
                                            </span>
                                            <input class=" form-control" id="_text_splash_default_" type="text"  readonly>
                                        </div>
                                    </div>
                                </div>                                                             
                            </div>
                        </div>
                        <div class="row">
                            <p class="col-md-12 bg-warning">El fichero de llamarse splash.png y residir en el directorio raiz del proyecto.</p>
                        </div>
                    </div>                    
                </div>                                                         
            </div>
        </div>
    </div>
</div>