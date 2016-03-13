package com.peak.house.po;

import java.io.Serializable;

import org.hibernate.validator.constraints.NotEmpty;

import com.peak.house.commons.domain.QueryPage;

public class House extends QueryPage implements Serializable{
    private Long id;

    private String village;//小区

    private Double price;//售价

    private Double unitprice;//单价

    private Double acreage;//面积

    private Integer hand;//1 新房  2 二手

    private Integer type;//房型：1室 2室 3室。。5室以上

    private String orientation;//朝向  东南西北  南北

    private Integer age;//楼龄  5、10、10-20、20+

    private Integer floor;//楼层   低8 中8-15 高15+

    private Double downpay;//首付
    
    private Integer month;//月数
    
    private Double monthpay;//月供

    private String image;

    private String areaid;//所在省市区的区
    
    /*******************************/
    
    private String province;//省
    private String city;//市
    private String district;//区
    
    private String provinceCode;
    private String cityCode;
    private String districtCode;
    
    private Double xprice;//小于
    private Double pricex;//大于
    
    /***********sell***********/
    private Long sid;
    private String title;
    private String content;
    
    /************agent*************/
    private Long aid;
    private String phone;
    private String nickname;
    /**********attention********/
    private Long atid;
    
    
    
    public String getProvinceCode() {
		return provinceCode;
	}
	public void setProvinceCode(String provinceCode) {
		this.provinceCode = provinceCode;
	}
	public String getCityCode() {
		return cityCode;
	}
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	public String getDistrictCode() {
		return districtCode;
	}
	public void setDistrictCode(String districtCode) {
		this.districtCode = districtCode;
	}
	public Long getAtid() {
		return atid;
	}
	public void setAtid(Long atid) {
		this.atid = atid;
	}

	public Long getSid() {
		return sid;
	}

	public void setSid(Long sid) {
		this.sid = sid;
	}

	public Long getAid() {
		return aid;
	}

	public void setAid(Long aid) {
		this.aid = aid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

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

	public Double getXprice() {
		return xprice;
	}

	public void setXprice(Double xprice) {
		this.xprice = xprice;
	}

	public Double getPricex() {
		return pricex;
	}

	public void setPricex(Double pricex) {
		this.pricex = pricex;
	}


    public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

    public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getVillage() {
        return village;
    }

    public void setVillage(String village) {
        this.village = village == null ? null : village.trim();
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(Double unitprice) {
        this.unitprice = unitprice;
    }

    public Double getAcreage() {
        return acreage;
    }

    public void setAcreage(Double acreage) {
        this.acreage = acreage;
    }

    public Integer getHand() {
        return hand;
    }

    public void setHand(Integer hand) {
        this.hand = hand;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getOrientation() {
        return orientation;
    }

    public void setOrientation(String orientation) {
        this.orientation = orientation == null ? null : orientation.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getFloor() {
        return floor;
    }

    public void setFloor(Integer floor) {
        this.floor = floor;
    }

    public Double getDownpay() {
        return downpay;
    }

    public void setDownpay(Double downpay) {
        this.downpay = downpay;
    }

    public Double getMonthpay() {
        return monthpay;
    }

    public void setMonthpay(Double monthpay) {
        this.monthpay = monthpay;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public String getAreaid() {
        return areaid;
    }

    public void setAreaid(String areaid) {
        this.areaid = areaid == null ? null : areaid.trim();
    }

    
}