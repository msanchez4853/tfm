<%-- 
    Document   : opc_generales
    Created on : 09-may-2015, 19:43:03
    Author     : adrastea
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="es.uned.msanchez.tfm.utilidades.Util"%>
<%
    String aspecto = request.getParameter("aspecto");
    String[] plugins = null;
    Map mplugins = new HashMap();
    if (!Util.isNulo(aspecto) && aspecto.equalsIgnoreCase("related")) {
        ResourceBundle rb = ResourceBundle.getBundle("es.uned.msanchez.tfm.resources.related");
        String s_plugins = rb.getString("plugins");
        if (!Util.isNulo(s_plugins)) {
            plugins = s_plugins.split(",");
            for (String p : plugins) {
                mplugins.put(p, "related");
            }

        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="panel panel-default" id="_opciones_plugins"  data-config="seccion">
    <div class="panel-heading">
        <h3 class="panel-title">Plugins&nbsp; 
            <span class="_mostrar_info glyphicon glyphicon-question-sign" data-alert="plugins" data-toggle="tooltip" title="Muestra /oculta informacion adicional">&nbsp;</span></h3>
    </div>
    <div class="panel-body panel_contenido">

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div id="info_plugins" class="jumbotron img-rounded" >
                        <button type="button" class="_mostrar_info close" data-alert="plugins"><span aria-hidden="true">&times;</span></button>
                        <strong>Plugins.</strong> Nos permite indicar que plugins desarrollados por Phonegap hemos utilizado para el desarrollo de nuestra aplicación Phonegap Build                        
                        <br/>
                        Mas informacion en Phonegap build:  <a href="http://docs.build.phonegap.com/en_US/configuring_plugins.md.html#Plugins" class="alert-link" target="_blank">Configuring - Plugins</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12">                                
                    <div class="row form-group">
                        <label  class="">Api Plugins</label>
                        <div class="row form-control form_agrupa">
                            <div class="col-md-6">                                
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input data-select-to="<%=Util.getValue(mplugins, "battery-status")%>" type="checkbox"  name="_opc_plug_battery-status" id="_opc_plug_battery-status">&nbsp;Battery
                                    </label>
                                </div>
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input data-select-to="<%=Util.getValue(mplugins, "camera")%>" type="checkbox"  name="_opc_plug_camera" id="_opc_plug_camera">&nbsp;Camera
                                    </label>
                                </div>
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input data-select-to="<%=Util.getValue(mplugins, "media-capture")%>" type="checkbox"  name="_opc_plug_media-capture" id="_opc_plug_media-capture">&nbsp;Capture
                                    </label>
                                </div>
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input data-select-to="<%=Util.getValue(mplugins, "console")%>" type="checkbox"  name="_opc_plug_console" id="_opc_plug_console">&nbsp;Console
                                    </label>
                                </div>
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input data-select-to="<%=Util.getValue(mplugins, "contacts")%>" type="checkbox"  name="_opc_plug_contacts" id="_opc_plug_contacts">&nbsp;Contacts
                                    </label>
                                </div>
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input data-select-to="<%=Util.getValue(mplugins, "device")%>" type="checkbox"  name="_opc_plug_device" id="_opc_plug_device">&nbsp;Device
                                    </label>
                                </div>
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input data-select-to="<%=Util.getValue(mplugins, "device-motion")%>"  type="checkbox"  name="_opc_plug_device-motion" id="_opc_plug_device-motion">&nbsp;Device Motion
                                    </label>
                                </div>
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input data-select-to="<%=Util.getValue(mplugins, "device-orientation")%>"  type="checkbox"  name="_opc_plug_device-orientation" id="_opc_plug_device-orientation">&nbsp;Device Orientation
                                    </label>
                                </div>
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input data-select-to="<%=Util.getValue(mplugins, "file")%>"  type="checkbox"  name="_opc_plug_file" id="_opc_plug_file">&nbsp;File
                                    </label>
                                </div>


                            </div> 
                            <div class="col-md-5 col-md-offset-1">
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input data-select-to="<%=Util.getValue(mplugins, "file-transfer")%>"  type="checkbox"  name="_opc_plug_file-transfer" id="_opc_plug_file-transfer">&nbsp;File transfer
                                    </label>
                                </div>
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input data-select-to="<%=Util.getValue(mplugins, "geolocation")%>"  type="checkbox"  name="_opc_plug_geolocation" id="_opc_plug_geolocation">&nbsp;GeoLocation
                                    </label>
                                </div>
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input data-select-to="<%=Util.getValue(mplugins, "globalization")%>"  type="checkbox"  name="_opc_plug_globalization" id="_opc_plug_globalization">&nbsp;Globalization
                                    </label>
                                </div>
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input data-select-to="<%=Util.getValue(mplugins, "inappbrowser")%>"  type="checkbox"  name="_opc_plug_inappbrowser" id="_opc_plug_inappbrowser">&nbsp;InApp Browser
                                    </label>
                                </div>
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input data-select-to="<%=Util.getValue(mplugins, "media")%>"  type="checkbox"  name="_opc_plug_media" id="_opc_plug_media">&nbsp;Media
                                    </label>
                                </div>                               

                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input data-select-to="<%=Util.getValue(mplugins, "network-information")%>"  type="checkbox"  name="_opc_plug_network-information" id="_opc_plug_network-information">&nbsp;Network Information
                                    </label>
                                </div>
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input data-select-to="<%=Util.getValue(mplugins, "battery-status")%>"  type="checkbox"  name="_opc_plug_dialogs" id="_opc_plug_dialogs">&nbsp;Notification
                                    </label>
                                </div>
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input data-select-to="<%=Util.getValue(mplugins, "splashscreen")%>"  type="checkbox"  name="_opc_plug_splashscreen" id="_opc_plug_splashscreen">&nbsp;Splashscreen
                                    </label>
                                </div>

                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input data-select-to="<%=Util.getValue(mplugins, "vibration")%>"  type="checkbox"  name="_opc_plug_vibration" id="_opc_plug_vibration">&nbsp;Vibration
                                    </label>
                                </div>
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input data-select-to="<%=Util.getValue(mplugins, "whitelist")%>"  type="checkbox"  name="_opc_plug_whitelist" id="_opc_plug_whitelist">&nbsp;White List
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>               

            </div>

        </div>
    </div>
</div>