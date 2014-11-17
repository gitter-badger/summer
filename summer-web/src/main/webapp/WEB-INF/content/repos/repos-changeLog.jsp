<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>版本变更记录</title>
		<link type="text/css" rel="stylesheet" href="static/about/changeLog.css"/>
		<script type="text/javascript" src="static/about/changeLog.js"></script>
		<script type="text/javascript">
			globalParams.projectName = '${changeLog.projectName}';
			globalParams.projectVersion = '${changeLog.projectVersion}';
			
			//生成静态文件.
			function repos_genarate_logHtml(){
				var cbody = document.getElementById('changeLog_body').innerHTML;
				globalParams.loghtml = cbody;

				$.ajax( {
					url:'log/genarate',
					data : globalParams,
					type : 'POST',
					async : false,
					cache : false,
					success:function(result){
						//$container.html(result);
						//console.log(result);
						var $result = document.getElementById('genarate_logHtml_result');
						//console.log('result:',$result);
						$result.innerHTML = "生成成功，访问链接<a href='"+ result +"' target='_blank'>点击访问</a>";
					},
					error:function(error){
						alert(error);
					}
				});
			}
			
			//导出分析日志.
			function repos_export_analysisLog(){
				//判断文件是否存在.
				$.ajax( {
					url:'log/changeValidate',
					data : globalParams,
					type : 'POST',
					async : false,
					cache : false,
					success:function(result){
						if(result == 'false'){
							//不存在,则重新生成.
							repos_genarate_logHtml();
						}
						var $iframe = document.getElementById('export_analysisLog_iframe');
						$iframe.setAttribute("src","log/down?projectName="+ globalParams.projectName +"&projectVersion="+globalParams.projectVersion);
					},
					error:function(error){
						alert(error);
					}
				});
				
			}
			
		</script>
	</head>
	<body>
		<div class="toolbar">
			<input type="button" value="返回" onclick="repos_return();"/>
			<input type="button" value="生成Html" onclick="repos_genarate_logHtml();"/>
			<input type="button" value="导出Html" onclick="repos_export_analysisLog()"/>
		</div>
		<iframe id="export_analysisLog_iframe" style="width:0;height:0;"></iframe>
		<div id="genarate_logHtml_result"></div>
		<div id="changeLog_body">
			<div class="changeLog_box">
				<div class="changeLog_title showContent" onclick="show_changeLogContent(this);">${changeLog.projectName} ${changeLog.projectVersion} Release Notes</div>
				<div class="changeLog_content">
					<div class="section">
						<div class="releaseVersion">	<span class="label codeVersion">版本:</span> <span class="value">${changeLog.projectVersion}</span></div>
						<div class="releaseTime">		<span class="label buildTime">日期:</span> <span class="value">${changeLog.projectTime}</span></div>
						<div class="releaseDescription"><span class="label description">说明:</span> 
							<span class="value">${changeLog.projectNote}</span>
						</div>
					</div>
					<c:forEach var="group" varStatus="vstatus" items="${changeLog.groupList}">
					<div class="module_group">
						<div class="module_group_title" onclick="show_GroupContent(this)">${group.name}</div>
						<div class="module_group_content" style="display:none;">
							<div class="section">
								<h4>新增功能/资源</h4>
								<ul class="releaseUl releaseNew">
									<c:if test="${group.newLogList.size() == 0}">
										<li>1.无</li>
									</c:if>
									<c:forEach var="log" varStatus="vstatus" items="${group.newLogList}">
										<li onclick="show_logDetail(this);">${vstatus.index+1}. ${log.actComment} <span class="logUInfo">Revision ${log.version} by ${log.author}</span></li>
										<div class="log_detail" style="display:none;">
											<b>影响范围:</b> ${log.effectComment}<br/>
											<b>变更路径:</b><br/>
												<c:forEach var="cpath" items="${log.changePath}">
												<span class="${cpath.type}">&nbsp;&nbsp;</span><a href="#">${cpath.path}</a><br/>
												</c:forEach>
										</div>
									</c:forEach>
								</ul>
							</div>
							<div class="section">
								<h4>调整优化</h4>
								<ul class="releaseUl releaseUpdate">
									<c:if test="${group.updateLogList.size() == 0}">
										<li>1.无</li>
									</c:if>
									<c:forEach var="log" varStatus="vstatus" items="${group.updateLogList}">
										<li onclick="show_logDetail(this);">${vstatus.index+1}. ${log.actComment} <span class="logUInfo">Revision ${log.version} by ${log.author}</span></li>
										<div class="log_detail" style="display:none;">
											<b>影响范围:</b> ${log.effectComment}<br/>
											<b>变更路径:</b><br/>
												<c:forEach var="cpath" items="${log.changePath}">
												<span class="${cpath.type}">&nbsp;&nbsp;</span><a href="#">${cpath.path}</a><br/>
												</c:forEach>
										</div>
									</c:forEach>
								</ul>
							</div>
							<div class="section">
								<h4>修复BUG</h4>
								<ul class="releaseUl releaseFix">
									<c:if test="${group.fixLogList.size() == 0}">
										<li>1.无</li>
									</c:if>
									<c:forEach var="log" varStatus="vstatus" items="${group.fixLogList}">
										<li onclick="show_logDetail(this);">${vstatus.index+1}. ${log.actComment} <span class="logUInfo">Revision ${log.version} by ${log.author}</span></li>
										<div class="log_detail" style="display:none;">
											<b>影响范围:</b> ${log.effectComment}<br/>
											<b>变更路径:</b><br/>
												<c:forEach var="cpath" items="${log.changePath}">
												<span class="${cpath.type}">&nbsp;&nbsp;</span><a href="#">${cpath.path}</a><br/>
												</c:forEach>
										</div>
									</c:forEach>
								</ul>
							</div>
							<div class="section">
								<h4>废弃功能/资源</h4>
								<ul class="releaseUl releaseDel">
									<c:if test="${group.delLogList.size() == 0}">
										<li>1.无</li>
									</c:if>
									<c:forEach var="log" varStatus="vstatus" items="${group.delLogList}">
										<li onclick="show_logDetail(this);">${vstatus.index+1}. ${log.actComment} <span class="logUInfo">Revision ${log.version} by ${log.author}</span></li>
										<div class="log_detail" style="display:none;">
											<b>影响范围:</b> ${log.effectComment}<br/>
											<b>变更路径:</b><br/>
												<c:forEach var="cpath" items="${log.changePath}">
												<span class="${cpath.type}">&nbsp;&nbsp;</span><a href="#">${cpath.path}</a><br/>
												</c:forEach>
										</div>
									</c:forEach>
								</ul>
							</div>
							<div class="section">
								<h4>其它</h4>
								<ul class="releaseUl releaseOther">
									<c:if test="${group.otherLogList.size() == 0}">
										<li>1.无</li>
									</c:if>
									<c:forEach var="log" varStatus="vstatus" items="${group.otherLogList}">
										<li onclick="show_logDetail(this);">${vstatus.index+1}. ${log.actComment} <span class="logUInfo">Revision ${log.version} by ${log.author}</span></li>
										<div class="log_detail" style="display:none;">
											<b>影响范围:</b> ${log.effectComment}<br/>
											<b>变更路径:</b><br/>
												<c:forEach var="cpath" items="${log.changePath}">
												<span class="${cpath.type}">&nbsp;&nbsp;</span><a href="#">${cpath.path}</a><br/>
												</c:forEach>
										</div>
									</c:forEach>
								</ul>
							</div>
						</div>					
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</body>
</html>
