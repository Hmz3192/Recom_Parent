package com.zjnu.pojo;

import java.util.List;

public class NeoResultJson {

    private String resultJson;

    private List<NeoUser> neoUsers;

    public NeoResultJson() {
    }

    public NeoResultJson(String resultJson, List<NeoUser> neoUsers) {

        this.resultJson = resultJson;
        this.neoUsers = neoUsers;
    }

    public String getResultJson() {

        return resultJson;
    }

    public void setResultJson(String resultJson) {
        this.resultJson = resultJson;
    }

    public List<NeoUser> getNeoUsers() {
        return neoUsers;
    }

    public void setNeoUsers(List<NeoUser> neoUsers) {
        this.neoUsers = neoUsers;
    }

    public static class NeoUser{
        private String neoName;
        private String neoAge;
        private String neoSex;
        private String neoPower;
        private String neoIntro;

        public NeoUser() {
        }

        public NeoUser(String neoName, String neoAge, String neoSex, String neoPower, String neoIntro) {

            this.neoName = neoName;
            this.neoAge = neoAge;
            this.neoSex = neoSex;
            this.neoPower = neoPower;
            this.neoIntro = neoIntro;
        }

        public String getNeoName() {

            return neoName;
        }

        public void setNeoName(String neoName) {
            this.neoName = neoName;
        }

        public String getNeoAge() {
            return neoAge;
        }

        public void setNeoAge(String neoAge) {
            this.neoAge = neoAge;
        }

        public String getNeoSex() {
            return neoSex;
        }

        public void setNeoSex(String neoSex) {
            this.neoSex = neoSex;
        }

        public String getNeoPower() {
            return neoPower;
        }

        public void setNeoPower(String neoPower) {
            this.neoPower = neoPower;
        }

        public String getNeoIntro() {
            return neoIntro;
        }

        public void setNeoIntro(String neoIntro) {
            this.neoIntro = neoIntro;
        }
    }
}
