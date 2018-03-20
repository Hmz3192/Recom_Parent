package com.zjnu.model;

import java.io.Serializable;

public class Permission implements Serializable {
    private Integer permissionId;

    private String permissionName;

    private String permissionUrl;

    public Permission(Integer permissionId, String permissionName, String permissionUrl) {
        this.permissionId = permissionId;
        this.permissionName = permissionName;
        this.permissionUrl = permissionUrl;
    }

    public Permission() {
        super();
    }

    public Integer getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(Integer permissionId) {
        this.permissionId = permissionId;
    }

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName == null ? null : permissionName.trim();
    }

    public String getPermissionUrl() {
        return permissionUrl;
    }

    public void setPermissionUrl(String permissionUrl) {
        this.permissionUrl = permissionUrl == null ? null : permissionUrl.trim();
    }
}