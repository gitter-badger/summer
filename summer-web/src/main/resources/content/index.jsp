<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>EpicHust Code Manager</title>
		<link rel="stylesheet" type="text/css" href="static/css/index.css"/>
		<script type="text/javascript" src="static/js/jquery/1.6/jquery.js"></script>
		
		<script type="text/javascript">
		<!--
			//Url访问记录
			var urlHis = [];
		
			//返回前一页面.
			function repos_return(){
				var url = '';
				var param = {};
				if(urlHis.length > 1){
					var obj = urlHis[urlHis.length-2];
					url = obj.url;
					param = obj.params;
					
					//console.log('url',url,'param',param);
				}
				
				$.coder.common.pageToContent(url,param);
			}
			
			//自动计算高度.
			$(document).ready(function(){
				urlHis = [];
				
				var bodyHeight = $(document).height();
				var topHeight  = $('#top').height();
				var mqHeight = $('#menu_quick').height();
				var bottomHeight  = $('#bottom').height();
				var mheight =  bodyHeight-topHeight-bottomHeight-15;
				$('#menu').css('height',mheight);
				$('#menu_main').css('height',mheight-mqHeight);
				
				$('#index_content').css('height',mheight);
			});
		//-->
		</script>
	</head>
	<body>
		<div id="page">
            <div id="top">
            	<div id="logo"></div>
            	<div id="top_title">产品管理中心</div>
            	<div id="top_info">
            		<div id="top_user">Hi ${user}. |<a href="login">退出</a></div>
            		<div class="search_subject nowrap">
            			<div id="smartSearch" class="smartsearch">
	            			<input type="text" class="searchinput" fullsearch="1" id="subject" name="subject" autocomplete="off" value="全文搜索..." style="color: rgb(160, 160, 160);" onfocus="QMFullTextSearch.onfocus();" onblur="QMFullTextSearch.onblur();" onkeydown="QMFullTextSearch.onkeydown(event);">
	            			<span class="ss_icon ss_fronticon ss_icon_search" id="searchIcon"></span>
	            			<span class="ss_icon ss_endicon ss_icon_arrowdown" id="subjectsearchLogo" onclick="showAdvanceSearchMenu()">
	            			</span>
            			</div>
            		</div>
            	</div>
            </div>
            <div id="top_line">
            	<div id="top_line_left"></div>
            </div>
            <div id="middle">
            	<div id="menu">
            		<div id="menu_main">
	            		<ul>
	            			<li><a href="javascript:$.coder.common.pageToContent('repos/list')">代码仓库列表</a></li>
	            			<li><a href="javascript:$.coder.common.pageToContent('repos/toUpdate')">新增代码仓库</a></li>
	            			<c:if test="${'admin' == user}">
	            				<li><a href="javascript:$.coder.common.pageToContent('user/list')">用户列表</a></li>
	            			</c:if>
	            		</ul>
            		</div>
            	</div>
            	<div id="index_content">
            	</div>
            </div>
			<div id="bottom">
            	<div style="color:#555;position:absolute;bottom:7px;left:0px;;text-align:center;width:100%">
				Copyright &copy; 2014 <a style="color:#555" href="http://www.richeninfo.com" target="_blank">上海锐至信息技术有限公司</a>-Powered by Summer &reg;
				</div>
			</div>            
        </div>
	</body>
</html>
