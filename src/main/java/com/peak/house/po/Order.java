package com.peak.house.po;

import java.io.Serializable;
import java.util.Date;



import com.peak.house.commons.domain.QueryPage;

public class Order extends QueryPage implements Serializable{
    private Long id;

    private Date addtime;

    private Long uid;

    private Long hid;

    private Long aid;

    private Double realprice;
    /*************/
    //user
    private String phone;
    private String nickname;
    //agent
    private String aphone;
    private String anickname;
    
    private String village;//小区
    

    public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getAphone() {
		return aphone;
	}

	public void setAphone(String aphone) {
		this.aphone = aphone;
	}

	public String getAnickname() {
		return anickname;
	}

	public void setAnickname(String anickname) {
		this.anickname = anickname;
	}

	public String getVillage() {
		return village;
	}

	public void setVillage(String village) {
		this.village = village;
	}

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Long getHid() {
        return hid;
    }

    public void setHid(Long hid) {
        this.hid = hid;
    }

    public Long getAid() {
        return aid;
    }

    public void setAid(Long aid) {
        this.aid = aid;
    }

    public Double getRealprice() {
        return realprice;
    }

    public void setRealprice(Double realprice) {
        this.realprice = realprice;
    }
}