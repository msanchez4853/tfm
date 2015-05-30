/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(window).ready(function(){
    ajustartam();
    defineEvents();  
    
    
}
);
$(window).resize(function(){
    ajustartam();
        
}
);

function ajustartam(){
    var h_contenido = $(window).height() -170;
    $("#navegacion").height(40)
    $("#pie").height(60)
    $("#contenido").height(h_contenido);
    $("div.panel").height(h_contenido+20);
    $("div.panel-body").height(h_contenido-65);
}

function defineEvents(){
    
    
    
}