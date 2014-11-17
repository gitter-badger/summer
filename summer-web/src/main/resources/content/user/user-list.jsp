<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
<!--
	//删除用户
	function user_list_del(aobj,userName){
		$.ajax( {
			url:'user/remove',
			type : 'POST',
			data : {userName:userName},
			async : false,
			cache : false,
			success:function(obj){
				$('#user_list_msg').css({
					display :'block'
				});
				$('#user_list_msg').html('<font color=green>账号'+userName+'删除成功!</font>');
				$(aobj).parent().parent().remove();
			},
			error:function(error){
				$('#user_list_msg').style.display = 'block';
				$('#user_list_msg').html('<font color=red>账号删除出错!</font>');
			}
		});
	}
	//改密码
	function user_list_changePwd(userName){
		$.coder.common.pageToContent('user/toChangePwd?userName='+userName);
	}
//-->
</script>

<div id="user_list_msg" style="display: none;"></div>
<table border="1">
	<tr>
		<th colspan="3" style="text-align: center;">用户列表</th>
	</tr>
	<tr>
		<th>用户名</th>
		<th colspan="2">操作</th>
	</tr>
	<c:forEach var="user" items="${userList}">
		<tr>
			<td>${user.name}</td>
			<td><span style="color:blue;cursor: pointer;" onclick="user_list_del(this,'${user.name}')">删除</span></td>
			<td><span style="color:blue;cursor: pointer;" onclick="user_list_changePwd('${user.name}')">改密码</span></td>
		</tr>
	</c:forEach>
</table>