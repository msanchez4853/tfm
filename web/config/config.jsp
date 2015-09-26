
<%@page import="java.util.ResourceBundle"%>
<%@page import="es.uned.msanchez.tfm.utilidades.Util"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <%--     <meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Wizard Config.</title>
        <link rel="stylesheet" href="../resources/jquery-easyui/themes/gray/easyui.css"/>
        <link rel="stylesheet" href="../resources/jquery-easyui/themes/icon.css"/>
        <link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../resources/bootstrap/css/bootstrap-theme.min.css"/>

        <link rel="stylesheet" href="../resources/css/config.css"/>

        <script src="../resources/jquery/jquery.js"></script>
        <script src="../resources/jquery-easyui/jquery.easyui.min.js"></script>
        <script src="../resources/js/config.js"></script>

    </head>
    <%

        Map opciones_generales = new HashMap();
        Map opciones_avanzadas = new HashMap();
        Map opciones_iconos = new HashMap();
        Map opciones_splash = new HashMap();
        Map opciones_permisos = new HashMap();
        Map opciones_desarrollo = new HashMap();
        Map opciones_plugins = new HashMap();

        String aspecto = "completo";
        for (Enumeration e = request.getParameterNames(); e.hasMoreElements();) {
            String param = (String) e.nextElement();
            String value = request.getParameter(param);

            if (param.indexOf("_opc_gen_") >= 0) {

                opciones_generales.put(param.replaceFirst("_opc_gen_", ""), value);
            }
            if (param.indexOf("_opc_avan_") >= 0) {
                opciones_avanzadas.put(param.replaceFirst("_opc_avan_", ""), value);
            }
            if (param.indexOf("_opc_icon_") >= 0) {
                opciones_iconos.put(param.replaceFirst("_opc_icon_", ""), value);
            }
            if (param.indexOf("_opc_splash_") >= 0) {
                opciones_splash.put(param.replaceFirst("_opc_splash_", ""), value);
            }
            if (param.indexOf("_opc_perm_") >= 0) {
                opciones_permisos.put(param.replaceFirst("_opc_perm_", ""), value);
            }
            if (param.indexOf("_opc_desa_") >= 0) {
                opciones_desarrollo.put(param.replaceFirst("_opc_desa_", ""), value);
            }
            if (param.indexOf("_opc_plug_") >= 0) {
                opciones_plugins.put(param.replaceFirst("_opc_plug_", ""), value);
            }

            if (param.equals("_opc_aspecto")) {
                if (!Util.isNulo(value) && value.equalsIgnoreCase("reducido")) {
                    aspecto = "reducido";
                }
            }

        }

        //Peticion realizada desde RELATED.
        String apli_ext = request.getParameter("apli");
        String lab_id = request.getParameter("lab_id");
        String lab_experiment_id = request.getParameter("lab_experiment_id");
        lab_experiment_id = Util.isNulo(lab_experiment_id) ? "" : lab_experiment_id;

        String login = request.getParameter("login");
        login = Util.isNulo(login) ? "S" : login;

        // boolean _onlyLabApp = true;
        if (!Util.isNulo(apli_ext) && apli_ext.equalsIgnoreCase("related")) {
            aspecto = "related";
            ResourceBundle rb = ResourceBundle.getBundle("es.uned.msanchez.tfm.resources.related");
            String pag_inicio = rb.getString("pag_inicio").trim();
            opciones_generales.put("source_file", pag_inicio);


        }

        session.setAttribute("opciones_generales", opciones_generales);
        session.setAttribute("opciones_avanzadas", opciones_avanzadas);
        session.setAttribute("opciones_desarrollo", opciones_desarrollo);
        session.setAttribute("opciones_iconos", opciones_iconos);
        session.setAttribute("opciones_permisos", opciones_permisos);
        session.setAttribute("opciones_plugins", opciones_plugins);
        session.setAttribute("opciones_splash", opciones_splash);


    %>
    <body>
        <section id="navegacion">
            <nav class="navbar navbar-default navbar-inverse" role="navigation">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
                                data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button> 
                        <a class="navbar-brand" href="#" data-aspecto="<%=aspecto%>" data-toggle="popover" data-toggle-pos="bottom">
                            <%if (aspecto.equalsIgnoreCase("related")) {%>
                            <span class="nav-aspecto glyphicon glyphicon-eye-open" aria-hidden="true">&nbsp;Related&nbsp;
                            </span>
                            <%} else {
                            %>

                            <span class="nav-aspecto glyphicon glyphicon-eye-open" aria-hidden="true">&nbsp;Completa&nbsp;
                            </span>
                            <span class="data-content" >
                                Indica la vision (completa o reducida) del Wizard  para definir el fichero de 
                                configuracion config.xml necesario para una aplicacion Phonegap Build.                                
                            </span>        
                            <%                                }
                            %>

                        </a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="#_opciones_generales">General <span class="sr-only">(current)</span></a></li>
                            <li data-ex-apli="related" data-agr="avanzada"><a href="#_opciones_avanzadas">Avanzadas</a></li>
                            <li data-ex-apli="related" ><a href="#_opciones_iconos">Iconos</a></li>
                            <li data-ex-apli="related" ><a href="#_opciones_splash">Splash Screen</a></li>
                            <li data-ex-apli="related" ><a href="#_opciones_permisos">Caract. y Permisos</a></li>
                            <li ><a href="#_opciones_desarrollador">Info. Desarrollador</a></li>
                            <li><a href="#_opciones_plugins">Plugins</a></li>
                            <li><a id="_opciones_guardar" href="#"><span class="glyphicon glyphicon-floppy-disk">&nbsp;Guardar</span></a></li>                    
                            <%if (aspecto.equalsIgnoreCase("related")) {%>
                            <li><a href="#">User: <span id="user">None</span></a></li>
                            <li><!-- Button trigger modal -->
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#labsSelectionModalDialog">
                                    Lab/Experiment
                                </button>
                            </li>
                            <%}%>
                        </ul>


                    </div><!-- /.navbar-collapse -->
                </div>
            </nav>
        </section>



        <section id="contenido">
            <form id="form_guardar" method="POST" action="save_config.jsp">
                <input type="hidden" name="option" id="option" value="default">
                <input type="hidden" name="apli" id="apli" value="<%=aspecto%>">
                <input type="hidden" name="lab_id" id="lab_id" value="--">
                <input type="hidden" name="lab_experiment_id" id="lab_experiment_id" value="--">
                <jsp:include  page="opc_generales.jsp">
                    <jsp:param name="aspecto" value="<%=aspecto%>"></jsp:param>
                </jsp:include>    
                <jsp:include  page="opc_avanzadas.jsp">
                    <jsp:param name="aspecto" value="<%=aspecto%>"></jsp:param>
                </jsp:include>    
                <jsp:include  page="opc_iconos.jsp">
                    <jsp:param name="aspecto" value="<%=aspecto%>"></jsp:param>
                </jsp:include>    
                <jsp:include  page="opc_splash.jsp">
                    <jsp:param name="aspecto" value="<%=aspecto%>"></jsp:param>
                </jsp:include>    
                <jsp:include  page="opc_permisos.jsp" >
                    <jsp:param name="aspecto" value="<%=aspecto%>"></jsp:param>
                </jsp:include>
                <jsp:include  page="opc_desarrollador.jsp">
                    <jsp:param name="aspecto" value="<%=aspecto%>"></jsp:param>
                </jsp:include>    
                <jsp:include  page="opc_plugins.jsp">
                    <jsp:param name="aspecto" value="<%=aspecto%>"></jsp:param>
                </jsp:include>      
            </form>
        </section>        
        <%
            if (aspecto.equalsIgnoreCase("related") && login.equals("S")) {
        %>

        <section id="mensajeSeleccion">
            <div> 
                Debe seleccionar un laboratorio. 
                <br/> Pulse sobre Lab/Experiment del menu superior.
            </div>
        </section>       
        <section id="loginInfo">
            <p class="alert alert-info" role="alert">Abriendo ventana de login...</p>
            <p class="alert alert-info hidden" role="alert" id="loginWindowOpenned">Esperando la respuesta de login...</p>
        </section>

        <section id="pie">
            <button class="btn btn-primary" type="button">
                Laboratorio Seleccionado: <span class="badge" id="selectedLab">NONE</span>
            </button>
            <button class="btn btn-primary" type="button">
                Experimento Seleccionado: <span class="badge" id="selectedExp">NONE</span>
            </button>
            <!--<span class="label label-default">Selected lab: <span id="selectedLab">NONE</span></span>
            <span class="label label-default">Selected experiment: <span id="selectedExp">NONE</span></span>-->
            <input type="hidden" name="selectedLabId" id="selectedLabId" value="">
            <input type="hidden" name="selectedExpId" id="selectedExpId" value="">
        </section>

        <!-- Modal -->
        <div class="modal fade" id="labsSelectionModalDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Selección del laboratorio/experimento</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="labs">Seleccciona el laboratorio:</label>
                            <select id="labs" class="form-control"></select>
                            <label for="experiments">Selecciona Experimento</label>
                            <select id="experiments" class="form-control"></select>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input id="cbxOnlyLabApp" type="checkbox" checked> Generar App solo para laboratorio
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        <button id="btnSelectLabExp" type="button" class="btn btn-primary">Seleccionar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="../resources/bootstrap/js/bootstrap.min.js"></script>
        <script src="http://lab-services.scc.uned.es/html5/related/webclientv3/js/rlab_web_auth.js"></script>
        <script src="http://lab-services.scc.uned.es/html5/related/webclientv3/js/jquery.xml2json.js"></script>
        <script src="http://lab-services.scc.uned.es/html5/related/webclientv3/js/jquery.soap.js"></script>
        <script src="http://lab-services.scc.uned.es/html5/related/webclientv3/js/rlab_services_systems.js"></script>

        <script>
            $(document).ready(function () {
                // Hide main sections !!!
                $('#navegacion').addClass("hidden");
                $('#contenido').addClass("hidden");
                $('#pie').addClass("hidden");
                // Init auth
                RLAB.SERVICES.AUTH_HTML.initAuth(onInfoMessageReceived);
                RLAB.SERVICES.AUTH_HTML.openLoginWindow(onLoginWindowOpenned);

                $('#btnSelectLabExp').on('click', function () {
                    // Get info from modal
                    var _onlyLabApp = $("#cbxOnlyLabApp").is(':checked');
                    $('#selectedLab').text($('#labs :selected').text());
                    $('#selectedLabId').val($('#labs :selected').val())
                    $('#_opc_gen_desc_app').val($('#labs :selected').attr('data-desc'))
                    $('#_opc_gen_name_app').val($('#labs :selected').attr('data-name'))
                
                
                    $('#selectedExp').text("NONE");
                    if (!_onlyLabApp) {
                        $('#selectedExp').text($('#experiments :selected').text());
                        $('#selectedExpId').val($('#experiments :selected').val())
                    }
                    $('#labsSelectionModalDialog').modal('hide');
                    
                    //Preparar entorno al laboratorio selecionado.
                    $("#form_guardar input[id='lab_id']").val($('#selectedLabId').val());
                    $("#form_guardar input[id='lab_experiment_id']").val($('#selectedExpId').val());
                });

            });

            function onInfoMessageReceived(userInfo) {
                // Add the lab content to the footer
                var sel = $('#labs');
                var count = 0;

                if (userInfo.labs != undefined) {
                    $(userInfo.labs).each(function () {
                        sel.append($("<option>")
                        .attr('value', this.ID)
                        .text(this.name)
                        .attr("data-name",this.name)
                        .attr("data-desc",this.description));
                        count++;
                    });
                    
                    if (count > 0) {
                        // Hide main sections !!!
                        $('#loginInfo').addClass("hidden");
                        // Add the customized content
                        $('#user').text(userInfo.user);
                        // Show main sections !!!
                        $('#navegacion').removeClass("hidden");
                        $('#contenido').removeClass("hidden");
                        $('#pie').removeClass("hidden");
               
                        // Add the event to select
                        $("#labs").change(function () {
                            var _lab_id = this.value;
                            // Load experiments to the experiments "select"
                            var experiments = RLAB.SERVICES.SYSTEMS.getExperiments(_lab_id);
                            if (typeof experiments != "undefined") {
                                if (!(experiments instanceof Array) && (typeof experiments == "object")) {
                                    experiments = [experiments];
                                }
                                var sel2 = $('#experiments');
                                sel2.find("option").remove();
                                $(experiments).each(function () {
                                    sel2.append($("<option>")
                                    .attr('value', this.id)
                                    .text(this.experiment_name)
                                    .attr("data-name",this.experiment_name));
                                });
                            }
                        });
                        $('button[data-target="#labsSelectionModalDialog"').click();
                    }else{
                        $.messager.alert('Wizard Config','No tiene acceso a ningun laboratorio o experimiento. No puede acceder a la configuracion.','error')
            
                    }
                }
            }

            function onLoginWindowOpenned() {
                $('#loginWindowOpenned').removeClass("hidden");
            }

            function sortLabsByName(a, b) {
                var aName = a.name.toLowerCase();
                var bName = b.name.toLowerCase();
                return ((aName < bName) ? -1 : ((aName > bName) ? 1 : 0));
            }

        </script>
        <%        } else {
        %>
        <!-- Bootstrap core JavaScript
    ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="../resources/bootstrap/js/bootstrap.min.js"></script>
        <%            }
        %>

        <div id="_dd_guardar">
            Va a proceder a generar el fichero config.xml. ¿Que desea hacer?<br/>
            Puede seleccionar la opcion:
            <ul>
                <li><strong>Guardar</strong>: Guarda en su pc el fichero generado. </li>
                <li><strong>Mostrar</strong>: Muestra en el navegador el fichero generado. </li>
                <%
                    if (aspecto.equalsIgnoreCase("related")) {
                %>
                <li><strong>Generar</strong>: Genera el laboratorio con el fichero generado. </li>
                <%                        }
                %>
                <li><strong>Cancelar</strong>: No genera el documento. </li>
            </ul>
        </div>
    </body>
</html>

