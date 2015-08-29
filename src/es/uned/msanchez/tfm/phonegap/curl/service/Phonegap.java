/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.uned.msanchez.tfm.phonegap.curl.service;

import es.uned.msanchez.tfm.phonegap.curl.exception.CurlException;
import es.uned.msanchez.tfm.phonegap.curl.Curl;
import es.uned.msanchez.tfm.utilidades.Util;
import java.io.File;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
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
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.core.Request;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;
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
    public String getMeApps(@Context HttpServletRequest request) throws CurlException {

        String ip = request.getRemoteAddr();
        System.out.println("MI IP --- " + ip);
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
                System.out.println(appJSON);
                JSONObject _o_app = new JSONObject();
                _o_app.put("title", (String) appJSON.get("title"));
                _o_app.put("id", (Long) appJSON.get("id"));
                _o_app.put("package", (String) appJSON.get("package"));
                _o_app.put("phonegap_version", (String) appJSON.get("phonegap_version"));
                _o_app.put("last_build", (String) appJSON.get("last_build"));
                JSONObject _statusApp = (JSONObject) appJSON.get("status");
                _o_app.put("status_android", _statusApp.get("android"));
                _o_app.put("status_win", _statusApp.get("winphone"));
                _o_app.put("status_ios", _statusApp.get("ios"));
                JSONObject _downloadApp = (JSONObject) appJSON.get("download");
                _o_app.put("download_android", _downloadApp.get("android"));
                _o_app.put("download_win", _downloadApp.get("winphone"));
                _o_app.put("download_ios", _downloadApp.get("ios"));
                JSONObject _errorApp = (JSONObject) appJSON.get("error");
                _o_app.put("error_android", _errorApp.get("android"));
                _o_app.put("error_win", _errorApp.get("winphone"));
                _o_app.put("error_ios", _errorApp.get("ios"));
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
    public String getApp(@Context HttpServletRequest request, @PathParam("idapli") Long idapli) throws CurlException {

        String ip = request.getRemoteAddr();
        System.out.println("MI IP --- " + ip);
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

        System.out.println("delapp --> " + idapli);
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
    public String addApp(@Context UriInfo uri, @Context Application request, @FormParam("datos") String data) throws CurlException {

        JSONParser parser = new JSONParser();
        System.out.println(data);
        System.out.println("URI_Path -->" + uri.getRequestUri().getHost());

        //System.out.println("ip_Path -->"+request.getRemoteAddr());
        JSONObject respuestaJSON = null;
        try {
            respuestaJSON = Util.isNulo(data) ? null : (JSONObject) parser.parse(data);

            Curl phonegap = new Curl();
            JSONObject misdatos;
            System.out.println((String) respuestaJSON.get("title") + " " + (String) respuestaJSON.get("method") + " " + (String) respuestaJSON.get("url"));
            misdatos = phonegap.createApp((String) respuestaJSON.get("title"), (String) respuestaJSON.get("method"), null, (String) respuestaJSON.get("url"), null);
            //if(Util.isNulo(respuestaJSON)) return "";
            return misdatos.toJSONString();
        } catch (ParseException ex) {
            Logger.getLogger(Phonegap.class.getName()).log(Level.SEVERE, null, ex);
        }


        //    System.out.print(headers.getRequestHeader(HttpHeaders.ACCEPT));
        return " ";
    }

    @POST
    @Path("/{idapli}/build/{platform}")
    @Produces("application/json")
    public String buildApp(@PathParam("idapli") Long idapli, @PathParam("platform") String platform) throws CurlException {

        System.out.println("buildapp --> " + idapli);
        System.out.println(platform);
        Curl phonegap = new Curl();
        JSONObject misdatos;
        if (Util.isNulo(idapli)) {
            misdatos = phonegap.getApps();
        } else {
            misdatos = phonegap.buildApp(idapli, platform);
        }

        return misdatos.toJSONString();
    }

    @POST
    @Path("/{idapli}/build")
    @Produces("application/json")
    public String buildApp(@PathParam("idapli") Long idapli) throws CurlException {

        Curl phonegap = new Curl();
        JSONObject misdatos;
        if (Util.isNulo(idapli)) {
            misdatos = phonegap.getApps();
        } else {
            misdatos = phonegap.buildApp(idapli, new JSONObject());
        }

        return misdatos.toJSONString();
    }

    /**
     *
     * @param request
     * @param idapli
     * @param platform
     * @param name_apli
     * @return
     * @throws CurlException
     */
    @GET
    @Path("/{idapli}/{platform}")
    @Produces({MediaType.APPLICATION_OCTET_STREAM, "application/json"})
    public Response downloadApp(@Context HttpServletRequest request, @PathParam("idapli") Long idapli, @PathParam("platform") String platform,
            @QueryParam("name") String name_apli) throws CurlException {

        String ip = request.getRemoteAddr();
        System.out.println("MI IP --- " + ip);
        Curl phonegap = new Curl();
        JSONObject resul = phonegap.getPlatform(idapli, platform);
        if (!Util.isNulo(resul) && resul.containsKey("status_text") && ((String) resul.get("status_text")).equals("OK")) {
            JSONObject datosFile = (JSONObject) resul.get("respuesta");

            File file = new File((String) datosFile.get("descargado"));
            String type = (String) datosFile.get("type");
            //String name_file = Util.isNulo(idapli) ? platform : idapli.toString();
            String name_file = Util.isNulo(name_apli) ? platform : name_apli.toString();
            if (platform.equals("android")) {
                name_file = name_file + ".apk";
            }
            if (platform.equals("winphone")) {
                name_file = name_file + ".xap";
            }
            if (platform.equals("ios")) {
                name_file = name_file + ".ipa";
            }

            ResponseBuilder rbu = Response.ok(file, MediaType.APPLICATION_OCTET_STREAM);
            rbu.header("Content-Disposition", "attachment; filename=\"" + name_file + "\"") //optional
                    .header("Content-Type", type);

            //  file.delete();
            file.deleteOnExit();

            return rbu.build();
        } else {
            //JSONObject error = new JSONObject();
            return Response.status(400).entity(resul)
                    .header("Content-Type", MediaType.APPLICATION_JSON_TYPE).build();
        }

    }
}
