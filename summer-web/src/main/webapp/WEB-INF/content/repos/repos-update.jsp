<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
<!--
	//仓库更新.
	function repos_update_submit(){
		var conf = repos_update_validate();
		if(conf == false){
			return;
		}
		$.ajax( {
			url:'repos/update',
			type : 'POST',
			data : {conf:conf},
			async : false,
			cache : false,
			success:function(obj){
				if('success' == obj){
					$('#repos_update_msg').html('<font color=green>仓库维护成功!</font>');
					//跳转至仓库列表页面
					$.coder.common.pageToContent('repos/list');
				}
			},
			error:function(error){
				$('#repos_update_msg').html('仓库维护出错!');
			}
		});
	}
	//验证,并返回配置值.
	function repos_update_validate(){
		var type = $('#repos_update_type').val();
		var name = $('#repos_update_name').val();
		if(name == ''){
			$('#repos_update_msg').html('请输入仓库名称!');
			return false;
		}
		var url = $('#repos_update_url').val();
		if(url == ''){
			$('#repos_update_msg').html('请输入仓库地址!');
			return false;
		}
		var account = $('#repos_update_account').val();
		if(account == ''){
			$('#repos_update_msg').html('请输入访问账号!');
			return false;
		}
		var pswd = $('#repos_update_pswd').val();
		if(pswd == ''){
			$('#repos_update_msg').html('请输入访问密码!');
			return false;
		}
		
		$('#repos_update_msg').html('');
		var conf = '{'+
			'"type":"'+ type +'",'+
			'"name":"'+ name +'",'+
			'"url":"'+ url +'",'+
			'"account":"'+ account +'",'+
			'"pswd":"'+ pswd +'"'+
			'}';
		//console.log('conf',conf);
		return conf;
	}
//-->
</script>

<div id="repos_update_msg" style="color:red"></div>
<form id="repos_updateForm" action="" method="post">
	<table>
		<tr>
			<th colspan="2" style="text-align: center;">仓库维护</th>
			<th></th>
		</tr>
		<tr>
			<td>仓库类型:</td>
			<td>
				<select id="repos_update_type" name="type">
					<option value="SVN" <c:if test="${'SVN' == repos.type}">selected="selected"</c:if>>SVN</option>
					<option value="GIT" <c:if test="${'GIT' == repos.type}">selected="selected"</c:if>>GIT</option>
				</select>
			</td>
			<td></td>
		</tr>
		<tr>
			<td>仓库名称:</td>
			<td><input id="repos_update_name" name="name" type="text" value="${repos.name}"/></td>
			<td id=""></td>
		</tr>
		<tr>
			<td>仓库地址:</td>
			<td><input id="repos_update_url" name="url" type="text" value="${repos.url}"/></td>
			<td></td>
		</tr>
		<tr>
			<td>访问账号:</td>
			<td><input id="repos_update_account" name="account" type="text" value="${repos.account}"/></td>
			<td id=""></td>
		</tr>
		<tr>
			<td>访问密码:</td>
			<td><input id="repos_update_pswd" name="pswd" type="password" value="${repos.pswd}"/></td>
			<td id=""></td>
		</tr>
	 	<tr>
	 		<td colspan="2" style="text-align:center;">
				<input type="button" value="提交" onclick="repos_update_submit()"/>
	 		</td>
	 		<td></td>
	 	</tr>
	</table>
</form>

<script type="text/javascript">
<!--
	//编辑状态,仓库名称只读
	var rname = $('#repos_update_name').val();
	if(rname != ''){
		$('#repos_update_name').attr("readonly","readonly");
	}
//-->
</script>