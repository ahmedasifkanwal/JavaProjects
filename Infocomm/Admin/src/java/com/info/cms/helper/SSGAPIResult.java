/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.info.cms.helper;

/**
 *
 * @author software1
 */
public class SSGAPIResult {
     private String _operation;// The name of the operation, Add,Update,Delete
    private String _version;// vesion of the API like  1.1.1
    private String _result;// Final result of the call like  ok
    private String _resultcode;//Return code like 0
    private String _no_of_user_created_user;//number of user creted
    private String _multi_Results;//result apart from Final result for multi user pipe separate= ok|ok|ok;
    private String _userid;// user id
    private String _password;// password
    private String _no_of_deleted_user;//number of user deleted
     private String _errorMessage;
    private String _liveConnectedDevice = "0";
    private String _liveLogginUser = "0";

    /**
     * @return the _operation
     */
    public String getOperation() {
        return _operation;
    }

    /**
     * @param operation the _operation to set
     */
    public void setOperation(String operation) {
        this._operation = operation;
    }

    /**
     * @return the _version
     */
    public String getVersion() {
        return _version;
    }

    /**
     * @param version the _version to set
     */
    public void setVersion(String version) {
        this._version = version;
    }

    /**
     * @return the _result
     */
    public String getResult() {
        return _result;
    }

    /**
     * @param result the _result to set
     */
    public void setResult(String result) {
        this._result = result;
    }

    /**
     * @return the _resultcode
     */
    public String getResultcode() {
        return _resultcode;
    }

    /**
     * @param resultcode the _resultcode to set
     */
    public void setResultcode(String resultcode) {
        this._resultcode = resultcode;
    }

    /**
     * @return the _no_of_user_created_user
     */
    public String getNoofusercreated() {
        return _no_of_user_created_user;
    }

    /**
     * @param no_of_user_created_user the _no_of_user_created_user to set
     */
    public void setNoofusercreated (String no_of_user_created_user) {
        this._no_of_user_created_user = no_of_user_created_user;
    }

    /**
     * @return the _multi_Results
     */
    public String getMultiResults() {
        return _multi_Results;
    }

    /**
     * @param multi_Results the _multi_Results to set
     */
    public void setMultiResults(String multi_Results) {
        this._multi_Results = multi_Results;
    }

    /**
     * @return the _userid
     */
    public String getUserid() {
        return _userid;
    }

    /**
     * @param userid the _userid to set
     */
    public void setUserid(String userid) {
        this._userid = userid;
    }

    /**
     * @return the _password
     */
    public String getPassword() {
        return _password;
    }

    /**
     * @param password the _password to set
     */
    public void setPassword(String password) {
        this._password = password;
    }

    /**
     * @return the _no_of_deleted_user
     */
    public String getNoofdeleteduser() {
        return _no_of_deleted_user;
    }

    /**
     * @param no_of_deleted_user the _no_of_deleted_user to set
     */
    public void setNoofdeleteduser(String no_of_deleted_user) {
        this._no_of_deleted_user = no_of_deleted_user;
    }

    /**
     * @return the _errorMessage
     */
    public String getErrorMessage() {
        return _errorMessage;
    }

    /**
     * @param errorMessage the _errorMessage to set
     */
    public void setErrorMessage(String errorMessage) {
        this._errorMessage = errorMessage;
    }

    /**
     * @return the _liveConnectedDevice
     */
    public String getLiveConnectedDevice() {
        return _liveConnectedDevice;
    }

    /**
     * @param _liveConnectedDevice the _liveConnectedDevice to set
     */
    public void setLiveConnectedDevice(String _liveConnectedDevice) {
        this._liveConnectedDevice = _liveConnectedDevice;
    }

    /**
     * @return the _liveLogginUser
     */
    public String getLiveLogginUser() {
        return _liveLogginUser;
    }

    /**
     * @param _liveLogginUser the _liveLogginUser to set
     */
    public void setLiveLogginUser(String _liveLogginUser) {
        this._liveLogginUser = _liveLogginUser;
    }
}
