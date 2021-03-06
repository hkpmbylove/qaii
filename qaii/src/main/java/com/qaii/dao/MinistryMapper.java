package com.qaii.dao;

import com.qaii.domain.Ministry;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.ss.formula.functions.T;

import java.util.List;

public interface MinistryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Ministry record);

    int insertSelective(Ministry record);

    Ministry selectByPrimaryKey(Integer id);
    int selectCountNums(String ministrytime);
    List<String> listministrytime();
    int updateByPrimaryKeySelective(Ministry record);

    int updateByPrimaryKey(Ministry record);

    int insertRecordReturnID(Ministry record);

    int deleteByPrimaryKeys(Integer[] id);

    List<Ministry> listRecords();

    Ministry getRecord(Integer id);

    List<String> selectministryName();

    List<String> selectministryName1();

    List<T> selectInfoByName(@Param("name")String name);
}