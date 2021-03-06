package com.qaii.service;

import com.qaii.domain.IndustryExchangeTalksFiles;
import com.qaii.domain.SigningAgreementFiles;

import java.util.List;

/**
 * Created by kunpeng on 2019/1/21 11:01
 */
public interface SigningAgreementFilesService {

    int deleteByPrimaryKey(Integer[] id);

    int insert(SigningAgreementFiles record);

    int insertSelective(SigningAgreementFiles record);

    SigningAgreementFiles selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SigningAgreementFiles record);

    int updateByPrimaryKey(SigningAgreementFiles record);

    List<SigningAgreementFiles> selectFilePathBysigningagreementId(Integer[] id);
}
