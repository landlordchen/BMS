<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/rdp/commons/tag_libs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>内容管理系统</title>
<%@ include file="/jsp/rdp/commons/index_libs.jsp"%>
<!--框架必需end-->

<%@ include file="/jsp/rdp/commons/ztree_libs.jsp"%>

<%
	String strtenderid = request.getParameter("tenderid");
	String strFuncId = request.getParameter("funcid");
%>
<script type="text/javascript">
function initTree(value){
	
	strtenderid = "<%=strtenderid%>" ;
	strFuncId = "<%=strFuncId%>" ;
	value = null == value?strFuncId:value;
	//alert(strtenderid);
	$.ajax({
		url:ctx+"/NodesTree/getNodesTreeBysys.htm?type="+value+"&tenderid="+strtenderid+"&strFuncId="+strFuncId,
		async:false,
		dataType:'JSON',
		success: function(data){
			initNodes(data);
		}
	});
}


var zNodes = [];
function iterator(result,type){
	var rooter = new Object();
	var strURL = ctx+"/"+result.url;
	if(type != 0){
		rooter.id=result.id;
		rooter.pid=result.parentId;
		rooter.name=result.name;	
		rooter.open=true;	
		if(result.url){
			rooter.url = strURL;
		}else{
			rooter.url="javascript:void(0)";
		}
		
		rooter.target="frmright1";
		zNodes.push(rooter);
	}
	
	//递归循环子节点
	if(result.nodes!=null){
		$(result.nodes).each(function(i,n){
			iterator(n,1);
		});
	}
	return zNodes;
}
var setting = {
	    view: {
	        dblClickExpand: false
	    },
	    data: {
			simpleData: {
				enable:true,
				idKey: "id",
				pIdKey: "pid",
				rootPId: ""
			}
		},
		callback: {
	        onClick: onclick
	    }

	};  

function initNodes(data){
	var zNodes = iterator(data,0);
	$.fn.zTree.init($("#user_tree"),setting, zNodes);
	var treeObj = $.fn.zTree.getZTreeObj("user_tree");
	//var node = treeObj.getNodeByParam("id", groupId);
	//treeObj.selectNode(node,false);
	//clickNode(groupId);
}

function clickNode(groupId){
	window.parent.userright.location.href=ctx+"/ShowReport.wx?PAGEID=sysUserList&GROUP_ID="+groupId;
}

$(function(){
	$(".optionMethod input[name=type]").each(function(){
		$(this).click(function(){
			//$(".optionMethod input[name=type]").attr("checked",false);
			$(":checkbox").not(this).attr("checked",false);
			$(this).attr("checked",true);
			zNodes = [];
			initTree($(this).val());
		});
	});
});

function refresh(){
	var value=$(".optionMethod :checkbox:checked").val();
	value = null != value ? value : 0 ;
	zNodes = [];
	initTree(value);
}
</script>
<style type="text/css">
	html, body{ margin:0; height:100%; }
</style>
</head>
<body onload="initTree()">
	<div class="optionMethod">
		<!-- 
		<input type="checkbox" name="type" checked="checked" value="1"/>按部门
		<input type="checkbox" name="type" value="2" />按群组
		
		<button onclick="refresh()">刷新</button>
		 -->
	</div>
	<div style="height:100%; overflow:auto; ">
		<ul id="user_tree" class="ztree"></ul>
	</div>
</body>
</html>