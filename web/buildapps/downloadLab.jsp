<%-- 
    Document   : downloadLab
    Created on : 14-sep-2015, 23:22:32
    Author     : adrastea
--%>

<%@page import="java.util.ResourceBundle"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.File"%>
<%@page import="es.uned.msanchez.tfm.utilidades.Util"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
    ResourceBundle rb = ResourceBundle.getBundle("es.uned.msanchez.tfm.resources.wizard");

    String path_base_tmp = rb.getString("path_tmp").trim();

    String lab_id = Util.isNulo(request.getParameter("lab_id")) ? "" : (String) request.getParameter("lab_id");
    String lab_experiment_id = Util.isNulo(request.getParameter("lab_experiment_id")) ? "default" : (String) request.getParameter("lab_experiment_id");
    String platform = Util.isNulo(request.getParameter("platform")) ? null : (String) request.getParameter("platform");
    String name_file = Util.isNulo(request.getParameter("name")) ? platform : (String) request.getParameter("name");

    if (Util.isNulo(platform) || Util.isNulo(lab_id)) {
        response.sendError(404, "No ha indicado algunos de los parametros obligatorios.");
        return;
    }

    name_file = name_file.replaceAll(" ", "");

    if (platform.equals("android")) {
        name_file = name_file + ".apk";
    }
    if (platform.equals("winphone")) {
        name_file = name_file + ".xap";
    }
    if (platform.equals("ios")) {
        name_file = name_file + ".ipa";
    }

    File file = new File(path_base_tmp + File.separator 
            + "create_app" + File.separator + lab_id 
            + File.separator + lab_experiment_id
            + File.separator + "download" + File.separator 
            + platform + File.separator + name_file);

    if (file.exists() && file.isFile()) {
        response.setHeader("Content-Disposition", "attachment; filename=\"" + name_file + "\""); //optional

        FileInputStream inFile = new FileInputStream(file);
        OutputStream outFile = new DataOutputStream(response.getOutputStream());

        byte[] buffer = new byte[1024];
        int sizeRead = 0;
        while ((sizeRead = inFile.read(buffer)) >= 0) { //leyendo del host
            outFile.write(buffer, 0, sizeRead); //escribiendo para el navegador
        }
        inFile.close(); // y cerrando
        outFile.close(); // todo
    } else {
        response.sendError(404, "No se ha encontrado la aplicacion movil para la plataforma indicada.");
        return;
    }
%>