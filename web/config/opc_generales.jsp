<%-- 
    Document   : opc_generales
    Created on : 09-may-2015, 19:43:03
    Author     : adrastea
--%>

<%@page import="es.uned.msanchez.tfm.utilidades.Util"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Map<String, String> opciones = (Map<String, String>) session.getAttribute("opciones_generales");

%>
<div class="panel panel-info" id="_opciones_generales" data-config="seccion">
    <div class="panel-heading">
        <h3 class="panel-title">General &nbsp; 
            <span class="_mostrar_info glyphicon glyphicon-question-sign" data-alert="general" data-toggle="tooltip" title="Muestra /oculta informacion adicional">&nbsp;</span>
        </h3>             

    </div>
    <div class="panel-body panel_contenido">

        <div class="container-fluid">                       
            <div class="row">
                <div class="col-md-12">
                    <div id="info_general" class="jumbotron img-rounded" >
                        <button type="button" class="_mostrar_info close" data-alert="general"><span aria-hidden="true">&times;</span></button>
                        <strong>General.</strong> Define aspectos generales de configuracion de nuestra aplicacion Phonegap Build.                        
                        <br/>
                        Mas informacion en Phonegap build:  <a href="http://docs.build.phonegap.com/en_US/configuring_basics.md.html#The%20Basics" class="alert-link" target="_blank">Configuring - The Basics</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 col-sm-12 ">                                
                    <div class="row  form-group">
                        <label for="_opc_gen_name_app" data-toggle="popover"> 
                            <span class="data-content glyphicon glyphicon-question-sign" >
                                Especifica el nombre de la aplicaci&oacute;n, tal cual aparecer&aacute; en la pantalla de inicio del dispositivo y en las tiendas de las distintas plataformas.
                            </span>
                            <span class="data-title">Nombre App.</span>:</label>
                        <input type="text" name="_opc_gen_name_app" id="_opc_gen_name_app"  class="form-control" placeholder="Nombre de la aplicación" required data-required='_opciones_generales'
                               value="<%=Util.getValue(opciones, "name_app")%>"
                               />
                    </div>
                </div>
                <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                    <div class="row form-group">
                        <label for="_opc_gen_desc_app"  data-toggle="popover"> 
                            <span class="data-content glyphicon glyphicon-question-sign" >
                                Descripción de nuestra aplicación, esta descripción es la que aparecerá en el  listado de aplicaciones de las tiendas de las plataformas.
                            </span>
                            <span class="data-title">Descripcion App</span>.</label>
                        <textarea  name="_opc_gen_desc_app" id="_opc_gen_desc_app"  class="form-control" placeholder="Descripcion de la aplicacion.">
                            <%=Util.getValue(opciones, "desc_app")%>
                        </textarea>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 col-sm-12"> 
                    <div class="row form-group">
                        <label for="_opc_gen_source_file"  data-toggle="popover"> 
                            <span class="data-content glyphicon glyphicon-question-sign" >
                                Define la pagina de inicio de la aplicación debe estar en el directorio raíz de la aplicación.
                                <br/>
                                <em><strong>Por defecto</strong>:index.html</em>
                            </span>
                            <span class="data-title">Pagina inicio</span>:
                        </label>                       
                        <div class="input-group ">
                            <span class="input-group-btn">
                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_gen_source_file" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                    <input type="file" id="_opc_gen_source_file" name="_opc_gen_source_file"  data-ext="html"/>
                                </span> 
                            </span>
                            <input class=" form-control" id="_text_gen_source_file"  name="_text_gen_source_file" type="text" placeholder="Pagina de inicio de la aplicacion. Por defecto index.html"  readonly>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                    <div class="row  form-group">
                        <label for="_opc_gen_version_app" data-toggle="popover"> 
                            <span class="data-content glyphicon glyphicon-question-sign" >
                                Versión de nuestra aplicación.
                                <br/>
                                <em><strong>Por defecto</strong>:1.0.0</em>
                            </span>
                            <span class="data-title">Versi&oacute;n App.</span>:</label>
                        <input type="text" name="_opc_gen_version_app" id="_opc_gen_version_app"  class="form-control" placeholder="Versión del codigo de la aplicacion. Por defecto 1.0.0"/>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-5 col-sm-12">                                
                    <div class="row form-group">
                        <label  data-toggle="popover"> 
                            <span class="data-content glyphicon glyphicon-question-sign" >
                                Phonegap Build genera la aplicación para todas las plataformas. 
                                Si desea que solo se genere para una plataforma concreta debe seleccionarla y desmarcar las otras. 
                                <br/>
                                <em><strong>Por defecto</strong>:Todas las plataformas.</em>
                            </span>
                            <span class="data-title">Plataformas</span>:</label>
                        <div class="row form-control form_agrupa">
                            <div class="col-md-12 checkbox">
                                <label>
                                    <input type="checkbox"  name="_opc_gen_platf_android" id="_opc_gen_platf_android" checked="checked">&nbsp;Android
                                </label>
                            </div>
                            <div class="col-md-12 checkbox">
                                <label>
                                    <input type="checkbox"  name="_opc_gen_platf_ios" id="_opc_gen_platf_ios"  checked="checked">&nbsp;iOS
                                </label>
                            </div>
                            <div class="col-md-12 checkbox">
                                <label>
                                    <input type="checkbox"  name="_opc_gen_platf_winp" id="_opc_gen_platf_winp"  checked="checked">&nbsp;Windows Phone
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                    <div class="row  form-group">
                        <label for="_opc_gen_orientation" data-toggle="popover"> 
                            <span class="data-content glyphicon glyphicon-question-sign" >
                                Los posibles valores son: Ambas(tanto horizontal como vertical), Horizontal, Vertical o 
                                Predeterminada (la configuración predeterminada de la plataforma, por lo general vertical).
                                <br/>
                                <em><strong>Por defecto</strong>:Ambas.</em>
                            </span>
                            <span class="data-title">Orientación Dispositivo</span>:</label>
                        <select name="_opc_gen_orientation" id="_opc_gen_orientation"  class="form-control" >
                            <option value="default" selected="selected">Ambas</option>
                            <option value="landscape">Horizontal</option>
                            <option value="portrait">Vertical</option>
                            <option value="plataforma">Predeterminada</option>
                        </select>
                    </div>                    
                </div>
                <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                    <div class="row form-group">
                        <label for="_opc_gen_fullscreen" data-toggle="popover"> 
                            <span class="data-content glyphicon glyphicon-question-sign" >
                                Indica si la aplicacion se va a ejecutar a pantalla completa. Haciendo que la barra de estado en la
                                parte superior del dispositivo se oculte.
                                <br/>
                                <em><strong>Por defecto</strong>: False (No se muestra a pantalla completa)</em>
                            </span>
                            <span class="data-title">Pantalla Completa</span></label>
                        <div class="row form-control form_agrupa">
                            <div class="col-md-12 checkbox">
                                <label>
                                    <input type="checkbox" name="_opc_gen_fullscreen" id="_opc_gen_fullscreen"/> &nbsp;True
                                </label>
                            </div>
                        </div>
                    </div>               
                </div>
            </div>
            <div class="row">
                <div  data-agr="avanzada" class="col-md-5  col-sm-12">                                
                    <div class="row  form-group">
                        <label for="_opc_gen_pgap_version"  data-toggle="popover"> 
                            <span class="data-content glyphicon glyphicon-question-sign" >
                                Indica la version de Phonegap con la que se va a construir la aplicacion. Sino se especifica construira con 
                                la version predeterminada actual. 
                                <br/>                          
                                <strong>Nota:</strong> Parametro de configuracion solo accesible en la vision avanzada.
                                <br/>
                                <em><strong>Por defecto</strong>: la version 3.6.3</em>
                            </span>
                            <span class="data-title">Versi&oacute;n Phonegap</span>:</label>
                        <select name="_opc_gen_pgap_version" id="_opc_gen_pgap_version" class="form-control" >
                            <option value="3.0.0">3.0.0</option>
                            <option value="3.1.0">3.1.0</option>
                            <option value="3.2.0">3.2.0</option>
                            <option value="3.3.0">3.3.0</option>
                            <option value="3.4.0">3.4.0</option>
                            <option value="3.5.0">3.5.0</option>
                            <option value="3.6.3" selected="selected">3.6.3 (default)</option>
                            <option value="3.7.0">3.7.0</option>
                        </select>
                    </div>
                </div>
                <div data-agr="avanzada" class="col-md-5 col-md-offset-2 col-sm-12">  
                    <div class="row form-group">
                        <label for="_opc_gen_ErrorUrl_file"  data-toggle="popover"> 
                            <span class="data-content glyphicon glyphicon-question-sign" >
                                Define la pagina de error de la aplicación debe estar en el directorio raíz de la aplicación.
                                <br/>                                
                                <br/>
                                Sino se establece un valor se mostrara el diagolo de error de aplicacion por defecto.
                            </span>
                            <span class="data-title">Pagina error</span>:
                        </label>                       
                        <div class="input-group ">
                            <span class="input-group-btn">
                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_gen_ErrorUrl_file" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                    <input type="file" id="_opc_gen_ErrorUrl_file" name="_opc_gen_ErrorUrl_file"  data-ext="html"/>
                                </span> 
                            </span>
                            <input class=" form-control" id="_text_gen_ErrorUrl"  name="_text_gen_ErrorUrl" type="text" placeholder="Pagina de eror de la aplicacion."  readonly>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row">
                <div  data-agr="avanzada" class="col-md-5  col-sm-12">                                
                    <div class="row  form-group">
                        <label for="_opc_gen_package_app" data-toggle="popover"> 
                            <span class="data-content glyphicon glyphicon-question-sign" >
                                Identificador de paquetes de nuestra aplicacion.
                                <br/>
                                <em><strong>Por defecto</strong>: uned.phonegap.example</em>
                            </span>
                            <span class="data-title">Package App.</span>:</label>
                        <input type="text" name="_opc_gen_package_app" id="_opc_gen_package_app"  class="form-control" placeholder="Identificador de paquetes de su aplicacion.  Por defecto uned.phonegap.example"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

