/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.uned.msanchez.tfm.phonegap.curl.service;

import com.sun.jersey.spi.resource.Singleton;
import es.uned.msanchez.tfm.phonegap.curl.exception.CurlException;
import es.uned.msanchez.tfm.phonegap.curl.Curl;
import es.uned.msanchez.tfm.utilidades.Util;
import es.uned.msanchez.tfm.utilidades.Zip;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;
import java.util.Set;
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
import org.apache.commons.io.FileUtils;
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
@Singleton
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
                _o_app.put("desc", (String) appJSON.get("description"));
                _o_app.put("version", (String) appJSON.get("version"));
                _o_app.put("id", (Long) appJSON.get("id"));
                _o_app.put("package", (String) appJSON.get("package"));
                _o_app.put("phonegap_version", (String) appJSON.get("phonegap_version"));
                _o_app.put("last_build", (String) appJSON.get("last_build"));
                _o_app.put("repo", (String) appJSON.get("repo"));
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

    /**
     * Obtiene la informacion de la aplicacion indicada que se encuentra en
     * Phonega Build.
     *
     * @param idapli
     * @return
     * @throws CurlException
     */
    @GET
    @Path("/check/{lab}/{lab_experiment}")
    @Produces("application/json")
    public String checkConfig(@Context HttpServletRequest request, @PathParam("lab") String lab_id, @PathParam("lab_experiment") String lab_experiment_id) throws CurlException {

        String ip = request.getRemoteAddr();
        System.out.println("MI IP --- " + ip);


        File f_config = new File(System.getProperty("user.dir") + File.separator + "tmp" + File.separator + "create_app" + File.separator + lab_id + File.separator + lab_experiment_id + File.separator + "www/config.xml");

        JSONObject resul = new JSONObject();
        resul.put("lab_id", lab_id);
        resul.put("lab_experiment_id", lab_experiment_id);
        if (f_config.exists()) {
            resul.put("status", "ok");
        } else {
            resul.put("status", "error");
        }



        //  resul.put("rows", _rows);


        return resul.toJSONString();
    }

    @GET
    @Path("/pkg/{lab}/{lab_experiment}")
    @Produces("application/json")
    public String pkgLab(@Context HttpServletRequest request, @PathParam("lab") String lab_id, @PathParam("lab_experiment") String lab_experiment_id) throws CurlException {

        String ip = request.getRemoteAddr();
        System.out.println("MI IP --- " + ip);

        File source = new File(System.getProperty("user.dir") + File.separator + "tmp" + File.separator + "git" + File.separator + "memory" + File.separator + "www");
        File dest = new File(System.getProperty("user.dir") + File.separator + "tmp" + File.separator + "create_app" + File.separator + lab_id + File.separator + lab_experiment_id + File.separator + "tmp");
        //dest.mkdirs();
        JSONObject resul = new JSONObject();
        resul.put("lab_id", lab_id);
        resul.put("lab_experiment_id", lab_experiment_id);


        try {
            FileUtils.copyDirectory(source, dest);
        } catch (IOException ex) {
            Logger.getLogger(Phonegap.class.getName()).log(Level.SEVERE, null, ex);
            resul.put("status", "error");
            return resul.toJSONString();
        }


        File f_config = new File(System.getProperty("user.dir") + File.separator + "tmp" + File.separator + "create_app" + File.separator + lab_id + File.separator + lab_experiment_id + File.separator + "www/config.xml");
        try {
            FileUtils.copyFileToDirectory(f_config, dest);
        } catch (IOException ex) {
            Logger.getLogger(Phonegap.class.getName()).log(Level.SEVERE, null, ex);
            resul.put("status", "error");
            return resul.toJSONString();
        }


        File dest_zip = new File(System.getProperty("user.dir") + File.separator + "tmp" + File.separator + "create_app" + File.separator + lab_id + File.separator + lab_experiment_id + File.separator + "zip");
        try {
            Zip.zipDirectorio(dest, dest_zip, "lab", Zip.Extension.ZIP);
        } catch (IOException ex) {
            Logger.getLogger(Phonegap.class.getName()).log(Level.SEVERE, null, ex);
            resul.put("status", "error");
            return resul.toJSONString();
        } catch (IllegalArgumentException ex) {
            Logger.getLogger(Phonegap.class.getName()).log(Level.SEVERE, null, ex);
            resul.put("status", "error");
            return resul.toJSONString();
        }


        resul.put("status", "ok");
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
    @Path("/build/{lab}/{lab_experiment}")
    @Produces("application/json")
    public synchronized String buildLab(@Context HttpServletRequest request, @PathParam("lab") String lab_id, @PathParam("lab_experiment") String lab_experiment_id) throws CurlException {

        String ip = request.getRemoteAddr();
        System.out.println("MI IP --- " + ip);
        Curl phonegap = new Curl();

        // Comprobamos si existe otra aplicacion en Phonegap privada.
        JSONObject info_apps = phonegap.getApps();
        JSONObject apliPrivada = null;
        System.out.println(info_apps);
        if (((Integer) info_apps.get("status")) == 200) {
            JSONObject respuesta = (JSONObject) info_apps.get("respuesta");
            JSONArray apps = (JSONArray) respuesta.get("apps");
            for (int i = 0; i < apps.size(); i++) {
                JSONObject apli = (JSONObject) apps.get(i);
                if (((Boolean) apli.get("private")) == true) {
                    apliPrivada = apli;
                    break;
                }
            }
        }

        JSONObject resul = new JSONObject();

        if (apliPrivada != null) {
            //existe aplicacion privada
            //Gestionamos si podemos eliminarla.
            //Comprobamos que la aplicacion no este en proceso de creacion para una plataforma.
            JSONObject info_status = (JSONObject) apliPrivada.get("status");
            Collection c = info_status.values();
            for (Iterator i = c.iterator(); i.hasNext();) {
                String value = (String) i.next();
                if (value.contains("pending")) {
                    //existe una aplicacion pendiente de ejecutar.
                    resul.put("error", "Existe una aplicacion privada. La aplicacion esta pendiente de crearse para una plataforma.");
                    resul.put("status", "error");
                    return resul.toJSONString();
                }
            }
            //Comprobamos si se ha realizado el download de la aplicacion privada
            Long idApliPho = (Long) apliPrivada.get("id");
            File dir_back = new File(System.getProperty("user.dir") + File.separator + "tmp" + File.separator + "backup" + File.separator + idApliPho);
            if (dir_back.exists() && dir_back.isDirectory()) {
                //La aplicacion privada no se ha realizado download
                //Leemos los datos del laboratorio.
                File f_labId = new File(dir_back, "idLab");
                File f_labExperimentId = new File(dir_back, "idLabExperiment");
                String antLabId = null;
                String antLabExpId = null;
                try {
                    FileReader fr_labId = new FileReader(f_labId);
                    BufferedReader re_labId = new BufferedReader(fr_labId);
                    antLabId = re_labId.readLine();
                    re_labId.close();
                    fr_labId.close();
                    FileReader fr_labExpId = new FileReader(f_labExperimentId);
                    BufferedReader re_labExpId = new BufferedReader(fr_labExpId);
                    antLabExpId = re_labExpId.readLine();
                    re_labExpId.close();
                    fr_labExpId.close();

                    System.out.println(antLabId + " -- " + antLabExpId);

                } catch (FileNotFoundException ex) {
                    Logger.getLogger(Phonegap.class.getName()).log(Level.SEVERE, null, ex);
                    resul.put("error", "Existe una aplicacion privada. No se ha podido identificar la aplicacion privada.");
                    resul.put("status", "error");
                    return resul.toJSONString();
                } catch (IOException ex) {
                    Logger.getLogger(Phonegap.class.getName()).log(Level.SEVERE, null, ex);
                    resul.put("error", "Existe una aplicacion privada. No se ha podido identificar la aplicacion privada.");
                    resul.put("status", "error");
                    return resul.toJSONString();
                }

                //descargamos la aplicaciones para las distintas plataformas.
                Set platfs = info_status.keySet();
                System.out.println("info_status ---> "+ info_status);
                for (Iterator i = platfs.iterator(); i.hasNext();) {
                    String platform = (String) i.next();
                    if (((String) info_status.get(platform)).equals("complete")) {
                        //descargamos la aplicacion

                        JSONObject info_des = phonegap.getPlatform(idApliPho, platform);
                        System.out.println("info_des -->"+info_des);
                        if (!Util.isNulo(info_des) && info_des.containsKey("status_text") && ((String) info_des.get("status_text")).equals("OK")) {
                            JSONObject datosFile = (JSONObject) info_des.get("respuesta");

                            File file = new File((String) datosFile.get("descargado"));
                            File dir_down = new File(System.getProperty("user.dir") + File.separator + "tmp" + File.separator + "create_app" + File.separator + antLabId + File.separator + antLabExpId + File.separator + "download" + File.separator + platform);
                            try {
                                FileUtils.deleteDirectory(dir_down);
                            } catch (IOException ex) {
                                Logger.getLogger(Phonegap.class.getName()).log(Level.SEVERE, null, ex);
                            }
                            dir_down.mkdirs();

                            String name_file = (String) apliPrivada.get("title");
                            name_file = name_file.replaceAll(" ", "");
                            try {
                                
                                if (platform.equals("android")) {
                                    FileUtils.moveFile(file, new File(dir_down, name_file + ".apk"));
                                }
                                if (platform.equals("winphone")) {
                                    FileUtils.moveFile(file, new File(dir_down, name_file + ".xap"));
                                }
                                if (platform.equals("ios")) {
                                    FileUtils.moveFile(file, new File(dir_down, name_file + ".ipa"));
                                }
                            } catch (IOException ex) {
                                Logger.getLogger(Phonegap.class.getName()).log(Level.SEVERE, null, ex);
                                resul.put("error", "Existe una aplicacion privada. No se ha podido realizar el backup");
                                resul.put("status", "error");
                                return resul.toJSONString();
                            }

                        }
                    }
                }
                try {
                    //Eliminamos el backup
                    FileUtils.deleteDirectory(dir_back);
                    dir_back.delete();
                } catch (IOException ex) {
                    Logger.getLogger(Phonegap.class.getName()).log(Level.SEVERE, null, ex);                    
                                resul.put("error", "Existe una aplicacion privada. No se ha podido eliminar el bloqueo de la api");
                                resul.put("status", "error");
                                return resul.toJSONString();
                }
                
                
            }

            //Eliminamos la aplicacion privada.
            JSONObject del_app = phonegap.deleteApp(idApliPho);
            if (((Integer) info_apps.get("status")) != 200) {
                //se ha generado un error al eliminar la aplicacion
                resul.put("error", "Existe una aplicacion privada. No se ha podido eliminar correctamente");
                resul.put("status", "error");
                return resul.toJSONString();
            }
        }

        File lab_zip = new File(System.getProperty("user.dir") + File.separator + "tmp" + File.separator + "create_app" + File.separator + lab_id + File.separator + lab_experiment_id + File.separator + "zip" + File.separator + "lab" + ".zip");


        resul.put("lab_id", lab_id);
        resul.put("lab_experiment_id", lab_experiment_id);

        System.out.println(lab_zip.getAbsolutePath());
        JSONObject misdatos = null;
        JSONObject respuesta = null;
        if (lab_zip.exists()) {
            misdatos = phonegap.createApp(lab_id, "file", lab_zip, "", null);

            System.out.println("Respuesta Crear --> " + misdatos);
            respuesta = (JSONObject) misdatos.get("respuesta");
            if (((Integer) misdatos.get("status")) == 201) {
                //respuesta satisfactoria
                resul.put("info_apli", misdatos);
                resul.put("status", "ok");
            } else {
                //respuesta erronea.                
                resul.put("error", respuesta.get("error"));
                return resul.toJSONString();
            }


        } else {
            resul.put("error", "No se ha encontrado el empaquetado del proyecto");
            resul.put("status", "error");
            return resul.toJSONString();
        }



        //Establecemos que la aplicacion esta en proceso de creacion y download
        System.out.println("respuesta ---> " + respuesta);
        Long idPhonegap = (Long) respuesta.get("id");

        File dir_back = new File(System.getProperty("user.dir") + File.separator + "tmp" + File.separator + "backup" + File.separator + idPhonegap);
        dir_back.mkdirs();
        File f_labId = new File(dir_back, "idLab");
        File f_labExperimentId = new File(dir_back, "idLabExperiment");


        try {
            FileWriter fw_labId = new FileWriter(f_labId);
            FileWriter fw_labExperimentId = new FileWriter(f_labExperimentId);
            fw_labId.write(lab_id);
            fw_labExperimentId.write(lab_experiment_id);
            fw_labId.close();
            fw_labExperimentId.close();


        } catch (IOException ex) {
            Logger.getLogger(Phonegap.class.getName()).log(Level.SEVERE, null, ex);
            resul.put("error", "Se ha creado la aplicacion. Pero no se ha podido proteger");
            resul.put("status", "error");
            return resul.toJSONString();
        }



        return resul.toJSONString();
    }
}
