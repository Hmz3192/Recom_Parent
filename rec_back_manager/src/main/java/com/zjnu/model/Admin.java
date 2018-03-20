package com.zjnu.model;

import java.io.Serializable;

public class Admin implements Serializable{
    private Integer adminId;

    private String adminName;

    private String password;

    private String registerTime;

    private String phone;

    public Admin(Integer adminId, String adminName, String password, String registerTime, String phone) {
        this.adminId = adminId;
        this.adminName = adminName;
        this.password = password;
        this.registerTime = registerTime;
        this.phone = phone;
    }

    public Admin() {
        super();
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName == null ? null : adminName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(String registerTime) {
        this.registerTime = registerTime == null ? null : registerTime.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }
}