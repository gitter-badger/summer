<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>产品管理中心</title>
		<link   rel="stylesheet" type="text/css" href="static/js/ext-2.2/resources/css/ext-all.css" /> 
	    <script type="text/javascript" src="static/js/ext-2.2/adapter/ext/ext-base.js"></script>
	    <script type="text/javascript" src="static/js/ext-2.2/ext-all.js"></script>
	</head>
	<body>
		<script LANGUAGE="javascript">
			 Ext.onReady(function()
			 {
				Ext.QuickTips.init();
				
				 //页面的上部分
			    var northPanel=new Ext.Panel({
			        title:"顶部面板(实际应用中，通常去掉改属性)",//实际应用中，通常去掉该属性。
			        region : 'north',//北部，即顶部，上面
			        contentEl : 'north-div',//面板包含的内容
			        split : false,
			        border : false,//当面板内容超出面板大小时，是否显示边框
			        collapsible : false,//是否可以收缩,默认不可以收缩，即不显示收缩箭头
			        //collapsed:true,//初始化是否显示, 默认是显示
			        height : 60
			    });
				 
			    //左边菜单
			    var  westPanel=new Ext.Panel({
			        title : '左边菜单',//面板名称
			        region : 'west',//该面板的位置，此处是西部 也就是左边
			        split : true,//为true时，布局边框变粗 ,默认为false
			        border : false,
			        collapsible : true,
			        collapsed:false,//初始化是否显示, 默认是显示
			        width : 150,
			        minSize : 10,//最小宽度
			        maxSize : 300,
			        layout : 'accordion',
			        layoutConfig : { //布局
			            titleCollapse : true,
			            animate : true,
			            activeOnTop : false
			        },
			        items : [{
			                title : '统计查询',
			                iconCls : 'money_box'//字面板样式
			                //contentEl : 'my-book'//子面板包含的内容，contentEl 的值日通常是一个div ID
			            },
			            {
			                title:"内容管理",
			                border:false,autoScroll:true,iconCls:"Icon"
			                //autoLoad:{url:"xx.htm",scripts:true}//面板的内容是指向一个*.htm，scripts:true 是表示支持包含文件里面的js脚本
			            }
			  
			        ]
			    });
			    //页面的右边
			    var eastPanel=new Ext.Panel(
			    {
			        region:"east",
			        title:"右边",
			        collapsible:true,
			        collapsed:true,
			        //collapsed:true,//是否显示
			        split:true,
			        width:225,
			        minSize:175,maxSize:400,layout:"fit",margins:"0 5 0 0",
			        layout:"accordion",iconCls:"my-toolPanelIcon",layoutConfig:{animate:true}
			    });
			     
			    //页面的底部
			    var southPanel=new Ext.Panel( {
			        title:'底部面板',
			        region:"south",
			        split:true,height:80,minSize:60,maxSize:150,collapsible:true,collapsed:true,
			        contentEl:"footer",
			        title:"底栏",
			        margins:"0 0 0 0"    
			    });
			    //页面的中间面板
			    var centerPanel=new Ext.Panel( {
			        region : 'center',//中间 主显示面板
			        activeTab : 0,
			        enableTabScroll : true,
			        border : false,
			        items : [{
			            id : 'HomePage',
			            title : '首页',
			            iconCls : 'home',
			            contentEl : 'hp',//显示的内容,hp 是div ID
			            closable : false,
			            layout : 'fit'
			        }]
			    });
			    
			    var viewport = new Ext.Viewport({
			        layout : 'border',//布局,必须是border
			        loadMask : true,
			        items : [northPanel, //上
			                westPanel,//左
			                centerPanel,//中
			                eastPanel,//右
			                southPanel//下
			            ]
			    });
			});
		</script>
		
		<div id="north-div" align="center">
		     上 上 上 上 上
		   </div>
		   <div id="hp" style="margin: 40px 20px 10px 20px; font-weight: lighter">
		       <div style="font-size: 16px; color: red;"> 面板的布局分为：东西南北中 也就是左右上下中 </div>
		       </div>
		   </div>
		    <div id="footer" class="footer">
		    <div>
		       Copyright <span style="font-size: 20px;vertical-align:bottom;">©</span> 2007-2008 
		      
		       <sup style="font-size: 16px">®</sup> 版权所有
		       </div>
		   </div>
	</body>
</html>
