<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table>
	<tr>
		<th></th>
		<th>文件(夹)名</th>
		<th>拓展名</th>
		<th>版本号</th>
		<th>作者</th>
		<th>大小</th>
		<th>日期</th>
		<th>是否锁定</th>
	</tr>
	<c:if test="${isRoot == false}">
		<tr>
			<td></td>
			<td><span style="color:blue;cursor: pointer;" onclick="refreshflist('..')">上一层</span></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</c:if>
	<c:forEach var="dir" items="${dirList}">
		<tr>
			<td><input name="version" type="checkbox" value="${dir.version}"/></td>
			<td><span style="color:blue;cursor: pointer;" onclick="refreshflist('${dir.name}','${dir.kind}')">${dir.name}</span></td>
			<td>${dir.ext}</td>
			<td>${dir.version}</td>
			<td>${dir.lastAuthor}</td>
			<td>${dir.size}</td>
			<td>${dir.date}</td>
			<td>${dir.isLock}</td>
		</tr>
	</c:forEach>
</table>