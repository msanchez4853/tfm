<%-- 
    Document   : opc_iconos
    Created on : 09-may-2015, 19:46:37
    Author     : adrastea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="panel panel-default" id="_opciones_splash">
    <div class="panel-heading">
        <h3 class="panel-title">Splash Screen</h3>
    </div>
    <div class="panel-body panel_contenido">
        <div class="container-fluid">                       
            <div id="_acc_avan_option" class="row" style="text-align: center; margin-bottom: 5px">
                <div class="btn-group" data-toggle="buttons">
                    <label class="btn btn-primary active">
                        <input type="radio" name="_bt_splash_rad" id="_bt_splash_option_ios" value="_opc_splash_ios" checked> iOS
                    </label>
                    <label class="btn btn-primary ">
                        <input type="radio" name="_bt_splash_rad" id="_bt_splash_option_android"  value="_opc_splash_android" > Android
                    </label>  
                    <label class="btn btn-primary ">
                        <input type="radio" name="_bt_splash_rad" id="_bt_splash_option_win"  value="_opc_splash_win"  > Windows Phone
                    </label>
                    <label class="btn btn-primary ">
                        <input type="radio" name="_bt_splash_rad" id="_bt_splash_option_default"  value="_opc_splash_default"  > Default
                    </label>
                </div>
            </div>
            <div id="_opc_splash_ios">
                <div class="row">
                    <div class="col-md-12"> 
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