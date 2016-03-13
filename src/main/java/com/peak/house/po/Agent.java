package com.peak.house.po;

import java.io.Serializable;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

import com.peak.house.commons.domain.QueryPage;

public class Agent extends QueryPage implements Serializable{
    private Long id;

    @Pattern(regexp = "^[1][358][0-9]{9}$",message="{phone.error}")
    private String phone;

    @NotEmpty(message = "{nickname.notempty}")
    private String nickname;

    private String gender;

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
}