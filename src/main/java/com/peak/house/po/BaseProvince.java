package com.peak.house.po;

import java.util.Date;

public class BaseProvince {
    private String provincecode;

    private String provincename;

    private Boolean openbusinessflag;

    private Date addtime;

    public String getProvincecode() {
        return provincecode;
    }

    public void setProvincecode(String provincecode) {
        this.provincecode = provincecode == null ? null : provincecode.trim();
    }

    public String getProvincename() {
        return provincename;
    }

    public void setProvincename(String provincename) {
        this.provincename = provincename == null ? null : provincename.trim();
    }

    public Boolean getOpenbusinessflag() {
        return openbusinessflag;
    }

    public void setOpenbusinessflag(Boolean openbusinessflag) {
        this.openbusinessflag = openbusinessflag;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}