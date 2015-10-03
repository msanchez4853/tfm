/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.uned.msanchez.tfm.phonegap.curl.service;

import com.sun.jersey.spi.resource.Singleton;
import es.uned.msanchez.tfm.git.GitControl;
//import es.uned.msanchez.tfm.git.GitControl;
import es.uned.msanchez.tfm.phonegap.curl.Curl;
import es.uned.msanchez.tfm.phonegap.curl.exception.CurlException;
import es.uned.msanchez.tfm.utilidades.Util;
import es.uned.msanchez.tfm.utilidades.Zip;
import es.uned.msanchez.tfm.utilidades.ZipDirectory;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;
import java.util.ResourceBundle;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;
import org.apache.commons.io.FileUtils;
//import org.eclipse.jgit.api.errors.GitAPIException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 *
 * @author Miguel Sánchez Román
 */
@Path("/apps")
@Singleton
public class Phonegap {

    private static String path_base_tmp;
    private static String remotePath;
    private static String[] dir_omitir;

    static {
        ResourceBundle rb = ResourceBundle.getBundle("es.uned.msanchez.tfm.resources.wizard");
        path_base_tmp = rb.getString("path_tmp").trim();
        remotePath = rb.getString("related_ori").trim();
        String directorios_omitir = rb.getString("directorios_omitir");
        if (!Util.isNulo(directorios_omitir)) {
            dir_omitir = directorios_omitir.split(",");
        }
    }

    /**
     * Obtiene la informacion de las aplicaciones registradas en Phonega Build.
     *
     * @param request Representa la informacion sobre la peticion realizada.
     * @return Representacion en JSON de las aplicaciones definidas en PhoneGap
     * Build
     * @throws CurlException
     */
    @GET
    @Produces("application/json")
    public String getMeApps(@Context HttpServletRequest request) throws CurlException {

        String ip = request.getRemoteAddr();

        Curl phonegap = new Curl();
        JSONObject misdatos = phonegap.getApps();

        JSONObject resul = new JSONObject();
        JSONObject salida = new JSONObject();

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
            salida.put("status", 200);
            salida.put("respuesta", resul);
        } else {
            salida.put("status", (Integer) misdatos.get("status"));
        }
        return salida.toJSONString();
    }

    /**
     * Obtiene la informacion de la aplicacion indicada que se encuentra en
     * Phonegap Build.
     *
     * @param request Representa la informacion sobre la peticion realizada.
     * @param idapli Identificador de la aplicacion.
     * @return Una representacion en JSON de la informacion de la aplicacion
     * indicada.
     * @throws CurlException
     */
    @GET
    @Path("/{idapli}")
    @Produces("application/json")
    public String getApp(@Context HttpServletRequest request, @PathParam("idapli") Long idapli) throws CurlException {

        String ip = request.getRemoteAddr();

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
     * Elimina la aplicacion especificada de Phonegap Build.
     *
     * @param request Representa la informacion sobre la peticion realizada.
     * @param idapli Identificador de la aplicacion.
     * @return Respresentacion JSON con la informacion de la aplicacion
     * eliminada.
     * @throws CurlException
     */
    @DELETE
    @Path("/{idapli}")
    @Produces("application/json")
    public String delApp(@Context HttpServletRequest request, @PathParam("idapli") Long idapli) throws CurlException {


        Curl phonegap = new Curl();
        JSONObject misdatos;
        if (Util.isNulo(idapli)) {
            misdatos = phonegap.getApps();
        } else {
            misdatos = phonegap.deleteApp(idapli);
        }

        return misdatos.toJSONString();
    }

    /**
     * Añade un aplicacion a Phonegap Build utilizando un respositorio GitHub.
     * La aplicacion generada es de ambito privado
     *
     * @param request Representa la informacion sobre la peticion realizada.
     * @param data Datos en formato JSON que se establecen en la creacion de la
     * aplicacion (titulo, etc..)
     * @return Respuesta en JSON con la informacion de la aplicacion creada en
     * Phonegap Build
     * @throws CurlException
     */
    @POST
    @Produces("application/json")
    public String addApp(@Context HttpServletRequest request, @FormParam("datos") String data) throws CurlException {

        JSONParser parser = new JSONParser();



        JSONObject respuestaJSON = null;
        try {
            respuestaJSON = Util.isNulo(data) ? null : (JSONObject) parser.parse(data);

            Curl phonegap = new Curl();
            JSONObject misdatos;
          
            misdatos = phonegap.createApp((String) respuestaJSON.get("title"), (String) respuestaJSON.get("method"), null, (String) respuestaJSON.get("url"), null);
            return misdatos.toJSONString();
        } catch (ParseException ex) {
            Logger.getLogger(Phonegap.class.getName()).log(Level.SEVERE, null, ex);
        }

        return " ";
    }

    /**
     * Inicia la construccion de la plataforma especificada para la aplicacion
     * indicada.
     *
     * @param request Representa la informacion sobre la peticion realizada.
     * @param idapli Identificador de la aplicacion.
     * @param platform Identificador de la aplicacion.
     * @return Respuesta en JSON con la informacion de la aplicacion que se esta
     * construyendo en Phonegap Build
     * @throws CurlException
     */
    @POST
    @Path("/{idapli}/build/{platform}")
    @Produces("application/json")
    public String buildAppPlatform(@Context HttpServletRequest request,
            @PathParam("idapli") Long idapli, @PathParam("platform") String platform) throws CurlException {


        Curl phonegap = new Curl();
        JSONObject misdatos;
        if (Util.isNulo(idapli)) {
            misdatos = phonegap.getApps();
        } else {
            misdatos = phonegap.buildApp(idapli, platform);
        }

        return misdatos.toJSONString();
    }

    /**
     * Inicia la construccion de la aplicacion indicada.
     *
     * @param request Representa la informacion sobre la peticion realizada.
     * @param idapli Identificador de la aplicacion.
     * @return Respuesta en JSON con la informacion de la aplicacion que se esta
     * construyendo en Phonegap Build
     * @throws CurlException
     */
    @POST
    @Path("/{idapli}/build")
    @Produces("application/json")
    public String buildApp(@Context HttpServletRequest request, @PathParam("idapli") Long idapli) throws CurlException {

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
     * Descarga la aplicacion movil para la plataforma y aplicacion Phonegap
     * indicadas.
     *
     * @param request Representa la informacion sobre la peticion realizada.
     * @param idapli Identificador de la aplicacion.
     * @param platform Identificador de la plataforma.
     * @param name_apli Nombre de la aplicacion.
     * @return Si se ha generado un error, devuelve la informacion del error en
     * una representacion JSON; en otro caso, se devuelve el fichero de binario
     * para la plataforma indicada.
     * @throws CurlException
     */
    @GET
    @Path("/{idapli}/{platform}")
    @Produces({MediaType.APPLICATION_OCTET_STREAM, "application/json"})
    public Response downloadApp(@Context HttpServletRequest request,
            @PathParam("idapli") Long idapli,
            @PathParam("platform") String platform,
            @QueryParam("name") String name_apli) throws CurlException {

        String ip = request.getRemoteAddr();
        JSONObject resul = new JSONObject();

        if (Util.isNulo(idapli) || Util.isNulo(platform)) {
            resul.put("status", 400);
            resul.put("status_text", "No se han especificado los parametros obligaotrios en la llamada");
            return Response.status(400).entity(resul)
                    .header("Content-Type", MediaType.APPLICATION_JSON_TYPE).build();
        }

        //Conexion con el cliente de Phonegap Build, Curl
        Curl phonegap = new Curl();
        resul = phonegap.getPlatform(idapli, platform);
        if (!Util.isNulo(resul) && resul.containsKey("status_text")
                && ((String) resul.get("status_text")).equals("OK")) {
            JSONObject datosFile = (JSONObject) resul.get("respuesta");

            File file = new File((String) datosFile.get("descargado"));
            String type = (String) datosFile.get("type");

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


            file.deleteOnExit();

            return rbu.build();
        } else {

            return Response.status(400).entity(resul)
                    .header("Content-Type", MediaType.APPLICATION_JSON_TYPE).build();
        }

    }

    /**
     * Comprueba que el fichero de configuracion config.xml se encuentra
     * generado para el laboratorio y experimiento especificado.
     *
     * @param request Representa la informacion sobre la peticion realizada.
     * @param lab_id Identificador del laboratorio
     * @param lab_experiment_id Identificador del experimento.
     * @return Representacion JSON indicado si existe el fichero o no.
     * @throws CurlException
     */
    @GET
    @Path("/check/{lab}/{lab_experiment}")
    @Produces("application/json")
    public String relatedCheckConfig(@Context HttpServletRequest request, @PathParam("lab") String lab_id, @PathParam("lab_experiment") String lab_experiment_id) throws CurlException {

        String ip = request.getRemoteAddr();


        File f_config = new File(Phonegap.path_base_tmp+ File.separator 
                + "create_app" + File.separator + lab_id + File.separator 
                + lab_experiment_id + File.separator + "config/config.xml");

        JSONObject resul = new JSONObject();
        resul.put("lab_id", lab_id);
        resul.put("lab_experiment_id", lab_experiment_id);
        if (f_config.exists()) {
            resul.put("status", "ok");
        } else {
            resul.put("status", "error");
        }


        return resul.toJSONString();
    }

    /**
     * Empaquete el codigo fuente del laboratorio con el fichero config.xml
     * generado
     *
     * @param request Representa la informacion sobre la peticion realizada.
     * @param lab_id Identificador del laboratorio
     * @param lab_experiment_id Identificador del experimento.
     * @return Represetnacion en JSON del resultado de realizar la operacion de
     * empaquetado.
     * @throws CurlException
     */
    @POST
    @Path("/pkg/{lab}/{lab_experiment}")
    @Produces("application/json")
    public String relatedPkgLab(@Context HttpServletRequest request, 
    @PathParam("lab") String lab_id, @PathParam("lab_experiment") String lab_experiment_id) 
            throws CurlException {

        String ip = request.getRemoteAddr();
        JSONObject resul = new JSONObject();
        resul.put("lab_id", lab_id);
        resul.put("lab_experiment_id", lab_experiment_id);

        // Path for git repositry $BASE_PATH/git/source
       File source = new File(Phonegap.path_base_tmp + File.separator + "git" + File.separator + "source");
 /*        GitControl gc;
        try {
            gc = new GitControl(source, remotePath);
            // if (!source.exists()) {
            if (source.exists()) {
                gc.pullFromRepo();
            } else {
                gc.cloneRepo();
            }
        } catch (Exception ex) {
            Logger.getLogger(Phonegap.class.getName()).log(Level.SEVERE, null, ex);
            resul.put("status", "error");
            return resul.toJSONString();
        }
*/
        File phonegap_git_www_source = new File(Phonegap.path_base_tmp + File.separator + "git" + File.separator + "source" + File.separator + "www" ); 
        
        //Copiamos el codigo base al directorio tmp de la aplicacion que se esta generando.
        File dest = new File(Phonegap.path_base_tmp + File.separator + "create_app" + File.separator + lab_id + File.separator + lab_experiment_id 
                + File.separator + "phonegap");
        // Create folder/folders for phonegap source
        dest.mkdirs();
        try {
            // Source:$BASE_PATH/git/source
            // Dest: $BASE_PATH/create_app/lab_id/lab_experiment_id/phonegap
            FileUtils.copyDirectory(phonegap_git_www_source, dest);
        } catch (IOException ex) {
            Logger.getLogger(Phonegap.class.getName()).log(Level.SEVERE, null, ex);
            resul.put("status", "error");
            return resul.toJSONString();
        }

        
      

        //Se copia el fichero config.xml generado previamente al directorio tmp de la aplicacion 
        //que se esta generando. 
        File f_config = new File(Phonegap.path_base_tmp  + File.separator 
                + "create_app" + File.separator + lab_id + File.separator + lab_experiment_id 
                + File.separator + "config/config.xml");
        try {
            FileUtils.copyFileToDirectory(f_config, dest);
        } catch (IOException ex) {
            Logger.getLogger(Phonegap.class.getName()).log(Level.SEVERE, null, ex);
            resul.put("status", "error");
            return resul.toJSONString();
        }

        //Elimina el fichero phonegap.js o cordova.js del directorio raiz de la aplicacion.
        File f_phonegap = new File(dest, "phonegap.js");
        if (f_phonegap.exists() && f_phonegap.isFile()) {
            //se elimina
            f_phonegap.delete();
        }
        File f_cordova = new File(dest, "cordova.js");
        if (f_cordova.exists() && f_cordova.isFile()) {
            //se elimina
            f_cordova.delete();
        }
        //Se crea el fichero .pgbomit en los directorios que se quieren omitir en la aplicacion.
        if (!Util.isNulo(Phonegap.dir_omitir) && Phonegap.dir_omitir.length > 0) {
            //Si se ha especificado directorios se añade el fichero .pgbomit
            for (String dir : Phonegap.dir_omitir) {
                File f_pgbomit = new File(Phonegap.path_base_tmp  + File.separator + File.separator
                        + "create_app" + File.separator + lab_id + File.separator + lab_experiment_id + File.separator
                        + "phonegap" + File.separator + dir + File.separator + ".pgbomit");
                try {
                    f_pgbomit.createNewFile();
                } catch (IOException ex) {
                    Logger.getLogger(Phonegap.class.getName()).log(Level.SEVERE, null, ex);
                    resul.put("status", "error");
                    return resul.toJSONString();
                }
            }
        }

        //Generar el fichero lab_config.json
        JSONObject config_json = new JSONObject();
        config_json.put("lab_id", lab_id);
        if (!lab_experiment_id.equals("default")) {
            config_json.put("lab_experiment_id", lab_experiment_id);
        } else {
            config_json.put("lab_experiment_id", "");
        }
        File f_config_json = new File(Phonegap.path_base_tmp + File.separator + File.separator
                + "create_app" + File.separator + lab_id + File.separator + lab_experiment_id + File.separator
                + "phonegap" + File.separator + "conf" + File.separator + "lab_config.js");
        FileWriter fw_config_json;
        try {
            fw_config_json = new FileWriter(f_config_json);
            String file_content = "// Configuration file for use a RELATED Lab\n" +
                "// lab_id: Unique ID for Lab, generated by RLAB Server\n" +
                "// lab_experiment_id: ID for experiment included in the Lab\n" +
                "var lab_config = ";
            file_content+=config_json.toJSONString();
            fw_config_json.write(file_content);
            fw_config_json.close();
        } catch (IOException ex) {
            Logger.getLogger(Phonegap.class.getName()).log(Level.SEVERE, null, ex);
            resul.put("status", "error");
            return resul.toJSONString();
        }

        //Se crea el fichero zip del directorio tmp de la aplicacion que se esta generando y se copia en el directorio zip de la aplicacion.
        File dest_zip = new File(Phonegap.path_base_tmp  + File.separator 
                + "create_app" + File.separator + lab_id + File.separator +
                lab_experiment_id + File.separator + "zip");
        try {
               ZipDirectory.createZip(dest, dest_zip, "lab", Zip.Extension.ZIP);
           // Zip.zipDirectorio(dest, dest_zip, "lab", Zip.Extension.ZIP);
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
     * Realiza la peticion de construccion de un laboratorio de RELATED.
     *
     * @param request Representa la informacion sobre la peticion realizada.
     * @param lab_id Identificador del laboratorio
     * @param lab_experiment_id Identificador del experimento.
     * @return Una representacion de JSON de la informacion de la aplicacion que
     * se esta construyendo en Phonegap Build asociada al laboratorio.
     * @throws CurlException
     */
    @POST
    @Path("/build/{lab}/{lab_experiment}")
    @Produces("application/json")
    public static synchronized String relatedBuildLab(@Context HttpServletRequest request, 
    @PathParam("lab") String lab_id, @PathParam("lab_experiment") String lab_experiment_id) 
            throws CurlException {

        String ip = request.getRemoteAddr();

        Curl phonegap = new Curl();

        // Comprobamos si existe otra aplicacion en Phonegap privada.
        JSONObject info_apps = phonegap.getApps();
        JSONObject apliPrivada = null;
        
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
                    resul.put("error", "Existe una aplicacion privada. La aplicacion esta "
                            + "pendiente de crearse para una plataforma.");
                    resul.put("status", "error");
                    return resul.toJSONString();
                }
            }
            
            //Comprobamos si se ha realizado el download de la aplicacion privada
            Long idApliPho = (Long) apliPrivada.get("id");
            File dir_back = new File(Phonegap.path_base_tmp
                    + File.separator + "backup" + File.separator + idApliPho);
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

                } catch (FileNotFoundException ex) {
                    Logger.getLogger(Phonegap.class.getName()).log(Level.SEVERE, null, ex);
                    resul.put("error", "Existe una aplicacion privada. No se ha podido "
                            + "identificar la aplicacion privada.");
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
                
                for (Iterator i = platfs.iterator(); i.hasNext();) {
                    String platform = (String) i.next();
                    if (((String) info_status.get(platform)).equals("complete")) {
                        //descargamos la aplicacion

                        JSONObject info_des = phonegap.getPlatform(idApliPho, platform);
                        
                        if (!Util.isNulo(info_des) && info_des.containsKey("status_text") 
                                && ((String) info_des.get("status_text")).equals("OK")) {
                            JSONObject datosFile = (JSONObject) info_des.get("respuesta");

                            File file = new File((String) datosFile.get("descargado"));
                            File dir_down = new File(Phonegap.path_base_tmp+ File.separator 
                                    + "create_app" + File.separator + antLabId + File.separator + antLabExpId 
                                    + File.separator + "download" + File.separator + platform);
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

        
        //Enviamos el codigo a phonegap para crear la aplicacion.
        File lab_zip = new File(Phonegap.path_base_tmp+ File.separator 
                + "create_app" + File.separator + lab_id + File.separator 
                + lab_experiment_id + File.separator + "zip" 
                + File.separator + "lab" + ".zip");
        resul.put("lab_id", lab_id);
        resul.put("lab_experiment_id", lab_experiment_id);

        
        JSONObject misdatos = null;
        JSONObject respuesta = null;
        if (lab_zip.exists()) {
            misdatos = phonegap.createApp(lab_id, "file", lab_zip, "", null);

        
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

        Long idPhonegap = (Long) respuesta.get("id");

        File dir_back = new File(Phonegap.path_base_tmp + File.separator + "backup" + File.separator + idPhonegap);
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

    /**
     * Descarga la aplicacion movil del laboratorio y experimentos indicados
     * para la plataforma especificada.
     *
     * @param request Representa la informacion sobre la peticion realizada.
     * @param lab_id Identificador del laboratorio.
     * @param lab_experiment_id Identificador del experimento
     * @param idapli Identificador de la aplicacion en Phonegap Build
     * @param platform Identificador de la plataforma
     * @param name_apli Nombre de la aplicacion.
     * @return Si se ha generado un error, devuelve la informacion del error en
     * una representacion JSON; en otro caso, se devuelve el fichero de binario
     * para la plataforma indicada.
     * @throws CurlException
     */
    @GET
    @Path("/download/{lab}/{lab_experiment}/{idapli}/{platform}")
    @Produces("application/json")
    public String relatedDownloadLab(@Context HttpServletRequest request,
            @PathParam("lab") String lab_id, @PathParam("lab_experiment") String lab_experiment_id,
            @PathParam("idapli") Long idapli, @PathParam("platform") String platform,
            @QueryParam("name") String name_apli) throws CurlException {

        String ip = request.getRemoteAddr();
        
        Curl phonegap = new Curl();
        JSONObject resul = new JSONObject();
        resul.put("platform", platform);
        resul.put("idApli", idapli);
        resul.put("lab_id", lab_id);
        resul.put("lab_experiment_id", lab_experiment_id);
        JSONObject info_down = phonegap.getPlatform(idapli, platform);
        if (!Util.isNulo(info_down) && info_down.containsKey("status_text") && ((String) info_down.get("status_text")).equals("OK")) {
            JSONObject datosFile = (JSONObject) info_down.get("respuesta");

            File file = new File((String) datosFile.get("descargado"));
            File dir_down = new File(Phonegap.path_base_tmp+ File.separator 
                    + "create_app" + File.separator + lab_id + File.separator 
                    + lab_experiment_id + File.separator + "download" 
                    + File.separator + platform);
            dir_down.mkdirs();
            String name_file = Util.isNulo(name_apli) ? platform : name_apli.toString();
            name_file = name_file.replaceAll(" ", "");
            try {

                if (platform.equals("android")) {
                    FileUtils.copyFile(file, new File(dir_down, name_file + ".apk"));
                }
                if (platform.equals("winphone")) {
                    FileUtils.copyFile(file, new File(dir_down, name_file + ".xap"));
                }
                if (platform.equals("ios")) {
                    FileUtils.copyFile(file, new File(dir_down, name_file + ".ipa"));
                }
            } catch (IOException ex) {
                Logger.getLogger(Phonegap.class.getName()).log(Level.SEVERE, null, ex);
                resul.put("error", "Existe una aplicacion privada. No se ha podido realizar el backup");
                resul.put("status", "error");
                return resul.toJSONString();
            }

            file.delete();


            resul.put("status", "ok");


        } else {
            resul.put("info_down", info_down);
            resul.put("error", "Error en la descarga.");
            resul.put("status", "error");

        }

        return resul.toJSONString();
    }

    /**
     * Desbloquea la aplicacion Phongap Build del ultimo laboratorio creado.
     * Permitiendo que se pueda generar otro laboratorio.
     *
     * @param request Representa la informacion sobre la peticion realizada.
     * @param idapli Identificador de la aplicaicon en PHonegap Build asociada
     * al laboratorio.
     * @return Representacion en JSON del resultado de aplicar esta funcion.
     */
    @POST
    @Path("/desbloquea/{idapli}")
    @Produces("application/json")
    public String relatedDesbloqueaLab(@Context HttpServletRequest request, @PathParam("idapli") Long idapli) {

        String ip = request.getRemoteAddr();


        JSONObject resul = new JSONObject();
        resul.put("idApli", idapli);
        File dir_back = new File(Phonegap.path_base_tmp+ File.separator + "backup" + File.separator + idapli);
        try {
            FileUtils.deleteDirectory(dir_back);
        } catch (IOException ex) {
            Logger.getLogger(Phonegap.class.getName()).log(Level.SEVERE, null, ex);
            resul.put("status", "error");
        }
        dir_back.delete();

        resul.put("status", "ok");


        return resul.toJSONString();
    }
}
