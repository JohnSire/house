package com.peak.house.po;

import java.util.Date;

public class BaseCity {
    private String citycode;

    private String cityname;

    private String provincecode;

    private Boolean bussinessopenflag;

    private Date addtime;

    public String getCitycode() {
        return citycode;
    }

    public void setCitycode(String citycode) {
        this.citycode = citycode == null ? null : citycode.trim();
    }

    public String getCityname() {
        return cityname;
    }

    public void setCityname(String cityname) {
        this.cityname = cityname == null ? null : cityname.trim();
    }

    public String getProvincecode() {
        return provincecode;
    }

    public void setProvincecode(String provincecode) {
        this.provincecode = provincecode == null ? null : provincecode.trim();
    }

    public Boolean getBussinessopenflag() {
        return bussinessopenflag;
    }

    public void setBussinessopenflag(Boolean bussinessopenflag) {
        this.bussinessopenflag = bussinessopenflag;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}