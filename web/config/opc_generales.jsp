<%-- 
    Document   : opc_generales
    Created on : 09-may-2015, 19:43:03
    Author     : adrastea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="panel panel-default" id="_opciones_generales">
    <div class="panel-heading">
        <h3 class="panel-title">General</h3>
    </div>
    <div class="panel-body panel_contenido">

        <div class="container-fluid">                       
            <div class="row">
                <div class="col-md-5 col-sm-12"> 
                    <div class="row form-group">
                        <label for="_opc_gen_source_file" class="">Fuentes:</label>                       
                        <div class="input-group ">
                            <span class="input-group-btn">
                                <span  class="  btn btn-default   btn-file" aria-label="Seleccionar" id="_bt_gen_source_file" >&nbsp;<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
                                    <input type="file" id="_opc_gen_source_file" name="_opc_gen_source_file"/>
                                </span> 
                            </span>
                            <input class=" form-control" id="_text_gen_source_file"  name="_text_gen_source_file" type="text" placeholder="Pagina de inicio de la aplicacion. Por defecto index.html"  readonly>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                    <div class="row  form-group">
                        <label for="_opc_gen_version_app" class="">Versi&oacute;n App.:</label>
                        <input type="text" name="_opc_gen_version_app" id="_opc_gen_version_app"  class="form-control" placeholder="Versión del codigo de la aplicacion. Por defecto 1.0.0"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 col-sm-12 ">                                
                    <div class="row  form-group">
                        <label for="_opc_gen_name_app" class="">Nombre App.:</label>
                        <input type="text" name="_opc_gen_name_app" id="_opc_gen_name_app"  class="form-control" placeholder="Nombre de la aplicación"/>
                    </div>
                </div>
                <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                    <div class="row  form-group">
                        <label for="_opc_gen_pgap_version" class="">Versi&oacute;n Phonegap:</label>
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
            </div>
            <div class="row">
                <div class="col-md-5 col-sm-12">                                
                    <div class="row form-group">
                        <label for="_opc_gen_desc_app" class="">Descripcion App.</label>
                        <textarea  name="_opc_gen_desc_app" id="_opc_gen_desc_app"  class="form-control" placeholder="Descripcion de la aplicacion."> </textarea>
                    </div>
                </div>
                <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                    <div class="row  form-group">
                        <label for="_opc_gen_orientation" class="">Orientacion:</label>
                        <select name="_opc_gen_orientation" id="_opc_gen_orientation"  class="form-control" >
                            <option value="default" selected="selected">default</option>
                            <option value="landscape">landscape</option>
                            <option value="portrait">portrait</option>
                        </select>
                    </div>                    
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 col-sm-12">                                
                    <div class="row form-group">
                        <label  class="">Plataformas</label>
                        <div class="row form-control form_agrupa">
                            <div class="col-md-12 checkbox">
                                <label>
                                    <input type="checkbox"  name="_opc_gen_platf_android" id="_opc_gen_platf_android">&nbsp;Android
                                </label>
                            </div>
                            <div class="col-md-12 checkbox">
                                <label>
                                    <input type="checkbox"  name="_opc_gen_platf_ios" id="_opc_gen_platf_ios">&nbsp;iOS
                                </label>
                            </div>
                            <div class="col-md-12 checkbox">
                                <label>
                                    <input type="checkbox"  name="_opc_gen_platf_winp" id="_opc_gen_platf_winp">&nbsp;Windows Phone
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                    <div class="row  form-group">
                        <label for="_opc_gen_ErrorUrl" class="opc_android">Error URL</label>
                        <input type="text" name="_opc_gen_ErrorUrl" id="_opc_gen_ErrorUrl"  class="form-control" placeholder="Pagina de error."/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>