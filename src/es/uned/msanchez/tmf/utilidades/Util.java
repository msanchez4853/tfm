/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.uned.msanchez.tmf.utilidades;

import java.util.List;
import org.jdom2.Element;

/**
 *
 * @author adrastea
 */
public class Util {
    
    public static boolean isNulo(String _cadena){
        if(_cadena==null || _cadena.trim().equals("")){
            return true;
        }
        else{
            return false;
        }
    }
    
    public static boolean isNulo(Object _obj){
        if(_obj==null){
            return true;
        }
        else{
            return false;
        }
    }
    
    public static boolean isNulo(Element _elem){
       if(_elem==null){               
            return true;
        }
        else{
            return false;
        } 
        
    }
    
    public static boolean isNulo(List _list){ 
       if(_list==null || _list.size()==0){               
            return true;
        } 
        else{ 
            return false; 
        } 
        
    }
}
