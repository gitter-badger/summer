<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>EpicHust Code Manager-Register</title>
		<script type="text/javascript" src="../static/js/jquery/1.6/jquery.js"></script>
		<script type="text/javascript">
			function validateUser(){
				var result = false;
				//验证两次密码是否一致
				var p1 = $('#upswd').val();
				var p2 = $('#upswd2').val();
				if(p1 == '' || p2 == ''){
					$('#psmsg').html('<font color=red>密码不能为空!</font>');
					return false;
				}
				if(p1 != p2){
					$('#psmsg').html('<font color=red>两次密码输入不一至,请重新输入!</font>');
					return false;
				}
				
				//验证用户是否已存在.
				var uname = $('#uname').val();
				if(uname == undefined || uname == ''){
					$('#unmsg').html('<font color=red>请输入账号!</font>');
					return false;
				}
				$.ajax( {
					url:'../user/validate',
					type : 'POST',
					data : {user:uname},
					async : false,
					cache : false,
					success:function(obj){
						if(obj == true || obj == 'true'){
							$('#unmsg').html('<font color=red>账号已存在,请重新输入!</font>');
						} else {
							$('#unmsg').html('<font color=green>账号可用!</font>');
							result = true;
						}
					},
					error:function(error){
						$('#unmsg').html('<font color=red>账号验证出错!</font>');
					}
				});
				
				return result;
			}
		</script>
	</head>
	<body>
		<form action="../user/add" method="post" onsubmit="return validateUser()">
			<table>
				<tr>
					<th colspan="2" style="text-align: center;">用户注册</th>
					<th></th>
				</tr>
				<tr>
					<td>账号:</td>
					<td><input id="uname" name="uname" type="text" value=""/></td>
					<td id="unmsg"></td>
				</tr>
				<tr>
					<td>密码:</td>
					<td><input id="upswd" name="upswd" type="password" value=""/></td>
					<td></td>
				</tr>
				<tr>
					<td>重复密码:</td>
					<td><input id="upswd2" name="upswd2" type="password" value=""/></td>
					<td id="psmsg"></td>
				</tr>
			 	<tr>
			 		<td colspan="2" style="text-align:center;">
						<input type="submit" value="提交"/>
			 		</td>
			 		<td></td>
			 	</tr>
			</table>
		</form>
	</body>
</html>