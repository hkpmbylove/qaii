package com.qaii.controller;

import com.qaii.domain.IncubatorRecord;
import com.qaii.service.IncubatorRecordService;
import com.qaii.util.ConstantUtil;
import com.qaii.util.DateUtils;
import com.qaii.util.JsonResult;
import com.qaii.util.Layui;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.Null;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class IncubatorRecordController {
    @Resource
    private IncubatorRecordService incubatorRecordService;
    //公司变更记录获取
    @ResponseBody
    @RequestMapping(value="selectRecordInfoByinId.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8")
    public Layui selectRecordInfoByinId(@RequestParam(value = "pid")Integer pid){
        if (pid!=null){
            List<IncubatorRecord> list=incubatorRecordService.selectByPrimaryKey(pid);
            int count =list.size();
            if (list!=null){
                for (IncubatorRecord in :list){
                    in.setListName(NameList(in.getListName()));
                }
                return Layui.data(count, list);
            }{
                return Layui.data(count, list);
            }
        }else {
            return Layui.data(null,null);
        }

    }

    //更新变更时间
    @RequestMapping(value="updataTime.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8")
    public String updataTime(HttpServletRequest req) throws UnsupportedEncodingException {
        req.setCharacterEncoding("UTF-8");
        IncubatorRecord incubatorRecord=new IncubatorRecord();
        try {
            incubatorRecord.setId(Integer.parseInt(req.getParameter("id")));
            String time=req.getParameter("time");
            Date times= DateUtils.parseStringToDate(time);
            incubatorRecord.setChangedTime(times);
        }catch (Exception e){
            return ConstantUtil.INDUSTRY_EDIT_FAILD;
        }
        int row =incubatorRecordService.updataTime(incubatorRecord);
        if(row!=0){
            return ConstantUtil.INDUSTRY_EDIT_SUCCESS;
        }else{
            return ConstantUtil.INDUSTRY_EDIT_FAILD;
        }

    }


    public String NameList(String n){
        String item=null;
       // String n="companyName";
        switch(n)
        {
            case "companyName":
                item="企业名称";
                break;
            case "creditCode":
                item="统一社会信用代码";
                break;
            case "establishTime":
                item="成立时间";
                break;
            case "companyType":
                item="公司类型";
                break;
            case "companyLocation":
                item="公司住所";
                break;
            case "legalRepresentative":
                item="法定代表人";
                break;
            case "registeredCapital":
                item="注册资本";
                break;
            case "businessScope":
                item="经营范围";
                break;
            case "incubatorName":
                item="所属孵化器";
                break;
            case "hatchingTime":
                item="入孵时间";
                break;
            case "limitedPeriod":
                item="有限期";
                break;
            case "isThousandSailEnterprise":
                item="是否'千帆计划'入库企业";
                break;
            case "isHighTechnologyEnterprise":
                item="是否高新技术企业";
                break;
            case "isBillionEnterprise":
                item="是否青岛市科技型企业培育’百千万‘工程";
                break;
            default:
                item="变更记录显示异常";
        }
        return  item;
    }


}
