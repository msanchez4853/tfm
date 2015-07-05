
<%@page import="java.util.ResourceBundle"%>
<%@page import="org.apache.http.HttpHeaders"%>

<%//@page import="org.json.simple.JSONArray"%>
<!DOCTYPE html>

<%//@page import="es.uned.curl.Curl"%>
<%//@page import="org.json.simple.JSONObject"%> 
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
        <title>Wizard Config.</title>
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
                    <!-- Collect the nav links, forms, and other content for toggling -->                    
                </div>
            </nav>
        </section>
        <section id="contenido">
            <table id="apps_phonegap" title="Aplicaciones con Phonegap Build">
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
                      <%--
                            Curl curl = new Curl();
                            JSONObject misdatos = curl.getApps();
                          //  out.println(misdatos);
                            if (((Integer) misdatos.get("status"))==200) {
                                JSONObject respuesta = (JSONObject) misdatos.get("respuesta");
                              //  JSONObject infoApps = (JSONObject) respuesta.get("apps");
                                JSONArray appsJSON = (JSONArray) respuesta.get("apps");
                                
                                for(int app=0; app < appsJSON.size();app++){
                                    JSONObject appJSON = (JSONObject) appsJSON.get(app);
                                    //out.println(appJSON);
                                    String _titleApp = (String) appJSON.get("title");
                                    Long _idApp = (Long) appJSON.get("id");
                                    String _packageApp = (String) appJSON.get("package");
                                    JSONObject _statusApp = (JSONObject)appJSON.get("status");
                                    String _urlInstApp = (String)appJSON.get("install_url");
                                    %>
                                    <tr>
                                        <td><%=_idApp%></td>
                                        <td><%=_titleApp%></td>
                                        <td><%=_packageApp%></td>
                                        <td><%=_statusApp.get("android")%></td>
                                        <td><%=_statusApp.get("ios")%></td>
                                        <td><%=_statusApp.get("winphone")%></td>
                                        <td><%=_urlInstApp%></td>
                                    </tr>
                                    <%
                                }
                            }
                            
                        --%> 
            </table>
            <div id="ft" style="padding:2px 5px;">
                <a href="#" class="tool_button icon-add"  name="add"></a>
                <a href="#" class="tool_button icon-edit"  name="edit"></a>
                <a href="#" class="tool_button icon-remove" name="del"></a>
                <a href="#" class="tool_button icon-reload" name="reload"></a>
            </div>
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
                 <div id="platform_gestkeys">
                     <span> Gestion de las Keys</span>
                     <div><span>Delete Keys</span></div>
                </div>
            </div>
        </section>        
        <section id="pie">
        </section>
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="../resources/bootstrap/js/bootstrap.min.js"></script>

    </body>
</html>