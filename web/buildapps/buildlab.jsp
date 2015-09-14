<%-- 
    Document   : buildlab
    Created on : 12-sep-2015, 22:39:34
    Author     : adrastea
--%>
<%@page import="es.uned.msanchez.tfm.utilidades.Util"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="org.apache.http.HttpHeaders"%>

<!DOCTYPE html>

<%
    ResourceBundle rb = ResourceBundle.getBundle("es.uned.msanchez.tfm.phonegap.curl.resources.config");
    String serverRestFull = rb.getString("serverRESTFUL").trim();
    ResourceBundle rb_w = ResourceBundle.getBundle("es.uned.msanchez.tfm.resources.wizard");
    
    String url_download = rb_w.getString("url_download_lab");
    
    String lab_id= Util.isNulo(request.getAttribute("lab_id"))?"default":(String)request.getAttribute("lab_id");
    String lab_experiment_id= Util.isNulo(request.getAttribute("lab_experiment_id"))?"default":(String)request.getAttribute("lab_experiment_id");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Build Apps - Related</title>
        <link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../resources/bootstrap/css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" href="../resources/jquery-easyui/themes/gray/easyui.css"/>
        <link rel="stylesheet" href="../resources/jquery-easyui/themes/icon.css"/>
        <link rel="stylesheet" href="../resources/css/build.css"/>

        <script src="../resources/jquery/jquery.js"></script>
        <script src="../resources/jquery-easyui/jquery.easyui.min.js"></script>
        <script type="text/javascript">
            var serverRest= '<%=serverRestFull%>';
            var downloadPlat ='<%=url_download%>';
        </script>
        <script src="../resources/js/buildlab.js"></script>

    </head>
    <body>
        <section id="navegacion">
            <nav class="navbar navbar-default navbar-inverse" role="navigation">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">
                            <span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
                        </a>
                    </div>                                  
                </div>
            </nav>
        </section>
        <section id="contenido">
            <div class="row">
                <div class="col-md-12 table-responsive">
                    <table class="table table-striped">
                        <caption></caption>
                        <tr id="paso_1"><td>1</td><td>Comprobando el fichero config.xml</td><td class="_info_paso">
                                <div id="p_p_1" data-paso="paso_1" class="easyui-progressbar" data-options="value:0" style="width:100%;"></div>
                            </td></tr>
                        <tr id="paso_2"><td>2</td><td>Empaquetando el codigo de la aplicacion.</td><td class="_info_paso">
                                <div id="p_p_2" data-paso="paso_2" class="easyui-progressbar" data-options="value:0" style="width:100%;"></div>
                            </td></tr>
                        <tr id="paso_3"><td>3</td><td>Subiendo a Phonegap Build.</td><td class="_info_paso">
                                <div id="p_p_3" data-paso="paso_3" class="easyui-progressbar" data-options="value:0" style="width:100%;"></div>
                            </td></tr>

                    </table> 
                </div>
            </div>


            <div id="_dd_ff_infoApp" class="row">
                <div class="col-md-12 table-responsive" >
                    <table class="table table-striped table-hover">
                        <caption>Informacion sobre la aplicacion <span id="_info_name_apli">&nbsp;</span></caption>
                        <tr><td class="etiqueta_info_lab"> Descripcion</td><td class="valor_info" id="_info_desc_apli"> --- </td></tr>
                        <tr><td class="etiqueta_info_lab"> Version Aplicacion</td><td class="valor_info" id="_info_vapp_apli"> --- </td></tr>
                        <tr><td class="etiqueta_info_lab"> Package Aplicacion</td><td class="valor_info" id="_info_package_apli"> --- </td></tr>
                        <tr><td class="etiqueta_info_lab"> Version Phonegap</td><td class="valor_info" id="_info_vphonegap_apli"> --- </td></tr>
                        <tr><td class="etiqueta_info_lab"> Id Phonegap</td><td class="valor_info" id="_info_idphonegap_apli"> --- </td></tr>
                        <%--<tr><td class="etiqueta_info"> Url repositorio</td><td class="valor_info" id="_info_repo_apli"> --- </td></tr>--%>
                        <tr><td class="etiqueta_info_lab"> Android</td><td class="valor_info" id="_info_android_apli"> --- </td></tr>
                        <tr><td class="etiqueta_info_lab"> iOS</td><td class="valor_info" id="_info_ios_apli"> --- </td></tr>
                        <tr><td class="etiqueta_info_lab"> WinPhone</td><td class="valor_info" id="_info_winphone_apli"> --- </td></tr>
                    </table>                
                </div>
            </div>
        </section>        
        <section id="pie">
        </section>
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="../resources/bootstrap/js/bootstrap.min.js"></script>
        <div id="_dd_ff_downApp">
            <form id="_ff_downApp" target="download" enctype="multipart/form-data" action="get">                
                <input type="hidden" id="_ff_downApp_name" name="name" value="default"/>                
                <input type="hidden" id="_ff_lab_id" name="lab_id" value="<%=lab_id%>"/>                
                <input type="hidden" id="_ff_lab_experiment_id" name="lab_experiment_id" value="<%=lab_experiment_id%>"/>                
            </form>
        </div>


    </body>
</html>