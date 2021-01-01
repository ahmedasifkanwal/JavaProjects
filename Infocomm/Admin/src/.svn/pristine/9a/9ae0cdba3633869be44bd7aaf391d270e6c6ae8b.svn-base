/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.helper;

/**
 *
 * @author SALEEM
 */
public class BusinessException extends Exception {

    private String message = null;
    private String trace = null;

    /**
     *
     */
    public BusinessException() {
        super();
    }

    /**
     *
     * @param message
     */
    public BusinessException(String message) {
        super(message);
        this.message = message;
    }

    /**
     *
     * @param component
     * @param ex
     */
    public BusinessException(String component, Exception ex) {

        super(ex.getMessage());
        this.message = ex.getMessage();

    }

    /**
     *
     * @param message
     * @param cause
     */
    public BusinessException(String message, Throwable cause) {
        super(message, cause);
        this.message = message;

    }

    /**
     *
     * @param cause
     */
    public BusinessException(Throwable cause) {
        super(cause);
    }

    @Override
    public String toString() {
        return message;
    }

    @Override
    public String getMessage() {
        return message;
    }

    /**
     * @return the trace
     */
    public String getTrace() {
        return trace;
    }

    /**
     * @param trace the trace to set
     */
    public void setTrace(String trace) {
        this.trace = trace;
    }
}
