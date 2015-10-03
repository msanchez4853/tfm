<%-- 
    Document   : save_config
    Created on : 12-may-2015, 19:50:16
    Author     : adrastea
--%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="es.uned.msanchez.tfm.utilidades.Util"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="es.uned.msanchez.tfm.xml.Xml"%>
<%@page contentType="text/xml" pageEncoding="UTF-8" autoFlush="false"%>
<%
    ResourceBundle rb = ResourceBundle.getBundle("es.uned.msanchez.tfm.resources.wizard");
    String path_build = rb.getString("path_build_lab").trim();
    String path_base_tmp = rb.getString("path_tmp").trim();

    String option = request.getParameter("option");
    option = Util.isNulo(option) ? "default" : option;

    String aspecto = request.getParameter("apli");
    aspecto = Util.isNulo(aspecto) ? "completo" : aspecto;

    String lab_id = request.getParameter("lab_id");
    if(aspecto.equals("related") && (Util.isNulo(lab_id) || lab_id.equals("--"))){
        response.setContentType("text/html");
        response.sendError(402, "No se ha especficado ningun laboratorio");
        return; 
    } 
    lab_id = Util.isNulo(lab_id) ? "default" : lab_id;
    String lab_experiment_id = request.getParameter("lab_experiment_id");
    lab_experiment_id = (Util.isNulo(lab_experiment_id)||lab_experiment_id.equals("--")) ? "default" : lab_experiment_id;

    Map opciones_generales = new HashMap();
    Map opciones_avanzadas = new HashMap();
    Map opciones_iconos = new HashMap();
    Map opciones_splash = new HashMap();
    Map opciones_permisos = new HashMap();
    Map opciones_desarrollo = new HashMap();
    Map opciones_plugins = new HashMap();

    for (Enumeration e = request.getParameterNames(); e.hasMoreElements();) {
        String params = (String) e.nextElement();
        String valueParams = request.getParameter(params);
        if (params.indexOf("_opc_gen_") >= 0) {
          
            if (params.equals("_opc_gen_source_file") && aspecto.equals("related")) {
                //Si la aplicacion es related, modificamos la apgina de inicio.
                if (!valueParams.contains("?")) {
                    valueParams = valueParams + "?lab_id=" + lab_id+(lab_experiment_id.equals("default")?"":"&lab_experiment_id="+lab_experiment_id);
                } else {
                    valueParams = valueParams + "&lab_id=" + lab_id+(lab_experiment_id.equals("default")?"":"&lab_experiment_id="+lab_experiment_id);
                }
            }
            opciones_generales.put(params.replaceFirst("_opc_gen_", ""), valueParams);
            
        }
        if (params.indexOf("_opc_avan_") >= 0) {
            opciones_avanzadas.put(params.replaceFirst("_opc_avan_", ""), valueParams);
        }
        if (params.indexOf("_opc_icon_") >= 0) {
            opciones_iconos.put(params.replaceFirst("_opc_icon_", ""), valueParams);
        }
        if (params.indexOf("_opc_splash_") >= 0) {
            opciones_splash.put(params.replaceFirst("_opc_splash_", ""), valueParams);
        }
        if (params.indexOf("_opc_perm_") >= 0) {
            opciones_permisos.put(params.replaceFirst("_opc_perm_", ""), valueParams);
        }
        if (params.indexOf("_opc_desa_") >= 0) {
            opciones_desarrollo.put(params.replaceFirst("_opc_desa_", ""), valueParams);
        }
        if (params.indexOf("_opc_plug_") >= 0) {
            opciones_plugins.put(params.replaceFirst("_opc_plug_", ""), valueParams);
        }

    }

    // 1) Instanciar el objeto de clase Xml, se establece el elemento raiz (widget) del fichero 
    Xml xml = new Xml();
    
    // 2) Se crean los distintos grupos de elementos 
    xml.setOpcionesGenerales(opciones_generales);
    xml.setOpcionesAvanzadas(opciones_avanzadas);
    xml.setOpcionesIcons(opciones_iconos);
    xml.setOpcionesSplash(opciones_splash);
    xml.setOpcionesPermisos(opciones_permisos);
    xml.setOpcionesPlugins(opciones_plugins);
    xml.setOpcionesDesarrollador(opciones_desarrollo);

    // 3) Se genera el fichero xml en byte para que pueda ser guardado, mostrado o 
    // utilizado para generacion automatica
    if (option.equals("default") || option.equals("mostrar") || option.equals("guardar")) {
        if (option.equals("guardar")) {
            response.setHeader("Content-Disposition", "attachment;filename=config.xml");
        }
        out.clearBuffer();
        ServletOutputStream outputStream = response.getOutputStream();
        xml.generarXml(outputStream);

    }

    if (option.equals("generar")) {
        out.println("Generando");
        File dir_tmp = new File(path_base_tmp + File.separator 
                + "create_app" + File.separator + lab_id + File.separator 
                + lab_experiment_id + File.separator + "config");
        dir_tmp.mkdirs();

        File f_config = new File(dir_tmp, "config.xml");
        FileOutputStream fo = new FileOutputStream(f_config);
        xml.generarXml(fo);
        fo.close();
        String nextJSP = path_build;
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
        request.setAttribute("lab_id", lab_id);
        request.setAttribute("lab_experiment_id", lab_experiment_id);
        request.setAttribute("apli_ext", "related");
        dispatcher.forward(request, response);
    }

%>