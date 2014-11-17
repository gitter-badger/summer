<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="repos_flog_content" style="border:1px solid blue;">
	<c:forEach var="log" items="${logList}">
		<div>
			版本：${log.version}<br/>
			作者：${log.author}<br/>
			日期：${log.date}<br/>
			注释：${log.comment}<br/>
			影响路径：<br/>
			<c:forEach var="cpath" items="${log.changePath}">
			&nbsp;&nbsp;${cpath.type}&nbsp;&nbsp;<a href="#">${cpath.path}</a><br/>
			</c:forEach>
		</div>
		<hr/>
	</c:forEach>
</div>