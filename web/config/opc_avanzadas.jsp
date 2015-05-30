<%-- 
    Document   : opc_avanzadas
    Created on : 09-may-2015, 19:46:37
    Author     : adrastea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="panel panel-default" id="_opciones_avanzadas">
    <div class="panel-heading">
        <h3 class="panel-title">Avanzadas</h3>
    </div>
    <div class="panel-body panel_contenido">
        <div class="container-fluid">                       
            <div id="_acc_avan_option" class="row" style="text-align: center">
                <div class="btn-group" data-toggle="buttons">
                    <label class="btn btn-primary active">
                        <input type="radio" name="_bt_avan_rad" id="_bt_avan_option_ios" value="_opc_avan_ios" checked> iOS
                    </label>
                    <label class="btn btn-primary">
                        <input type="radio" name="_bt_avan_rad" id="_bt_avan_option_android" value="_opc_avan_android"  > Android
                    </label>                                    
                </div>
            </div>
            <div id="_opc_avan_ios">
                <div class="row">
                    <div class="col-md-5 col-sm-12"> 
                        <div class="row  form-group">
                            <label for="_opc_avan_target-device" class=" opc_ios">Target Device Type:</label>
                            <select name="_opc_avan_target-device" id="_opc_avan_target-device"  class="form-control"  >
                                <option value="universal" selected="selected">universal</option>
                                <option value="tablet">tablet</option>
                                <option value="handset">handset</option>
                            </select>
                        </div>
                    </div>                                        
                </div>
                <div class="row">                    
                    <div class="col-md-5 col-sm-12"> 
                        <div class="row form-group">
                            <label for="_opc_avan_deployment-target" class="">Deployment target</label>
                            <input type="text" name="_opc_avan_deployment-target" id="_opc_avan_deployment-target" class="form-control"/>

                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_CKBF_detect-data-types" class="">Detect Data Type</label>
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
                            <label for="_opc_avan_CKBT_prerendered-icon" class="">Prerendered Icon</label>
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
                            <label for="_opc_avan_CKBT_exit-on-suspend" class="">Exit on Suspend</label>
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
                            <label for="_opc_avan_ios-statusbarstyle" class="">Status Bar Style</label>
                            <select name="_opc_avan_ios-statusbarstyle" id="_opc_avan_ios-statusbarstyle" class="form-control" >
                                <option value="default" selected="selected">default</option> 
                                <option value="black-opaque">black-opaque</option>
                                <option value="black-translucent">black-translucent</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_CKBT_MediaPlaybackRequiresUserAction" class="">Media Playback Requires User Action</label>
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
                            <label for="_opc_avan_CKBT_EnableViewportScale" class="">Enable ViewPort Scalling</label>
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
                            <label for="_opc_avan_CKBT_AllowInlineMediaPlayback" class="">Allow Inline Media Playback</label>
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
                            <label for="_opc_avan_BackupWebStorage" class="">Backup Web Storage</label>
                            <select name="_opc_avan_BackupWebStorage" id="_opc_avan_BackupWebStorage" class="form-control" >
                                <option value="none">none</option>
                                <option value="local">local</option>
                                <option value="cloud" selected="selected">cloud</option>                                
                            </select>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_CKBT_SuppressesIncrementalRendering" class="">Supress Incremental Rendering</label>
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
                            <label for="_opc_avan_TopActivityIndicator" class="">Top Activity Indicator</label>
                            <select name="_opc_avan_TopActivityIndicator" id="_opc_avan_TopActivityIndicator" class="form-control" >
                                <option value="whiteLarge">whiteLarge</option>
                                <option value="white">white</option>
                                <option value="gray" selected="selected">gray</option>   
                            </select>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_CKBF_KeyboardDisplayRequiresUserAction" class="">Keyboard Diplay requires User Action</label>
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
                            <label for="_opc_avan_GapBetweenPages" class="">Gap Between Pages</label>
                            <input type="text" name="_opc_avan_GapBetweenPages" id="_opc_avan_GapBetweenPages" placeholder="Distancia en puntos entre las paginas" class="form-control"/>

                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_PageLength" class="">Page Length</label>
                            <input type="text" name="_opc_avan_PageLength" id="_opc_avan_PageLength" placeholder="el tamaño de cada pagina en puntos." class="form-control"/>                                                        
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_PaginationBreakingMode" class="">Pagination Breaking Mode</label>
                            <select name="_opc_avan_PaginationBreakingMode" id="_opc_avan_PaginationBreakingMode" class="form-control" >
                                <option value="page" selected="selected">page</option>
                                <option value="column">column</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_PaginationMode" class="">Pagination Mode</label>
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
                        <div class="row  form-group">
                            <label for="_opc_avan_UIWebViewDecelerationSpeed" class="">UI Web View Deceleration Speed</label>
                            <select name="_opc_avan_UIWebViewDecelerationSpeed" id="_opc_avan_UIWebViewDecelerationSpeed" class="form-control" >
                                <option value="normal" selected="selected">normal</option>
                                <option value="fast">fast</option>
                            </select>
                        </div>
                    </div>
                </div>

            </div>
            <div id="_opc_avan_android">
                <div class="row">
                    <div class="col-md-5 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_version_code" class="opc_android">Versi&oacute;n Code:</label>
                            <input type="text" name="_opc_avan_version_code" id="_opc_avan_version_code"  class="form-control" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_android-minSdkVersion" class="">Minima Versi&oacute;n SDK</label>
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
                            <label for="_opc_avan_SplashScreenDelay" class="">Splash Screen Duration</label>
                            <input type="text" name="_opc_avan_SplashScreenDelay" id="_opc_avan_SplashScreenDelay"  class="form-control" placeholder="Tiempo en milisegundos que se va a mostrar el splash" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_android-maxSdkVersion" class="">Maxima Versi&oacute;n SDK</label>
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
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_android-windowSoftInputMode" class="">Window Soft. Input Mode</label>
                            <input type="text" name="_opc_avan_android-windowSoftInputMode" id="_opc_avan_android-windowSoftInputMode"  class="form-control" placeholder="Consulte http://developer.android.com/guide/topics/manifest/activity-element.html#wsoft"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_android-targetSdkVersion" class="">Target Versi&oacute;n SDK</label>
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
                            <label for="_opc_avan_LoadingDialog" class="">Titulo y Mensajes del Dialogo de carga</label>
                            <input type="text" name="_opc_avan_LoadingDialog" id="_opc_avan_LoadingDialog"  class="form-control" placeholder="Especifica el titulo y el mensaje de carga, separados por una coma (,)"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_android-installLocation" class="">Localizacion de la Instalacion.</label>
                            <select name="_opc_avan_android-installLocation" id="_opc_avan_android-installLocation" class="form-control" >
                                <option value="internalOnly" selected="selected">internalOnly</option>
                                <option value="auto">auto</option>
                                <option value="preferExternal">preferExternal</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_AndroidLaunchMode" class="">AndroidLaunchMode</label>
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
                            <label for="_opc_avan_CKBF_KeepRunning" class="">Keep Running in Background</label>
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
                            <label for="_opc_avan_LoadUrlTimeoutValue" class="opc_android">Load URL timeout</label>
                            <input type="text" name="_opc_avan_LoadUrlTimeoutValue" id="_opc_avan_LoadUrlTimeoutValue"  class="form-control" placeholder="El tiempo en milisegundos que espera para lanzar error de timeout" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-12 ">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_SplashScreen" class="">Splash Screen</label>
                            <input type="text"  name="_opc_avan_SplashScreen" id="_opc_avan_SplashScreen" class="form-control" placeholder="Nombre menos la extension del fichero splash."/>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_CKBT_ShowTitle" class="">Show Title</label>
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
                            <label for="_opc_avan_CKBF_InAppBrowserStorageEnabled" class="">In AppBrowser Storage Enabled</label>
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
                            <label for="_opc_avan_LoadingPageDialog" class="">Titulo y Mensaje del Dialogo de carga de otras paginas</label>
                            <input type="text" name="_opc_avan_LoadingPageDialog" id="_opc_avan_LoadingPageDialog"  class="form-control" placeholder="Especifica el titulo y el mensaje de carga cuando no es la pagina inicial, separados por una coma (,)"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-sm-12">                                
                        <div class="row  form-group">
                            <label for="_opc_avan_LogLevel" class="">Log Level.</label>
                            <select name="_opc_avan_LogLevel" id="_opc_avan_LogLevel" class="form-control" >
                                <option value="ERROR" selected="selected">ERROR</option>
                                <option value="WARN">WARN</option>
                                <option value="INFO">INFO</option>
                                <option value="DEBUG">DEBUG</option>
                                <option value="VERBOSE">VERBOSE</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-2 col-sm-12">                                
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>