package com.qaii.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qaii.service.ChilddeptService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qaii.domain.DeptInfo;
import com.qaii.domain.EmpInfo;
import com.qaii.service.DeptInfoService;
import com.qaii.util.JsonResult;
import com.qaii.util.Layui;

@Controller
public class deptController {
	@Resource
	private DeptInfoService deptInfoService;
	@Resource
	private ChilddeptService childdeptService;
	
	@RequestMapping("dept.do")
	public String dept(){
		return "page/indexNav";
	}
	
	//部门列表
	@ResponseBody
	@RequestMapping(value="findDeptInfoList.do",method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	public JsonResult findDeptInfoList() {
		List<DeptInfo> deptInfo=deptInfoService.findAllRoleList();
		int count =deptInfo.size();
			if(deptInfo!=null) {
				return new JsonResult(deptInfo);
			}else {
				return new JsonResult();
			}
		
		
	}
	
	
	//删除部门信息
    @ResponseBody
    @RequestMapping(value="dellDeptInfo.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8")
    public JsonResult DellempInfo(@RequestParam(value = "requestDate") Integer id ){
     	int row=deptInfoService.dellDeptInfoByid(id);
     	//这里是为了执行在删除一级菜单的时候将其下属的二级菜单也删除掉
		int rows=childdeptService.deletePid(id);
    	if(row!=0) {
    		return  new JsonResult(row);
    	}else {
    		return  new JsonResult();
    		
    	}
        
    }
	
	//添加部门信息
    @ResponseBody
    @RequestMapping(value="addDeptInfo.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8")
    public JsonResult addDeptInfo(HttpServletRequest req,DeptInfo dept){
     	dept.setDeptName(req.getParameter("deptName"));
     	int row=deptInfoService.addDeptInfo(dept);
    	if(row!=0) {
    		return  new JsonResult(row);
    	}else {
    		return  new JsonResult();
    		
    	}
        
    }
	
	//修改部门信息
    @ResponseBody
    @RequestMapping(value="uptateDeptInfo.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8")
    public JsonResult uptateDeptInfo(HttpServletRequest req,DeptInfo dept){
     	dept.setDeptName(req.getParameter("deptName"));
     	dept.setId(Integer.parseInt(req.getParameter("id")));
     	int row=deptInfoService.updateDeptInfoById(dept);
    	if(row!=0) {
    		return  new JsonResult(row);
    	}else {
    		return  new JsonResult();
    		
    	}
    }
    
    //chaxun bumen xingming 
    @RequestMapping(value="getdeptName.do",method=RequestMethod.POST)
    @ResponseBody
    public List<String> getdeptName(){
    	List<DeptInfo>list=deptInfoService.findAllRoleList();
		List<String> s=new ArrayList<>();
		for(DeptInfo s1:list) {
			s.add(s1.getDeptName());
		}
    	return s;
    }
	
}
