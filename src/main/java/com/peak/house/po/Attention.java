package com.peak.house.po;

import java.io.Serializable;

import com.peak.house.commons.domain.QueryPage;

public class Attention extends QueryPage implements Serializable{
    private Long id;

	private Long uid;

    private Long sid;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    public Long getSid() {
  		return sid;
  	}

  	public void setSid(Long sid) {
  		this.sid = sid;
  	}


    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

}