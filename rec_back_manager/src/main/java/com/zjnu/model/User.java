package com.zjnu.model;

import java.io.Serializable;

public class User implements Serializable {
    private Long userId;

    private String userName;

    private String password;

    private String email;

    private String work;

    private Integer age;

    private Integer sex;

    private String location;

    private String avatar;

    private String phone;

    private Integer vip;

    private String introduction;

    public User(Long userId, String userName, String password, String email, String work, Integer age, Integer sex, String location, String avatar, String phone, Integer vip, String introduction) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.work = work;
        this.age = age;
        this.sex = sex;
        this.location = location;
        this.avatar = avatar;
        this.phone = phone;
        this.vip = vip;
        this.introduction = introduction;
    }

    public User() {
        super();
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work == null ? null : work.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location == null ? null : location.trim();
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar == null ? null : avatar.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getVip() {
        return vip;
    }

    public void setVip(Integer vip) {
        this.vip = vip;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }
}