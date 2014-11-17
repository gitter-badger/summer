<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
<!--
	//验证.
	function onsubmitfun(){
		var uname = $('#uname').val();
		var upswd = $('#upswd').val();
		var npswd = $('#npswd').val();
		var npswd1 = $('#npswd1').val();
		
		//console.log(upswd,npswd,npswd1);
		//
		if(upswd == ''){
			$('#result').html('密码不能为空!');
			return false;
		}
		if(npswd == ''){
			$('#result').html('新密码不能为空!');
			return false;
		}
		if(npswd != npswd1){
			$('#result').html('两次输入的新密码需保持一致!');
			return false;
		}
		//验证旧密码
		var result = true;
		$.ajax( {
			url:'user/validateUserPwd',
			type : 'POST',
			data : {uname:uname,upswd:upswd},
			async : false,
			cache : false,
			success:function(obj){
				if(obj == false || obj == 'error'){
					$('#result').html('旧密码错误,请输入正确的密码!');
					result = false;
				}
			},
			error:function(error){
				$('#result').html('验证旧密码出错!');
			}
		});
		
		return result;
	}
	//提交修改.
	function submitfun(){
		var result = onsubmitfun();
		
		if(result == true){
			var uname = $('#uname').val();
			var npswd = $('#npswd').val();
			$.ajax( {
				url:'user/changePwd',
				type : 'POST',
				data : {uname:uname,npswd:npswd},
				async : false,
				cache : false,
				success:function(obj){
					if(obj == true || obj == 'success'){
						var intervalTime = 3;
						var countdown = intervalTime;
						var finterval=0;
						finterval = setInterval(function(){
							console.log('intervalTime',intervalTime);
							$('#result').html('<font color=green>修改成功! 等待跳转... '+ --countdown +' </font>');
							if(countdown == 0){
								//关闭倒计时.
								clearInterval(finterval);
								//跳转.
								$.coder.common.pageToContent('user/list');
							}
						},1000);
					}
				},
				error:function(error){
					$('#result').html('修改密码出错,请重试!');
				}
			});
		}
	}
//-->
</script>
<div id="result" style="color:red; padding-left:5px;"></div>
<form action="user/changePwd" method="post" onsubmit="return onsubmitfun()">
	<table>
		<tr>
	 		<td colspan="3" style="text-align:center;">
				修改密码
	 		</td>
	 		<td></td>
	 	</tr>
		<tr>
			<td>账号:</td>
			<td><input id="uname" name="uname" type="text" value="${user}" readonly="readonly"/></td>
			<td id="unmsg"></td>
		</tr>
		<tr>
			<td>密码:</td>
			<td><input id="upswd" name="upswd" type="password" value=""/></td>
			<td></td>
		</tr>
		<tr>
			<td>新密码:</td>
			<td><input id="npswd" name="npswd" type="password" value=""/></td>
			<td></td>
		</tr>
		<tr>
			<td>重复新密码:</td>
			<td><input id="npswd1" name="npswd1" type="password" value=""/></td>
			<td id="psmsg"></td>
		</tr>
	 	<tr>
	 		<td colspan="2" style="text-align:center;">
				<input type="button" value="提交" onclick="submitfun()"/>
	 		</td>
	 		<td></td>
	 	</tr>
	</table>
</form>