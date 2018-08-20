<!DOCTYPE html>
<html>
<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <title>成员管理</title>
  <link rel="stylesheet" href="${basePath}/commen/layui/css/layui.css" media="all" />
  <link rel="stylesheet" href="${basePath}/commen/layui/css/layuiAdd.css" media="all" />
	<script src="${basePath}/js/jquery-3.3.1.min.js"></script>
	<script src="${basePath}/js/jquery.table2excel.js"></script>
  <style>
    body{margin: 10px;}
    .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
	.noExl {
    display: none;
}
  </style>
</head>
<body id="bodyHei">
<div class="tool">
	<div class="layui-btn-group demoTable">
  	  <span class="limit">成员管理（165）</span>
		<a href="adddetail.html" target="_blank">
			<button class="layui-btn btn" style="margin-left:40px !important;margin-right:16px !important">
				<i class="layui-icon layui-icon-add-1"></i>添加
			</button>
		</a>
		<button class="layui-btn btn" data-type="getCheckLength" style="margin-right:16px !important">
			<i class="layui-icon layui-icon-delete"></i>删除
		</button>
		
		<button class="layui-btn btn" data-type="getCheckLength">
			<i class="layui-icon layui-icon-refresh-3"></i>更新
		</button>	
	</div>
	<!--		导出-->
	<button class="layui-btn btn export " data-type="getCheckLength" style="float: right;margin-right: 115px;margin-top: 12.5px;">
		导出
	</button>
	<!--		搜索-->
	<div class="demoTable" style="float: right;margin-right: 115px;">
		<select class="search" id="switch">
			<option value="all">全部</option>
			<option value="emp_dept">部门</option>
			<option value="emp_jobTitleLevel">职称等级</option>
			<option value="emp_gender">性别</option>
		</select>
		<div class="layui-inline" style="margin-left:-5px;margin-right:-6px;">
			<input class="layui-input" name="id" id="demoReload" autocomplete="off">
		</div>
		<button class="layui-btn" id="search" data-type="reload" style="height: 36px;line-height: 36px;">搜索</button>
	</div>
		
	
</div>
<!-- 操作-->
<div class="action"> 
	<div class="int-inline"><input id="id"  type="checkbox" value="序号" checked="true"/><lable>序号</lable></div>
	<div class="int-inline"><input id="emp_num"  type="checkbox" value="工号" checked="flase"/><lable>工号</lable></div>
	<div class="int-inline"><input id="emp_name"  type="checkbox" value="姓名" checked/><lable>姓名</lable></div>
	<div class="int-inline"><input id="emp_gender"  type="checkbox" value="性别" checked/><lable>性别</lable></div>
	<div class="int-inline"><input id="emp_dept"  type="checkbox" value="部门" checked/><lable>部门</lable></div>
	<div class="int-inline"><input id="emp_position"  type="checkbox" value="职务" checked/><lable>职务</lable></div>
	<div class="int-inline"><input id="emp_hire_startTime"  type="checkbox" value="聘期" checked/><lable>聘期</lable></div>
	<div class="int-inline"><input id="emp_idcard"  type="checkbox" value="身份证号" checked/><lable>身份证号</lable></div>
	<div class="int-inline"><input id="emp_idcard_endTime"  type="checkbox" value="身份证到期时间" checked/><lable>身份证到期时间</lable></div>
	<div class="int-inline"><input id="emp_ethnic"  type="checkbox" value="民族" checked/><lable>民族</lable></div>
	<div class="int-inline"><input id="emp_politicalLandscape"  type="checkbox" value="政治面貌" checked/><lable>政治面貌</lable></div>
	<div class="int-inline"><input id="emp_maritalStatus"  type="checkbox" value="婚姻状况" checked/><lable>婚姻状况</lable></div>
	<div class="int-inline"><input id="emp_firstEducation"  type="checkbox" value="第一学历" checked/><lable>第一学历</lable></div>
	<div class="int-inline"><input id="emp_firstEducationSchool"  type="checkbox" value="第一学历学校" checked/><lable>第一学历学校</lable></div>
	<div class="int-inline"><input id="emp_firstEducationPro"  type="checkbox" value="第一学历专业" checked/><lable>第一学历专业</lable></div>
	<div class="int-inline"><input id="emp_firstGraduationTime"  type="checkbox" value="第一学历毕业时间" checked/><lable>第一学历毕业时间</lable></div>
	<div class="int-inline"><input id="emp_secondEducation"  type="checkbox" value="第二学历" checked/><lable>第二学历</lable></div>
	<div class="int-inline"><input id="emp_secondEducationSchool"  type="checkbox" value="第二学历学校" checked/><lable>第二学历学校</lable></div>
	<div class="int-inline"><input id="emp_secondEducationPro"  type="checkbox" value="第二学历专业" checked/><lable>第二学历专业</lable></div>
	<div class="int-inline"><input id="emp_secondGraduationTime"  type="checkbox" value="第二学历毕业时间" checked/><lable>第二学历毕业时间</lable></div>
	<div class="int-inline"><input id="emp_thirdEducation"  type="checkbox" value="第三学历" checked/><lable>第三学历</lable></div>
	<div class="int-inline"><input id="emp_thirdEducationSchool"  type="checkbox" value="第三学历学校" checked/><lable>第三学历学校</lable></div>
	<div class="int-inline"><input id="emp_thirdEducationPro"  type="checkbox" value="第三学历专业" checked/><lable>第三学历专业</lable></div>
	<div class="int-inline"><input id="emp_thirdGraduationTime"  type="checkbox" value="第三学历毕业时间" checked/><lable>第三学历毕业时间</lable></div>
	<div class="int-inline"><input id="emp_jobTitle"  type="checkbox" value="职称名称" checked/><lable>职称名称</lable></div>
	<div class="int-inline"><input id="emp_jobTitleLevel"  type="checkbox" value="职称等级" checked/><lable>职称等级</lable></div>
	<div class="int-inline"><input id="emp_jobTitleObtainTime"  type="checkbox" value="职称取得时间" checked/><lable>职称取得时间</lable></div>
	<div class="int-inline"><input id="emp_phone"  type="checkbox" value="联系电话" checked/><lable>联系电话</lable></div>
	<div class="int-inline"><input id="emp_emergencyContactAndPhone"  type="checkbox" value="紧急联系人及联系方式" checked/><lable>紧急联系人及联系方式</lable></div>
	<div class="int-inline"><input id="emp_fileAddress"  type="checkbox" value="档案所在地" checked/><lable>档案所在地</lable></div>
	<div class="int-inline"><input id="emp_accountAddress"  type="checkbox" value="户口所在地" checked/><lable>户口所在地</lable></div>
	<div class="int-inline"><input id="emp_homeAddress"  type="checkbox" value="家庭住址" checked/><lable>家庭住址</lable></div>
	<div class="int-inline"><input id="emp_workType"  type="checkbox" value="用工形式" checked/><lable>用工形式</lable></div>
	<div class="int-inline"><input id="emp_compile"  type="checkbox" value="编制" checked/><lable>编制</lable></div>
	<div class="int-inline"><input id="emp_inductionTime"  type="checkbox" value="入职时间" checked/><lable>入职时间</lable></div>
	<div class="int-inline"><input id="emp_tryOutEndTime"  type="checkbox" value="试用期结束日期" checked/><lable>试用期结束日期</lable></div>
	<div class="int-inline"><input id="emp_contractEndTime"  type="checkbox" value="合同期满日期" checked/><lable>合同期满日期</lable></div>
	<div class="int-inline"><input id="emp_contractSignedNum"  type="checkbox" value="合同期签订次数" checked/><lable>合同期签订次数</lable></div>
	<div class="int-inline"><input id="emp_returnee"  type="checkbox" value="是否留学归国人员" checked/><lable>是否留学归国人员</lable></div>
	<div class="int-inline"><input id="emp_foreign"  type="checkbox" value="是否外籍人员" checked/><lable>是否外籍人员</lable></div>
	<div class="int-inline"><input id="emp_remarks"  type="checkbox" value="备注" checked/><lable>备注</lable></div>
</div>  
<!-- 数据展示主表格-->
<div class="table2excel">
	<table class="layui-table" id="testTable" lay-filter="demo" style="margin-top:5px;width: 100% !important;"></table>
</div>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" href="adddetail.html" target="_blank"  >查看详情</a>
  <a class="layui-btn layui-btn-xs layui-btn-edit" href="adddetail.html" target="_blank">修改</a>
  <a class="layui-btn layui-btn-xs layui-btn-tired" lay-event="dimission">离职</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<!-- 数据展示主表格-->
 

<script src="${basePath}/commen/layui/layui.js"></script>
<script>
	
layui.config({
  version: '1531663423583' //为了更新 js 缓存，可忽略
});

 
layui.use('table', function(){
  var table = layui.table,form = layui.form;
	 //监听表格复选框选择

	
  table.on('checkbox(demo)', function(obj){
    console.log(obj)
  });
  
  //执行一个 table 实例
  table.render({
    elem: '#testTable',
	page: false,
	limit:9999999,//不设置分页，最大数据量为9999999
	id: 'testReload',  
//    height: 332,
//    ,url: '/demo/table/user/' //数据接口
	cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
    cols: [[ //标题栏
		{type:'checkbox',fixed: 'left'},
		{field: 'id', title: '序号',fixed: 'left',width:100},
		{field: 'emp_num', title: '工号',fixed: 'left',width:100},
		{field: 'emp_name', title: '姓名',fixed: 'left',width:150},
		{field: 'emp_gender', title: '性别',sort: true},
		{field: 'emp_dept', title: '部门',sort: true,width:200},
		{field: 'emp_position', title: '职务',sort: true,width:150},
		{field: 'emp_hire_startTime', title: '聘期',sort: true},
		{field: 'emp_idcard', title: '身份证号',width:220},
		{field: 'emp_idcard_endTime', title: '身份证到期时间',sort: true,width:200},
		{field: 'emp_ethnic', title: '民族',sort: true},
		{field: 'emp_politicalLandscape', title: '政治面貌',sort: true,width:150},
		{field: 'emp_maritalStatus', title: '婚姻状况',sort: true,width:150},
		
		{field: 'emp_firstEducation', title: '第一学历',sort: true,width:200},
		{field: 'emp_firstEducationSchool', title: '第一学历学校',sort: true,width:200},
		{field: 'emp_firstEducationPro', title: '第一学历专业',sort: true,width:200},
		{field: 'emp_firstGraduationTime', title: '第一学历毕业时间',sort: true,width:230},
		{field: 'emp_secondEducation', title: '第二学历',sort: true,width:200},
		{field: 'emp_secondEducationSchool', title: '第二学历学校',sort: true,width:200},
		{field: 'emp_secondEducationPro', title: '第二学历专业',sort: true,width:200},
		{field: 'emp_secondGraduationTime', title: '第二学历毕业时间',sort: true,width:230},
		{field: 'emp_thirdEducation', title: '第三学历',sort: true,width:200},
		{field: 'emp_thirdEducationSchool', title: '第三学历学校',sort: true,width:200},
		{field: 'emp_thirdEducationPro', title: '第三学历专业',sort: true,width:200},
		{field: 'emp_thirdGraduationTime', title: '第三学历毕业时间',sort: true,width:230},

		{field: 'emp_jobTitle', title: '职称名称',sort: true,width:200},
		{field: 'emp_jobTitleLevel', title: '职称等级',sort: true,width:200},
		{field: 'emp_jobTitleObtainTime', title: '职称取得时间',sort: true,width:200},
		
		{field: 'emp_phone', title: '联系电话',width:200},
		{field: 'emp_emergencyContactAndPhone', title: '紧急联系人及联系方式',width:250},
		{field: 'emp_fileAddress', title: '档案所在地',sort: true,width:200},
		{field: 'emp_accountAddress', title: '户口所在地',sort: true,width:200},
		{field: 'emp_homeAddress', title: '家庭住址',sort: true,width:250},
		{field: 'emp_workType', title: '用工形式',sort: true,width:200},
		{field: 'emp_compile', title: '编制',sort: true,width:100},
		{field: 'emp_inductionTime', title: '入职时间',sort: true,width:200},
		{field: 'emp_tryOutEndTime', title: '试用期结束日期',sort: true,width:200},
		{field: 'emp_contractEndTime', title: '合同期满日期',sort: true,width:200},
		{field: 'emp_contractSignedNum', title: '合同签订次数',sort: true,width:200},
		{field: 'emp_returnee', title: '是否留学归国人员',sort: true,width:230},
		{field: 'emp_foreign', title: '是否外籍人员',sort: true,width:200},
		{field: 'emp_remarks', title: '备注',sort: true,width:200},
		{field: 'sex', title: '操作',toolbar: '#barDemo',fixed: 'right',width:340}
    ]],
	  //表格数据
    data: [{
		"id":'1',
		"emp_num":'1',
		"emp_name":'姓名',
		"emp_gender":'性别',
		"emp_dept":'部门',
		"emp_position":'职务',
		"emp_hire_startTime":'聘期',
		"emp_idcard":'身份证号',
		"emp_idcard_endTime":'身份证到期时间',
		"emp_ethnic":'名族',
		"emp_politicalLandscape":'政治面貌',
		"emp_maritalStatus":'婚姻状态',
		"emp_firstEducation":'第一学历',
		"emp_secondEducation":'第二学历',
		"emp_thirdEducation":'第三学历',
		"emp_firstEducationSchool":'第一学历学校',
		"emp_secondEducationSchool":'：第二学历学校',
		"emp_thirdEducationSchool":'第三学历学校',
		"emp_firstEducationPro":'第一学历专业',
		"emp_secondEducationPro":'第二学历专业',
		"emp_thirdEducationPro":'第三学历专业',
		"emp_firstGraduationTime":'第一学历毕业时间',
		"emp_secondGraduationTime":'第二学历毕业时间',
		"emp_thirdGraduationTime":'第三学历毕业时间',
		"emp_jobTitle":'职称名称',
		"emp_jobTitleLevel":'职称等级',
		"emp_jobTitleObtainTime":'获取职称时间',
		"emp_phone":'手机号',
		"emp_emergencyContactAndPhone":'紧急联系人姓名以及联系手机号',
		"emp_fileAddress":'档案所在地',
		"emp_accountAddress":'户口所在地',
		"emp_homeAddress":'家庭住址',
		"emp_workType":'用工形式',
		"emp_compile":'编制',
		"emp_inductionTime":'入职时间',
		"emp_tryOutEndTime":'试用期结束时间',
		"emp_contractEndTime":'合同期满日期',
		"emp_contractSignedNum":'合同签订次数',
		"emp_returnee":'是否归国人员',
		"emp_foreign":'是否外籍人员',
		"emp_remarks":'备注'
		 },{
		"id":'2',
		"emp_num":'2',
		"emp_name":'李璐萍',
		"emp_gender":'女',
		"emp_dept":'平行工作室',
		"emp_position":'院长助理',
		"emp_hire_startTime":'3年',
		"emp_idcard":'370729699784561235',
		"emp_idcard_endTime":'2018-09-16',
		"emp_ethnic":'汉',
		"emp_politicalLandscape":'团员',
		"emp_maritalStatus":'未婚',
		"emp_firstEducation":'本科',
		"emp_secondEducation":'研究生',
		"emp_thirdEducation":'博士',
		"emp_firstEducationSchool":'中国石油大学',
		"emp_secondEducationSchool":'中国石油大学',
		"emp_thirdEducationSchool":'中国石油大学',
		"emp_firstEducationPro":'软件编程',
		"emp_secondEducationPro":'软件编程',
		"emp_thirdEducationPro":'软件编程',
		"emp_firstGraduationTime":'2018-09-16',
		"emp_secondGraduationTime":'2018-09-16',
		"emp_thirdGraduationTime":'2018-09-16',
		"emp_jobTitle":'系统集成管理中级职称',
		"emp_jobTitleLevel":'中级职称',
		"emp_jobTitleObtainTime":'2018-09-16',
		"emp_phone":'16298745621',
		"emp_emergencyContactAndPhone":'母亲-刘乐芬-16985746213',
		"emp_fileAddress":'山东省潍坊市',
		"emp_accountAddress":'山东省青岛市高新区',
		"emp_homeAddress":'山东省青岛市高新技术开发区',
		"emp_workType":'合同工',
		"emp_compile":'是',
		"emp_inductionTime":'2018-09-16',
		"emp_tryOutEndTime":'2018-09-16',
		"emp_contractEndTime":'2018-09-16',
		"emp_contractSignedNum":'3',
		"emp_returnee":'否',
		"emp_foreign":'否',
		"emp_remarks":'备注备注备注'
		 },{
		"id":'3',
		"emp_num":'3',
		"emp_name":'李璐萍',
		"emp_gender":'女',
		"emp_dept":'平行工作室',
		"emp_position":'院长助理',
		"emp_hire_startTime":'3年',
		"emp_idcard":'370729699784561235',
		"emp_idcard_endTime":'2018-09-16',
		"emp_ethnic":'汉',
		"emp_politicalLandscape":'团员',
		"emp_maritalStatus":'未婚',
		"emp_firstEducation":'本科',
		"emp_secondEducation":'研究生',
		"emp_thirdEducation":'博士',
		"emp_firstEducationSchool":'中国石油大学',
		"emp_secondEducationSchool":'中国石油大学',
		"emp_thirdEducationSchool":'中国石油大学',
		"emp_firstEducationPro":'软件编程',
		"emp_secondEducationPro":'软件编程',
		"emp_thirdEducationPro":'软件编程',
		"emp_firstGraduationTime":'2018-09-16',
		"emp_secondGraduationTime":'2018-09-16',
		"emp_thirdGraduationTime":'2018-09-16',
		"emp_jobTitle":'系统集成管理中级职称',
		"emp_jobTitleLevel":'中级职称',
		"emp_jobTitleObtainTime":'2018-09-16',
		"emp_phone":'16298745621',
		"emp_emergencyContactAndPhone":'母亲-刘乐芬-16985746213',
		"emp_fileAddress":'山东省潍坊市',
		"emp_accountAddress":'山东省青岛市高新区',
		"emp_homeAddress":'山东省青岛市高新技术开发区',
		"emp_workType":'合同工',
		"emp_compile":'是',
		"emp_inductionTime":'2018-09-16',
		"emp_tryOutEndTime":'2018-09-16',
		"emp_contractEndTime":'2018-09-16',
		"emp_contractSignedNum":'3',
		"emp_returnee":'否',
		"emp_foreign":'否',
		"emp_remarks":'备注备注备注'
		 },{
		"emp_num":'17',
		"emp_name":'李璐萍',
		"emp_gender":'女',
		"emp_dept":'平行工作室',
		"emp_position":'院长助理',
		"emp_hire_startTime":'3年',
		"emp_idcard":'370729699784561235',
		"emp_idcard_endTime":'2018-09-16',
		"emp_ethnic":'汉',
		"emp_politicalLandscape":'团员',
		"emp_maritalStatus":'未婚',
		"emp_firstEducation":'本科',
		"emp_secondEducation":'研究生',
		"emp_thirdEducation":'博士',
		"emp_firstEducationSchool":'中国石油大学',
		"emp_secondEducationSchool":'中国石油大学',
		"emp_thirdEducationSchool":'中国石油大学',
		"emp_firstEducationPro":'软件编程',
		"emp_secondEducationPro":'软件编程',
		"emp_thirdEducationPro":'软件编程',
		"emp_firstGraduationTime":'2018-09-16',
		"emp_secondGraduationTime":'2018-09-16',
		"emp_thirdGraduationTime":'2018-09-16',
		"emp_jobTitle":'系统集成管理中级职称',
		"emp_jobTitleLevel":'中级职称',
		"emp_jobTitleObtainTime":'2018-09-16',
		"emp_phone":'16298745621',
		"emp_emergencyContactAndPhone":'母亲-刘乐芬-16985746213',
		"emp_fileAddress":'山东省潍坊市',
		"emp_accountAddress":'山东省青岛市高新区',
		"emp_homeAddress":'山东省青岛市高新技术开发区',
		"emp_workType":'合同工',
		"emp_compile":'是',
		"emp_inductionTime":'2018-09-16',
		"emp_tryOutEndTime":'2018-09-16',
		"emp_contractEndTime":'2018-09-16',
		"emp_contractSignedNum":'3',
		"emp_returnee":'否',
		"emp_foreign":'否',
		"emp_remarks":'备注备注备注'
		 }]
  });

	//添加筛选功能
var $ = layui.$, active = {
    reload: function(){
      var demoReload = $('#demoReload');
      console.log(demoReload.val());
	  console.log($('#switch').val());
      //执行重载
      table.reload('testReload', {
//       url: '/demo/table/user/', /*根据条件重新加载数据*/
        where: {
          key: {
            id: demoReload.val()
          }
        }
		
      });
    }
  };
  
  
  
  $('#search').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
	  console.log("dianjishiqin");
  });
	
	
  
  //监听工具条
  table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
    var data = obj.data //获得当前行数据
    ,layEvent = obj.event; //获得 lay-event 对应的值
    if(layEvent === 'detail'){
      layer.msg('用户名：'+JSON.stringify(data.username)+'<br>密码：'+JSON.stringify(data.pas)+'<br>角色：'+JSON.stringify(data.rid));
    } else if(layEvent === 'del'){
      layer.confirm('确定删除信息', function(index){
        obj.del(); //删除对应行（tr）的DOM结构
        layer.close(index);
        //向服务端发送删除指令
      });
    } else if(layEvent === 'edit'){
      layer.alert(
		  '<div class="layui-form-item">'+

			'<label class="layui-form-label">角色</label>'+
			'<div class="layui-input-block">'+
				'<select name="interest" lay-filter="aihao">'+
					'<option value=""></option>'+
					'<option value="0">超级管理员</option>'+
					'<option value="1" selected="">院级权限</option>'+
					'<option value="2">人事部门权限</option>'+
					'<option value="3">产业化处权限</option>'+
					'<option value="4">科技管理处</option>'+
				'</select>'+
			'</div>'+
		'</div>')
    }
  });

	//监听顶部添加删除操作
	
//	var $ = layui.$, active = {
//   	getCheckLength: function(){ //选中批量删除
//      var checkStatus = table.checkStatus('testTable'),
//      data = checkStatus.data;
//		if(data.length==0){
//			layer.msg("未选中数据！");
//		}else{
//			layer.confirm('确定删除'+ data.length + ' 条数据'+JSON.stringify(data), function(index){
//				obj.del(); //删除对应行（tr）的DOM结构
//				layer.close(index);
//				//向服务端发送删除指令
//			});
//		}
//    }
//  };
//  
//  $('.demoTable .layui-btn').on('click', function(){
//    var type = $(this).data('type');
//    active[type] ? active[type].call(this) : '';
//  });
//	
// });	

});

	
</script>
<!--导出功能设置-->
<script type="text/javascript">
	$(function() {
		$(".export").click(function(){
			$(".table2excel").table2excel({
				// 不被导出的表格行的CSS class类
				exclude: ".noExl",
				// 导出的Excel文档的名称
				name: "Excel Document Name",
				// Excel文件的名称
				filename: "test",
				//文件后缀名
				fileext: ".xls",
				//是否排除导出图片
				exclude_img: false,
				//是否排除导出超链接
				exclude_links: false,
				//是否排除导出输入框中的内容
				exclude_inputs: false
			});
		}); 
		$(".layui-form .layui-form-item div span").click(function(){
			console.log($(this).attr('class')+"5555");
		});
		$(":checkbox").click(function(){
			var val=$(this).attr("id");
			if( $(this).prop('checked')){
				$("[data-field='"+val+"']").removeClass("noExl");
			}else{
				$("[data-field='"+val+"']").addClass("noExl");
			}
		});
	});
</script>
<!--自动设置主表格可视区域-->
<script>
	var hei=$(".action").height();
	var ji=$(document).height();
	var heigt=ji-hei-85;
	$(".layui-table-body").prop("height",heigt+"px");
	
	console.log(heigt);

	
</script>
</body>
</html>        
        