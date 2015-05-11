<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
%>
<base href="<%=basePath%>">
<%@page import="web.*" %>
<%@page import="other.*" %>
<%@page import="test.*" %>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<html>
<head>
<title style="font-family:Cambria, 'Hoefler Text', 'Liberation Serif', Times, 'Times New Roman', serif">北京邮电大学信息理论与技术教研中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<!--  -->
<script src="dataMiningResource/jquery-1.10.2.min.js"></script>
<script src="dataMiningResource/sigma.min.js"></script> 
<script src="dataMiningResource/sigma.parseGexf.js"></script>
  <script src="dataMiningResource/forceatlas2.js"></script>
<script src="dataMiningResource/chartView.js"></script>
<script src="dataMiningResource/province.js"></script>
<!--<script src="dataMiningResource/highchartsNew.js"></script>-->
<script src="dataMiningResource/highcharts.js"></script>
<script src="dataMiningResource/highcharts-3d.js"></script>
<script src="dataMiningResource/highcharts-more.js"></script>
<script src="dataMiningResource/exporting.js"></script>
<script src="dataMiningResource/js/libraries/RGraph.common.core.js"></script>
<script src="dataMiningResource/js/libraries/RGraph.common.tooltips.js"></script>
<script src="dataMiningResource/js/libraries/RGraph.common.key.js"></script>
<script src="dataMiningResource/js/libraries/RGraph.common.dynamic.js"></script>
<script src="dataMiningResource/js/libraries/RGraph.common.effects.js"></script>
<script src="dataMiningResource/js/raphael.min.js"></script>
<script src="dataMiningResource/js/jquery.tooltip.js"></script>
<script src="dataMiningResource/js/g.raphael.js"></script>
<!-- menulist-->
<link href="dataMiningResource/js/menulist/style.css" rel="stylesheet" type="text/css" />
<!-- toolbar -->
<script src="dataMiningResource/js/menu/jquery-ui-1.10.4.min.js"></script>
<link href="dataMiningResource/js/menu/jquery-ui.css" rel="stylesheet" type="text/css">
<!--chosen -->
<script src="dataMiningResource/js/chosen/chosen.jquery.min.js"></script>
<link href="dataMiningResource/js/chosen/chosen.css" rel="stylesheet" type="text/css"></script>

<link href="dataMiningResource/css/min.css" rel="stylesheet" type="text/css"> 
<link href="dataMiningResource/css/content.css" rel="stylesheet" type="text/css">
<script src="dataMiningResource/js/plotcharts.js"></script>
<script src="dataMiningResource/chartOptions.js"></script>
<script type="text/javascript">
$(function(){
	 //表格互动
  	$(".tr0,.tr1").on({"mouseenter":function(){
  		$(this).addClass("trg1");
  	},"mouseleave":function(){
		$(this).removeClass("trg1");  	
  	}});
	//plotmenu
	$("#plotmenu").menu();
	$("#menucontent").on({"mouseenter":function()
		{
			$("#plotmenu").show("slide");
		},"mouseleave":function(){
			$("#plotmenu").hide("slide");
		}
	});
	//tooltip
	$(document).tooltip({
          content: function () {
              return $(this).prop('title');
          }
      });
	//chosen
	$(".sigma-select-class").chosen({no_results_text: "未找到",allow_single_deselect:true,width:"100%"});
	$("#weibolist").chosen({allow_single_deselect:true,disable_search:true});
	$("#weibodemo-select").chosen().change(function(){
		demoSelectChange();
	});
	//button
    $( "input[type=submit]").button();
	$( "#userpara-button").button({icons: {
        primary: "ui-icon-help"
      }}).click(function(){
				$("#userpara-toggle").toggle("Slide");
		  }
	  );
	$("#sigma-para-button").button({width:'100%'}).click(function( event ) {
        event.preventDefault();
		$("#sigma-para-toggle").slideToggle();
		if($(this).text() == "更多"){
			$(this).children("span").text("收起");
		}
		else{
			$(this).children("span").text("更多");
		}
      });
});
</script>

<style type="text/css">
div#container{width:1000px;margin-top:0px;margin-left:auto;margin-right:auto;}
div#headerFront{width:1000px;height:10px;background-color:#6699CC;margin:0;}
div#header{
	background-color:transparent;
	width: 1000px;
	height:100px;
	text-align: center;
	font-size: 40px;
	margin:0;
}


div#footer {clear:both;margin:0px auto;color:#fff;text-align:center;height:20px;width:940px;padding:30px;background:#336699;}



/*menu*/
<!--

-->

.ui-menu{width:28px;float:left;z-index:7;top:40px;}
</style>

</head>

<!--<body style="background-color:#4E4B41;">-->
<body  style= "background:#D8F6FF  url(dataMiningResource/9.jpg)center 0 no-repeat;background-size:100% 100%;font-family:微软雅黑;">
<div id="container">
<div id="headerFront"></div>

<div id="header">
	 <p style="margin:0;"><img src="dataMiningResource/ittc_banner.png"  alt="" width="1000" height="104" /></p>
</div>
<div id="topmenu">
	    <ul  class="menu" >
			<li><a href="../index.php"> 首页</a></li>
			<li><a href="#">实验室简介</a>
				<ul>
					<li><a href="../laboratoryDisplay/laboratoryInto.php">实验室介绍</a></li>
					<li><a href="../laboratoryDisplay/latestNews.php">最新动态</a></li>
				</ul>
			</li>
			<li><a href="#">师资队伍</a>
				<ul>
					<li><a href="teamMember.php">团队成员</a></li>
					<li><a href="expertAdvisor.php">专家顾问</a></li>
				</ul>
			</li>
			<li><a href="#"> 成果展示</a>
				<ul>
					<li><a href="../achievementDisplay/projectIntro.php">项目介绍 </a></li>
					<li><a href="../achievementDisplay/academicPaper.php">论文著作</a></li>
					<li><a href="../achievementDisplay/awardInformation.php">获奖信息</a></li>
				</ul>
			</li>
			<li><a href="#"> 课程资源</a>
				<ul>
					<li><a href="../excellentCourse/log.php?menuCource=informationTheory">信息论</a></li>
					<li><a href="../excellentCourse/log.php?menuCource=telecomunicationTheory">通信原理</a></li>
				</ul>
			</li>
			<li><a href="#"><span class="iconic mail"></span> 学生风采</a>
				<ul>
					<li><a href="../studentDisplay/excellentGraduate.php">优秀毕业生</a></li>
					<li><a href="../studentDisplay/outreachActivities.php">拓展活动</a></li>
					<li><a href="../studentDisplay/admissionInfo.php">招生信息</a></li>
				</ul>
			</li>
		</ul>
</div>

<style>div#content {align:center;height:2040px;width:1000px;float:left;border-left:1px solid #D8F6FF040;border-right:1px solid #D8F6FF040;border-bottom:1px solid #D8F6FF040;}</style>
<style>
div#Head	{border:#6699CC;border-style:solid;border-width:5px;
			width:auto;height:100px;}

div#introduce	{
			border-bottom:groove 2px #999;/*border-width:2px;*/width:80%;height:25px;
	font-size:18px;color:#333;margin:10px auto 0 auto;text-align:center;}

div#caozuo{margin:0 auto;width:50%;}
</style>

<div id="content" style="margin-top:20px;" >
<div id="Head" >
           <div id="introduce" style="font-size:18px;color:#000">微博分析平台</div>
           <div id="caozuo">           
           <form action="pull.do" method="post">
 	<span style="font-size:18px;color:#000"> <p>请输入微博用户名: </span><input type="text" name="weiboName" /> 
	<input type="submit" value="绘制关系图谱" style="font-size:14px;font-family:微软雅黑;" /></p>
			</form>
			<form action="pull.do" method="post" id="hiddenform" hidden="true"><input id="hiddeninput" name="hiddeninput" type="text" name="weiboName" /> </form>
    		 </div>
 </div>

 <!--  -->
<div class="container" style="margin-top:10px;position:relative;border:2px solid #1E90FF;
	border-radius:4px 4px 4px 4px;
-moz-border-radius:4px; -webkit-border-radius:4px;">
		<div style="width:200px;height:30px;z-index:6;float:right;position:relative;top:0px;">
			<select id="sigma-select" class="sigma-select-class" data-placeholder="搜索好友">
				<option value="-1"></option>
			</select>
		</div>		
		<img src="dataMiningResource/images/sigma/3-small.png" class="titlelogo">
		<div class="title" style="boder-bottom:0px;background:#c0d9db;"><span id="zhujue" style="text-align:center;">好友关系图</span></div>	
		<div class="sigma-parent" id="sigma-example-parent" style="width:996px;position:absolute;">
			<div class="sigma-expand" id="sigma-example">
			<canvas height="480px" width="996px" class="sigma_nodes_canvas" id="sigma_nodes_1" style="position: absolute;"></canvas>
			<canvas height="480px" width="996px" class="sigma_labels_canvas" id="sigma_labels_1" style="position: absolute;"></canvas>
			<canvas height="480px" width="996px" class="sigma_hover_canvas" id="sigma_hover_1" style="position: absolute;"></canvas>
			<div height="480px" width="996px" class="sigma_monitor_div" id="sigma_monitor_1" style="position: absolute;"></div>
			<canvas height="480px" width="996px" class="sigma_mouse_canvas" id="sigma_mouse_1" style="position: absolute;"></canvas>
			</div>
		 </div>

	  <div id="menucontent" style="top:40px;width:40px;color:#000;height:200px;z-index:6;float:left;position:relative;">
			<ul id="plotmenu">
				<li id="init" title="返回默认"><a href="javascript:init()" style="font-size:1px;"><span class="ui-icon ui-icon-arrowreturnthick-1-w"></span>&nbsp;</a></li>
				<li id="advanced" title="局部放大"><a href="javascript:advanced()" style="font-size:1px;"><span class="ui-icon ui-icon-zoomin" ></span>&nbsp;</a></li>
				<li id="hidden" title="隐藏节点"><a href="javascript:hidden()" style="font-size:1px;"><span  class="ui-icon ui-icon-cancel"></span>&nbsp;</a></li>
				<li id="attri" title="直线型"><a href="javascript:attri()" style="font-size:1px;"><span class="ui-icon ui-icon-grip-solid-vertical" ></span>&nbsp;</a></li>
				<li id="imatatecluster" title="聚类"><a href="javascript:imatatecluster()" style="font-size:1px;"><span class="ui-icon ui-icon-bullet" ></span>&nbsp;</a></li>
			</ul>
	</div>
	<div style="width:100px;height:30px;float:right;position:relative;right:-25px;">
			<a href="#" id="sigma-para-button" style="font-size:12px;font-family:微软雅黑;" name="1">收起</a>
	</div>
	<div class="toggler">
	    <div id="sigma-para-toggle" style="color:#000;">
			<h3>基本信息</h3>
		</div>
	</div>
	<div id="sigma-dialog" title="好友基本信息" style="font-size:16px;font-family:微软雅黑;"></div>
</div>
  <div  style="min-width: 280px; width:590px;height: 352px; margin: 0 auto; float:left;position:relative;top:20px;" class="frameborder">
		<img src="dataMiningResource/images/province/3-small.png" class="titlelogo">
		<div class="title"><span>好友地域分布</span></div>
		<div id="province"></div>
		<img src = "dataMiningResource/mapright.png" style="position: relative;bottom:250px;left:500px;">
  </div>
  <div id="influencerank" style="min-width: 280px; width:382px;height: 352px; margin: 0 auto; float:left;position:relative;top:20px;left:20px;" class="frameborder">
  <img src="dataMiningResource/images/influencerank/2-small.png" class="titlelogo">
	<div class="title">
		<span>好友影响度排名</span>
	</div>
	<table class="table" id="ranktable">
		<tr style="border-bottom: 1px solid #FFB6C1;height: 27px;">
			<th>排名</th>
			<th>昵称</th>
		</tr>
		<tr class="tr0">
			<td style = "width:35px; color: #000;"><span class = "tdtop">1</span></td>
			<td style = "width:147px; " class="rankname"></td>
		</tr>
		<tr class="tr1">
			<td style = "width:35px; color: #000;"><span class = "tdtop">2</span></td>
			<td style = "width:147px; " class="rankname"></td>
		</tr>
		<tr class="tr0">
			<td style = "width:35px; color: #000;"><span class = "tdtop">3</span></td>
			<td style = "width:147px; " class="rankname"></td>
		</tr>
		<tr class="tr1">
			<td style = "width:35px; color: #000;">4</td>
			<td style = "width:147px; " class="rankname">			</td>
		</tr>
		<tr class="tr0">
			<td style = "width:35px; color: #000;">5</td>
			<td style = "width:147px; " class="rankname"></td>
		</tr>
		<tr class="tr1">
			<td style = "width:35px; color: #000;">6</td>
			<td style = "width:147px; " class="rankname"></td>
		</tr>
		<tr class="tr0">
			<td style = "width:35px; color: #000;">7</td>
			<td style = "width:147px; " class="rankname">	</td>
		</tr>
		<tr class="tr1">
			<td style = "width:35px; color: #000;">8</td>
			<td style = "width:147px; " class="rankname">			</td>
		</tr>
		<tr class="tr0">
			<td style = "width:35px; color: #000;">9</td>
			<td style = "width:147px;" class="rankname">			</td>
		</tr>
		<tr class="tr1">
			<td style = "width:35px; color: #000;">10</td>
			<td style = "width:147px; " class="rankname"></td>
		</tr>
	</table>
  </div>
  <!--  -->
    <div id="para" style="min-width: 280px; width:510px;height: 300px; margin: 0 auto; float:left;position:relative;top:40px;" class="frameborder">
		<img src="dataMiningResource/images/userpara/3-small.png" class="titlelogo">
		<div class="title">
			<span>用户属性</span>
		</div>
		<div id="parachart" style="height:270px;float:left;width:470px;" >			
		</div>
	</div>
    <div id="sexanddegree" style=" width:462px;height: 300px; margin: 0 auto; float:left;position:relative;top:40px;left:20px;" class="frameborder">
		<img src="dataMiningResource/images/ratio/3-small.png" class="titlelogo">
		<div class="title">
			<span>用户属性</span>
		</div>
		<div id="degree" style="MARGIN-RIGHT: auto; MARGIN-LEFT: auto;width:230px;height:280px;float:left;position:relative;top:10px;left:10px;">
				</div>
		<div id="sex" style="MARGIN-RIGHT: auto; MARGIN-LEFT: auto;width:230px;height:280px;float:left;position:relative;top:10px;left:10px;">
		</div>		
	</div>

	<div id="weibo" style="min-width: 280px; width:552px;height: 400px; margin: 0 auto; float:left;position:relative;top:60px;" class="frameborder">
		<img src="dataMiningResource/images/weibochart/3-small.png" class="titlelogo">
		<div class="title">
			<span>近期微博转发曲线</span>
		</div>
		<div style="top:5px;position:relative;">
			<form><select id="weibolist" style="width:220px;" data-placeholder="近期微博列表">
				</select></form>
		</div>
		<div id="weibochart" style="width:550px;margin: 0 auto; float:left;height:330px;">
		</div>
		
	</div>
	<div id="weibospread" style="width:420px;margin: 0 auto; position:relative;float:left;height:400px;top:60px;left:20px; " class="frameborder">
	<img src="dataMiningResource/images/sigma/2-small.png" class="titlelogo">
	<div class="title" style="boder-bottom:0px"><span id="zhujue" style="text-align:center">微博转发图</span></div>
		<div  id="sigma-weibospread" style="position:relative;border-radius:4px 4px 4px 4px;
-moz-border-radius:4px; -webkit-border-radius:4px;background:#c0d9dbz; height:370px;">
			<div class="sigma-expand" id="sigma-example-weibospread">
			<canvas height="370px" width="430px" class="sigma_nodes_canvas" id="sigma_nodes_2" style="position: absolute;"></canvas>
			<canvas height="370px" width="430px" class="sigma_labels_canvas" id="sigma_labels_2" style="position: absolute;"></canvas>
			<canvas height="370px" width="430px" class="sigma_hover_canvas" id="sigma_hover_2" style="position: absolute;"></canvas>
			<div height="370px" width="430px" class="sigma_monitor_div" id="sigma_monitor_2" style="position: absolute;"></div>
			<canvas height="370px" width="430px" class="sigma_mouse_canvas" id="sigma_mouse_2" style="position: absolute;"></canvas>
			</div>
		</div>
	</div>
	<div style="min-width: 280px; width:396px; height: 240px; margin: 0 auto; float:left;position:relative;top:80px;" class="frameborder">
	<img src="dataMiningResource/images/weibotext/3-small.png" class="titlelogo">
		<div class="title">
			<span>微博内容</span>
		</div>
		<div id="weibotext" class="text"></div>
	</div>
	<div  style="min-width: 280px; width:576px; height: 240px; margin: 0 auto; float:left;position:relative;top:80px;left:20px;" class="frameborder">
		<img src="dataMiningResource/images/weiboemotion/2-small.png" class="titlelogo">
		<div style="width:200px;height:30px;z-index:6;float:right;position:relative;top:0px;">
			<select id="weibodemo-select"  data-placeholder="热点微博事件分析">
				<option value="-1"></option>
				<option value="1">你妈打你，用什么最顺手</option>
				<option value="2">台湾双胞胎</option>
				<option value="3">毕业季</option>
				<option value="4">韩国沉船事故</option>
			</select>
		</div>	
		<div class="title">
			<span>微博情感分析</span>
		</div>
		<div id="weiboemopie" style="MARGIN-RIGHT: auto; MARGIN-LEFT: auto;text-align:center;width:500px;height:280px;float:left;position:relative;top:-40px;"></div>	
		<div id="weibodemo-dialog"  style="font-size:16px;font-family:微软雅黑;"></div>
	</div>
  
</div>

<div id="footer" >copyright@北京邮电大学信息理论与技术教研中心</div>
</div>
	<script>window.onload = setInit('dataMiningResource/gexfs/${userParameter.getuserName()}/1.gexf');</script>	
<script>
	//加载表格数据和地图
	$(document).ready(function(){
		if(${FRIENDS_WITH_WEIGHTS.size()} !=0)
		{
			var tableObj = document.getElementById("ranktable");
			var weights = new Array(10);
			weights[0] = '${FRIENDS_WITH_WEIGHTS[0].getPosition()}';
			weights[1] = '${FRIENDS_WITH_WEIGHTS[1].getPosition()}';
			weights[2] = '${FRIENDS_WITH_WEIGHTS[2].getPosition()}';
			weights[3] = '${FRIENDS_WITH_WEIGHTS[3].getPosition()}';
			weights[4] = '${FRIENDS_WITH_WEIGHTS[4].getPosition()}';
			weights[5] = '${FRIENDS_WITH_WEIGHTS[5].getPosition()}';
			weights[6] = '${FRIENDS_WITH_WEIGHTS[6].getPosition()}';
			weights[7] = '${FRIENDS_WITH_WEIGHTS[7].getPosition()}';
			weights[8] = '${FRIENDS_WITH_WEIGHTS[8].getPosition()}';
			weights[9] = '${FRIENDS_WITH_WEIGHTS[9].getPosition()}';
			for(var i=1;i<tableObj.rows.length;i++)
			{
				tableObj.rows[i].cells[1].innerHTML = weights[i-1];
			}
		}
		map(eval(${province}));
})
</script>
<!--参数-->
<script>
	$(function(){
		//<!--层级图-->
		var low1=0.08,high1=1.2,average1=0.1,coef=(${userParameter.getClusterCoefficient()}).toFixed(2);
		var low2=0.1,high2=0.2,average2=0.14,truefollratio= (${userParameter.gettruefollRatio()}).toFixed(2);
		var low3=0.2,high3=0.4,average3=0.3,biratio= (${userParameter.getBilateralRatio()}).toFixed(2);
		var help={	"好友紧密度":"反应好友圈的互动程度",
					"互相关注率":"与好友互相关注的比例",
					"真粉率":"真实粉丝的比例"};
		var parachart = new Highcharts.Chart({
        chart: {
			renderTo:'parachart',
            type: 'column',
			style: {
            fontFamily: 'Microsoft YaHei'
			},
            marginTop: 30,
            marginRight: 40,
			backgroundColor: 'rgba(255, 255, 255, 0)',
			plotBackgroundColor: null,  
			plotBorderWidth: null,
			plotBackgroundImage:null,  
			plotBorderWidth: null,  
			plotShadow: false
        },
		colors: ["#1E90FF", "#8085e9"],
        title: {
            text: ''
        },
        xAxis: {
            categories: ['好友紧密度', '互相关注率', '真粉率'],
			labels:{
						enabled:true,
						style:{color:'#000'},
						formatter:function(){
							return '<span title="<p>' + help[this.value]  + '</p>">' + this.value + '</span>';
						},
						useHTML:true
					},
			tickLength: 0,
			lineColor:'#000'
        },
        yAxis: {
            allowDecimals: false,
            min: 0,
			max: 1,
            title: {
                text: ''
            },
			labels:{
						style:{color:'#000'}
					},
			tickInterval: 0.2,
			tickColor:'#000',
			gridLineColor:'#000'
        },
        tooltip: {
            formatter: function(){
				var s = '<b>' + this.x + '</b><br>';
				$.each(this.points,function(i,point){
					if (point.y != 0)
					{
						s += '<br/>' + point.series.name + ':' + point.y;
					}
				});
				return s;
			},			
			shared:true
        },
        plotOptions: {
            column: {
				borderWidth:0,
                depth: 40
            }
        },
        series: [{
            name: '${userParameter.getuserName()}',
            data: [${userParameter.getClusterCoefficient()},${userParameter.getBilateralRatio()}, ${userParameter.gettruefollRatio()}]
        }, {
            name: '平均值',
            data: [0.1, 0.4, 0.08],
        }],
		legend:{
            align: 'right',
            verticalAlign: 'top',
			backgroundColor:'#afb4db',
			borderColor:'#3399CC',
			borderRadius:2,
			itemStyle:{color:'#000'},
			labelFormatter:function(){
				if(this.name == 'Series 1')
					return "当前用户";
				else
					return this.name;
			}
		},
		credits:{enabled:false},
		exporting:{enabled:false}
    });

		//<!--性别比例-->
		var sexchart = new Highcharts.Chart({
        chart: {
			renderTo:'sex',
			backgroundColor: 'rgba(255, 255, 255, 0)',
			plotBackgroundColor: null,  
            plotBorderWidth: null,
		    plotBackgroundImage:null,  
            plotBorderWidth: null,  
            plotShadow: false,
			style: {
            fontFamily: 'Microsoft YaHei'
			}
        },
		colors:Highcharts.map(['#00BFFF','#FF00FF'], function(color) {
					return {
						radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
						stops: [
							[0, color],
							[1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
						]
					};
				}),
        title: {
            text: '好友性别分布',
			style:{
					color:'#000'
				}
        },
        tooltip: {
    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
				size:150,
                allowPointSelect: true,
                cursor: 'pointer',
				borderColor:null,
				borderWidth:0,
                dataLabels: {
                    enabled: true,
					format: '{point.name}: {point.percentage:.0f}%',
					color:'white',
					distance:-30
                }
            }
        },
        series: [{
            type: 'pie',
            name: '所占百分比',
            data: [
               ['男',5],
			   ['女',5],
				]
			}],
		credits:{
			enabled:false},
		exporting:{
			enabled:false
		}
		});
		//<!--出度入度比例-->
		var degreechart = new Highcharts.Chart({
        chart: {
			renderTo:'degree',
			backgroundColor: 'rgba(255, 255, 255, 0)',
			plotBackgroundColor: null,  
            plotBorderWidth: null,
		    plotBackgroundImage:null,  
            plotBorderWidth: null,  
            plotShadow: false,
				style: {
            fontFamily: 'Microsoft YaHei'
			},
        },
		colors:Highcharts.map(['#00BFFF','#FF00FF'], function(color) {
					return {
						radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
						stops: [
							[0, color],
							[1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
						]
					};
				}),
        title: {
            text: '关注和粉丝比例',
			style:{
					color:'#000'
				}
        },
        tooltip: {
    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
				size:150,
				borderColor:null,
				borderWidth:0,
                dataLabels: {
                    enabled: true,
					color:'white',
					format: '{point.name}: {point.percentage:.0f}%',
					distance:-30
                }
            }
        },
        series: [{
            type: 'pie',
            name: '所占百分比',
            data: [
               ['关注',1],
			   ['粉丝',1],
				]
			}],
		credits:{
			enabled:false},
		exporting:{
			enabled:false
		}
		});

		
		if((${WEBSITE_GENDER_MAN} !=0) &&(${WEBSITE_GENDER_WOMAN} !=0))
		{
			var data = [];
			data.push(['男',${WEBSITE_GENDER_MAN}]);
			data.push(['女',${WEBSITE_GENDER_WOMAN}]);
			sexchart.series[0].setData (data);
			sexchart.redraw();
		}
		if((${userParameter.getVtexin()} !=0) &&(${userParameter.getVtexout()} !=0))
		{
			var data = [];
			data.push(['关注',${userParameter.getVtexin()}]);
			data.push(['粉丝',${userParameter.getVtexout()}]);
			degreechart.series[0].setData(data);
			degreechart.redraw();
		}		
		
});
</script>

<!--微博数据-->
<script>
	$(document).ready(function (){

		//微博转发
		Highcharts.setOptions({
			lang:{
				resetZoom:'重置'
			}
		});
		 var weibochart = new Highcharts.Chart({			 
            colors:["#1E90FF"],
			chart: {
				renderTo:'weibochart',
                type: 'areaspline',
				backgroundColor: 'rgba(255, 255, 255, 0)',
				zoomType:'x',
				plotBackgroundColor: null,  
				plotBorderWidth: null,
				plotBackgroundImage:null,  
				plotBorderWidth: null,
					style: {
						fontFamily: 'Microsoft YaHei'
						},
            },
            title: {
                text: '近期微博转发曲线',
				style:{
					color:'#000'
				}
            },
            legend: {
                enabled:false
            },
            xAxis: {
                    type:'linear',
					title:{
						text:'时间(单位:20minutes)',
						style:{
							color:'#000',
							}
					},
					labels:{
						style:{color:'#000'}
					},
					lineColor:'#000'
            },
            yAxis: {
                title: {
                    text: '转发次数/20minutes',
					style:{
						color:'#000'
					}
                },
				labels:{
						style:{color:'#000'}
					},
				lineColor:'#000',
				gridLineColor: '#000'
            },
            tooltip: {
                formatter:function(){
					return '转发次数:<b>' + this.y + '</b>';
				}
            },
            credits: {
                enabled: false
            },
            plotOptions: {
                areaspline: {
                    fillOpacity: 0.8
                }
            },
            series: [{
                name: '转发次数',
				type:'area',
				fillColor : {
					  linearGradient : [0, 0, 0, 500],
					  stops : [
						[0, "#1E90FF"],
						[1, 'rgba(255,255,255,0)']
					  ]
				  },
                data: []
            }],
			exporting:{
					enabled:false
				}
        });
		//选择微博，触发加载数据事�?加载转发曲线�?
		$('#weibolist').on('change',function(){
			var weiboid = $(this).children('option:selected').val() + '';
			//GET data
			$.ajax({
					url:"weibocurve.do",
					data:{'wid':weiboid},
					type:'get',
					dataType:'json',
					success:function(data){
						var chartdata=[];
						for(var i = 0;i < data.length;i ++)
						{
							chartdata.push([data[i].date,data[i].count]);
						}
						weibochart.series[0].setData(chartdata);
						weibochart.redraw();
						loadWeiboSpread('${userParameter.getuserName()}' + '/' + weiboid);
					},
					error:function(){
						document.getElementById("sigma-example-weibospread").innerHTML = "";
						weibochart.series[0].setData([]);
						weibochart.redraw();
					}
			})
			
			//更新微博内容和情感�?
			var text = $(this).find('option:selected').text() ;
			weibotext.innerHTML = text;
			//TODO
			//情感�?
		})
		//加载微博列表
		if('${userParameter.getID()}' != '')
		{
				$.ajax({
					url:"recentweibolist.do",
					data:{'uid':'${userParameter.getID()}'},
					type:'get',
					dataType:'json',
					success:function(data){
						if(data.length != 0)
						{
							for(var i = 0; i < data.length; i++)
							{
								var jsonObj = data[i];
								$('#weibolist').append("<option style='width:200px;' value=" + data[i].ID + ">" + data[i].Text + "</option>");
							}
							$('#weibolist').get(0).selectedIndex=0;
							$('#weibolist').trigger("chosen:updated");
							$('#weibolist').trigger('change');
						}
					}
				});
				$.ajax({
					url:"weiboemotion.do",
					data:{'uid':'${userParameter.getID()}'},
					type:'get',
					dataType:'json',
					success:function(data){
						var chartdata=[];
						for(var i = 0;i < data.length;i ++)
						{
							if(data[i].emotion == "Angry"){
								chartdata[0] = [data[i].value];
							}
							if(data[i].emotion == "Happy"){
								chartdata[1] = [data[i].value];
							}
							if(data[i].emotion == "Sad"){
								chartdata[2] = [data[i].value];
							}
						}
						weiboemotion(chartdata);
					}
				});
		}
})
</script>
<script>
  if (!document.getElementById("sigma_nodes_1").getContext)
  {         alert("您的浏览器不支持HTML5，请换用支持HTML的浏览器");     }
</script>

</body>
<!-- InstanceEnd --></html>
