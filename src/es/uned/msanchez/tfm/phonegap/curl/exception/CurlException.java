package es.uned.msanchez.tfm.phonegap.curl.exception;

/**
 * Clase que implemta las excepciones que se generan en la clase Curl
 *
 * @author Miguel Sánchez Román
 */
public class CurlException extends Exception {

    private Throwable causa;
    private String mensaje;

    /**
     * Constructor de la expceiocn CurlException
     *
     * @param causa
     * @param mensaje
     */
    public CurlException(Throwable causa, String mensaje) {
        this.causa = causa;
        this.mensaje = mensaje;
    }

    /**
     * Constructor de la expceiocn CurlException
     *
     * @param mensaje
     */
    public CurlException(String mensaje) {

        this.causa = new Exception(mensaje);
        this.mensaje = mensaje;
    }

    /**
     * Obtiene el mensaje con la descripcion de la excepcion
     *
     * @return
     */
    @Override
    public String getMessage() {
        return this.mensaje;
    }

    /**
     * Obtiene la causa de la excepcion
     *
     * @return
     */
    @Override
    public Throwable getCause() {
        return this.causa;
    }
}
