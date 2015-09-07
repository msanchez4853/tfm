<%-- 
    Document   : opc_avanzadas
    Created on : 09-may-2015, 19:46:37
    Author     : adrastea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="panel panel-danger" id="_opciones_avanzadas" data-config="seccion">
    <div class="panel-heading">
        <h3 class="panel-title">Avanzadas&nbsp; 
            <span class="_mostrar_info glyphicon glyphicon-question-sign" data-alert="avanzadas" data-toggle="tooltip" title="Muestra /oculta informacion adicional">&nbsp;</span></h3>
    </div>
    <div class="panel-body panel_contenido">
        <div class="container-fluid"> 
            <div class="row">
                <div class="col-md-12">
                    <div id="info_avanzadas" class="jumbotron img-rounded" >
                        <button type="button" class="_mostrar_info close" data-alert="avanzadas"><span aria-hidden="true">&times;</span></button>
                        <strong>Avanzadas.</strong> En esta agrupación se aglutinan propiedades de configuración o preferencias propias de cada plataforma. 
                        <br/>
                        Mas informacion en Phonegap build:  <a href="http://docs.build.phonegap.com/en_US/3.3.0/configuring_preferences.md.html#Preferences" class="alert-link" target="_blank">Configuring - Preferences</a>
                        <br/>Mas detalle sobre cada plataforma podemos encontrarla en Phonegap API ( 
                        <a href="http://docs.phonegap.com/en/edge/guide_platforms_ios_config.md.html#iOS%20Configuration" class="alert-link" target="_blank">iOS Configuration</a>
                        y   
                        <a href="http://docs.phonegap.com/en/edge/guide_platforms_android_config.md.html#Android%20Configuration" class="alert-link" target="_blank">Android Configuration</a>
                        )
                    </div>
                </div>
            </div>
            <div id="_acc_avan_option" class="row" style="text-align: center">
                <div class="btn-group  col-md-12" data-toggle="buttons">
                    <label class="col-md-3  col-sm-6 col-xs-12 btn btn-primary active" data-toggle="popover"> 
                        <span class="data-content glyphicon glyphicon-question-sign" >
                            Muestra para la plataforma iOS la preferencias que podemos definir para nuestra aplicacion Phonega Build. 
                        </span> 
                        <input type="radio" name="_bt_avan_rad" id="_bt_avan_option_ios" value="_opc_avan_ios" checked  data-text="_text_avan_selec" >
                        <span class="data-title">iOS</span>
                    </label>
                    <label class="col-md-3 col-sm-6 col-xs-12 btn btn-primary btn btn-primary" data-toggle="popover"> 
                        <span class="data-content glyphicon glyphicon-question-sign" >
                            Muestra para la plataforma Android la preferencias que podemos definir para nuestra aplicacion Phonega Build. 
                        </span> 
                        <input type="radio" name="_bt_avan_rad" id="_bt_avan_option_android" value="_opc_avan_android" data-text="_text_avan_selec" >
                        <span class="data-title">Android</span>
                    </label>                                    
                </div>
            </div>
            <div class='row'>
                <div class="col-md-12 jumbotron img-rounded" style='padding-top: 18px;padding-bottom: 18px;' >
                    <strong>Definiendo preferencias para</strong>:  <span id="_text_avan_selec"></span>
                </div>
            </div>
            <div id="_opc_avan_ios">
                <div class="row">
                    <div class="col-md-5 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_CKBT_EnableViewportScale" data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Se establece en true para permitir que la etiqueta meta viewport en nuestro codigo HTML  pueda desactivar o restringir el rango de escala de usuario.
                                    <br/>
                                    <em><strong>Por defecto</strong>:false.</em>
                                </span>
                                <span class="data-title">Enable ViewPort Scalling</span>:
                            </label>
                            <div class="row form-control form_agrupa">
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input type="checkbox" name="_opc_avan_CKBT_EnableViewportScale" id="_opc_avan_CKBT_EnableViewportScale" /> &nbsp;True
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_CKBT_MediaPlaybackRequiresUserAction" data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Se establece en true para impedir vídeos HTML5 o audios se reproduzcan de forma automática con el atributo de reproducción automática o a través de JavaScript.
                                    <br/>
                                    <em><strong>Por defecto</strong>:false.</em>
                                </span>
                                <span class="data-title">Media Playback Requires User Action</span>:</label>
                            <div class="row form-control form_agrupa">
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input type="checkbox" name="_opc_avan_CKBT_MediaPlaybackRequiresUserAction" id="_opc_avan_CKBT_MediaPlaybackRequiresUserAction" /> &nbsp;True
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_UIWebViewDecelerationSpeed" data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Los valores válidos son normal y fast. Esta propiedad controla la velocidad de desaceleración del scrolling. 
                                    <br/>
                                    normal es la velocidad predeterminada para la mayoría de aplicaciones nativas, y fast es el predeterminado para Mobile Safari
                                    <br/>
                                    <em><strong>Por defecto</strong>: normal</em>
                                </span>
                                <span class="data-title">UI Web View Deceleration Speed</span>:</label>
                            <select name="_opc_avan_UIWebViewDecelerationSpeed" id="_opc_avan_UIWebViewDecelerationSpeed" class="form-control" >
                                <option value="normal" selected="selected">normal</option>
                                <option value="fast">fast</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_CKBT_AllowInlineMediaPlayback" data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Se define como true para permitir la reproducción multimedia HTML5 que aparezca en línea en el diseño de la pantalla, utilizando controles del navegador suministrados en lugar de controles nativos. Para que esto funcione, se debe agregar el atributo webkit-playsinline a cualquier elemento <video> del HTML
                                        <br/>
                                        <em><strong>Por defecto</strong>:false.</em>
                                </span>
                                <span class="data-title">Allow Inline Media Playback:</span></label>
                            <div class="row form-control form_agrupa">
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input type="checkbox" name="_opc_avan_CKBT_AllowInlineMediaPlayback" id="_opc_avan_CKBT_AllowInlineMediaPlayback" /> &nbsp;True
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">

                    <div class="col-md-5 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_BackupWebStorage" data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Puede tomar como  valor las cadena  "none","local" o "cloud".<br/>
                                    Si toma "cloud" permite realizar una copia de seguridad de los datos Web Storage a través de iCloud. Si el valor es "local" permite sólo las copias de seguridad locales a través de las  sincronización con iTunes. 
                                    Si el toma el valor "none"no permite realizar copias de seguridad de Web Storage.
                                    <br/>
                                    <em><strong>Por defecto</strong>: could.</em>
                                </span>
                                <span class="data-title">Backup Web Storage</span>:</label>
                            <select name="_opc_avan_BackupWebStorage" id="_opc_avan_BackupWebStorage" class="form-control" >
                                <option value="none">none</option>
                                <option value="local">local</option>
                                <option value="cloud" selected="selected">cloud</option>                                
                            </select>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_CKBT_SuppressesIncrementalRendering" data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Si el valor es true, espera a renderizar la pantalla hasta que todos los contenidos se hayan recibido.<br/>
                                    <em><strong>Por defecto</strong>: false.</em>
                                </span>
                                <span class="data-title">Supress Incremental Rendering</span>:</label>
                            <div class="row form-control form_agrupa">
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input type="checkbox" name="_opc_avan_CKBT_SuppressesIncrementalRendering" id="_opc_avan_CKBT_SuppressesIncrementalRendering" /> &nbsp;True
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_TopActivityIndicator" data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Controla la apariencia del icono pequeño  de espera/trabajando en la barra de estado que indica una actividad significativa procesador.
                                    <br/>Los valores válidos son "whiteLarge", "white" y "gray".
                                    <br/>
                                    <em><strong>Por defecto</strong>: gray.</em>
                                </span>
                                <span class="data-title">Top Activity Indicator</span>:
                            </label>
                            <select name="_opc_avan_TopActivityIndicator" id="_opc_avan_TopActivityIndicator" class="form-control" >
                                <option value="whiteLarge">whiteLarge</option>
                                <option value="white">white</option>
                                <option value="gray" selected="selected">gray</option>   
                            </select>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_CKBF_KeyboardDisplayRequiresUserAction"  data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Establecido a false permite que aparezca el teclado cuando un elemento del formulario tome el foco (se llama a focus() del elemento).
                                    <br/>
                                    <em><strong>Por defecto</strong>: true.</em>
                                </span>
                                <span class="data-title">Keyboard Display requires User Action</span>:</label>
                            <div class="row form-control form_agrupa">
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input type="checkbox" name="_opc_avan_CKBF_KeyboardDisplayRequiresUserAction" id="_opc_avan_CKBF_KeyboardDisplayRequiresUserAction" /> &nbsp;False
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-12"> 
                        <div class="row form-group">
                            <label for="_opc_avan_GapBetweenPages"  data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    El tamaño del espacio, en puntos, entre las páginas.<br/>
                                    <em><strong>Por defecto</strong>: 0</em>
                                </span>
                                <span class="data-title">Gap Between Pages</span>:</label>
                            <input type="text" name="_opc_avan_GapBetweenPages" id="_opc_avan_GapBetweenPages" placeholder="Distancia en puntos entre las paginas" class="form-control"/>

                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_PageLength" data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    El tamaño de cada página, en puntos, en la direccion del flujo de paginas. Cuando el valor del elemento  PaginationMode es leftToRight o de rightToLeft, el valor de PageLength representa el ancho de cada página. Cuando PaginationMode es topToBottom o bottomToTop, el valor de PageLength representa la altura de cada página. <br/>
                                    <em><strong>Por defecto</strong>: 0, lo que significa que el diseño utiliza el tamaño de la ventana gráfica para determinar las dimensiones de la página</em>
                                </span>
                                <span class="data-title">Page Length</span>:</label>
                            <input type="text" name="_opc_avan_PageLength" id="_opc_avan_PageLength" placeholder="el tamaño de cada pagina en puntos." class="form-control"/>                                                        
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_PaginationBreakingMode" data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Los valores válidos son page y  column.<br/>
                                    Esta propiedad determina que propiedades CSS respecto a la ruptura de columna o página se tienen en cuenta o son ignorados. <br/>
                                    Cuando se establece en "column", el contenido respeta las propiedades CSS relacionados con la ruptura de columna en lugar de la ruptura de página.
                                    <br/>
                                    <em><strong>Por defecto</strong>: page</em>
                                </span>
                                <span class="data-title">Pagination Breaking Mode</span>:</label>
                            <select name="_opc_avan_PaginationBreakingMode" id="_opc_avan_PaginationBreakingMode" class="form-control" >
                                <option value="page" selected="selected">page</option>
                                <option value="column">column</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_PaginationMode"  data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Los valores válidos son unpaginated, leftToRight, topToBottom, bottomToTop y RightToLeft. 
                                    <br/>
                                    Esta propiedad determina si el contenido se divide en páginas que llenan la pantalla, o se muestra como una sola vista con desplazamiento. Si se define  un valor diferente a unpagineted, haciendo que se utilicen los valores de las propiedades PageLength y GapBetweenPages para la redistribución de su contenido.
                                    <br/>
                                    <em><strong>Por defecto</strong>: unpaginated</em>
                                </span>
                                <span class="data-title">Pagination Mode</span>:</label>
                            <select name="_opc_avan_PaginationMode" id="_opc_avan_PaginationMode" class="form-control" >
                                <option value="unpaginated" selected="selected">unpaginated</option>
                                <option value="leftToRight">leftToRight</option>
                                <option value="topToBottom">topToBottom</option>
                                <option value="bottomToTop">bottomToTop</option>
                                <option value="rightToLeft">rightToLeft</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">                    
                    <div class="col-md-5 col-sm-12"> 
                        <div class="row form-group">
                            <label for="_opc_avan_deployment-target"  data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Establece el elemento IPHONEOS_DEPLOYMENT_TARGET en la construcción de la aplicación, lo que se traduce en establecer la propiedad MinimumOSVersion de la ipa Propertly List.
                                </span>
                                <span class="data-title">Deployment target</span>:</label>
                            <input type="text" name="_opc_avan_deployment-target" id="_opc_avan_deployment-target" class="form-control"/>

                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_CKBF_detect-data-types"  data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Controla si ciertos tipos de datos (por ejemplo, números de teléfono y fechas) se convierten automáticamente en enlaces por el sistema. 
                                    <br/>
                                    <em><strong>Por defecto</strong>: true </em>
                                </span>
                                <span class="data-title">Detect Data Type</span>:</label>
                            <div class="row form-control form_agrupa">
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input type="checkbox" name="_opc_avan_CKBF_detect-data-types" id="_opc_avan_CKBF_detect-data-types" /> &nbsp;False
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-12"> 
                        <div class="row form-group">
                            <label for="_opc_avan_CKBT_prerendered-icon"  data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Esto provocará que iOS no aplique el su efecto brillo a l icono de la aplicación en la pantalla de inicio del usuario. Los posibles valores son false y true.
                                    <br/>
                                    <em><strong>Por defecto</strong>: false </em>
                                </span>
                                <span class="data-title">Prerendered Icon</span>:</label>
                            <div class="row form-control form_agrupa">
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input type="checkbox" name="_opc_avan_CKBT_prerendered-icon" id="_opc_avan_CKBT_prerendered-icon"/> &nbsp;True
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12"> 
                        <div class="row form-group">
                            <label for="_opc_avan_CKBT_exit-on-suspend"  data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Si se establece el valor true la aplicación terminará cuando se suspenda. Por ejemplo cuando se pulse el botón de inicio.
                                    <br/>
                                    <em><strong>Por defecto</strong>: false </em>
                                </span>
                                <span class="data-title">Exit on Suspend</span>:</label>
                            <div class="row form-control form_agrupa">
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input type="checkbox" name="_opc_avan_CKBT_exit-on-suspend" id="_opc_avan_CKBT_exit-on-suspend"/> &nbsp;True
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-12"> 
                        <div class="row  form-group">
                            <label for="_opc_avan_target-device"  data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Determina un dispositivo específico. Los valores que puede tomar son handset (móvil) , tablet (tablet), or universal.
                                    <br/>
                                    <em><strong>Por defecto</strong>: universal </em>
                                </span>
                                <span class="data-title">Target Device Type</span>:</label>
                            <select name="_opc_avan_target-device" id="_opc_avan_target-device"  class="form-control"  >
                                <option value="universal" selected="selected">universal</option>
                                <option value="tablet">tablet</option>
                                <option value="handset">handset</option>
                            </select>
                        </div>
                    </div>                                        
                </div>

            </div>
            <div id="_opc_avan_android">
                <%-- <div class="row">
                     <div class="col-md-5 col-sm-12">                                
                         <div class="row  form-group">
                             <label for="_opc_avan_version_code" class="opc_android">Version Code:</label>
                             <input type="text" name="_opc_avan_version_code" id="_opc_avan_version_code"  class="form-control" />
                         </div>
                     </div>
                 </div>--%>
                <div class="row">
                    <div class="col-md-5 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_android-minSdkVersion" data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Mínima versión de SDK de Android. Corresponde con el atributo minSdkVersion en el elemento usesSdk del AndroidManifest.xml. 
                                    <br/>
                                    <em>Para más detalles en la documentación de android (
                                        <a href="http://developer.android.com/guide/topics/manifest/uses-sdk-element.html">http://developer.android.com/guide/topics/manifest/uses-sdk-element.html</a> ) </em><br/>
                                    <em><strong>Por defecto</strong>: 7 (Android 2.1) </em>
                                </span>
                                <span class="data-title">Min SDK Version </span>:</label>
                            <select name="_opc_avan_android-minSdkVersion" id="_opc_avan_android-minSdkVersion" class="form-control" >
                                <option value="7" selected="selected" >7 (Android 2.1.x)</option>
                                <option value="8" >8 (Android 2.2.x)</option>
                                <option value="9" >9 (Android 2.3, Android 2.3.1, Android 2.3.2)</option>
                                <option value="10" >10 (Android 2.3.3, Android 2.3.4)</option>
                                <option value="11" >11 (Android 3.0.x)</option>
                                <option value="12" >12 (Android 3.1.x)</option>
                                <option value="13" >13 (Android 3.2.x)</option>
                                <option value="14" >14 (Android 4.0, Android 4.0.1, Android 4.0.2)</option>
                                <option value="15" >15 (Android 4.0.3, Android 4.0.4)</option>
                                <option value="16" >16 (Android 4.1, Android 4.1.1)</option>
                                <option value="17" >17 (Android 4.2, Android 4.2.2)</option>
                                <option value="18" >18 (Android 4.3)</option>
                                <option value="19" >19 (Android 4.4)</option>                                
                                <option value="21" >21 (Android 5.0)</option>
                                <option value="22" >22 (Android 5.1)</option>                                
                            </select>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_android-maxSdkVersion" data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Máxima versión de SDK Android. Corresponde con el atributo maxSdkVersion en el elemento usesSdk del AndroidManifest.xml<br/>
                                    <br/>
                                    <em>Para más detalles en la documentación de android (
                                        <a href="http://developer.android.com/guide/topics/manifest/uses-sdk-element.html">http://developer.android.com/guide/topics/manifest/uses-sdk-element.html</a> ) </em><br/>

                                </span>
                                <span class="data-title">Max SDK Version</span>:</label>
                            <select name="_opc_avan_android-maxSdkVersion" id="_opc_avan_android-maxSdkVersion" class="form-control" >
                                <option value="7" selected="selected" >7 (Android 2.1.x)</option>
                                <option value="8" >8 (Android 2.2.x)</option>
                                <option value="9" >9 (Android 2.3, Android 2.3.1, Android 2.3.2)</option>
                                <option value="10" >10 (Android 2.3.3, Android 2.3.4)</option>
                                <option value="11" >11 (Android 3.0.x)</option>
                                <option value="12" >12 (Android 3.1.x)</option>
                                <option value="13" >13 (Android 3.2.x)</option>
                                <option value="14" >14 (Android 4.0, Android 4.0.1, Android 4.0.2)</option>
                                <option value="15" >15 (Android 4.0.3, Android 4.0.4)</option>
                                <option value="16" >16 (Android 4.1, Android 4.1.1)</option>
                                <option value="17" >17 (Android 4.2, Android 4.2.2)</option>
                                <option value="18" >18 (Android 4.3)</option>
                                <option value="19" >19 (Android 4.4)</option>                                
                                <option value="21" >21 (Android 5.0)</option>
                                <option value="22" >22 (Android 5.1)</option>     
                            </select>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_android-targetSdkVersion" data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Corresponde con el atributo targerSdkVersion del elemento usesSdk del AndroidManifest.xml. indica el nivel de sdk objetivo de la aplicación sino se indica se toma el valor minSdkversion.                                    <br/>
                                    <em>Para más detalles en la documentación de android (
                                        <a href="http://developer.android.com/guide/topics/manifest/uses-sdk-element.html">http://developer.android.com/guide/topics/manifest/uses-sdk-element.html</a> ) </em><br/>

                                </span>
                                <span class="data-title">Target SDK Version</span>:</label>
                            <select name="_opc_avan_android-targetSdkVersion" id="_opc_avan_android-targetSdkVersion" class="form-control" >
                                <option value="7" selected="selected" >7 (Android 2.1.x)</option>
                                <option value="8" >8 (Android 2.2.x)</option>
                                <option value="9" >9 (Android 2.3, Android 2.3.1, Android 2.3.2)</option>
                                <option value="10" >10 (Android 2.3.3, Android 2.3.4)</option>
                                <option value="11" >11 (Android 3.0.x)</option>
                                <option value="12" >12 (Android 3.1.x)</option>
                                <option value="13" >13 (Android 3.2.x)</option>
                                <option value="14" >14 (Android 4.0, Android 4.0.1, Android 4.0.2)</option>
                                <option value="15" >15 (Android 4.0.3, Android 4.0.4)</option>
                                <option value="16" >16 (Android 4.1, Android 4.1.1)</option>
                                <option value="17" >17 (Android 4.2, Android 4.2.2)</option>
                                <option value="18" >18 (Android 4.3)</option>
                                <option value="19" >19 (Android 4.4)</option>                                
                                <option value="21" >21 (Android 5.0)</option>
                                <option value="22" >22 (Android 5.1)</option>     
                            </select>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_android-windowSoftInputMode" data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Indicamos como la ventana principal de activity interactua con la ventana que contiene el teclado virtual de la pantalla. 

                                    <br/>
                                    <em>Para más detalles y posibles valores en la documentación de android (
                                        <a href="http://developer.android.com/guide/topics/manifest/activity-element.html#wsoft">http://developer.android.com/guide/topics/manifest/activity-element.html#wsoft</a> ) </em><br/>

                                </span>
                                <span class="data-title">Window Soft. Input Mode</span>:</label>
                            <input type="text" name="_opc_avan_android-windowSoftInputMode" id="_opc_avan_android-windowSoftInputMode"  class="form-control" placeholder="Consulte http://developer.android.com/guide/topics/manifest/activity-element.html#wsoft"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_android-installLocation" data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Donde la aplicación puede ser instalada: internalOnly (defecto). auto o preferExternal (permite que la aplicacion se instale sobre una tarjeta SD, esto puede lleva aun comportamiento inesperado).
                                    <br/>
                                    <em>Para más informacion  en la documentación de android (
                                        <a href="http://developer.android.com/guide/topics/data/install-location.html">http://developer.android.com/guide/topics/data/install-location.html</a> ) </em><br/>
                                    <em><strong>Por defecto</strong>: internalOnly </em>
                                </span>
                                <span class="data-title">Install Location</span>:</label>
                            <select name="_opc_avan_android-installLocation" id="_opc_avan_android-installLocation" class="form-control" >
                                <option value="internalOnly" selected="selected">internalOnly</option>
                                <option value="auto">auto</option>
                                <option value="preferExternal">preferExternal</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_LoadingDialog"  data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >

                                    Muestra un cuadro de diálogo con el título y mensaje especificado y un spinner (imagen de cargando), al cargar la primera página de la aplicación. El título y el mensaje se separan por una coma en la cadena. Defecto null.
                                    <br/>
                                    <em><strong>Por defecto</strong>: cadena vacia </em>
                                </span>
                                <span class="data-title">Loading Dialog</span>:</label>
                            <input type="text" name="_opc_avan_LoadingDialog" id="_opc_avan_LoadingDialog"  class="form-control" placeholder="Especifica el titulo y el mensaje de carga, separados por una coma (,)"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5  col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_SplashScreenDelay" data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >

                                    El tiempo en milisegundos que se va a mostrar la splash screen.                                    
                                    <br/>
                                    <em><strong>Por defecto</strong>: 3000 milisegundos </em>
                                </span>
                                <span class="data-title">Splash Screen Delay</span>:</label>
                            <input type="text" name="_opc_avan_SplashScreenDelay" id="_opc_avan_SplashScreenDelay"  class="form-control" placeholder="Tiempo en milisegundos que se va a mostrar el splash" value="3000"/>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_AndroidLaunchMode"  data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >

                                    Establece el comportamiento de nuestra aplicación cuando se inicia desde el icono de la aplicación y ya se está ejecutando.
                                    <br/>Los valores válidos son estándar, singleTop, singleTask, SingleInstance
                                    <br/>Establecerá el valor del atributo launchMode del elemento activity del AndroidManifest.xml. 

                                    <em>Para más informacion  en la documentación de android (
                                        <a href="http://developer.android.com/guide/topics/manifest/activity-element.html#lmode">http://developer.android.com/guide/topics/manifest/activity-element.html#lmode</a></em>

                                    <br/>
                                    <em><strong>Por defecto</strong>: singleTop </em>
                                </span>
                                <span class="data-title">Android Launch Mode</span>:</label>
                            <select name="_opc_avan_AndroidLaunchMode" id="_opc_avan_AndroidLaunchMode" class="form-control" >
                                <option value="standard">standard</option>
                                <option value="singleTop" selected="selected">singleTop</option>
                                <option value="singleTask">singleTask</option>
                                <option value="singleInstance">singleInstance</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-12 ">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_CKBF_KeepRunning"  data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Determina si la aplicación continua funcionando en segundo plano después de un evento de pausa. Si se marca a false, no mata la aplicación sino que simplemente se detiene la ejecución del código en el webview de cordova mientras que la app esta en background. 
                                    <br/>
                                    <em><strong>Por defecto</strong>: true </em>
                                </span>
                                <span class="data-title">Keep Running</span>:</label>
                            <div class="row form-control form_agrupa">
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input type="checkbox"  name="_opc_avan_CKBF_KeepRunning" id="_opc_avan_CKBF_KeepRunning" >&nbsp;False
                                    </label>
                                </div>                                                
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_LoadUrlTimeoutValue"  data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Al cargar una página, la cantidad de tiempo de espera antes de lanzar un error de timeout. <br/>
                                    <em><strong>Por defecto</strong>: 20000 milisegundos (20 seg).</em>
                                </span>
                                <span class="data-title">Load URL timeout Value</span>:</label>
                            <input type="text" name="_opc_avan_LoadUrlTimeoutValue" id="_opc_avan_LoadUrlTimeoutValue"  class="form-control" placeholder="El tiempo en milisegundos que espera para lanzar error de timeout" value="20000"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-12 ">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_SplashScreen"  data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    El nombre del archivo menos su extensión en el directorio res/drawable.
                                    <br/>
                                    <em><strong>Por defecto</strong>: splash</em>
                                </span>
                                <span class="data-title">Splash Screen</span>:</label>
                            <input type="text"  name="_opc_avan_SplashScreen" id="_opc_avan_SplashScreen" class="form-control" placeholder="Nombre menos la extension del fichero splash."/>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_CKBT_ShowTitle"  data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Muestra el título de la aplicación en la parte superior de la pantalla.
                                    <br/>
                                    <em><strong>Por defecto</strong>: false</em>
                                </span>
                                <span class="data-title">Show Title</span>:</label>
                            <div class="row form-control form_agrupa">
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input type="checkbox"  name="_opc_avan_CKBT_ShowTitle" id="_opc_avan_CKBT_ShowTitle" >&nbsp;True
                                    </label>
                                </div>                                                
                            </div>
                        </div>
                    </div>
                </div>  
                <div class="row">
                    <div class="col-md-5 col-sm-12 ">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_CKBF_InAppBrowserStorageEnabled"  data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Controla si las páginas abiertas en un InAppBrowser pueden acceder al mismo almacenamiento localStorage y WebSQL como las abiertas en el navegador por defecto. 
                                    <br/>
                                    <em><strong>Por defecto</strong>: true</em>
                                </span>
                                <span class="data-title">In AppBrowser Storage Enabled</span>:</label>
                            <div class="row form-control form_agrupa">
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input type="checkbox"  name="_opc_avan_CKBF_InAppBrowserStorageEnabled" id="_opc_avan_CKBF_InAppBrowserStorageEnabled" >&nbsp;False
                                    </label>
                                </div>                                                
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_LoadingPageDialog"  data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Lo mismo que loadingDialog pero para las páginas que aparecen después de la principal.
                                </span>
                                <span class="data-title">Loading Page Dialog</span>:</label>
                            <input type="text" name="_opc_avan_LoadingPageDialog" id="_opc_avan_LoadingPageDialog"  class="form-control" placeholder="Especifica el titulo y el mensaje de carga cuando no es la pagina inicial, separados por una coma (,)"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_LogLevel" data-toggle="popover"> 
                                <span class="data-content glyphicon glyphicon-question-sign" >
                                    Establece el nivel mínimo de log de la aplicación. Los valores válidos son ERROR, WARN, INFO, DEBUG, and VERBOSE.
                                    <br/>
                                    <em><strong>Por defecto</strong>: ERROR</em>
                                </span>
                                <span class="data-title">Log Level</span>:</label>
                            <select name="_opc_avan_LogLevel" id="_opc_avan_LogLevel" class="form-control" >
                                <option value="ERROR" selected="selected">ERROR</option>
                                <option value="WARN">WARN</option>
                                <option value="INFO">INFO</option>
                                <option value="DEBUG">DEBUG</option>
                                <option value="VERBOSE">VERBOSE</option>
                            </select>
                        </div>
                    </div>
                    <%--<div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_CKBT_SetFullscreen" class="">SetFullscreen</label>
                            <div class="row form-control form_agrupa">
                                <div class="col-md-12 checkbox">
                                    <label>
                                        <input type="checkbox"  name="_opc_avan_CKBT_SetFullscreen" id="_opc_avan_CKBT_SetFullscreen">&nbsp;True
                                    </label>
                                </div>                                                
                            </div>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</div>