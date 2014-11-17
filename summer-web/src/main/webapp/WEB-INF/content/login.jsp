<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>EpicHust Code Manager-Login</title>
		<link rel="stylesheet" type="text/css" href="static/css/login.css"/>
		<script type="text/javascript" src="static/js/jquery/1.6/jquery.js"></script>
		<script type="text/javascript">
			/**
			 * 自动调整iframe大小.
			 */
			function autoFillBgSize(){
				var bodyWidth = $(document).width();
				var bodyHeight = $(document).height();
				//console.log(bodyHeight,toolbarHeight,formHeight);
				
				$('#login_bg').css('width',bodyWidth);
				$('#login_bg').css('height',bodyHeight);
				//禁用右键.
				$('#login_bg').bind('contextmenu',function(e){ 
					return false; 
				});
				$('#login_uname').focus();
				
			}
		</script>
	</head>
	<body onload="autoFillBgSize()">
		<img id="login_bg" src="static/images/login_bg_02.jpg">
		<div id="login_box">
			<div id="login_logo">
				<img alt="Epichust Coder" src="static/images/login_logo.png">
			</div>
			<form action="login/validate" method="post">
				<div style="text-align: center;">
					<div class="divRadius">
						<span>&nbsp;&nbsp;Account:</span>
						<input id="login_uname" name="uname" class="inputRadius" type="text" value=""/>
					</div>
				</div>
				<div style="text-align: center;">
					<div class="divRadius">
						<span>&nbsp;Password:</span>
						<input name="upswd" class="inputRadius" type="password" value=""/>
					</div>
				</div>
				<div style="text-align: center;margin-top:6px;">
					<input class="button" type="submit" value="Sign in"/>
					<span class="button"><a href="user/register"/>Sign up</a></span>
				</div>
			</form>
		</div>
	</body>
</html>