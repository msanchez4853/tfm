
<%@page import="java.util.ResourceBundle"%>
<%@page import="org.apache.http.HttpHeaders"%>

<!DOCTYPE html>

<%
    ResourceBundle rb = ResourceBundle.getBundle("es.uned.msanchez.tfm.phonegap.curl.resources.config");
    String serverRestFull = rb.getString("serverRESTFUL").trim();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Build Apps</title>
        <link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../resources/bootstrap/css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" href="../resources/jquery-easyui/themes/gray/easyui.css"/>
        <link rel="stylesheet" href="../resources/jquery-easyui/themes/icon.css"/>
        <link rel="stylesheet" href="../resources/css/build.css"/>

        <script src="../resources/jquery/jquery.js"></script>
        <script src="../resources/jquery-easyui/jquery.easyui.min.js"></script>
        <script type="text/javascript">
            var serverRest= '<%=serverRestFull%>';
        </script>
        <script src="../resources/js/build.js"></script>

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
            <table id="apps_phonegap" title="Aplicaciones con Phonegap Build" width="100%">
                <thead> 
                    <tr>
                        <th>Id</th>
                        <th>Titulo</th>
                        <th>Package</th>
                        <th>Android</th>
                        <th>iOS</th>
                        <th>WinPhone</th>
                        <th>Install</th>
                    </tr>
                </thead>

            </table>
            <div id="tb" style="padding:2px 5px;">
                <a href="#" class="tool_button icon-add"  name="add"></a>
                <a href="#" class="tool_button icon-edit"  name="edit"></a>
                <a href="#" class="tool_button icon-remove" name="del"></a>
                <a href="#" class="tool_button icon-reload" name="reload"></a>
            </div>
            <div id="getApli"></div>
            <div id="menuPlatform">
                <div id="platform_build">
                    Build
                </div>
                <div id="platform_download">
                    Descargar
                </div>
            </div>
        </section>        
        <section id="pie">
        </section>
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="../resources/bootstrap/js/bootstrap.min.js"></script>


        <div id="_dd_ff_addApp">
            <form id="_ff_addApp">
                <span id="_ff_addApp_men" class="_error_form">&nbsp;</span><br/>
                <input type="hidden" id="_ff_addApp_method" name="method" value="remote_repo"/>
                <label class="form_etiqueta" for="_ff_addApp_title"> Titulo: </label>
                <input type="text" id="_ff_addApp_title" name ="title"/><br/>
                <label class="form_etiqueta" for="_ff_addApp_url"> Url del repositorio GitHub: </label>
                <input type="text" id="_ff_addApp_url" name ="url" />
                <div class="_ff_nota">
                    <strong>Nota:</strong>  Si en el repositorio est� definido el fichero config.xml el t�tulo
                    de la aplicaci�n definido en config.xml prevalece sobre el indicado en este formulario.
                </div>
            </form>
        </div>
        <div id="_dd_ff_downApp">
            <form id="_ff_downApp" target="download" enctype="multipart/form-data" action="get">                
                <input type="hidden" id="_ff_downApp_name" name="name" value="default"/>                
            </form>
        </div>

        <div id="_dd_ff_infoApp">
            <table>
                <%--  <caption>Informacion sobre la aplicacion <span id="_info_name_apli">&nbsp;</span></caption>--%>

                <tr><td class="etiqueta_info"> Version Aplicacion</td><td class="valor_info" id="_info_vapp_apli"> --- </td></tr>
                <tr><td class="etiqueta_info"> Version Phonegap</td><td class="valor_info" id="_info_vphonegap_apli"> --- </td></tr>
                <tr><td class="etiqueta_info"> Descripcion</td><td class="valor_info" id="_info_desc_apli"> --- </td></tr>


            </table>                
        </div>
    </body>
</html>