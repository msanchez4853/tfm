<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
   <%--     <meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Wizard Config.</title>
        <link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../resources/bootstrap/css/bootstrap-theme.min.css"/>
        <link rel="stylesheet" href="../resources/css/config.css"/>

       <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>--%>
       <script src="../resources/jquery/jquery.js"></script>
        <script src="../resources/js/config.js"></script>

    </head>
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
                        <a class="navbar-brand" href="#">
                            <span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
                        </a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="#_opciones_generales">General <span class="sr-only">(current)</span></a></li>
                            <li data-agr="avanzada"><a href="#_opciones_avanzadas">Avanzadas</a></li>
                            <li ><a href="#_opciones_iconos">Iconos</a></li>
                            <li ><a href="#_opciones_splash">Splash Screen</a></li>
                            <li><a href="#_opciones_permisos">Permisos</a></li>
                            <li><a href="#_opciones_desarrollador">Info. Desarrolador</a></li>
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

