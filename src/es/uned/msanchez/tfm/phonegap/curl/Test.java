
package es.uned.msanchez.tfm.phonegap.curl;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Clases para realizar test de la clase Curl.java
 * @author Miguel Sanchez Roman.
 */
public class Test {
    /**
     * Main de la clase Test que nos permite realizar diferentes pruebas de los
     * metodos implementados en Curl.java
     * @param args
     * @throws Exception 
     */
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
}
