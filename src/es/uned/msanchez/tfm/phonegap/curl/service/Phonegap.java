/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.uned.msanchez.tfm.phonegap.curl.service;

import es.uned.msanchez.tfm.phonegap.curl.exception.CurlException;
import es.uned.msanchez.tfm.phonegap.curl.Curl;
import es.uned.msanchez.tfm.utilidades.Util;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.core.Request;
import javax.ws.rs.core.SecurityContext;
import javax.ws.rs.core.UriInfo;

import javax.ws.rs.ext.Providers;
import org.apache.http.HttpHeaders;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 *
 * @author adrastea
 */
@Path("/apps")
public class Phonegap {


    /**
     * Obtiene la informacion de las aplicaciones registradas en Phonega Build.
     *
     * @return
     * @throws CurlException
     */
    @GET
    @Produces("application/json")
    public String getMeApps() throws CurlException {
        Curl phonegap = new Curl();
        JSONObject misdatos = phonegap.getApps();
        JSONObject resul = new JSONObject();

        if (((Integer) misdatos.get("status")) == 200) {

            JSONObject respuesta = (JSONObject) misdatos.get("respuesta");
            //  JSONObject infoApps = (JSONObject) respuesta.get("apps");
            JSONArray appsJSON = (JSONArray) respuesta.get("apps");

            resul.put("total", appsJSON.size());

            JSONArray _rows = new JSONArray();
            for (int app = 0; app < appsJSON.size(); app++) {
                JSONObject appJSON = (JSONObject) appsJSON.get(app);
                JSONObject _o_app = new JSONObject();
                _o_app.put("title", (String) appJSON.get("title"));
                _o_app.put("id", (Long) appJSON.get("id"));
                _o_app.put("package", (String) appJSON.get("package"));
                JSONObject _statusApp = (JSONObject) appJSON.get("status");
                _o_app.put("status_android", _statusApp.get("android"));
                _o_app.put("status_win", _statusApp.get("winphone"));
                _o_app.put("status_ios", _statusApp.get("ios"));
                _o_app.put("install_url", (String) appJSON.get("install_url"));
                _rows.add(_o_app);

            }
            resul.put("rows", _rows);

        }
        return resul.toJSONString();
    }

    /**
     * Obtiene la informacion de la aplicacion indicada que se encuentra en
     * Phonega Build.
     *
     * @param idapli
     * @return
     * @throws CurlException
     */
    @GET
    @Path("/{idapli}")
    @Produces("application/json")
    public String getApp(@PathParam("idapli") Long idapli) throws CurlException {
        Curl phonegap = new Curl();
        JSONObject misdatos;
        if (Util.isNulo(idapli)) {
            misdatos = phonegap.getApps();
        } else {
            misdatos = phonegap.getApp(idapli);
        }
        JSONObject resul = new JSONObject();

        if (((Integer) misdatos.get("status")) == 200) {

            JSONObject respuesta = (JSONObject) misdatos.get("respuesta");
            //  JSONObject infoApps = (JSONObject) respuesta.get("apps");
            JSONArray appsJSON = (JSONArray) respuesta.get("apps");

            resul.put("total", appsJSON.size());

            JSONArray _rows = new JSONArray();
            for (int app = 0; app < appsJSON.size(); app++) {
                JSONObject appJSON = (JSONObject) appsJSON.get(app);
                JSONObject _o_app = new JSONObject();
                _o_app.put("title", (String) appJSON.get("title"));
                _o_app.put("id", (Long) appJSON.get("id"));
                _o_app.put("package", (String) appJSON.get("package"));
                JSONObject _statusApp = (JSONObject) appJSON.get("status");
                _o_app.put("status_android", _statusApp.get("android"));
                _o_app.put("status_win", _statusApp.get("winphone"));
                _o_app.put("status_ios", _statusApp.get("ios"));
                _o_app.put("install_url", (String) appJSON.get("install_url"));
                _rows.add(_o_app);

            }
            resul.put("rows", _rows);

        }
        return resul.toJSONString();
    }

    /**
     *
     * @param idapli
     * @return
     * @throws CurlException
     */
    @DELETE
    @Path("/{idapli}")
    @Produces("application/json")
    public String delApp(@PathParam("idapli") Long idapli) throws CurlException {
        Curl phonegap = new Curl();
        JSONObject misdatos;
        if (Util.isNulo(idapli)) {
            misdatos = phonegap.getApps();
        } else {
            misdatos = phonegap.deleteApp(idapli);
        }

        return misdatos.toJSONString();
    }


    @POST
    @Produces("application/json")
    public String addApp(@Context UriInfo uri,@Context Application request,@FormParam("datos") String data) {

        System.out.println("Title :" + data);
        JSONParser parser = new JSONParser();
        System.out.println(data);
        System.out.println("URI_Path -->"+uri.getPath());
       
      
        MultivaluedMap<String,String> queryParams = uri.getQueryParameters();
         MultivaluedMap<String,String> pathParams = uri.getPathParameters();
         System.out.println("QUERY PARAMS ______");
         for(String qp : queryParams.keySet()){
         System.out.println(qp+" = "+queryParams.get(qp));
         }
         System.out.println("FIN ::::: QUERY PARAMS ______");
        
         System.out.println("PATH PARAMS ______");
         for(String pp : pathParams.keySet()){
         System.out.println(pp+" = "+queryParams.get(pp));
         }
         System.out.println("FIN ::::: PATH PARAMS ______");
        JSONObject respuestaJSON = null;
        try {
            respuestaJSON = Util.isNulo(data) ? null : (JSONObject) parser.parse(data);
            if(Util.isNulo(respuestaJSON)) return "";
            return respuestaJSON.toJSONString();
        } catch (ParseException ex) {
            Logger.getLogger(Phonegap.class.getName()).log(Level.SEVERE, null, ex);
        }
        
         
     //    System.out.print(headers.getRequestHeader(HttpHeaders.ACCEPT));
        return " ";
    } 
}
