/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.uned.msanchez.tfm.phonegap.curl.service;

import es.uned.msanchez.tfm.phonegap.curl.exception.CurlException;
import es.uned.msanchez.tfm.phonegap.curl.Curl;
import es.uned.msanchez.tfm.utilidades.Util;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author adrastea
 */
@Path("/apps")
public class Phonegap {

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
}
