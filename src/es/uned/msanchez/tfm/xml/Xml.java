/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.uned.msanchez.tfm.xml;

import es.uned.msanchez.tfm.utilidades.Util;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.jdom2.Attribute;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.Namespace;
import org.jdom2.filter.ContentFilter;
import org.jdom2.filter.Filter;
import org.jdom2.filter.Filters;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

/**
 *
 * @author Miguel Sánchez Román
 */
public class Xml {

    private Element widget;

    public static void main(String[] args) throws Exception {

        Xml xml = new Xml();


        try {

            xml.createRaizConfig("es.uned.miguesr.tfm.memoria", "1.0.0", null);
            xml.setNameApp("Aplicacion de memoria");
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

            xml.setFeatures("http://api.phonegap.com/1.0/network");
            xml.setPlugin("org.apache.cordova.console");
            xml.setPlugin("org.apache.cordova.battery-status", "0.2.11");

            Document doc = new Document(xml.getWidget());
            //   doc.setRootElement(company);



            // new XMLOutputter().output(doc, System.out);
            XMLOutputter xmlOutput = new XMLOutputter();

            // display nice nice
            xmlOutput.setFormat(Format.getPrettyFormat());
            xmlOutput.output(doc, System.out);

            System.out.println("File Saved!");
        } catch (IOException io) {
            System.out.println(io.getMessage());
        }
    }

    public Xml() {
        createRaizConfig();
    }

    /**
     * Genera la salida xml
     *
     * @param out
     * @throws IOException
     */
    public void generarXml(OutputStream out) throws IOException {
        out.flush();
        Document doc = new Document(getWidget());
        XMLOutputter xmlOutput = new XMLOutputter();
        xmlOutput.setFormat(Format.getPrettyFormat());
        xmlOutput.output(doc, out);
    }
    

    /**
     * Nos permite generar las opciones generales de Phonegap Build, para una aplicacion movil.
     * @param _opciones_generales Maps con los valores con los pares parametro valor
     * @throws Exception 
     */
    public void setOpcionesGenerales(Map<String, String> _opciones_generales) throws Exception {
        List platform = new ArrayList();
        for (String param : _opciones_generales.keySet()) {
           // System.out.println("Opciones Generales: " + param + " ---> " + _opciones_generales.get(param));
            String value = _opciones_generales.get(param);
            if(Util.isNulo(value)) continue;
            
            
            if (param.equals("name_app")) {
                setNameApp(value);
            }
            if (param.equals("desc_app")) {
                setDescripApp(value);
            }
            if (param.equals("platf_android")) {
                platform.add("android");
            }
            if (param.equals("platf_ios")) {
                platform.add("ios");
            }
            if (param.equals("platf_winp")) {
                platform.add("winphone");
            }
            if (param.equals("version_app")) {
                setVersionApp(value);
            }

            if (param.equals("package_app")) {
                setIdApp(value);
            }
            
            
            if (param.equals("pgap_version")) {
                setPreference("phonegap-version", value);
            }

            if (param.equals("orientation") && !value.equals("plataforma")) {
                setPreference("orientation", value);
            }
            if (param.equals("source_file")) {
                setContentApp(value);
            }
            if (param.equals("ErrorUrl_file")) {
                setPreference("ErrorUrl",value);
            }
            

        }
        if (!Util.isNulo(platform)) {
            setPlatform(platform);
        }

    }

    public void setOpcionesAvanzadas(Map<String, String> _opciones_avanzadas) throws Exception {
        for (String param : _opciones_avanzadas.keySet()) {
          //  System.out.println("Opciones Avanzadas: " + param + " ---> " + _opciones_avanzadas.get(param));
            String value = _opciones_avanzadas.get(param);

            if (param.indexOf("CKB") >= 0) {
                if (param.substring(3, 4).equals("F") && value.equals("on")) {
                    value = "false";
                }

                if (param.substring(3, 4).equals("T") && value.equals("on")) {
                    value = "true";
                }

                param = param.substring(5, param.length());
            }
            if (param.equals("version_code")) {
                setVersionCode(_opciones_avanzadas.get(param));
                continue;
            }
            if (!Util.isNulo(value)) {

                setPreference(param, value);
            }
        }
    }

    public void setOpcionesIcons(Map<String, String> _opciones_icons) throws Exception {

        //Obtenemos los path relativa si los hubiera;
        String path_ios = _opciones_icons.get("ios_path");
        path_ios = Util.isNulo(path_ios) ? "" : path_ios;
        String path_win = _opciones_icons.get("win_path");
        path_win = Util.isNulo(path_win) ? "" : path_win;
        String path_android = _opciones_icons.get("android_path");
        path_android = Util.isNulo(path_android) ? "" : path_android;
        String path_default = _opciones_icons.get("default_path");
        path_default = Util.isNulo(path_default) ? "" : path_default;
        for (String param : _opciones_icons.keySet()) {
          //  System.out.println("Opciones setOpcionesIcons: " + param + " ---> " + _opciones_icons.get(param));
            if (param.indexOf("_path") == param.length() - 5) {
                continue;
            }
            String value = _opciones_icons.get(param);
            if (Util.isNulo(value)) {
                continue;
            }
            if (param.indexOf("default_") >= 0) {
                setIcon(path_default + value, "");
                continue;
            }
            if (param.indexOf("ios") >= 0) {
                String _width = (param.replace("ios", "")).substring(2);
                setIconIos(path_ios + value, "ios", _width, _width);
                continue;
            }
            if (param.indexOf("win_") >= 0) {
                //System.out.println("role en icono win --->  "+param.substring(5));
                String _rol = (param.replace("win_", "")).substring(5);
                setIconWPhone(path_win + value, "winphone", _rol);
                continue;
            }
            if (param.indexOf("android_") >= 0) {
                //System.out.println("role en icono win --->  "+param.substring(5));
                String _qualifier = param.replace("android_", "");
                setIconAndroid(path_android + value, "android", _qualifier);
                continue;
            }

        }
    }

    public void setOpcionesSplash(Map<String, String> _opciones_splash) throws Exception {

        String path_ios = _opciones_splash.get("ios_path");
        path_ios = Util.isNulo(path_ios) ? "" : path_ios;
        String path_win = _opciones_splash.get("win_path");
        path_win = Util.isNulo(path_win) ? "" : path_win;
        String path_android = _opciones_splash.get("android_path");
        path_android = Util.isNulo(path_android) ? "" : path_android;
        String path_default = _opciones_splash.get("default_path");
        path_default = Util.isNulo(path_default) ? "" : path_default;

        for (String param : _opciones_splash.keySet()) {
            //System.out.println("Opciones setOpcionesSplash: " + param + " ---> " + _opciones_splash.get(param));
            if (param.indexOf("_path") == param.length() - 5) {
                continue;
            }
            String value = _opciones_splash.get(param);
            if (Util.isNulo(value)) {
                continue;
            }


            if (param.indexOf("default_") >= 0) {
                setSplash(path_default+value, "");
                continue;
            }
            if (param.indexOf("ios") >= 0) {

                String _width = param.substring(param.indexOf("_") + 1, param.indexOf("x"));
                String _height = param.substring(param.indexOf("x") + 1);
                setSplashIos(path_ios+value, "ios", _width, _height);
                continue;
            }
            if (param.indexOf("win_") >= 0) {
                setSplash(path_win+value, "winphone");
                continue;
            }
            if (param.indexOf("android_") >= 0) {
                //System.out.println("role en icono win --->  "+param.substring(5));
                String _qualifier = param.replace("android_", "");
                setSplashAndroid(path_android+value, "android", _qualifier);
                continue;
            }

        }
    }

    public void setOpcionesPermisos(Map<String, String> _opciones_permisos) throws Exception {
        HashMap<Integer, HashMap<String, String>> accesos = new HashMap<Integer, HashMap<String, String>>();

        for (String param : _opciones_permisos.keySet()) {
           // System.out.println("Opciones setOpcionesPermisos: " + param + " ---> " + _opciones_permisos.get(param));
            String value = _opciones_permisos.get(param);

            if (param.indexOf("acceso_") >= 0) {
                String _acceso = param.replaceFirst("acceso_", "");
                Integer _indice = Integer.parseInt(_acceso.substring(0, _acceso.indexOf("_")));

                String _param_acc = _acceso.substring(_acceso.indexOf("_") + 1);

                if (!accesos.containsKey(_indice)) {
                    accesos.put(_indice, new HashMap<String, String>());
                }
                (accesos.get(_indice)).put(_param_acc, value);
                continue;
            }

            if (param.indexOf("android_") >= 0) {
                //System.out.println("role en icono win --->  "+param.substring(5));
                String _perm = param.replace("android_", "");
                setFeatures(_perm);
                continue;
            }
            if (param.indexOf("win_") >= 0) {
                //System.out.println("role en icono win --->  "+param.substring(5));
                String _perm = param.replace("win_", "");
                setFeatures(_perm);
                continue;
            }

        }

        //Definimos los accesos
        for (Integer i : accesos.keySet()) {
            HashMap<String, String> acc = accesos.get(i);
            if (!acc.containsKey("url")) {
                continue; // Si no contiene url no se define.
            }
            String _origin = acc.get("url");
            Boolean _subdomains = Boolean.parseBoolean(acc.containsKey("subdomains") ? acc.get("subdomains") : null);
            Boolean _external = Boolean.parseBoolean(acc.containsKey("external") ? acc.get("external") : null);

            setAccess(_origin, _subdomains, _external);
        }

    }

    public void setOpcionesPlugins(Map<String, String> _opciones_puglins) throws Exception {
        HashMap<Integer, HashMap<String, String>> accesos = new HashMap<Integer, HashMap<String, String>>();

        for (String param : _opciones_puglins.keySet()) {
            System.out.println("Opciones setOpcionesPlugins: " + param + " ---> " + _opciones_puglins.get(param));
            String value = _opciones_puglins.get(param);

            setPlugin(param);
        }

    }

    public void setOpcionesDesarrollador(Map<String, String> _opciones_desarrollo) throws Exception {

        HashMap<String, String> autor = new HashMap<String, String>();
        for (String param : _opciones_desarrollo.keySet()) {
            System.out.println("Opciones setOpcionesDesarrollador: " + param + " ---> " + _opciones_desarrollo.get(param));
            String value = _opciones_desarrollo.get(param);
            if (param.indexOf("autor_") >= 0) {
                String info = param.replace("autor_", "");
                autor.put(info, value);
            }
        }

        //
        if (!autor.containsKey("name")) {
            return;
        }

        setAuthorApp(autor.get("name"), autor.get("url"), autor.get("mail"));
    }

    private Element createRaizConfig() {
        this.widget = new Element("widget");
        widget.setAttribute(new Attribute("xmls", "http://www.w3.org.ns/widgets"));
        widget.addNamespaceDeclaration(Namespace.getNamespace("gap", "http://phonegap.com/ns/1.0"));
         widget.setAttribute(new Attribute("id", "uned.phonegap.example"));
         widget.setAttribute(new Attribute("version", "1.0.0"));
        return widget;
    }

    /**
     *
     * @param _id
     * @param _version
     * @param _versionCode
     * @return
     */
    public Element createRaizConfig(String _id, String _version, String _versionCode) {
        this.widget = new Element("widget");
        widget.setAttribute(new Attribute("xmls", "http://www.w3.org.ns/widgets"));
        widget.addNamespaceDeclaration(Namespace.getNamespace("gap", "http://phonegap.com/ns/1.0"));
        String id = Util.isNulo(_id) ? "uned.phonegap.example" : _id;

        widget.setAttribute(new Attribute("id", id));
        if (!Util.isNulo(_versionCode)) {
            widget.setAttribute(new Attribute("versionCode", _versionCode));
        }

        String version = Util.isNulo(_version) ? "1.0.0" : _version;
        widget.setAttribute(new Attribute("version", version));
        return widget;
    }

    private void setVersionApp(String _versionApp) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }
        String version = Util.isNulo(_versionApp) ? "1.0.0" : _versionApp;
        widget.setAttribute(new Attribute("version", version));
    }
    
   private void setIdApp(String _idApp) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }
        String version = Util.isNulo(_idApp) ? "uned.phonegap.example" : _idApp;
        widget.setAttribute(new Attribute("id", version));
    }

    private void setVersionCode(String _versionCode) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }
        if (!Util.isNulo(_versionCode)) {
            widget.setAttribute(new Attribute("versionCode", _versionCode));
        }
    }

    private void setNameApp(String _name) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }

        Element e_name = widget.getChild("name");
        if (Util.isNulo(e_name)) {
            e_name = new Element("name");
            widget.addContent(e_name);
        } else {
            e_name.removeContent();
        }

        String name = Util.isNulo(_name) ? "Aplicacion de Ejemplo" : _name;

        e_name.addContent(name);
    }

    public void setDescripApp(String _desc) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }

        Element e_desc = widget.getChild("description");
        if (Util.isNulo(e_desc)) {
            e_desc = new Element("description");
            widget.addContent(e_desc);
        } else {
            e_desc.removeContent();
        }

        String descripcion = Util.isNulo(_desc) ? "Un Ejemplo de aplicacion ...." : _desc;

        e_desc.addContent(descripcion);
    }

    public void setContentApp(String _content) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }

        Element e_cont = widget.getChild("content");
        if (Util.isNulo(e_cont)) {
            e_cont = new Element("content");
            widget.addContent(e_cont);
        } else {
            e_cont.removeContent();
        }

        String descripcion = Util.isNulo(_content) ? "index.html" : _content;

       // e_cont.addContent(descripcion);
        e_cont.setAttribute("src", descripcion);
    }

    public void setAuthorApp(String _author, String _href, String _email) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }

        Element e_author = widget.getChild("author");
        if (Util.isNulo(e_author)) {
            e_author = new Element("author");
            widget.addContent(e_author);
        } else {
            e_author.removeContent();
        }

        String author = Util.isNulo(_author) ? "Autor ...." : _author;

        e_author.addContent(author);

        if (!Util.isNulo(_href)) {
            setAttributeElement(e_author, "href", _href);
        }
        if (!Util.isNulo(_email)) {
            setAttributeElement(e_author, "mail", _email);
        }
    }

    public void setPlatform(List<String> _nPlatform) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }

        if (Util.isNulo(_nPlatform)) {
            throw new Exception();
        }

        this.widget.removeChildren("platform", this.widget.getNamespace("gap"));

        for (String _platform : _nPlatform) {
            Element e_platform = new Element("platform", this.widget.getNamespace("gap"));
            setAttributeElement(e_platform, "name", _platform);
            this.widget.addContent(e_platform);
        }

    }

    public void setPreference(String _namePref, String _valuePref) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }

        Filter<Element> filters = (Filter<Element>) Filters.element("preference");
        List<Element> r_refere = this.widget.getContent(filters);

        for (Element _p : r_refere) {
            String v_name = _p.getAttributeValue("name");
            if (!Util.isNulo(v_name) && v_name.equals(_namePref)) {
                this.widget.removeContent(_p);
            }
        }
        Element preference = new Element("preference");
        setAttributeElement(preference, "name", _namePref);
        setAttributeElement(preference, "value", _valuePref);
        this.widget.addContent(preference);
    }

    public void setAccess(String _origin, Boolean _subdomains, Boolean _external) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }
        Filter<Element> filters = (Filter<Element>) Filters.element("access");
        List<Element> r_refere = this.widget.getContent(filters);

        for (Element _p : r_refere) {

            String v_origin = _p.getAttributeValue("origin");

            if (!Util.isNulo(v_origin) && v_origin.equals(_origin)) {
                this.widget.removeContent(_p);
            }
        }
        Element access = new Element("access");
        setAttributeElement(access, "origin", _origin);
        if (!Util.isNulo(_subdomains)) {
            setAttributeElement(access, "subdomais", _subdomains.toString());
        }
        if (!Util.isNulo(_external)) {
            setAttributeElement(access, "launch-external", _external == true ? "yes" : "no");
        }
        this.widget.addContent(access);

    }

    public Element setIcon(String _src, String _platform) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }
        Element icon = new Element("icon");
        setAttributeElement(icon, "src", _src);
        if (!Util.isNulo(_platform)) {
            setAttributeElement(icon, "platform", _platform, "gap");
        }
        this.widget.addContent(icon);
        return icon;
    }

    public Element setIconIos(String _src, String _platform, String _width, String _height) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }
        Element icon = setIcon(_src, _platform);
        if (!Util.isNulo(_width)) {
            setAttributeElement(icon, "width", _width);
        }
        if (!Util.isNulo(_height)) {
            setAttributeElement(icon, "height", _height);
        }

        return icon;
    }

    public Element setIconAndroid(String _src, String _platform, String _qualifier) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }
        Element icon = setIcon(_src, _platform);
        if (!Util.isNulo(_qualifier)) {
            setAttributeElement(icon, "qualifier", _qualifier, "gap");
        }


        return icon;
    }

    public Element setIconWPhone(String _src, String _platform, String _role) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }
        Element icon = setIcon(_src, _platform);
        if (!Util.isNulo(_role)) {
            setAttributeElement(icon, "role", _role, "gap");
        }

        return icon;
    }

    public Element setSplash(String _src, String _platform) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }
        Element splash = new Element("splash", this.widget.getNamespace("gap"));
        setAttributeElement(splash, "src", _src);
        if (!Util.isNulo(_platform)) {
            setAttributeElement(splash, "platform", _platform, "gap");
        }
        this.widget.addContent(splash);
        return splash;
    }

    public Element setSplashIos(String _src, String _platform, String _width, String _height) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }
        Element splash = setSplash(_src, _platform);
        if (!Util.isNulo(_width)) {
            setAttributeElement(splash, "width", _width);
        }
        if (!Util.isNulo(_height)) {
            setAttributeElement(splash, "height", _height);
        }

        return splash;
    }

    public Element setSplashAndroid(String _src, String _platform, String _qualifier) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }
        Element splash = setSplash(_src, _platform);
        if (!Util.isNulo(_qualifier)) {
            setAttributeElement(splash, "qualifier", _qualifier, "gap");
        }


        return splash;
    }

    private Element setFeatures(String _feature) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }
        String raiz = "http://api.phonegap.com/1.0/";
        Element feature = new Element("feature");
        setAttributeElement(feature, "name", raiz + _feature);
        this.widget.addContent(feature);
        return feature;
    }

    private Element setPlugin(String _plugin) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }
        Element plugin = new Element("plugin", this.widget.getNamespace("gap"));
        String raiz = "org.apache.cordova.";
        setAttributeElement(plugin, "name", raiz + _plugin);
        this.widget.addContent(plugin);
        return plugin;
    }

    public Element setPlugin(String _plugin, String _version) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }

        Element plugin = setPlugin(_plugin);
        setAttributeElement(plugin, "version", _version);

        return plugin;
    }

    private Attribute setAttributeElement(Element _element, String _nameAtt, String _valueAtt) throws Exception {
        if (Util.isNulo(_element)) {
            throw new Exception();
        }
        if (Util.isNulo(_nameAtt)) {
            throw new Exception();
        }
        if (Util.isNulo(_valueAtt)) {
            throw new Exception();
        }
        Attribute att = null;
        if (_element.hasAttributes()) {
            att = _element.getAttribute(_nameAtt);
        }

        if (Util.isNulo(att)) {
            att = new Attribute(_nameAtt, _valueAtt);
            _element.setAttribute(att);
        } else {
            att.setValue(_valueAtt);
        }
        return att;
    }

    private Attribute setAttributeElement(Element _element, String _nameAtt, String _valueAtt, String _prefix) throws Exception {
        if (Util.isNulo(_element)) {
            throw new Exception();
        }
        if (Util.isNulo(_nameAtt)) {
            throw new Exception();
        }
        if (Util.isNulo(_valueAtt)) {
            throw new Exception();
        }
        Attribute att = null;
        if (_element.hasAttributes()) {
            att = _element.getAttribute(_nameAtt, this.widget.getNamespace(_prefix));
        }

        if (Util.isNulo(att)) {
            att = setAttributeElement(_element, _nameAtt, _valueAtt);
            att.setNamespace(this.widget.getNamespace(_prefix));
        } else {
            att.setValue(_valueAtt);
        }
        return att;
    }

    public Element getWidget() {
        return widget;
    }
}
