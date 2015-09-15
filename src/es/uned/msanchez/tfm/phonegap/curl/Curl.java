/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.uned.msanchez.tfm.phonegap.curl;

import es.uned.msanchez.tfm.phonegap.curl.exception.CurlException;
import es.uned.msanchez.tfm.utilidades.Util;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.ResourceBundle;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.io.IOUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.CookieSpecs;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.ContentBody;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.HttpClients;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

//import org.apache.http.client.utils.URIBuilder;
/**
 *
 * @author adrastea
 */
public class Curl {

    private CredentialsProvider credsProvider;
    private RequestConfig localConfig;
    private HttpClient httpclient;

     private static String path_base_tmp;
    static{
        ResourceBundle rb = ResourceBundle.getBundle("es.uned.msanchez.tfm.resources.wizard");
        path_base_tmp = rb.getString("path_tmp").trim();
    }
    
    public static void main(String[] args) throws Exception {
        Curl curl = new Curl();

        //Accediendo a los datos del usuario 
        JSONObject misdatos = curl.getMe();
        JSONObject infoApps = (JSONObject) misdatos.get("apps");
        JSONArray appsJSON = (JSONArray) infoApps.get("all");
//
        System.out.println(infoApps);
        System.out.println(appsJSON);
        /*
         File miproyecto = new File("/Users/adrastea/NetBeansProjects/TFM/web/myapp/www.zip");
         curl.createApp("Memoria", "file", miproyecto);

         //Accediendo a los datos de las aplicaciones del usuario. 
         JSONObject infoApps2 = (JSONObject)curl.getApps().get("respuesta");
         JSONArray appsJSON2 = (JSONArray) infoApps2.get("apps");
         System.out.println(infoApps2);
         System.out.println(appsJSON2.size());
       
         for (int i = 0; i < appsJSON2.size(); i++) {
         JSONObject apli = (JSONObject) appsJSON2.get(i);
         Long idApli = (Long) apli.get("id");
         JSONObject infoIcon = (JSONObject) apli.get("icon");
         // JSONObject icon = Curl.getIcon((String) infoIcon.get("link"));
         //  System.out.println(icon);
         //JSONObject platform = Curl.getPlatform(idApli, "android");
         //System.out.println(platform);
         JSONObject keys = curl.getKeysPlatform("ios");
         System.out.println(keys);

         //  File miproyecto = new File("/Users/adrastea/NetBeansProjects/TFM/web/myapp/www.zip");
         //  File miproyecto = new File("/Users/adrastea/NetBeansProjects/TFM/web/myapp/www/index.html");


         //JSONObject dataApp = new JSONObject();
         //dataApp.put("title", "Prueba API");
         //dataApp.put("create_method", "file");
         //JSONObject infoApps3 = Curl.updateApp(idApli,dataApp,miproyecto);
         //System.out.println(infoApps3);

         File miIcon = new File("/Users/adrastea/NetBeansProjects/TFM/web/myapp/www/resources/imagenes/default.png");
         JSONObject jIcon = curl.setIcon(idApli, miIcon);
         System.out.println(jIcon);
         //    System.out.println(apli.get("title"));
         // JSONObject dataApp = new JSONObject();
         //dataApp.put("title", "Nuevo Title");
         //curl.updateApp(idApli.toString(), dataApp);
         //  Curl.buildApp(idApli.toString(), null);
         // JSONObject result = Curl.deleteApp(idApli);
         //System.out.println(result);

         }

         */

        /*             JSONObject dataApp = new JSONObject();
         dataApp.put("title", "Prueba API");
         dataApp.put("create_method", "file");
         */
    }

    public void init() {
        Properties prop = new Properties();
        String user;
        String pass;
        String server;
        String port;
        String protocol;

        ResourceBundle rb = ResourceBundle.getBundle("es.uned.msanchez.tfm.phonegap.curl.resources.config");
        user = rb.getString("user");
        pass = rb.getString("pass");
        server = rb.getString("server");
        port = rb.getString("port");
        protocol = rb.getString("protocol");
        Integer puerto = (port != null) ? Integer.parseInt(port) : 80;
        HttpHost targetHost = new HttpHost(server, puerto, protocol);
        credsProvider = new BasicCredentialsProvider();

        UsernamePasswordCredentials creds = new UsernamePasswordCredentials(user, pass);
        credsProvider.setCredentials(
                new AuthScope(AuthScope.ANY_HOST, AuthScope.ANY_PORT), creds);

        RequestConfig globalConfig = RequestConfig.custom()
                .setCookieSpec(CookieSpecs.STANDARD)
                .build();

        localConfig = RequestConfig.copy(globalConfig)
                .setCookieSpec(CookieSpecs.STANDARD)
                .build();
        httpclient = HttpClients.custom().setDefaultCredentialsProvider(credsProvider).build();

    }

    /**
     * Obtiene la informacion del usuario autenticado en Phonegap Build, asi
     * como la lista de recursos asociados.
     *
     * @return Una representacion JSON de la informacion sobre el usuario en
     * Phonegap.
     * @see
     * http://docs.build.phonegap.com/en_US/developer_api_read.md.html#_get_https_build_phonegap_com_api_v1_me
     * @throws CurlException
     */
    public JSONObject getAutorize() throws CurlException {

        Map param = new HashMap<String, String>();

        param.put("client_id", new StringBody("7c533be0f63a942b02c1", ContentType.TEXT_PLAIN));
        param.put("code", new StringBody("4dfb94d814896ff9271d2f7467", ContentType.TEXT_PLAIN));
        param.put("client_secret", new StringBody("3e5e7f2c079f5902eac4e64247261556d80b8467", ContentType.TEXT_PLAIN));
        JSONObject respuestaJSON = postMethodPhonegap("/authorize/token", param);

        return respuestaJSON;

    }

    /**
     * Obtiene la informacion del usuario autenticado en Phonegap Build, asi
     * como la lista de recursos asociados.
     *
     * @return Una representacion JSON de la informacion sobre el usuario en
     * Phonegap.
     * @see
     * http://docs.build.phonegap.com/en_US/developer_api_read.md.html#_get_https_build_phonegap_com_api_v1_me
     * @throws CurlException
     */
    public JSONObject getMe() throws CurlException {

        JSONObject respuestaJSON = getMethodPhonegap("/api/v1/me");
        return respuestaJSON;

    }

    /**
     * Obtiene la informacion de las aplicaciones del usuario autenticado en
     * Phonegap Build.
     *
     * @return Una representacion en JSON de la informacion de las aplicaciones
     * del usuario
     * @see
     * http://docs.build.phonegap.com/en_US/developer_api_read.md.html#_get_https_build_phonegap_com_api_v1_apps
     * @throws CurlException
     */
    public JSONObject getApps() throws CurlException {

        JSONObject respuestaJSON = getMethodPhonegap("/api/v1/apps");
        return respuestaJSON;

    }

    /**
     * Obtiene la informacion la lista de Keys asociadas con el usuario
     * autenticado en Phonegap Build.
     *
     * @return Una representacion en JSON de la informacion de las keys del
     * usuario
     * @see
     * http://docs.build.phonegap.com/en_US/developer_api_read.md.html#_get_https_build_phonegap_com_api_v1_keys
     * @throws CurlException
     */
    public JSONObject getKeys() throws CurlException {

        JSONObject respuestaJSON = getMethodPhonegap("/api/v1/keys");
        return respuestaJSON;

    }

    /**
     * Obtiene la informacion de una aplicacion del usuario autenticado en
     * Phonegap Build.
     *
     * @param _linkApp Link de la aplicacion en phonegap.
     * @return Una representacion en JSON con la informacion de la aplicacion
     * del usuario
     * @see
     * http://docs.build.phonegap.com/en_US/developer_api_read.md.html#_get_https_build_phonegap_com_api_v1_apps_id
     * @throws CurlException
     */
    public JSONObject getApp(String _linkApp) throws CurlException {

        JSONObject respuestaJSON = getMethodPhonegap(_linkApp);
        return respuestaJSON;

    }

    /**
     * Obtiene la informacion de una aplicacion del usuario autenticado en
     * Phonegap Build.
     *
     * @param _idApp Identificador de la aplicacion en phonegap
     * @returnUna representacion en JSON con la informacion de la aplicacion del
     * usuario
     * @see
     * http://docs.build.phonegap.com/en_US/developer_api_read.md.html#_get_https_build_phonegap_com_api_v1_apps_id
     * @throws CurlException
     */
    public JSONObject getApp(Long _idApp) throws CurlException {

        JSONObject respuestaJSON = getApp("/api/v1/apps/" + _idApp.toString());
        return respuestaJSON;

    }

    /**
     * Obtiene el icono de la aplicacion especificado en el config.xml, o del
     * icono que se ha subido utilizando la interfaz de Phonegap Build
     *
     * @param _linkIcon Link del icono en phonegap
     * @return Una representacion JSON con la informacion del icono existente.
     * @see
     * http://docs.build.phonegap.com/en_US/developer_api_read.md.html#_get_https_build_phonegap_com_api_v1_apps_id_icon
     * @throws CurlException
     */
    public JSONObject getIcon(String _linkIcon) throws CurlException {

        JSONObject respuestaJSON = getMethodPhonegapWithDowload(_linkIcon);
        return respuestaJSON;
    }

    /**
     * Obtiene el icono de la aplicacion especificado en el config.xml, o del
     * icono que se ha subido utilizando la interfaz de Phonegap Build
     *
     * @param _idApp Identificador de la aplicacion en phonegap
     * @return Una representacion JSON con la informacion del icono existente.
     * @see
     * http://docs.build.phonegap.com/en_US/developer_api_read.md.html#_get_https_build_phonegap_com_api_v1_apps_id_icon
     * @throws CurlException
     */
    public JSONObject getIcon(Long _idApp) throws CurlException {

        JSONObject respuestaJSON = getIcon("/api/v1/apps/" + _idApp.toString() + "/icon");
        return respuestaJSON;

    }

    /**
     * Se descarga la aplicacion para la plataforma indicada
     *
     * @param _idApp Identificador de la aplicacion en phonegap
     * @param _platform Plataforma de la que deseamos descargar la aplicacion.
     * @return Representacion JSON de con la informacion de la aplicacion
     * descargada.
     * @see
     * http://docs.build.phonegap.com/en_US/developer_api_read.md.html#_get_https_build_phonegap_com_api_v1_apps_id_platform
     * @throws CurlException
     */
    public JSONObject getPlatform(Long _idApp, String _platform) throws CurlException {

        JSONObject respuestaJSON = getMethodPhonegapWithDowload("/api/v1/apps/" + _idApp.toString() + "/" + _platform);
        System.out.println("getPlatForm-->"+respuestaJSON);
        return respuestaJSON;

    }

    /**
     * Se obtiene informacion de las keys asociadas a la plataforma indicada
     *
     * @param _platform Plataforma de la que deseamos obtener la informacion
     * @return Representacion JSON de con la informacion de la keys de la
     * plataforma.
     * @see
     * http://docs.build.phonegap.com/en_US/developer_api_read.md.html#_get_https_build_phonegap_com_api_v1_keys_platform
     * @throws CurlException
     */
    public JSONObject getKeysPlatform(String _platform) throws CurlException {

        JSONObject respuestaJSON = getMethodPhonegap("/api/v1/keys/" + _platform);
        return respuestaJSON;

    }

    /**
     * Se obtiene informacion de key especifica asociada a la plataforma
     * indicada
     *
     * @param _platform Plataforma de la que deseamos obtener la informacion.
     * @param _idKey Identificador de la key para la plataforma indicada.
     * @return Representacion JSON de con la informacion de la keys de la
     * plataforma.
     * @see
     * http://docs.build.phonegap.com/en_US/developer_api_read.md.html#_get_https_build_phonegap_com_api_v1_keys_platform_id
     * @throws CurlException
     */
    public JSONObject getKeysPlatform(String _platform, String _idKey) throws CurlException {

        JSONObject respuestaJSON = getMethodPhonegap("/api/v1/keys/" + _platform + "/" + _idKey);
        return respuestaJSON;

    }

    /**
     * Crea una nueva aplicacion.
     *
     * @param _title Titulo de la aplicacion. El titulo especificado en el
     * config.xml tiene preferencia.
     * @param _create_method Como la aplicacion es creada. Puede tomar los
     * valores file o remote_repo
     * @param _proyecto Archivo zip con los fuentes de la aplicacion.
     * Obligatorio si el metodo elegido es file
     * @param _url Url del repositorio. Obligatorio si el metodo elegido es
     * remote_repo
     * @param _paramOp Objeto JSOn que representa para opcionales que se pueden
     * especificar en la llamada.
     * @see
     * http://docs.build.phonegap.com/en_US/developer_api_write.md.html#_post_https_build_phonegap_com_api_v1_apps
     * @return Representacion JSON de la informacion de la aplicacion creada.
     * @throws CurlException
     */
    public JSONObject createApp(String _title, String _create_method, File _proyecto, String _url, JSONObject _paramOp) throws CurlException {
        JSONObject respuestaJSON = null;

        if (Util.isNulo(_title) || Util.isNulo(_create_method)) {
            throw new CurlException("No se han especificado parametros obligatorios.");
        }

        JSONObject data = new JSONObject();
        data.put("title", _title);
        data.put("create_method", _create_method);

        if (!Util.isNulo(_paramOp)) {
            for (String p_op : (Set<String>) _paramOp.entrySet()) {
                if (p_op.trim().equalsIgnoreCase("title") || p_op.trim().equalsIgnoreCase("create_method")
                        || p_op.trim().equalsIgnoreCase("file")
                        || p_op.trim().equalsIgnoreCase("repo")) {
                    continue;
                }

                data.put(p_op, _paramOp.get(p_op));
            }
        }

        if (_create_method.trim().equalsIgnoreCase("file")) {
            if (Util.isNulo(_proyecto)) {
                throw new CurlException("No se han especificado el fichero zip con el proyecto.");
            }
            respuestaJSON = createApp(data, _proyecto);
        }
        if (_create_method.trim().equalsIgnoreCase("remote_repo")) {
            if (Util.isNulo(_url)) {
                throw new CurlException("No se han especificado la url del repositorio.");
            }
            respuestaJSON = createApp(data, _url);
        }
        return respuestaJSON;

    }

    /**
     * Crea una aplicacion a partir de un fichero zip con el contenido del
     * proyecto.
     *
     * @param _data Representacion de los parametros definidos para la llamada.
     * @param _proyecto Fichero zip con el contenido de la aplicacion.
     * @see
     * http://docs.build.phonegap.com/en_US/developer_api_write.md.html#_post_https_build_phonegap_com_api_v1_apps
     * @return Representacion JSON de la informacion de la aplicacion creada.
     * @throws CurlException
     */
    private JSONObject createApp(JSONObject _data, File _proyecto) throws CurlException {

        JSONObject respuestaJSON = null;

        FileBody file = new FileBody(_proyecto);
        //_data.put("private", false);
        StringBody data_p = new StringBody(_data.toJSONString(), ContentType.TEXT_PLAIN);

        Map<String, Object> params = new HashMap<String, Object>();
        
        params.put("data", data_p);
        params.put("file", file);
        

        respuestaJSON = postMethodPhonegap("/api/v1/apps/", params);

        return respuestaJSON;

    }

    /**
     * Crea una aplicacion a partir de un repositorio..
     *
     * @param _data Representacion de los parametros definidos para la llamada.
     * @param _url Url del repositorio.
     * @see
     * http://docs.build.phonegap.com/en_US/developer_api_write.md.html#_post_https_build_phonegap_com_api_v1_apps
     * @return Representacion JSON de la informacion de la aplicacion creada.
     * @throws CurlException
     */
    private JSONObject createApp(JSONObject _data, String _url) throws CurlException {

        JSONObject respuestaJSON = null;
      //  _data.put("private", false);
        _data.put("repo", _url);

        StringBody data_p = new StringBody(_data.toJSONString(), ContentType.TEXT_PLAIN);

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("data", data_p);

        respuestaJSON = postMethodPhonegap("/api/v1/apps/", params);

        return respuestaJSON;

    }

    /**
     * Realiza peticion para la construccion de la aplicacion.
     *
     * @param _idApli Identificador de la aplicacion.
     * @param _data Parametros opcionales para la construccion
     * @return Representacion JSON
     * @see
     * http://docs.build.phonegap.com/en_US/developer_api_write.md.html#_post_https_build_phonegap_com_api_v1_apps_id_build
     * @throws CurlException
     */
    public JSONObject buildApp(Long _idApli, JSONObject _data) throws CurlException {
        JSONObject respuestaJSON = null;

        StringBody data_p = null;
        Map<String, Object> params = new HashMap<String, Object>();

        if (_data != null) {
            data_p = new StringBody(_data.toJSONString(), ContentType.TEXT_PLAIN);
            params.put("data", data_p);
        }
        respuestaJSON = postMethodPhonegap("/api/v1/apps/" + _idApli + "/build", params);
        return respuestaJSON;

    }

    /**
     * Realiza peticion para la construccion de la aplicacion.
     *
     * @param _idApli Identificador de la aplicacion.
     * @param _platform Identificador de la plataforma que se desea construir la
     * aplicacion.
     * @return Representacion JSON
     * @see
     * http://docs.build.phonegap.com/en_US/developer_api_write.md.html#_post_https_build_phonegap_com_api_v1_apps_id_build
     * @throws CurlException
     */
    public JSONObject buildApp(Long _idApli, String _platform) throws CurlException {
        JSONObject respuestaJSON = null;

        StringBody data_p = null;
        Map<String, Object> params = new HashMap<String, Object>();

        respuestaJSON = postMethodPhonegap("/api/v1/apps/" + _idApli + "/build/" + _platform, params);
        return respuestaJSON;

    }

    public JSONObject setIcon(Long _idApli, File _icon) throws CurlException {
        JSONObject respuestaJSON = null;

        if (Util.isNulo(_icon)) {
            throw new CurlException("No se han especificado parametros obligatorios.");
        }

        JSONObject data = new JSONObject();

        FileBody file = new FileBody(_icon);

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("icon", file);

        respuestaJSON = postMethodPhonegap("/api/v1/apps/" + _idApli + "/icon", params);
        return respuestaJSON;

    }

    public JSONObject addCollab(Long _idApli, JSONObject _data) throws CurlException {
        JSONObject respuestaJSON = null;

        StringBody data_p = null;
        Map<String, Object> params = new HashMap<String, Object>();

        if (_data != null) {
            data_p = new StringBody(_data.toJSONString(), ContentType.TEXT_PLAIN);
            params.put("data", data_p);
        }
        respuestaJSON = postMethodPhonegap("/api/v1/apps/" + _idApli + "/collaborators", params);
        return respuestaJSON;

    }

    public JSONObject setRoleCollab(Long _idApli, Long _idCollab, JSONObject _data) throws CurlException {
        JSONObject respuestaJSON = null;

        StringBody data_p = null;
        Map<String, Object> params = new HashMap<String, Object>();

        if (_data != null) {
            data_p = new StringBody(_data.toJSONString(), ContentType.TEXT_PLAIN);
            params.put("data", data_p);
        }
        respuestaJSON = putMethodPhonegap("/api/v1/apps/" + _idApli + "/collaborators/" + _idCollab, params);
        return respuestaJSON;

    }

    public JSONObject updateApp(Long _idApli, JSONObject _data, File _proyecto) throws CurlException {
        //  HttpGet httpget = new HttpGet()
        JSONObject respuestaJSON = null;
        FileBody file = new FileBody(_proyecto);
        StringBody data_p = new StringBody(_data.toJSONString(), ContentType.TEXT_PLAIN);

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("data", data_p);
        params.put("file", file);

        respuestaJSON = putMethodPhonegap("/api/v1/apps/" + _idApli, params);

        return respuestaJSON;

    }

    public JSONObject deleteApp(Long _idApli) throws CurlException {
        //  HttpGet httpget = new HttpGet()
        JSONObject respuestaJSON = deleteMethodPhonegap("/api/v1/apps/" + _idApli);

        return respuestaJSON;
        //httpclient.

    }

    public JSONObject deleteCollab(Long _idApli, Long _idCollab) throws CurlException {
        //  HttpGet httpget = new HttpGet()
        JSONObject respuestaJSON = deleteMethodPhonegap("/api/v1/apps/" + _idApli + "/collaborators/" + _idCollab);
        return respuestaJSON;

    }

    public JSONObject deleteKeyPlatform(String _platform, Long _idKey) throws CurlException {
        //  HttpGet httpget = new HttpGet()
        JSONObject respuestaJSON = deleteMethodPhonegap("/api/v1/keys/" + _platform + "/" + _idKey);
        return respuestaJSON;

    }

    /**
     * Metodo para obtener una instancia URI para la realizar la llamada a un
     * metodo de Phonegap Build.
     *
     * @param _method Identificador del metodo
     * @return Instancia URI
     * @throws CurlException
     */
    private URI getUriPhonegapMethods(String _method) throws CurlException {
        URIBuilder uribuilder = new URIBuilder();
        uribuilder.setScheme("https");
        uribuilder.setHost("build.phonegap.com");
        uribuilder.setPath(_method);
        URI uri = null;
        try {
            uri = uribuilder.build();
        } catch (URISyntaxException ex) {
            Logger.getLogger(Curl.class.getName()).log(Level.SEVERE, null, ex);
            throw new CurlException(ex.getCause(), "No se ha podido obtener obtener URI para el metodo " + _method);
        }
        return uri;
    }

    /**
     * Trata la respuesta generada por la llamada al metodo de Phonega y la
     * transforma a una instancia de JSONObject
     *
     * @param _response
     * @return
     * @throws CurlException
     */
    private JSONObject getResponseJSON(HttpResponse _response) throws CurlException {
        InputStream content = null;

        JSONObject respuestaJSON = null;
        try {
            HttpEntity entity1 = _response.getEntity();
            content = entity1.getContent();

            StringWriter writer = new StringWriter();
            IOUtils.copy(content, writer);
            String theString = writer.toString();
            JSONParser parser = new JSONParser();
            System.out.println("getResponseJSON: " + theString);
            respuestaJSON = Util.isNulo(theString) ? null : (JSONObject) parser.parse(theString);

        } catch (ParseException ex) {
            Logger.getLogger(Curl.class.getName()).log(Level.SEVERE, null, ex);
            throw new CurlException(ex, "No se ha podido obtener la respuesta");
        } catch (IOException ex) {
            Logger.getLogger(Curl.class.getName()).log(Level.SEVERE, null, ex);
            throw new CurlException(ex, "No se ha podido obtener la respuesta");
        } catch (UnsupportedOperationException ex) {
            Logger.getLogger(Curl.class.getName()).log(Level.SEVERE, null, ex);
            throw new CurlException(ex, "No se ha podido obtener la respuesta");
        } finally {
            try {

                if (content != null) {
                    content.close();
                }
            } catch (IOException ex) {
                Logger.getLogger(Curl.class.getName()).log(Level.SEVERE, null, ex);
                throw new CurlException(ex, "No se ha podido obtener la respuesta");
            }
            return respuestaJSON;
        }
    }

    /**
     * Realiza la llamada a un metodo de phonegap GET y la respuesta la
     * representa en un objeto JSON
     *
     * @param _link Identifica al metodo en Phonegap Build
     * @return Una instancia JSON con la respuesta del metodo get
     * @throws CurlException
     */
    private JSONObject getMethodPhonegap(String _link) throws CurlException {
        JSONObject respuestaJSON;
        JSONObject resultado = new JSONObject();
        init(); //

        URI uri = getUriPhonegapMethods(_link);

        HttpGet httpget = new HttpGet(uri);
        httpget.setConfig(localConfig);

        HttpResponse response;
        try {
            response = httpclient.execute(httpget);
        } catch (IOException ex) {
            Logger.getLogger(Curl.class.getName()).log(Level.SEVERE, _link, ex);
            throw new CurlException(ex, "No se ha podido realizar la llamada del metodo " + _link);
        }

        respuestaJSON = getResponseJSON(response);
        resultado.put("status", response.getStatusLine().getStatusCode());
        resultado.put("status_text", response.getStatusLine().getReasonPhrase());
        resultado.put("respuesta", respuestaJSON);

        return resultado;
    }

    private JSONObject getMethodPhonegapWithDowload(String _link) throws CurlException {
        JSONObject respuestaJSON;
        JSONObject resultado = new JSONObject();

        init(); //

        URI uri = getUriPhonegapMethods(_link);

        HttpGet httpget = new HttpGet(uri);
        httpget.setConfig(localConfig);

        HttpResponse response;
        try {
            response = httpclient.execute(httpget);
        } catch (IOException ex) {
            Logger.getLogger(Curl.class.getName()).log(Level.SEVERE, _link, ex);
            throw new CurlException(ex, "No se ha podido realizar la llamada del metodo " + _link);
        }

        respuestaJSON = getResponseJSONWithDowload(response);

        //  respuestaJSON = getResponseJSON(response);
        resultado.put("status", response.getStatusLine().getStatusCode());
        resultado.put("status_text", response.getStatusLine().getReasonPhrase());
        resultado.put("respuesta", respuestaJSON);

        return resultado;
    }

    private JSONObject getResponseJSONWithDowload(HttpResponse _response) throws CurlException {
        InputStream content = null;

        JSONObject respuestaJSON = null;
        try {
            HttpEntity entity1 = _response.getEntity();
            if (_response.getStatusLine().getStatusCode() == 302
                    || _response.getStatusLine().getStatusCode() == 404) {
                content = entity1.getContent();

                StringWriter writer = new StringWriter();
                IOUtils.copy(content, writer);
                String theString = writer.toString();
                JSONParser parser = new JSONParser();
                respuestaJSON = Util.isNulo(theString) ? null : (JSONObject) parser.parse(theString);
                content.close();
            } else {

                Random ale = new Random(System.currentTimeMillis());
                File dir_tmp = new File(Curl.path_base_tmp + File.separator + "tmp");
                dir_tmp.mkdirs();


                File fileTmp = File.createTempFile(Math.abs(ale.nextInt()) + "", null, dir_tmp);
                FileOutputStream outFile = new FileOutputStream(fileTmp);
                entity1.writeTo(outFile);

                respuestaJSON = new JSONObject();
                respuestaJSON.put("descargado", fileTmp.getAbsolutePath());
                respuestaJSON.put("type", entity1.getContentType().getValue().toString());
                respuestaJSON.put("name", fileTmp.getName());

            }
            //respuestaJSON = (JSONObject) obj;

        } catch (ParseException ex) {
            Logger.getLogger(Curl.class.getName()).log(Level.SEVERE, null, ex);
            throw new CurlException(ex, "No se ha podido obtener la respuesta");
        } catch (IOException ex) {
            Logger.getLogger(Curl.class.getName()).log(Level.SEVERE, null, ex);
            throw new CurlException(ex, "No se ha podido obtener la respuesta");
        } catch (UnsupportedOperationException ex) {
            Logger.getLogger(Curl.class.getName()).log(Level.SEVERE, null, ex);
            throw new CurlException(ex, "No se ha podido obtener la respuesta");
        } finally {

            return respuestaJSON;
        }
    }

    /**
     * Realiza la llamada a un metodo de phonegap POST y la respuesta la
     * representa en un objeto JSON
     *
     * @param _link Identifica al metodo en Phonegap Build
     * @return Una instancia JSON con la respuesta del metodo get
     * @throws CurlException
     */
    private JSONObject postMethodPhonegap(String _link, Map<String, ?> _params) throws CurlException {
        JSONObject respuestaJSON;
        JSONObject resultado = new JSONObject();

        init();

        URI uri = getUriPhonegapMethods(_link);

        HttpPost httpPost = new HttpPost(uri);
        httpPost.setConfig(localConfig);

        MultipartEntityBuilder mbuilder = MultipartEntityBuilder.create();

        for (String param : _params.keySet()) {
            mbuilder.addPart(param, (ContentBody) _params.get(param));
        }

        HttpEntity reqEntity = mbuilder.build();

        httpPost.setEntity(reqEntity);
        HttpResponse response = null;

        try {
            response = httpclient.execute(httpPost);
        } catch (IOException ex) {
            Logger.getLogger(Curl.class.getName()).log(Level.SEVERE, _link, ex);
            throw new CurlException(ex, "No se ha podido realizar la llamada del metodo " + _link);
        }

        respuestaJSON = getResponseJSON(response);

        resultado.put("status", response.getStatusLine().getStatusCode());
        resultado.put("status_text", response.getStatusLine().getReasonPhrase());
        resultado.put("respuesta", respuestaJSON);

        return resultado;
    }

    /**
     * Realiza la llamada a un metodo de phonegap PUT y la respuesta la
     * representa en un objeto JSON
     *
     * @param _link Identifica al metodo en Phonegap Build
     * @return Una instancia JSON con la respuesta del metodo get
     * @throws CurlException
     */
    private JSONObject putMethodPhonegap(String _link, Map<String, ?> _params) throws CurlException {
        JSONObject respuestaJSON;
        JSONObject resultado = new JSONObject();

        init();

        URI uri = getUriPhonegapMethods(_link);

        HttpPut httpPut = new HttpPut(uri);
        httpPut.setConfig(localConfig);

        MultipartEntityBuilder mbuilder = MultipartEntityBuilder.create();

        for (String param : _params.keySet()) {
            mbuilder.addPart(param, (ContentBody) _params.get(param));
        }

        HttpEntity reqEntity = mbuilder.build();

        httpPut.setEntity(reqEntity);
        HttpResponse response = null;

        try {
            response = httpclient.execute(httpPut);
        } catch (IOException ex) {
            Logger.getLogger(Curl.class.getName()).log(Level.SEVERE, _link, ex);
            throw new CurlException(ex, "No se ha podido realizar la llamada del metodo " + _link);
        }

        respuestaJSON = getResponseJSON(response);
        resultado.put("status", response.getStatusLine().getStatusCode());
        resultado.put("status_text", response.getStatusLine().getReasonPhrase());
        resultado.put("respuesta", respuestaJSON);

        return resultado;
    }

    /**
     * Realiza la llamada a un metodo de phonegap DELETE y la respuesta la
     * representa en un objeto JSON
     *
     * @param _link Identifica al metodo en Phonegap Build
     * @return Una instancia JSON con la respuesta del metodo get
     * @throws CurlException
     */
    private JSONObject deleteMethodPhonegap(String _link) throws CurlException {
        JSONObject respuestaJSON;
        JSONObject resultado = new JSONObject();
        init(); //

        URI uri = getUriPhonegapMethods(_link);

        HttpDelete httpDel = new HttpDelete(uri);
        httpDel.setConfig(localConfig);

        HttpResponse response;
        try {
            response = httpclient.execute(httpDel);
        } catch (IOException ex) {
            Logger.getLogger(Curl.class.getName()).log(Level.SEVERE, _link, ex);
            throw new CurlException(ex, "No se ha podido realizar la llamada del metodo " + _link);
        }

        respuestaJSON = getResponseJSON(response);
        resultado.put("status", response.getStatusLine().getStatusCode());
        resultado.put("status_text", response.getStatusLine().getReasonPhrase());
        resultado.put("respuesta", respuestaJSON);
        return resultado;
    }
}
