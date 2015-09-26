/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.uned.msanchez.tfm.xml;

import es.uned.msanchez.tfm.utilidades.Util;
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
import org.jdom2.filter.Filter;
import org.jdom2.filter.Filters;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

/**
 * Define un fichero xml siguiendo las especificaciones definidas para widget
 * por W3C
 *
 * @author Miguel Sánchez Román
 */
public class Xml {

    private Element widget;

    /**
     * Constructor por defecto.
     */
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
     * Nos permite generar las opciones generales de Phonegap Build, para una
     * aplicacion movil.
     *
     * @param _opciones_generales Maps con los valores con los pares parametro
     * valor
     * @throws Exception
     */
    public void setOpcionesGenerales(Map<String, String> _opciones_generales) throws Exception {
        List platform = new ArrayList();
        for (String param : _opciones_generales.keySet()) {
            String value = _opciones_generales.get(param);
            if (Util.isNulo(value)) {
                continue;
            }


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
                setPreference("ErrorUrl", value);
            }


        }
        if (!Util.isNulo(platform)) {
            setPlatform(platform);
        }

    }

    /**
     * Nos permite generar las opciones avanzadas de Phonegap Build, para una
     * aplicacion movil.
     *
     * @param _opciones_avanzadas Maps con los valores con los pares parametro
     * valor
     * @throws Exception
     */
    public void setOpcionesAvanzadas(Map<String, String> _opciones_avanzadas) throws Exception {
        for (String param : _opciones_avanzadas.keySet()) {

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

    /**
     * Nos permite generar las opciones de definicion de iconos de Phonegap
     * Build, para una aplicacion movil.
     *
     * @param _opciones_icons Maps con los valores con los pares parametro valor
     * @throws Exception
     */
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

                String _rol = (param.replace("win_", "")).substring(5);
                setIconWPhone(path_win + value, "winphone", _rol);
                continue;
            }
            if (param.indexOf("android_") >= 0) {

                String _qualifier = param.replace("android_", "");
                setIconAndroid(path_android + value, "android", _qualifier);
                continue;
            }

        }
    }

    /**
     * Nos permite generar las opcionesde definicion de Splash Screen de
     * Phonegap Build, para una aplicacion movil.
     *
     * @param _opciones_splash Maps con los valores con los pares parametro
     * valor
     * @throws Exception
     */
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

            if (param.indexOf("_path") == param.length() - 5) {
                continue;
            }
            String value = _opciones_splash.get(param);
            if (Util.isNulo(value)) {
                continue;
            }


            if (param.indexOf("default_") >= 0) {
                setSplash(path_default + value, "");
                continue;
            }
            if (param.indexOf("ios") >= 0) {

                String _width = param.substring(param.indexOf("_") + 1, param.indexOf("x"));
                String _height = param.substring(param.indexOf("x") + 1);
                setSplashIos(path_ios + value, "ios", _width, _height);
                continue;
            }
            if (param.indexOf("win_") >= 0) {
                setSplash(path_win + value, "winphone");
                continue;
            }
            if (param.indexOf("android_") >= 0) {

                String _qualifier = param.replace("android_", "");
                setSplashAndroid(path_android + value, "android", _qualifier);
                continue;
            }

        }
    }

    /**
     * Nos permite generar la definicion de caracteristica y permisos de
     * Phonegap Build, para una aplicacion movil.
     *
     * @param _opciones_permisos Maps con los valores con los pares parametro
     * valor
     * @throws Exception
     */
    public void setOpcionesPermisos(Map<String, String> _opciones_permisos) throws Exception {
        HashMap<Integer, HashMap<String, String>> accesos = new HashMap<Integer, HashMap<String, String>>();

        for (String param : _opciones_permisos.keySet()) {

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

                String _perm = param.replace("android_", "");
                setFeatures(_perm);
                continue;
            }
            if (param.indexOf("win_") >= 0) {

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

    /**
     * Nos permite generar las definiciones de los plugins de Phonegap Build,
     * para una aplicacion movil.
     *
     * @param _opciones_puglins Maps con los valores con los pares parametro
     * valor
     * @throws Exception
     */
    public void setOpcionesPlugins(Map<String, String> _opciones_puglins) throws Exception {
        HashMap<Integer, HashMap<String, String>> accesos = new HashMap<Integer, HashMap<String, String>>();

        for (String param : _opciones_puglins.keySet()) {

            String value = _opciones_puglins.get(param);

            setPlugin(param);
        }

    }

    /**
     * Nos permite generar las opciones de desarrollador de Phonegap Build, para
     * una aplicacion movil.
     *
     * @param _opciones_desarrollo Maps con los valores con los pares parametro
     * valor
     * @throws Exception
     */
    public void setOpcionesDesarrollador(Map<String, String> _opciones_desarrollo) throws Exception {

        HashMap<String, String> autor = new HashMap<String, String>();
        for (String param : _opciones_desarrollo.keySet()) {

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

    /**
     * Crea el elemento raiz de fichero xml.
     *
     * @return La representacion del elemento creado
     */
    private Element createRaizConfig() {
        this.widget = new Element("widget");
        widget.setAttribute(new Attribute("xmls", "http://www.w3.org.ns/widgets"));
        widget.addNamespaceDeclaration(Namespace.getNamespace("gap", "http://phonegap.com/ns/1.0"));
        widget.setAttribute(new Attribute("id", "uned.phonegap.example"));
        widget.setAttribute(new Attribute("version", "1.0.0"));
        return widget;
    }

    /**
     * Crea el elemento raiz de fichero xml, utilizando los valores de los
     * parametros.
     *
     * @param _id Identificador de los fuentes
     * @param _version Valor de la version
     * @param _versionCode Version del codigo.
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

    /**
     * Modifica el atributo version del elemento raiz.
     *
     * @param _versionApp Nuevo valor de la version
     * @throws Exception
     */
    private void setVersionApp(String _versionApp) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }
        String version = Util.isNulo(_versionApp) ? "1.0.0" : _versionApp;
        widget.setAttribute(new Attribute("version", version));
    }

    /**
     * Modifica el atributo de identificador de fuentes del elemento raiz
     *
     * @param _idApp Nuevo valor del identificador de fuentes.
     * @throws Exception
     */
    private void setIdApp(String _idApp) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }
        String version = Util.isNulo(_idApp) ? "uned.phonegap.example" : _idApp;
        widget.setAttribute(new Attribute("id", version));
    }

    /**
     * Modifica el atributo de version del codigo del elemento raiz
     *
     * @param _versionCode Nuevo valor de la version del codigo
     * @throws Exception
     */
    private void setVersionCode(String _versionCode) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }
        if (!Util.isNulo(_versionCode)) {
            widget.setAttribute(new Attribute("versionCode", _versionCode));
        }
    }

    /**
     * Añade el elemento name si no existe previamente. Si existia se modifica
     * el contenido con el nuevo indicado en el parametro
     *
     * @param _name Contenido del elemento name.
     * @throws Exception
     */
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

    /**
     * Añade el elemento description, si no existe previamente. Si existia se
     * modifica el contenido con el nuevo indicado en el parametro
     *
     * @param _desc Contenido del elemento description.
     * @throws Exception
     */
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

    /**
     * Se crea el elemento content con el contenido especificado en el
     * parametro. Si el elemento existia previamente, el conetido es modificado
     * con el nuevo valor que indica el parametro.
     *
     * @param _content Contenido del elemento content
     * @throws Exception
     */
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

    /**
     * Se crea el elemento author con el contenido especificado en _author y con
     * los atributos href y mail que toman los valores _href y _email
     * respectivamente. Si el elemento ya existia previamente este se actualiza
     * con los nuevos valores.
     *
     * @param _author Contenido de la etiqueta author
     * @param _href El valor del atributo href
     * @param _email Indica el valor del atributo mail
     * @throws Exception
     */
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

    /**
     * Añade tantos elementos platform como los indicados en el parametro.
     *
     * @param _nPlatform Lista de valores del atributo name del elemento
     * platform.
     * @throws Exception
     */
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

    /**
     * Añade el elemento preference con el contenido indicado en _valuePref, y
     * con el atributo name tomando el valor de _namePred
     *
     * @param _namePref Valor del atributo name
     * @param _valuePref Contenido del elemento preference
     * @throws Exception
     */
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

    /**
     * Añade el elemento access y los atributos origin, subdomains y
     * launch-external, el valor para cada atributo se especifica en los
     * parametros _origin, _subdomains y _external respectivamente
     *
     * @param _origin Valor del atributo origin
     * @param _subdomains Valor del atributo subdomains
     * @param _external Valor del atributo launch-external
     * @throws Exception
     */
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

    /**
     * Define el elemento icon con los atributos src y platform
     *
     * @param _src Valor del atributo src
     * @param _platform Valor del atributo platform
     * @return El elemento creado.
     * @throws Exception
     */
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

    /**
     * Define un elemento icon especifico para la plataforma Ios.
     *
     * @param _src Valor del atributo src
     * @param _platform Valor del atributo platform
     * @param _width Valor del atributo width
     * @param _height Valor del atributo height
     * @return El elmento creado
     * @throws Exception
     */
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

    /**
     * Define un elemento icon especifico para la plataforma Android.
     *
     * @param _src Valor del atributo src
     * @param _platform Valor del atributo platform
     * @param _qualifier Valor del atributo qualifier
     * @return El elmento creado
     * @throws Exception
     */
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

    /**
     * Define un elemento icon especifico para la plataforma windows Phone.
     *
     * @param _src Valor del atributo src
     * @param _platform Valor del atributo platform
     * @param _role Valor del atributo role
     * @return El elmento creado
     * @throws Exception
     */
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

    /**
     * Crear el elemento splash
     *
     * @param _src Valor del atributo src
     * @param _platform Valor del atributo platform
     * @return El elemento creado
     * @throws Exception
     */
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

    /**
     * Crear el elemento splash especifico para la plataforma iOS
     *
     * @param _src Valor del atributo src
     * @param _platform Valor del atributo platform
     * @param _width Valor del atributo width
     * @param _height Valor del atributo height
     * @return El elemento creado
     * @throws Exception
     */
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

    /**
     * Crear el elemento splash especifico para la plataforma Android
     *
     * @param _src Valor del atributo src
     * @param _platform Valor del atributo platform
     * @param _qualifier Valor del atributo quealifier
     * @return El elemento creado
     * @throws Exception
     */
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

    /**
     * Crear el elemento feature con el atribute name
     *
     * @param _feature Valor del atributo name
     * @return El elemento creado
     * @throws Exception
     */
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

    /**
     * Crea el elemento plugin
     *
     * @param _plugin Valor del atributo name
     * @return El elemento creado
     * @throws Exception
     */
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

    /**
     * Crea el elemento plugin con el atributo version
     *
     * @param _plugin Valor del atributo name
     * @param _version Valor del atributo version
     * @return El elemento creado
     * @throws Exception
     */
    public Element setPlugin(String _plugin, String _version) throws Exception {
        if (Util.isNulo(this.widget)) {
            throw new Exception();
        }

        Element plugin = setPlugin(_plugin);
        setAttributeElement(plugin, "version", _version);

        return plugin;
    }

    /**
     * Establece un atributo al elemento especificado
     *
     * @param _element Elemento al que se va a añadir el atributo
     * @param _nameAtt Nombre del atributo
     * @param _valueAtt Valor del atributo
     * @return El atributo creado.
     * @throws Exception
     */
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

    /**
     * Establece un atributo al elemento especificado indicando su NameSpace
     *
     * @param _element Elemento al que se va a añadir el atributo
     * @param _nameAtt Nombre del atributo
     * @param _valueAtt Valor del atributo
     * @param _prefix NameSpace del atribubuto si lo necesita
     * @return El atributo creado.
     * @throws Exception
     */
    private Attribute setAttributeElement(Element _element, String _nameAtt,
            String _valueAtt, String _prefix) throws Exception {
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

    /**
     * Obtiene el elemento raiz del documento.
     *
     * @return El elemento raiz.
     */
    public Element getWidget() {
        return widget;
    }
}
