package com.qaii.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * Created by kunpeng on 2019/1/4 10:37
 */
//解决接口中奖励荣誉获奖情况只查看四个字段的情况
public class AwardCollegest {
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private String awardTime;

    private String awardLevel;

    private String awardUnit;

    private String awardName;

    public String getAwardTime() {
        return awardTime;
    }

    public void setAwardTime(String awardTime) {
        this.awardTime = awardTime;
    }

    public String getAwardLevel() {
        return awardLevel;
    }

    public void setAwardLevel(String awardLevel) {
        this.awardLevel = awardLevel;
    }

    public String getAwardUnit() {
        return awardUnit;
    }

    public void setAwardUnit(String awardUnit) {
        this.awardUnit = awardUnit;
    }

    public String getAwardName() {
        return awardName;
    }

    public void setAwardName(String awardName) {
        this.awardName = awardName;
    }
}
