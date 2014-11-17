<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
<!--
	//删除用户仓库配置
	function repos_list_del(aobj,name){
		$.ajax( {
			url:'repos/remove',
			type : 'POST',
			data : {name:name},
			async : false,
			cache : false,
			success:function(obj){
				$('#repos_list_msg').html('<font color=green>仓库['+name+']删除成功!</font>');
				$(aobj).parent().parent().remove();
			},
			error:function(error){
				$('#repos_list_msg').html('<font color=red>仓库删除出错!</font>');
			}
		});
	}
//-->
</script>

<div id="repos_list_msg" style="color:red;"></div>
<table>
	<tr>
		<th colspan="5" style="text-align: center;">仓库列表</th>
	</tr>
	<tr>
		<th>仓库名称</th>
		<th>仓库地址</th>
		<th>仓库类型</th>
		<th>登陆账号</th>
		<th>操作</th>
	</tr>
	<c:forEach var="repos" items="${reposList}">
		<tr>
			<td>${repos.name}</td>
			<td>${repos.url}</td>
			<td>${repos.type}</td>
			<td>${repos.account}</td>
			<td>
				<span style="color:blue;cursor: pointer;" onclick="$.coder.common.pageToContent('repos/toView?name=${repos.name}');">浏览</span>
				<span style="color:blue;cursor: pointer;" onclick="$.coder.common.pageToContent('repos/toUpdate?name=${repos.name}');">编辑</span>
				<span style="color:blue;cursor: pointer;" onclick="repos_list_del(this,'${repos.name}')">删除</span>
			</td>
		</tr>
	</c:forEach>
</table>