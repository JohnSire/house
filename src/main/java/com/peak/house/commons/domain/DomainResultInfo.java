package com.peak.house.commons.domain;

import java.io.Serializable;

/**
 * 返回bean
 */
public class DomainResultInfo implements Serializable {
    private ResultInfo resultInfo;

    private Object domain;

    public DomainResultInfo() {
    }

    public DomainResultInfo(ResultInfo resultInfo) {
        this.resultInfo = resultInfo;
    }

    public ResultInfo getResultInfo() {
        return resultInfo;
    }

    public void setResultInfo(ResultInfo resultInfo) {
        this.resultInfo = resultInfo;
    }

    public Object getDomain() {
        return domain;
    }

    public void setDomain(Object domain) {
        this.domain = domain;
    }
}
