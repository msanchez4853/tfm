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

        <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>--%>
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
            System.out.println(param + ": " + value);
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
        String lab_id = request.getParameter("lab_id");
        String lab_experiment_id = request.getParameter("lab_experiment_id");
        if (!Util.isNulo(lab_id)) {
            String pag_inicio = "mobile.html";
            aspecto = "related";
            if (opciones_generales.containsKey("source_file")) {
                pag_inicio = (String) opciones_generales.get("source_file");
                opciones_generales.remove("source_file");
            }

            if (!pag_inicio.contains("?")) {
                pag_inicio = pag_inicio + "?ale=" + Math.random();
            }
            pag_inicio = pag_inicio + "&lab_id=" + lab_id;
            pag_inicio = pag_inicio + (Util.isNulo(lab_experiment_id) ? "" : "&lab_experiment_id=" + lab_experiment_id);
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
                            <%                               
                            }
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
                        </ul>


                    </div><!-- /.navbar-collapse -->
                </div>
            </nav>
        </section>



        <section id="contenido">
            <form id="form_guardar" method="POST" action="save_config.jsp">
                <jsp:include  page="opc_generales.jsp"/>
                <jsp:include  page="opc_avanzadas.jsp"/>
                <jsp:include  page="opc_iconos.jsp"/>
                <jsp:include  page="opc_splash.jsp"/>
                <jsp:include  page="opc_permisos.jsp"/>
                <jsp:include  page="opc_desarrollador.jsp"/>     
                <jsp:include  page="opc_plugins.jsp"/>  
            </form>
        </section>        
        <section id="pie">
        </section>
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="../resources/bootstrap/js/bootstrap.min.js"></script>

    </body>
</html>

