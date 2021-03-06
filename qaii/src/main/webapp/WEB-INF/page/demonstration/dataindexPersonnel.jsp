<!doctype html>
<html>
<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" type="image/x-icon" href="${basePath}/image/icon.ico" media="screen" />
<link rel="stylesheet" href="${basePath}/commen/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="${basePath}/css/stylemainrs.css" />

<script src="${basePath}/js/jquery-3.3.1.min.js"></script> 
<script src="${basePath}/commen/bootstrap/bootstrap.min.js"> </script>
<script src="${basePath}/js/echarts.min.js"></script>
	<script src="${basePath}/js/main.js"></script>
	<style>
		a{
			text-decoration: none;
		}
		.loading{
			width:100%;
			height: 100%;
			position: fixed;
			background: #003e8d;
			top: 0px;
			left: 0px;z-index:100;
		}
		.pic{
			position: absolute;
			top: 0;
			left: 0;
			bottom: 0;
			margin: auto;
			right: 0;
			width:99px;
			height:99px;
			background: url("${basePath}/image/000.png") no-repeat;
			animation: cir00 infinite linear 5s;

		}

		@keyframes cir00 {
			from{
				transform:rotate(360deg);
				-ms-transform:rotate(360deg); /* Internet Explorer */
				-moz-transform:rotate(360deg); /* Firefox */
				-webkit-transform:rotate(360deg); /* Safari 和 Chrome */
				-o-transform:rotate(360deg); /* Opera */
			}
			to{
				transform:rotate(0deg);
				-ms-transform:rotate(0deg); /* Internet Explorer */
				-moz-transform:rotate(0deg); /* Firefox */
				-webkit-transform:rotate(0deg); /* Safari 和 Chrome */
				-o-transform:rotate(0deg); /* Opera */
			}
		}
	</style>

	<script>
        document.onreadystatechange=function(){
            if(document.readyState=="complete"){
                $(".loading").fadeOut();
            }
            //console.log(document.readyState);
        }
	</script>
<script type="text/javascript">
	$().ready(function(){
		
		var now=new Date();
		var nowdate=now.getFullYear()+"-"+(now.getMonth() + 1)+"-"+now.getDate();
		getContractMsg();
		getTryMsg();
		
		//合同到期人员提醒
		function getContractMsg(){
			$.ajax({
				type:"POST",
				url:"getContractMsg.do",
				data:{date:nowdate},
				success:function(data){
					data.forEach(function(e){
						$("#contractremind").append('<li class="permain"><div class="row rowbox" style="margin:0px;"><div class="col-6 textovrt">'+'<a title="'+e.empDept+'">'+
								e.empDept+'</a></div><div class="col-2 textovrt name">'+'<a title="'+e.empName+'">'+
								e.empName+'</a></div><div class="col-4 textovrt">'+
								e.empContractendtime+'</div></div></li>');
					})
				}
			})
		}
		
		//试用期到期提醒
		function getTryMsg(){
			$.ajax({
				type:"POST",
				url:"getTryMsg.do",
				data:{date:nowdate},
				success:function(data){
					data.forEach(function(e){
						$("#tryremind").append('<li class="permain"><div class="row rowbox" style="margin:0px;"><div class="col-6 textovrt">'+'<a title="'+e.empDept+'">'+
								e.empDept+'</a></div><div class="col-2 textovrt name">'+'<a title="'+e.empName+'">'+
								e.empName+'</a></div><div class="col-4 textovrt">'+
								e.empTryoutendtime+'</div></div></li>');
					})
				}
			})
		}
		

	})
</script>
<title>QAII智慧管理平台</title>
</head>

<body class="mainbody">
<div class="loading">
	<div class="pic">
	</div>
</div>
	<div class="container-fluid">
		<div class="content">
			<div class="perhead shadowb">
                <span class="pertitlespan">QAII智慧人事管理平台</span>
                <div class="right perNav">
                    <a href="dataindexNav.do"><div class="pageTo">返回导航</div></a>
                    <a href="outLogin.do"><div class="pageTo">退出</div></a>
                </div>
				
			</div>
			<div class="row">
			<div class="perbox col-3">
				<div class="inform shadowb">
					<div class="perctitle"><span>合同到期提醒</span><span class="right more"><a href="intoPerSys.do">查看更多+</a></span></div>
					<div class="perinform">
						<ul id="contractremind">
							

						</ul>
					</div>
				</div>
				<div class="inform shadowb">
					<div class="perctitle"><span>试用期到期提醒</span><span class="right more"><a href="intoPerSys.do">查看更多+</a></span></div>
					<div class="perinform hei2">
						<ul id="tryremind">
							
						</ul>
					</div>
				</div>
			</div>
			<div class="perbox2 col-6">
                <div class="shadowb zhushit">
                    <div class="heightpeople">
					<div class="hightpnum">1260</div>

					<div class="heightbox pao11">
						<img src="${basePath}/image/height1.png" class="paopao" /><br/>
						<span>研究院人才</span><br />
						<span class="paopaotex">50人</span>
					</div>
					<div class="heightbox pao22">
						<img src="${basePath}/image/height7.png" class="paopao" /><br/>
						<span>国际期刊主编</span><br />
						<span class="paopaotex">50人</span>
					</div>
					<div class="heightbox pao33">
						<img src="${basePath}/image/height6.png" class="paopao" /><br/>
						<span>百人计划</span><br />
						<span class="paopaotex">50人</span>
					</div>
					<div class="heightbox pao44">
						<img src="${basePath}/image/height5.png" class="paopao" /><br/>
						<span>千人计划</span><br />
						<span class="paopaotex">50人</span>
					</div>
					<div class="heightbox pao55">
						<img src="${basePath}/image/height2.png" class="paopao" /><br/>
						<span>博士学历</span><br />
						<span class="paopaotex">50人</span>
					</div>
					<div class="heightbox pao66">
						<img src="${basePath}/image/height3.png" class="paopao" /><br/>
						<span>学科带头人</span><br />
						<span class="paopaotex">50人</span>
					</div>
					<div class="heightbox pao77">
						<img src="${basePath}/image/height4.png" class="paopao" /><br/>
						<span>国家杰青</span><br />
						<span class="paopaotex">50人</span>
					</div>
                    </div>
				</div>
				
			</div>
			<div class="perbox col-3" style="position: absolute;right:10px;">
                <div class="inform shadowb">
                    <div class="perctitle"><span>院人数增减情况</span></div>
                    <%--<div id="mainbar" style="width: 100%;height:350px;"></div>--%>
                    <div id="main"></div>
                </div>

				<div class="inform gradient shadowb">
					<div class="perctitle"><span>各部门人数所占比例</span></div>
					<div id="maincircle" style="width: 100%;height:267px;"></div>
				</div>

				<div class="inform shadowb">
					<div class="perctitle"><span>人才队伍</span></div>
					<div id="mainbar" style="width: 100%;height:270px;"></div>
				</div>

			</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
	$("#replacep").click(function(){
		window.location.replace('outLogin.do');
		window.history.back(-1);
	})
</script>
<script src="${basePath}/js/perchars.js"></script>


<script type="text/javascript">
	function getRandomNum() {
	  var min = 1//这里改成你需要的最小值
	  var max = 100//这里改成你需要的最大值
	  return Math.floor(Math.random() * (max - min + 1) + min)
	}
	var randomNum = getRandomNum()
</script>

<script>

	function getTitleMsg(data){
		var result=new Array();
		$.ajax({
			async:false,
			type:"POST",
			url:"getTitleMsg.do",
			data:{data:data},
			success:function(data){
				result=data;
			}
		})
		return result;
	}
	
	var title=new Array("千人计划","百人计划","研究院人员","国家期刊主编","国家优青","国家杰青","科学带头人","博士学历");
	var _title=getTitleMsg(title);
//JavaScript Document
/*//绘制高端人才界面
//获取到canvas元素
    var canvas = document.getElementById('talents');
	var canvasBox = document.getElementById('canvasBox').offsetWidth;
	canvas.width = canvasBox;

 
    //获取canvas中的画图环境
    var context = canvas.getContext('2d');
	var wid=canvas.width;

    //创建Image对象
    var img = new Image();
	var imgbox = new Image();
    //alert(img);
    //高端人才总数
    var count=_title[0]+_title[1]+_title[2]+_title[3]+_title[4]+_title[5]+_title[6]+_title[7];
	var a = parseInt(count % 10); // 个位数
	var b = parseInt((count % 100) / 10);  // 十位数
	var c = parseInt((count % 1000) / 100); // 百位数
	var d = parseInt((count % 10000) / 1000); // 千位数
    //引入图片URL
    img.src = "${basePath}/image/talent.png";
//	imgbox.src ="bac.png";
	img.onload = function (){
		context.drawImage(img,0,0,wid,0.5*wid);
		//绘制高端人才矩形框
		context.fillStyle="#2574b7";
		context.fillRect(197*wid/500,98*wid/500,23*wid/500,28*wid/500);
		context.fillRect(223*wid/500,98*wid/500,23*wid/500,28*wid/500);
		context.fillRect(249*wid/500,98*wid/500,23*wid/500,28*wid/500);
		context.fillRect(275*wid/500,98*wid/500,23*wid/500,28*wid/500);

		context.fillStyle="#fff";
		context.font="bold 20px Arial";
		context.textAlign="left";
		context.fillText(d,202*wid/500,120*wid/500);
		context.fillText(c,228*wid/500,120*wid/500);
		context.fillText(b,254*wid/500,120*wid/500);
		context.fillText(a,280*wid/500,120*wid/500);
		
		context.font="bold 14px Arial";
		context.textAlign="center";
		context.shadowColor="rgba(0,0,0,0.4)";
		context.shadowOffsetX = 1;
		context.shadowOffsetY = 1;
		//千人计划
		context.fillStyle="#8fc31f";
		context.fillText(_title[0]+"人",128*wid/500,54*wid/500);
		//百人计划
		context.fillStyle="#8e1c76";
		context.fillText(_title[1]+"人",64*wid/500,106*wid/500);
		//研究院人员
		context.fillStyle="#1576bd";
		context.fillText(_title[2]+"人",131*wid/500,160*wid/500);
		//国家期刊主编
		context.fillStyle="#f39800";
		context.fillText(_title[3]+"人",140*wid/500,235*wid/500);
		//国家优青
		context.fillStyle="#2ea7e0";
		context.fillText(_title[4]+"人",286*wid/500,235*wid/500);
		//国家杰青
		context.fillStyle="#e4007f";
		context.fillText(_title[5]+"人",358*wid/500,185*wid/500);
		//学科带头人
		context.fillStyle="#f8b62d";
		context.fillText(_title[6]+"人",438*wid/500,144*wid/500);
		//博士学历
		context.fillStyle="#6a2b85";
		context.fillText(_title[7]+"人",383*wid/500,82*wid/500);
		
	}*/
</script>
</body>
</html>
