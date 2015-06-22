/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package es.uned.msanchez.tfm.phonegap.curl.exception;

/**
 *
 * @author adrastea
 */
public class CurlException extends Exception{

    private Throwable causa;
    private String mensaje;
    

    public CurlException(Throwable causa, String mensaje) {
        this.causa = causa;
        this.mensaje = mensaje;
    }

    public CurlException( String mensaje) {
        
        this.causa = new Exception(mensaje);
        this.mensaje = mensaje;
    }

    
    
    @Override
    public String getMessage() {
        return this.mensaje;
    }

    @Override
    public Throwable getCause() {
        return this.causa;
    }
    
}
