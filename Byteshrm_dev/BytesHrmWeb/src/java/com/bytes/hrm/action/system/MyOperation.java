/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.action.system;

/**
 *This interface  will be implemented 
 * in each action class to generate default methods
 * @author Saleem
 */
public interface MyOperation {
    public void initialize();

    public void validateSearchInput();

    public String search();

    public void validateSaveInput();

    public String save();

    public void validateEditInput();

    public String edit();
     public String getSelected();
}
