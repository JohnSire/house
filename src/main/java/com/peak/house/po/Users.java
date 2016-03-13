package com.peak.house.po;

import java.io.Serializable;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

import com.peak.house.commons.domain.QueryPage;

public class Users extends QueryPage implements Serializable{
	
    private Long id;

    @Pattern(regexp = "^[1][358][0-9]{9}$",message="{phone.error}")
    private String phone;

    @Pattern(regexp = "^[a-z0-9A-Z]{6,16}$",message="{password.error}")
    private String password;

    @NotEmpty(message = "{nickname.notempty}")
    private String nickname;

    private String gender;

    @NotEmpty(message = "{address.notempty}")
    private String address;
    
    private int type;

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

	@Override
	public String toString() {
		return "Users [id=" + id + ", phone=" + phone + ", password="
				+ password + ", nickname=" + nickname + ", gender=" + gender
				+ ", address=" + address + "]";
	}
    
}