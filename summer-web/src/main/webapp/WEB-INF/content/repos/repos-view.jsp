<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
<!--
	var account = '${repos.account}';
	var pswd = '${repos.pswd}';
	var globalParams = {};
	
	//获取URL
	function repos_view_getUrl(fname){
		var url = $('#repos_view_url').val();
		if(fname && $.type(fname)=='string'){
			if('..' == fname){
				if(url.endWith("/") || url.endWith('\\')){
					url = url.substring(0,url.length-1);;
				}
				var idx = url.lastIndexOf('/');
				if(idx == -1){
					idx = url.lastIndexOf('\\');
				}
				url = url.substring(0,idx);
			} else {
				if(!url.toString().endWith("/") && !url.toString().endWith('\\')){
					url += '/';
				}
				url += fname;
			}
		}
		
		return url;
	}
	
	//刷新列表.
	function refreshflist(fname,kind){
		var url = repos_view_getUrl(fname);
		
			
		if(kind && kind == 'file'){
			//console.log('file:::',url);
		} else {
			$('#repos_view_url').val(url);
		}
		var params = {
				url:url,
				account:account,
				pswd:pswd,
		};
		
		if(kind && kind == 'file'){
			$.coder.common.toPage('repos_view_fcontent','repos/fcontent',params);
		} else {
			$.coder.common.toPage('repos_view_flist','repos/flist',params);
		}
	}
	
	//获取选中路径及版本.
	function getCheckedPathAndVersion(){
		var $pdiv = $('#repos_view_flist');
		var $chs = $(':checkbox',$pdiv);
		
		var params = {
				minVersion:0,
				minName:'',
				maxVersion:0,
				maxName:''
		};
		
		$chs.each(function(i){
			$ch = $(this);
			if($ch.attr("checked")=='checked'){
				var version = $ch.val();
				version = parseInt(version);
				var name = $ch.parent().next().find('span').html();
				if(params.maxVersion == 0 || version > params.maxVersion){
					params.minVersion = params.maxVersion;
					params.minName = params.maxName;
					params.maxName = name;
					params.maxVersion = version;
				} else {
					if(params.minVersion == 0 || version < params.minVersion){
						params.minVersion = version;
						params.minName = name;
					}
				}
			}
		});
		
		//console.log('params:',params);
		return params;
	}
	
	//显示日志.
	function repos_view_showLog(num){
		//console.log('num',num);
		$('#repos_log_toolbar').css('display','block');
		if(num == undefined){
			num = 5;
			$('#repos_log_select').val(num);
		}
		var params = getCheckedPathAndVersion();
		var url = repos_view_getUrl(params.maxName);
		params.url = url;
		params.account = account;
		params.pswd = pswd;
		params.limit = num;
		globalParams = params;
		$.coder.common.toPage('repos_view_fcontent','repos/flog',params);
	}
	
	//从params.maxName获取项目版本,若无则返回空字符串
	function repos_getProjectVersion(fname){
		var idx = fname.indexOf("-V");
		var pverison = '';
		if(idx > 0){
			pverison = fname.substring(idx+2);
		}
		return pverison;
	}
	
	//获取ChangeLog参数.
	function repos_getChangeLogUrl(type){
		var params = getCheckedPathAndVersion();
		if(type == 'main'){
			//获取分析目录及版本
			var url = repos_view_getUrl(params.maxName);
			$('#repos_mainURL').val(url);
			$('#repos_SVNVer').val(params.maxVersion);
			//从params.maxName获取项目版本,若无则需手动输入
			var pver = repos_getProjectVersion(params.maxName);
			
			$('#repos_Version').val(pver);
		} else {
			//获取对比目录及版本
			var url = repos_view_getUrl(params.maxName);
			var version = params.maxVersion;
			if(params.minVersion != 0){
				url = repos_view_getUrl(params.minName);
				version = params.minVersion;
			}
			$('#repos_conURL').val(url);
			$('#repos_conSVNVer').val(version);
		}
	}
	
	//显示/隐藏参数表单.(none|block)
	function show_changeLogParams(type){
		$('#param_form_div').css('display',type);
		if('none' == type){
			$('#repos_mainURL').val('');
			$('#repos_SVNVer').val('');
			$('#repos_Version').val('');
			$('#repos_conURL').val('');
			$('#repos_conSVNVer').val('');
		}
	}
	
	//日志分析.
	function repos_view_analysisLog(){
		var params = {};
		var url = $('#repos_mainURL').val();
		var maxVersion = $('#repos_SVNVer').val();
		var minVersion = $('#repos_conSVNVer').val();
		var pVersion = $('#repos_Version').val();
		//验证
		if('' == maxVersion || '0' == maxVersion){
			$('#param_error_div').html('请先勾选并获取分析目录!');
			$('#param_error_div').css('display','block');
			return;
		}		
		if('' == minVersion || '0' == minVersion){
			$('#param_error_div').html('请先勾选并获取对比目录!');
			$('#param_error_div').css('display','block');
			return;
		}
		if(maxVersion < minVersion){
			$('#param_error_div').html('对比目录版本不可大于分析目录版本!');
			$('#param_error_div').css('display','block');
			return;
		}
		if(maxVersion == minVersion){
			$('#param_error_div').html('分析目录与对比目录版本不可相同!');
			$('#param_error_div').css('display','block');
			return;
		}
		if('' == pVersion){
			$('#param_error_div').html('请先填写项目版本!');
			$('#param_error_div').css('display','block');
			return;
		}
		//验证通过,关闭错误提示.
		$('#param_error_div').css('display','none');
		
		params.maxVersion = maxVersion;
		params.minVersion = minVersion;
		params.version = pVersion;
		params.url = url;
		params.account = account;
		params.pswd = pswd;
		params.limit = 0;
		
		globalParams = params;
		//$.coder.common.toPage('repos_view_fcontent','repos/fchangeLog',params);
		$.coder.common.pageToContent('repos/fchangeLog',params);
	}
//-->
</script>

<div>
	<div class="toolbar">
		<input type="button" value="返回" onclick="repos_return();"/>
		<input type="button" value="显示日志" onclick="repos_view_showLog()"/>
		<input type="button" value="日志分析" onclick="show_changeLogParams('block')"/>
	</div>
	<div id="param_error_div" style="display: none;background: #FCBDB6; border: 1px solid #E81C0D;padding: 3px 30px 3px 30px;"></div>
	<div id="param_form_div" style="display: none; background: #A4FFFF; border: 1px solid #A4AFFF">
		分析目录：<input id="repos_mainURL" type="text" value="" size="100" readonly="readonly"/>
		分析版本：<input id="repos_SVNVer" type="text" value=""  readonly="readonly"/><br>
		对比目录：<input id="repos_conURL" type="text" value="" size="100" readonly="readonly"/>
		对比版本：<input id="repos_conSVNVer" type="text" value=""  readonly="readonly"/><br>
		项目版本：<input id="repos_Version" type="text" value="" /><br>
		<input type="button" value="获取主目录" onclick="repos_getChangeLogUrl('main');"/>
		<input type="button" value="获取对比版本" onclick="repos_getChangeLogUrl('min');"/>
		<input type="button" value="确定生成" onclick="repos_view_analysisLog();"/>
		<input type="button" value="取消" onclick="show_changeLogParams('none');"/>
	</div>
	<table>
		<tr>
			<td>仓库名:</td>
			<td><input type="text" value="${repos.name}"/></td>
		</tr>
		<tr>
			<td>URL:</td>
			<td><input id="repos_view_url" type="text" value="${repos.url}" size="100"/></td>
		</tr>
	</table>
</div>
<hr/>

<!-- 显示文件(夹) -->
<div id="repos_view_flist">

</div>
<hr/>

<div id="repos_log_toolbar" style="display: none;">
	显示日志条数
	<select id="repos_log_select" onchange="repos_view_showLog(this.value)">
		<option value="1">1</option>
		<option value="3">3</option>
		<option value="5" selected="selected">5</option>
		<option value="10">10</option>
		<option value="20">20</option>
		<option value="50">50</option>
	</select>
</div>
<!-- 显示日志内容 -->
<div id="repos_view_fcontent">
	
</div>

<script type="text/javascript">
<!--
	refreshflist();
//-->
</script>