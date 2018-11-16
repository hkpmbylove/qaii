package com.qaii.dao;

import com.qaii.domain.Incubator;

import java.util.Date;
import java.util.List;

public interface IncubatorMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Incubator record);

    int insertSelective(Incubator record);

    Incubator selectByPrimaryKey(Integer id);
    List<String> selectestablishtime();
    int selectCountNums(String establishtime);
    int updateByPrimaryKeySelective(Incubator record);

    int updateByPrimaryKey(Incubator record);
}