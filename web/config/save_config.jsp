<%-- 
    Document   : save_config
    Created on : 12-may-2015, 19:50:16
    Author     : adrastea
--%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="es.uned.tfm.xml.Xml"%>
<%@page contentType="text/xml" pageEncoding="UTF-8" autoFlush="false"%>
<%
//response.setHeader("Content-Disposition","attachment;filename=config.xml");


Xml xml = new Xml();

Map opciones_generales = new HashMap();
Map opciones_avanzadas = new HashMap();
Map opciones_iconos = new HashMap();
Map opciones_splash = new HashMap();
Map opciones_permisos = new HashMap();
Map opciones_desarrollo = new HashMap();
Map opciones_plugins = new HashMap();

for(Enumeration e= request.getParameterNames(); e.hasMoreElements();)
{
    String params = (String)e.nextElement();
    String valueParams = request.getParameter(params);
   
    if(params.indexOf("_opc_gen_")>=0){
        opciones_generales.put(params.replaceFirst("_opc_gen_", ""),valueParams );
    }
    if(params.indexOf("_opc_avan_")>=0){
        opciones_avanzadas.put(params.replaceFirst("_opc_avan_", ""),valueParams );
    }
    if(params.indexOf("_opc_icon_")>=0){
        opciones_iconos.put(params.replaceFirst("_opc_icon_", ""),valueParams );
    }
    if(params.indexOf("_opc_splash_")>=0 ){
        opciones_splash.put(params.replaceFirst("_opc_splash_", ""),valueParams );
    }
    if(params.indexOf("_opc_perm_")>=0){
        opciones_permisos.put(params.replaceFirst("_opc_perm_", ""),valueParams );
    }
    if(params.indexOf("_opc_desa_")>=0){
        opciones_desarrollo.put(params.replaceFirst("_opc_desa_", ""),valueParams );
    }
    if(params.indexOf("_opc_plug_")>=0){
        opciones_plugins.put(params.replaceFirst("_opc_plug_", ""),valueParams );
    }
     
}


xml.setOpcionesGenerales(opciones_generales); 
xml.setOpcionesAvanzadas(opciones_avanzadas); 
xml.setOpcionesIcons(opciones_iconos); 
xml.setOpcionesSplash(opciones_splash); 
xml.setOpcionesPermisos(opciones_permisos); 
xml.setOpcionesPlugins(opciones_plugins); 
xml.setOpcionesDesarrollador(opciones_desarrollo); 
xml.generarXml(response.getOutputStream());
%>