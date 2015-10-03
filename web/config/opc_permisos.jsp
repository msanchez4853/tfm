<%-- 
    Document   : opc_generales
    Created on : 09-may-2015, 19:43:03
    Author     : adrastea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String aspecto = request.getParameter("aspecto");
%>
<div class="panel panel-default" id="_opciones_permisos"  data-config="seccion">
    <div class="panel-heading">
        <h3 class="panel-title">Caracteristicas y Permisos/Accesos&nbsp; 
            <span class="_mostrar_info glyphicon glyphicon-question-sign" data-alert="permisos" data-toggle="tooltip" title="Muestra /oculta informacion adicional">&nbsp;</span></h3>
    </div>
    <div class="panel-body panel_contenido">

        <div class="container-fluid">  
            <div class="row">
                <div class="col-md-12">
                    <div id="info_permisos" class="jumbotron img-rounded" >
                        <button type="button" class="_mostrar_info close" data-alert="permisos"><span aria-hidden="true">&times;</span></button>
                        <strong>Caracteristicas y Permisos/Accesos&nbsp;.</strong> Define para la aplicación que estamos construyendo las características de Phonegap Build que va a utilizar la aplicacion
                        y los permisos/accesos que son necesarios para acceder a determinados dominios.                        
                        <br/>
                        Mas informacion en Phonegap build:  <a href="http://docs.build.phonegap.com/en_US/configuring_features.md.html#Features" class="alert-link" target="_blank">Configuring - Features</a>
                        <span  data-agr="avanzada"> y en <a href="http://docs.build.phonegap.com/en_US/configuring_access_elements.md.html#Access%20Elements" class="alert-link" target="_blank">Configuring - Access Elements</a> </span>
                    </div>
                </div>
            </div>
            <div class="row">
                <label  data-toggle="popover"> 
                    <span class="data-content glyphicon glyphicon-question-sign" >
                        Las caracteristicas o APIs de Phonegap Build que nuestra aplicacion va a utilizar.
                    </span>
                    <span class="data-title tit_seccion">Caracteristicas</span>:
                </label> 
            </div>
            <div class="row">

                <div class="col-md-5 col-sm-12">                                
                    <div class="row form-group">
                        <label  class="">Caracteristicas para Android</label>
                        <div class="row form-control form_agrupa">
                            <div class="col-md-12 checkbox">
                                <label>
                                    <input type="checkbox"  name="_opc_perm_android_battery" id="_opc_perm_android_battery">&nbsp;Battery
                                </label>
                            </div>
                            <div class="col-md-12 checkbox">
                                <label>
                                    <input type="checkbox"  name="_opc_perm_android_camera" id="_opc_perm_android_camera">&nbsp;Camera
                                </label>
                            </div>
                            <div class="col-md-12 checkbox">
                                <label>
                                    <input type="checkbox"  name="_opc_perm_android_contacts" id="_opc_perm_android_contacts">&nbsp;Contacts
                                </label>
                            </div>
                            <div class="col-md-12 checkbox">
                                <label>
                                    <input type="checkbox"  name="_opc_perm_android_file" id="_opc_perm_android_file">&nbsp;File
                                </label>
                            </div>
                            <div class="col-md-12 checkbox">
                                <label>
                                    <input type="checkbox"  name="_opc_perm_android_geolocation" id="_opc_perm_android_geolocation">&nbsp;GeoLocation
                                </label>
                            </div>
                            <div class="col-md-12 checkbox">
                                <label>
                                    <input type="checkbox"  name="_opc_perm_android_media" id="_opc_perm_android_media">&nbsp;Media
                                </label>
                            </div>
                            <div class="col-md-12 checkbox">
                                <label>
                                    <input type="checkbox"  name="_opc_perm_android_network" id="_opc_perm_android_network">&nbsp;Network
                                </label>
                            </div>
                            <div class="col-md-12 checkbox">
                                <label>
                                    <input type="checkbox"  name="_opc_perm_android_notification" id="_opc_perm_android_notification">&nbsp;Notification
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 col-sm-12 col-md-offset-1">                                
                    <div class="row form-group">
                        <label  class="">Caracteristicas para Windows Phone</label>
                        <div class="row form-control form_agrupa">                            
                            <div class="col-md-12 checkbox">
                                <label>
                                    <input type="checkbox"  name="_opc_perm_win_camera" id="_opc_perm_win_camera">&nbsp;Camera
                                </label>
                            </div>
                            <div class="col-md-12 checkbox">
                                <label>
                                    <input type="checkbox"  name="_opc_perm_win_contacts" id="_opc_perm_win_contacts">&nbsp;Contacts
                                </label>
                            </div>

                            <div class="col-md-12 checkbox">
                                <label>
                                    <input type="checkbox"  name="_opc_perm_win_geolocation" id="_opc_perm_win_geolocation">&nbsp;GeoLocation
                                </label>
                            </div>
                            <div class="col-md-12 checkbox">
                                <label>
                                    <input type="checkbox"  name="_opc_perm_win_media" id="_opc_perm_win_media">&nbsp;Media
                                </label>
                            </div>
                            <div class="col-md-12 checkbox">
                                <label>
                                    <input type="checkbox"  name="_opc_perm_win_network" id="_opc_perm_win_network">&nbsp;Network
                                </label>
                            </div>
                            <div class="col-md-12 checkbox">
                                <label>
                                    <input type="checkbox"  name="_opc_perm_win_device" id="_opc_perm_win_identity">&nbsp;Device
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row" data-agr="avanzada">
                <label  data-toggle="popover"> 
                    <span class="data-content glyphicon glyphicon-question-sign" >
                        El elemento access proporciona a la aplicación el acceso a recursos en otros ámbitos - en particular, permite su aplicación para cargar páginas de dominios externos que pueden hacerse cargo de toda su webview
                    </span>
                    <span class="data-title tit_seccion">Permisos/Accesos</span>:
                </label> 

            </div>
            <div class="row" data-agr="avanzada">
                <div class="row col-md-12">
                    <table id='_tb_perm_access' class="col-md-12 table table-hover table-striped">
                        <thead>
                            <tr><th>url</th><th>SubDomain</th><th>Aplicacion Externa</th></tr>
                        </thead>
                        <tbody>
                            
                            <%
                                if (aspecto.equals("related")) {
                            %>
                            <tr id="_opc_perm_fila_acceso_1" data-i="1">
                                <td name="url">*</td>
                                <td name="subdomains">true</td>
                                <td name="external">
                                    <span>true</span>

                                    <input id="_opc_perm_acceso_1_url" name="_opc_perm_acceso_1_url" value="*" type="hidden"/>
                                    <input id="_opc_perm_acceso_1_subdomains" name="_opc_perm_acceso_1_subdomains" value="true" type="hidden"/>
                                    <input id="_opc_perm_acceso_1_external" name="_opc_perm_acceso_1_external" value="true" type="hidden"/>
                                </td>
                            </tr>
                            <%    }else{
                            %>
                            <tr id="_perm_sin_accesos" ><td colspan="3">No se han especificado accesos.</td></tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
                <div class="row col-md-12 form-control form_agrupa">
                    <div class="col-md-12 col-sm-12">                                
                        <div class="row form-group">
                            <label for="_opc_perm_defacc_url" class="">Url</label>
                            <input type="hidden" name="_opc_perm_defacc_indice" id="_opc_perm_defacc_indice"   />
                            <input type="text" name="_opc_perm_defacc_url" id="_opc_perm_defacc_url" class="form-control"  />
                        </div>
                    </div>
                    <div class="col-md-12 checkbox ">
                        <label>
                            <input type="checkbox"  name="_opc_perm_defacc_subdomains" id="_opc_perm_defacc_subdomains">&nbsp;Permite SubDomains
                        </label>
                    </div>
                    <div class="col-md-12 checkbox">
                        <label>
                            <input type="checkbox"  name="_opc_perm_defacc_external" id="_opc_perm_defacc_external">&nbsp;Permitir Aplicación Externa
                        </label>
                    </div>

                    <div class="row col-md-12 text-right">
                        <span class="input-group-btn">
                            <span class="btn btn-default " aria-label="Añadir" id="_bt_perm_add_acc">
                                <span class="glyphicon glyphicon-plus-sign" aria-hidden="false">&nbsp;Añadir</span>
                            </span>
                            <span class="btn btn-default " aria-label="Eliminar" id="_bt_perm_del_acc">
                                <span class="glyphicon glyphicon-remove-sign" aria-hidden="true">&nbsp;Eliminar</span>
                            </span>
                            <span class="btn btn-default " aria-label="Editar" id="_bt_perm_mod_acc">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true">&nbsp;Editar</span>
                            </span>
                        </span>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>