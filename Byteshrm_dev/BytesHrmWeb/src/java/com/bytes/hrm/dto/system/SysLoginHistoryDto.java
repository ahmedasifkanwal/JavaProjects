/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.system;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
public class SysLoginHistoryDto implements Serializable {
    
    private BigDecimal id;
    private String userName;
    private String loginStatus;
    private String loc;
    private Date loginDatetime;
    private String mac;
    private String ip;
    private String host;
    private String country;
    private String port;
    private String emailId;
    private String usertype;
//ok
    public SysLoginHistoryDto() {
    }

    public SysLoginHistoryDto(BigDecimal id) {
        this.id = id;
    }

    public SysLoginHistoryDto(BigDecimal id, String userName) {
        this.id = id;
        this.userName = userName;
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getLoginStatus() {
        return loginStatus;
    }

    public void setLoginStatus(String loginStatus) {
        this.loginStatus = loginStatus;
    }

    public String getLoc() {
        return loc;
    }

    public void setLoc(String loc) {
        this.loc = loc;
    }

    public Date getLoginDatetime() {
        return loginDatetime;
    }

    public void setLoginDatetime(Date loginDatetime) {
        this.loginDatetime = loginDatetime;
    }

    public String getMac() {
        return mac;
    }

    public void setMac(String mac) {
        this.mac = mac;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SysLoginHistoryDto)) {
            return false;
        }
        SysLoginHistoryDto other = (SysLoginHistoryDto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.info.wifi.SysLoginHistory[ id=" + id + " ]";
    }

    /**
     * @return the usertype
     */
    public String getUsertype() {
        return usertype;
    }

    /**
     * @param usertype the usertype to set
     */
    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }
    
}
