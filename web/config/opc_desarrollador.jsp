<%-- 
    Document   : opc_generales
    Created on : 09-may-2015, 19:43:03
    Author     : adrastea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="panel panel-default" id="_opciones_desarrollador"  data-config="seccion">
    <div class="panel-heading">
        <h3 class="panel-title">Info. Desarrollador&nbsp; 
            <span class="_mostrar_info glyphicon glyphicon-question-sign" data-alert="desarrollador" data-toggle="tooltip" title="Muestra /oculta informacion adicional">&nbsp;</span></h3>
    </div>
    <div class="panel-body panel_contenido">

        <div class="container-fluid">   
            <div class="row">
                <div class="col-md-12">
                    <div id="info_desarrollador" class="jumbotron img-rounded" >
                        <button type="button" class="_mostrar_info close" data-alert="desarrollador"><span aria-hidden="true">&times;</span></button>
                        <strong>General.</strong> Define aspectos generales de configuracion de nuestra aplicacion Phonegap Build.                        
                        <br/>
                        Mas informacion en Phonegap build:  <a href="http://docs.build.phonegap.com/en_US/configuring_basics.md.html#The%20Basics" class="alert-link" target="_blank">Configuring - The Basics</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12"> 
                    <div class="row form-group">
                        <label for="_opc_desa_autor_name" class="">Nombre Autor:</label>
                        <input type="text" name="_opc_desa_autor_name" id="_opc_desa_autor_name"  placeholder="Nombre del autor"
                               class="form-control" />
                    </div>
                </div>                
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12 ">                                
                    <div class="row  form-group">
                        <label for="_opc_desa_autor_mail" class="">Mail Autor:</label>
                        <input type="text" name="_opc_desa_autor_mail" id="_opc_desa_autor_mail"  class="form-control"   placeholder="Mail del autor"/>
                    </div>
                </div>                
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12 ">                                
                    <div class="row  form-group">
                        <label for="_opc_desa_autor_url" class="">URL Autor:</label>
                        <input type="text" name="_opc_desa_autor_url" id="_opc_desa_autor_url"  class="form-control"   placeholder="Url de la pagina web del desarrollador" />
                    </div>
                </div>  
            </div>
            
        </div>
    </div>
</div>