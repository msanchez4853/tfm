/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.uned.msanchez.tfm.xml;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.jdom2.Document;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

/**
 *
 * @author Miguel Sanchez Roman
 */
public class Test {
    /**
     * Metodo principal para realizar pruebas con Xml.java
     * @param args
     * @throws Exception 
     */   
    public static void main(String[] args) throws Exception {

        Xml xml = new Xml();


        try {

            xml.createRaizConfig("es.uned.miguesr.tfm.memoria", "1.0.0", null);
         
            xml.setAuthorApp("Miguel S.R.", "www.ugr.es/local/miguesr", "msanchez4853@alumno.uned.es");
            xml.setDescripApp("Juego para ejercitar la memoria");
            List<String> platform = new ArrayList<String>();
            platform.add("ios");
            platform.add("android");
            platform.add("winphone");
            xml.setPlatform(platform);
            xml.setPlatform(platform);

            xml.setPreference("phonegap-version", "3.7.0");
            xml.setPreference("ois-phonegap-version", "3.7.0");
            xml.setPreference("phonegap-version", "3.7.0");

            xml.setAccess("http://phonegap", Boolean.TRUE, null);
            xml.setAccess("http://phonegap", Boolean.TRUE, null);
            xml.setIconIos("icon.png", "ios", "200", "100");
            xml.setIconAndroid("icon.png", "android", "ldpi");
            xml.setIconWPhone("icon.png", "winphone", "background");

            xml.setSplashIos("icon.png", "ios", "200", "100");
            xml.setSplashAndroid("icon.png", "android", "ldpi");
            xml.setSplash("icon.png", "winphone");

         
            xml.setPlugin("org.apache.cordova.battery-status", "0.2.11");

            Document doc = new Document(xml.getWidget());
            //   doc.setRootElement(company);



            // new XMLOutputter().output(doc, System.out);
            XMLOutputter xmlOutput = new XMLOutputter();

            // display nice nice
            xmlOutput.setFormat(Format.getPrettyFormat());
            xmlOutput.output(doc, System.out);

         
        } catch (IOException io) {
            ;
        }
    }
}
