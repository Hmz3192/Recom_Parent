package com.zjnu.pojo;

import java.util.HashMap;
import java.util.Set;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/2/24.
 */
public class RolePermissionPojo {

    String account;
    Set<String> rolesKey;
    Set<String> permissionsKey;
    HashMap<String,String> rolesAndName;
    HashMap<String,String> permissionsAndUrl;


    public RolePermissionPojo() {
    }

    public Set<String> getRolesKey() {
        return rolesKey;
    }

    public void setRolesKey(Set<String> rolesKey) {
        this.rolesKey = rolesKey;
    }

    public Set<String> getPermissionsKey() {
        return permissionsKey;
    }

    public void setPermissionsKey(Set<String> permissionsKey) {
        this.permissionsKey = permissionsKey;
    }

    public RolePermissionPojo(String account, Set<String> rolesKey, Set<String> permissionsKey, HashMap<String, String> rolesAndName, HashMap<String, String> permissionsAndUrl) {

        this.account = account;
        this.rolesKey = rolesKey;
        this.permissionsKey = permissionsKey;
        this.rolesAndName = rolesAndName;
        this.permissionsAndUrl = permissionsAndUrl;
    }

    public String getAccount() {

        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public HashMap<String, String> getRolesAndName() {
        return rolesAndName;
    }

    public void setRolesAndName(HashMap<String, String> rolesAndName) {
        this.rolesAndName = rolesAndName;
    }

    public HashMap<String, String> getPermissionsAndUrl() {
        return permissionsAndUrl;
    }

    public void setPermissionsAndUrl(HashMap<String, String> permissionsAndUrl) {
        this.permissionsAndUrl = permissionsAndUrl;
    }
}
