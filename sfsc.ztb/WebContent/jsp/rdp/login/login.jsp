<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/jsp/rdp/commons/tag_libs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title><%=com.rongzer.rdp.common.service.RDPUtil.getSysConfig("rdp.system.title")%></title>
<link href="${ctx}/resource/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
<link href="${ctx}/resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="${ctx}/resource/css/animate.min.css" rel="stylesheet">
<link href="${ctx}/resource/css/style.css?v=4.0.0" rel="stylesheet">
<style type="text/css">

input {
    width: 400px;
    height: 42px;
    padding: 0 15px;
    background: #2d2d2d; /* browsers that don't support rgba */
    background: rgba(45,45,45,.15);
    -moz-border-radius: 6px;
    -webkit-border-radius: 6px;
    border-radius: 6px;
    border: 1px solid #3d3d3d; /* browsers that don't support rgba */
    border: 1px solid rgba(255,255,255,.15);
    -moz-box-shadow: 0 2px 3px 0 rgba(0,0,0,.1) inset;
    -webkit-box-shadow: 0 2px 3px 0 rgba(0,0,0,.1) inset;
    box-shadow: 0 2px 3px 0 rgba(0,0,0,.1) inset;
    font-family: 'PT Sans', Helvetica, Arial, sans-serif;
    font-size: 14px;
    color: #fff;
    text-shadow: 0 1px 2px rgba(0,0,0,.1);
    -o-transition: all .2s;
    -moz-transition: all .2s;
    -webkit-transition: all .2s;
    -ms-transition: all .2s;
}

input:-moz-placeholder { color: #fff; }
input:-ms-input-placeholder { color: #fff; }
input::-webkit-input-placeholder { color: #fff; }

input:focus {
    outline: none;
    -moz-box-shadow:
        0 2px 3px 0 rgba(0,0,0,.1) inset,
        0 2px 7px 0 rgba(0,0,0,.2);
    -webkit-box-shadow:
        0 2px 3px 0 rgba(0,0,0,.1) inset,
        0 2px 7px 0 rgba(0,0,0,.2);
    box-shadow:
        0 2px 3px 0 rgba(0,0,0,.1) inset,
        0 2px 7px 0 rgba(0,0,0,.2);
}
button {
    cursor: pointer;
    width: 300px;
    height: 44px;
    margin-top: 25px;
    padding: 0;
    background: #56AAAA;
    -moz-border-radius: 6px;
    -webkit-border-radius: 6px;
    border-radius: 6px;
    border: 1px solid #ff730e;
    -moz-box-shadow:
        0 15px 30px 0 rgba(255,255,255,.25) inset,
        0 2px 7px 0 rgba(0,0,0,.2);
    -webkit-box-shadow:
        0 15px 30px 0 rgba(255,255,255,.25) inset,
        0 2px 7px 0 rgba(0,0,0,.2);
    box-shadow:
        0 15px 30px 0 rgba(255,255,255,.25) inset,
        0 2px 7px 0 rgba(0,0,0,.2);
    font-family: 'PT Sans', Helvetica, Arial, sans-serif;
    font-size: 14px;
    font-weight: 700;
    color: #fff;
    -o-transition: all .2s;
    -moz-transition: all .2s;
    -webkit-transition: all .2s;
    -ms-transition: all .2s;
}
.btn::hover {
color: #fff;
}
button:hover {
    -moz-box-shadow:
        0 15px 30px 0 rgba(255,255,255,.15) inset,
        0 2px 7px 0 rgba(0,0,0,.2);
    -webkit-box-shadow:
        0 15px 30px 0 rgba(255,255,255,.15) inset,
        0 2px 7px 0 rgba(0,0,0,.2);
    box-shadow:
        0 15px 30px 0 rgba(255,255,255,.15) inset,
        0 2px 7px 0 rgba(0,0,0,.2);
    color: #fff;
}

button:active {
    -moz-box-shadow:
        0 15px 30px 0 rgba(255,255,255,.15) inset,
        0 2px 7px 0 rgba(0,0,0,.2);
    -webkit-box-shadow:
        0 15px 30px 0 rgba(255,255,255,.15) inset,
        0 2px 7px 0 rgba(0,0,0,.2);
    box-shadow:        
        0 5px 8px 0 rgba(0,0,0,.1) inset,
        0 1px 4px 0 rgba(0,0,0,.1);

    border: 0px solid #ef4300;
    color: #fff;
}

.index_regist{
	display:none;
	width:540px;
	background:#fff;
	z-index:100;
	margin:0 auto;
	margin-top:100px;
	padding-top:50px
}
#registForm{padding:20px;height:auto;overflow:hidden;}
#registForm ul,#registForm ul li{margin:0;padding:0;list-style:none;width:100%}
#registForm ul li{height:80px;margin:0;}
#registForm ul li .regist-k{float:left;text-align:right;*width:100%;width:100px;color: #999;padding: 0 0;margin:11px 5px 11px 0px; font-size:14px;}
#registForm ul li .regist-k i {color: #e32a2f;margin-right: 5px;font-style:normal;}
#registForm ul li .regist-v{height:80px;padding: 0 0;float: left;}
#registForm ul li .regist-v .crl_xu{ height: 30px;line-height:30px;font-size:13px;text-align:left;padding-left:25px;}
#registForm ul li .regist-v .crl_xu.right{color:#56AAAA;background:url(resource/image/regist_w.png) no-repeat left center;background-size:6%;}
#registForm ul li .regist-v .crl_xu.wrong{color:red;background:url(resource/image/regist_g.png) no-repeat left center;background-size:6%;}
#registForm ul li .regist-v input{width:300px;color:#676a6c;background:#faffbd;}
#registForm ul li .regist-v input::-webkit-input-placeholder {font-family:"Microsoft YaHei";color: #676a6c !important;}
#registForm ul li #selGroup{width:300px;height:40px;line-height:40px;padding-left:15px;border:none;border-radius:6px;background:#faffbd;}
#registForm .regBtn{margin-left:105px;margin-bottom:50px;width:25%;float:left;}
#registForm .calBtn{margin-right:95px;margin-bottom:50px;width:25%;float:right;}
#registForm ul li .regist-chose{float:left;}
#registForm ul li .regist-chose input{width:15px;height:15px;float:left;margin:2px 8px 0 85px;}
#registForm ul li .regist-chose span{display;block;float:left;}
</style>
</head>
<body>
	<div class="middle-box text-center animated fadeInDown" id="index_login" style="display:block;">
        <div>
            <div>
                <h1 class="logo-name" style="background-image: url(resource/image/rdp_login_logo.png);height: 70px;width: 264px;margin: 0 auto;"></h1>
            </div>
            <h3>欢迎使用上海外服-招标系统</h3>
            <form id="loginForm">
                <div class="form-group">
                    <input type="text" id="username" class="" placeholder="用户名" required="">
                </div>
                <div class="form-group">
                    <input type="password" id="password" class="" placeholder="密码" required="">
                </div>
                <button type="button" id="loginBtn" class="btn block  m-left">登 录</button>
                <button type="button" id="registBtn" class="btn block m-right">注册</button>
			</form>

                <!-- <p class="text-muted text-center"> <a href="login.html#"><small>忘记密码了？</small></a> | <a href="register.html">注册一个新账号</a>
                </p> -->
        </div>
    </div>
	
	
	
	<!-- 注册 -->
        <div class="index_regist text-center animated fadeInDown" id="index_regist">
        	<h3>欢迎注册上海外服-评估系统</h3>
        	<form id="registForm">
        		<ul>
        			<li>
						<label class="regist-k"><i>*</i>用户名：</label>
						<div class="regist-v aling_left">
							<input id="regName" name="regName" class="x-input user_name" type="text" placeholder="请输入登录账号"   />  
							<div class="crl_xu">
								<span id="remind_regName"></span>
							</div>            
						</div>
					</li>
					<li>
						<label class="regist-k"><i>*</i>中文名称：</label>
						<div class="regist-v aling_left">
							<input id="supName" name="supName" class="x-input user_name" type="text" placeholder="请输入中文名称"  />   
							<div class="crl_xu">
								<span id="remind_supName"></span>
							</div>              
						</div>
					</li>
					<li>
						<label class="regist-k"><i>*</i>密码：</label>
						<div class="regist-v aling_left">
							<input id="reg_passwd" name="pam_account[login_password]" class="x-input inputstyle password" type="password" autocomplete="off" size="20" maxlength="20" >            
							<div class="crl_xu possword_strength">
								<span id="remind_pwd"></span>
							</div>
						</div>
					</li>
					<li>
						<label class="regist-k"><i>*</i>确认密码：</label>
						<div class="regist-v aling_left">
							<input id="reg_passwd_r" name="pam_account[psw_confirm]" class="x-input inputstyle password" type="password" autocomplete="off" size="20" maxlength="20">            
							<div class="crl_xu">
								<span id="remind_repwd"></span>
								<span></span>
							</div>
						</div>
					</li>
					<li>
						<label class="regist-k"><i>*</i>所属组织：</label>
						<select class="regist-v aling_left" id="selGroup">
						      
						</select>
					</li>
        		</ul>
        		<button type="button" id="completeBtn" class="btn block regBtn">完成</button>
        		<button type="button" id="cancelBtn" class="btn block calBtn">取消</button>
        	</form>
        </div>
	
	
	
<script type="text/javascript" src="${ctx}/resource/libs/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${ctx}/resource/js/plugins/supersized/supersized.3.2.7.min.js"></script>
<script type="text/javascript" src="${ctx}/resource/js/plugins/supersized/supersized-init.js"></script>
<script type="text/javascript">
$(function() {
	$("#username").keydown(function(event) {
		if (event.keyCode == 13) {
			login();
		}
	});
	$("#password").keydown(function(event) {
		if (event.keyCode == 13) {
			login();
		}
	});
	
	$("#loginBtn").click(function(){
		login();
	});
	
	//点击注册按钮
	$("#registBtn").click(function(){
		$("#index_login").hide();
		$("#index_regist").fadeIn();
		$.ajax({  
		    url : "${ctx}/rdpRegist/selectGroup.htm?NOSESSION_PASS=1", 
		    type : "GET",  
		    datatype:"json",  
		    contentType: "application/json; charset=UTF-8",  
		    success : function(result) {
		    eval("var dataList="+result);
		    $("#selGroup").empty();
			var optionHtml="<option   value='' >请选择组织</option>";
		    	for(var data in dataList){
		    		optionHtml+="<option    value='"+dataList[data].GROUP_ID+"'>"+dataList[data].GROUP_FULL_NAME+"</option>";
		    	}
		    	 $("#selGroup").append(optionHtml);
		    }
		}); 
	});
	
	//点击注册页面取消按钮
	$("#cancelBtn").click(function(){
		window.location.reload();
	});
	
	//点击注册页面完成按钮
	$("#completeBtn").click(function(){
		//alert(1);
		completeRegist();
	});
	
	$('.page-container form .username, .page-container form .password')
			.keyup(function() {
				$(this).parent().find('.error').fadeOut('fast');
			});
			
if (top.location.href != self.location.href) {
    top.location.href=self.location.href;
  }	
$("#username").focus();
});


//登录
function login() {
	var errorMsg = "";
	var loginName = $("#username");
	var password = $("#password");
	//登录处理
	loginUtil($.trim(loginName.val()), password.val(), false);
}
function loginUtil(loginName, password, obj) {
	$.post("${ctx}/login.htm", {
		"username" : loginName,
		"password" : password,
		"relogin" : obj
	}, function(result) {
		result = $.parseJSON(eval('(' + result + ')'));
		if (result == null) {
			alert("登录失败");
			return false;
		}
		if (result.status == "true" || result.status == true) {
			window.location = "${ctx}/" + result.url;
		} else {
			if (result.code == "4") {
				alert("当前用户已登录，是否重新登录？");
			} else {
				var msg = result.code == "1" ? "用户名或密码不能为空"
						: result.code == "2" ? "没有相关用户" : "用户名或密码不正确";

				alert(msg);
			}

		}

	}, "text");
}

//用户名校验
	$("#regName").focus(function(){
		if($.trim($(this).val()) == ""){
			$("#remind_regName").html("请输入用户名!");
			$(this).parent().find(".crl_xu").removeClass("right").addClass("wrong");
		}
	}).blur(function(){
		var username = $(this).val();
		if($.trim(username) == ""){
			$("#remind_regName").html("请输入用户名!");
			$(this).parent().find(".crl_xu").removeClass("right").addClass("wrong");
		}else if(!(/^[A-Za-z0-9]+$/).test($.trim(username))){
			$("#remind_regName").html("用户名只能输入字母及数字!");
			$(this).parent().find(".crl_xu").removeClass("right").addClass("wrong");
		}else if($.trim(username).length>20){
			$("#remind_regName").html("用户名长度不能超过20!");
			$(this).parent().find(".crl_xu").removeClass("right").addClass("wrong");
		}else{
			//添加用户名校重
			
			var paramMap={};
				paramMap.ACCOUNT=$.trim(username);
				$.ajax({  
		            url : "${ctx}/rdpRegist/checkAccount.htm?NOSESSION_PASS=1&ACCOUNT=" + encodeURI(encodeURI(username)),  
		            type : "GET",  
		            datatype:"json",  
		            contentType: "application/json; charset=UTF-8",  
		            data :paramMap,
		            success : function(result) {
		            	eval("var strResult="+result);
		            	if (strResult == "error") {
		            		console.log(strResult+"XXX");
		            		$("#remind_regName").html("用户名已存在!");
		            		$("#regName").parent().find(".crl_xu").removeClass("right").addClass("wrong");
		        			return false;
		    			}else{
		    				console.log(strResult+"==");
		    				$("#remind_regName").html("通过信息验证!");
		    				$("#regName").parent().find(".crl_xu").removeClass("wrong").addClass("right");
		    			}
		            }
	        	});
			}
	});

//中文名称校验
	$("#supName").focus(function(){
		if($.trim($(this).val()) == ""){
			$("#remind_supName").html("请输入中文名称!");
			$(this).parent().find(".crl_xu").removeClass("right").addClass("wrong");
		}
	}).blur(function(){
		var username = $(this).val();
		if($.trim(username) == ""){
			$("#remind_supName").html("请输入中文名称!");
			$(this).parent().find(".crl_xu").removeClass("right").addClass("wrong");
		}else if(/['"#$%&\^*;:<>!@?/,]/.test($.trim(username))){
			$("#remind_supName").html("中文名称不能带有特殊符号!");
			$(this).parent().find(".crl_xu").removeClass("right").addClass("wrong");
		}else if($.trim(username).length>20){
			$("#remind_supName").html("中文名称长度不能超过20!");
			$(this).parent().find(".crl_xu").removeClass("right").addClass("wrong");
		}else{
			//添加用户名校重
			var paramMap={};
				paramMap.NAME_CN=$.trim(username);
				$.ajax({  
		            url : "${ctx}/rdpRegist/checkNameCn.htm?NOSESSION_PASS=1&NAME_CN=" + encodeURI(encodeURI(username)),  
		            type : "GET",  
		            datatype:"json",  
		            contentType: "application/json; charset=UTF-8",  
		            data :paramMap,
		            success : function(result) {
		            	eval("var strResult="+result);
		            	if (strResult == "error") {
		            		$("#remind_supName").html("供应商名称已存在!");
		            		$("#supName").parent().find(".crl_xu").removeClass("right").addClass("wrong");
		        			return false;
		    			}else{
		    				$("#remind_supName").html("通过信息验证!");
		    				$("#supName").parent().find(".crl_xu").removeClass("wrong").addClass("right");
		    			}
		            }
	        	});
			}
	});
	
//密码校验
	$("#reg_passwd").focus(function(){
		if($.trim($(this).val()) == ""){
			$("#remind_pwd").html("6-20位字符，可使用字母、数字或符号的组合!");
			$(this).parent().find(".crl_xu").removeClass("right").addClass("wrong");
		}
	}).blur(function(){
		var password = $(this).val();
		if($.trim(password) == "" ||$.trim(password).length>20 || $.trim(password).length<6){
			$("#remind_pwd").html("6-20位字符，可使用字母、数字或符号的组合!");
			$(this).parent().find(".crl_xu").removeClass("right").addClass("wrong");
		}else{
			$("#remind_pwd").html("通过信息验证!");
			$(this).parent().find(".crl_xu").removeClass("wrong").addClass("right");
		}
	});
		
//确认密码
	$("#reg_passwd_r").focus(function(){
		if($.trim($(this).val()) == ""){
			$("#remind_repwd").html("请再次输入密码!");
			$(this).parent().find(".crl_xu").removeClass("right").addClass("wrong");
		}
	}).blur(function(){
		var password = $("#reg_passwd").val();
		var repassword = $(this).val();
		if($.trim(repassword)==""){
			$("#remind_repwd").html("请再次输入密码!");
			$(this).parent().find(".crl_xu").removeClass("right").addClass("wrong");
		}else if(password != repassword){
			$("#remind_repwd").html("两次输入密码不一致!");
			$(this).parent().find(".crl_xu").removeClass("right").addClass("wrong");
		}else{
			$("#remind_repwd").html("通过信息验证!");
			$(this).parent().find(".crl_xu").removeClass("wrong").addClass("right");
		}
	});
	
//完成注册
	function completeRegist(){
		var choseTag="";
		var groupId=$("#selGroup").val();
		if(groupId==''){
			alert("请选择所属组织!");
			return;
		}
		var len=parseInt($(".regist-v .right").length);
		if(len==4){
			var regName = $("#regName").val();
			var supName = $("#supName").val();
			var reg_passwd = $("#reg_passwd").val();
			var paramMap={};
			paramMap.ACCOUNT=$.trim(regName);
			paramMap.NAME_CN=$.trim(supName);
			paramMap.PASSWORD=$.trim(reg_passwd);
			paramMap.GROUP_ID=$.trim(groupId);
			console.log(regName+"=="+supName+"=="+reg_passwd+"=="+groupId);
			$.ajax({  
	            url : "${ctx}/rdpRegist/registIndex.htm?NOSESSION_PASS=1&NAME_CN="+encodeURI(encodeURI(supName)), 
	            type : "GET",  
	            datatype:"json",  
	            contentType: "application/json; charset=UTF-8",  
	            data :paramMap,
	            success : function(result) {
	            	if (result == "error") {
	    				alert("注册失败");
	    				return false;
	    			}else{
	    				alert("注册成功");
	    				document.getElementById("registForm").reset(); 
	    				$("#index_login").fadeIn();
	    				$("#index_regist").hide();
	    			}
	            }
	        }); 
		}else{
			alert("请您完善注册信息!");
		}
		
	}
</script>
</body>
</html>