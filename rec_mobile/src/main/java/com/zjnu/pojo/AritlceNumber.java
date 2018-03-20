package com.zjnu.pojo;

public class AritlceNumber {

    //已发布
    Long yf;
    //sheng shen zhong
    Long sh;
    //wei tong guo
    Long wg;
    //cao gao
    Long cg;

    public AritlceNumber() {
    }

    public Long getYf() {
        return yf;
    }

    public void setYf(Long yf) {
        this.yf = yf;
    }

    public Long getSh() {
        return sh;
    }

    public void setSh(Long sh) {
        this.sh = sh;
    }

    public Long getWg() {
        return wg;
    }

    public void setWg(Long wg) {
        this.wg = wg;
    }

    public Long getCg() {
        return cg;
    }

    public void setCg(Long cg) {
        this.cg = cg;
    }

    public AritlceNumber(Long yf, Long sh, Long wg, Long cg) {

        this.yf = yf;
        this.sh = sh;
        this.wg = wg;
        this.cg = cg;
    }
}