<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.rongzer.rdp.web.domain.system.LoginUser" %>
<!DOCTYPE html>
<%@ include file="/jsp/rdp/commons/tag_libs.jsp"%>
<%
String strMainURL = request.getContextPath()+"/ShowReport.wx?PAGEID=sdmsTaskQuery";
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title><%=com.rongzer.rdp.common.service.RDPUtil.getSysConfig("rdp.system.title")%></title>
<link href="${ctx}/resource/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
<link href="${ctx}/resource/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="${ctx}/resource/css/animate.min.css" rel="stylesheet">
<link href="${ctx}/resource/css/style.css?v=4.0.0" rel="stylesheet">
<script src="${ctx}/resource/libs/js/jquery-1.9.1.min.js"></script>
<script src="${ctx}/resource/js/bootstrap.min.js?v=3.3.5"></script>
<script type="text/javascript"> var ctx = "${ctx}";</script>
<script src="${ctx}/resource/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${js}/rdp/common/rongzer.core.js"></script>
<script src="${ctx}/resource/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctx}/resource/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${ctx}/resource/js/rdp.js"></script>
<script src="${ctx}/resource/js/plugins/pace/pace.min.js"></script>
<script src="${ctx}/resource/js/plugins/contabs/contabs.min.js"></script>
<script src="${ctx}/resource/js/plugins/jquery.ellipsis.js"></script>
<script type="text/javascript">
	function goToUserEdit(url){
		frmright.location.href=url;
	}
</script>
</head>
<body class="fixed-sidebar full-height-layout gray-bg fixed-nav" style="overflow:hidden">
<div id="wrapper">
	<!--左侧导航开始-->
	<nav class="navbar-default navbar-static-side" role="navigation" style="border-right: 4px solid #f7fafa!important;">
	    <div class="nav-close"><i class="fa fa-times-circle"></i>
	    </div>

	    <div class="sidebar-collapse">
	        <ul class="nav" id="side-menu">
	        	<li class="nav-header">
	        	</li>
	        </ul>
	    </div>
	</nav>
	<!--左侧导航结束-->
	<!--右侧部分开始-->
	<div id="page-wrapper" class="gray-bg dashbard-1">
	    <div class="row">
	        <nav class="navbar navbar-fixed-top border-bottom" role="navigation" style="margin-bottom: 0">
	            <div class="navbar-header">
 					<div class="logo">
 					</div>
	            	<!-- <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i></a> -->
	            	<ul class="nav navbar-top-links navbar-left" style="margin-left:34px;">
		            	<c:forEach items="${TopMenu}" var="top" varStatus="stat">
		                <li class="dropdown hidden-xs">
		                    <a class="" funcId="${top.FUNC_ID}" target="mainFrame" name="topBar" url="${top.REQUEST_URL}">
		                        ${top.FUNC_NAME}
		                    </a>
		                </li>
		                <c:if test="${!stat.last}">
		                	<li class="spacer"></li>
		                </c:if>  
		                </c:forEach>
	            	</ul>
	            	<ul class="navbar-right" style="padding-left: 0;margin-bottom: 0;list-style: none;border-left: 1px solid #F0F0F0;width: 425px;height: 90px;">
		            	<li class="dropdown hidden-xs" style="width:425px;height:90px;">
		            		
		            		
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="resource/image/rdpLogin.jpg" style="margin: 0 8px 0 25px;border-radius: 100%;border: 2px solid #FFF;width: 50px;height: 50px;">
								<span class="user-info" style="height: 90px;line-height: 90px;font-size: 18px;" alt="<c:out value="${LoginUser.loginUserName }"></c:out>">
									<c:out value="${LoginUser.loginUserName }"></c:out>
								</span>

								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close" style="left:0;width: 200px;">
								<li>
									<a onclick="goToUserEdit('ShowReport.wx?PAGEID=sysUserEditNewViewData&report1_ACCESSMODE=update&WX_EDITTYPE=update&USER_ID=<%=((LoginUser)request.getSession().getAttribute("LoginUser")).getLoginUserId()%>')" href="javascript:void(0)">
										<i class="ace-icon fa fa-cog"></i>
										个人资料
									</a>
								</li>

								<li>
									<a  onclick="goToUserEdit('ShowReport.wx?PAGEID=sysUserEditNewModPass&report1_ACCESSMODE=update&WX_EDITTYPE=update&USER_ID=<%=((LoginUser)request.getSession().getAttribute("LoginUser")).getLoginUserId()%>')" href="javascript:void(0)">
										<i class="ace-icon fa fa-user"></i>
										修改密码
									</a>
								</li>
							</ul>
		            	</li>
	            	</ul>
	            </div>

	        </nav>
	    </div>
	    <div class="row content-tabs">
	    	<button class="roll-nav roll-left J_tabLeft"><i class="fa fa-align-justify"></i>
	        </button>
	        <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
	        </button>
	        <nav class="page-tabs J_menuTabs">
	            <div class="page-tabs-content">
	                <a href="javascript:;" class="active J_menuTab" data-id="<%=strMainURL%>">我的任务</a>
	            </div>
	        </nav>
	        <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
	        </button>
	        <div class="btn-group roll-nav roll-right">
	            <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>
	            </button>
	            <ul role="menu" class="dropdown-menu dropdown-menu-right">
	                <li class="J_tabShowActive"><a>定位当前选项卡</a>
	                </li>
	                <li class="divider"></li>
	                <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
	                </li>
	                <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
	                </li>
	            </ul>
	        </div>
	        <a href="javascript:;" id="exitHandler" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
	    </div>
	    <div class="row J_mainContent" id="content-main">
	        <iframe class="J_iframe" id="frmright" name="frmright" width="100%" height="100%" src="<%=strMainURL%>" data-id="<%=strMainURL%>" frameborder="0" data-id="" seamless></iframe>
	    </div>
	     <div class="footer">
	        <div class="pull-right">&copy; 2014-2015 <a href="" target="_blank">rdp</a>
	        </div>
	    </div> 
	</div>
	<!--右侧部分结束-->
</div>
</body>
</html>
