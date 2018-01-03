<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/rdp/commons/tag_libs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>内容管理系统</title>
<%
	String strCityId = request.getParameter("ORDER_ID");
    String type = request.getParameter("type");
    String order_type = request.getParameter("order_type");
    String rec_type = request.getParameter("rec_type");
%>
<%@ include file="/jsp/rdp/commons/index_libs.jsp"%>
<!--框架必需end-->
<%@ include file="/jsp/rdp/commons/ztree_libs.jsp"%>

	<style type="text/css">
		html, body{ margin:0; height:100%; }
	</style>
	<script type="text/javascript" src="${ctx}/resource/libs/js/json2.js"></script>
	<script type="text/javascript" src="${ctx}/webresources/component/artDialog/artDialog.js"></script> 
	<script type="text/javascript" src="${ctx}/webresources/component/artDialog/plugins/iframeTools.js"></script> 
	
	<script type="text/javascript">
	var zNodes = [];
	function iterator(result,type){
		var rooter = new Object();
		//var strURL = ctx+"/"+result.url;
		if(type != 0 && result.level != 1){
			rooter.id=result.id;
			rooter.pid=result.parentId;
			rooter.name=result.name;	
			rooter.open=true;	
			//rooter.url = strURL;
			//rooter.target="frmright";
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
		    	selectedMulti: false
		    },
		    data: {
				simpleData: {
					enable:true,
					idKey: "id",
					pIdKey: "pid",
					rootPId: ""
				}
			},
			check: {
				enable: true
			},
			callback: {
		    }
	
			
		};  
	
	function checkNode(e) {
		var zTree = $.fn.zTree.getZTreeObj("user_tree"),
		type = e.data.type,
		nodes = zTree.getSelectedNodes();
		if (type.indexOf("All")<0 && nodes.length == 0) {
			alert("请先选择一个节点");
		}
	}
	
	
	function initNodes(data){
		var zNodes = iterator(data,0);
		$.fn.zTree.init($("#user_tree"),setting, zNodes);
		var treeObj = $.fn.zTree.getZTreeObj("user_tree");
	}
	
	$(function(){
		$(window).load(function(){
			var type = "<%=type%>" ;
			type = "I00102" == type ? "0" : "I00103" == type ? "1" : "2";
			user_num = (null != "<%=strCityId%>") ? "<%=strCityId%>" : null;
			$.ajax({
				url:ctx+"/wealOrder/getNodesTreeBysys.htm?type="+type+"&user_num="+user_num,
				async:false,
				dataType:'JSON',
				success: function(data){
					initNodes(data);
				}
			});
		});
		
		$(".btnClass .btn").click(function(){
			var treeObj = $.fn.zTree.getZTreeObj("user_tree");
			var nodes = treeObj.getCheckedNodes(true);
			var type = "<%=type%>" ;
			type = "I00102" == type ? "0" : "I00103" == type ? "1" : "2";
			user_num = (null != "<%=strCityId%>") ? "<%=strCityId%>" : null;
			var rec_type = (null != "<%=rec_type%>") ? "<%=rec_type%>" : null;
			var order_type = "<%=order_type%>";
			var json =  encodeURI(JSON.stringify(nodes));
			$.ajax({
				url:ctx+"/wealOrder/setSelectOptions.htm?type="+type+"&user_num="+user_num+"&json="+json+"&order_type="+order_type+"&rec_type="+rec_type,
				async:false,
				dataType:'JSON',
				success: function(data){
					//找到父窗口 并刷新原来的数据已经选择结果的数据
					if(data.code == 1){
							var doc = $(window.parent.document).find("iframe").eq(1).contents();
							$.ajax({
								url:ctx+"/wealOrder/getSelectOptions.htm?userNum="+user_num,
								type: "POST",
								dataType:'JSON',
								success: function(data){
								    var rdata = eval(data);
								    var liHtml = "<ul class='acc'>";
									for(var i = 0 ; i < rdata.length; i++){
									    var name = (null != rdata[i].NAME)? rdata[i].NAME : "";
									    var price = (null != rdata[i].PRICE)? rdata[i].PRICE : "";
									    var item_id = (null != rdata[i].ITEM_ID)? rdata[i].ITEM_ID : "";
									    var _pli = "<li class='liacc'>";
										var li = "<ul class='licon'>"
										+"<li class='long'>"+name+"</li>"
										+"<li class='low'>积分："+price+"</li><li class='lowly' onclick=delOption('"+item_id+"')><img border='0' height='15' width='15' src='"+ctx+"/webresources/skin/blue/images/icons/del.png'/></li></ul>";
										_pli += li;
										_pli += "</li>";
										liHtml += _pli;
									}
									liHtml += "</ul>";
									if("I02101" == order_type){
										$(doc).find("font[inputboxid=page_choice_distribute_enterprise_account_guid_rp1_wxcol_results]").html(liHtml);
									}
									else if("I02102" == order_type)
									{
										$(doc).find("font[inputboxid=page_choice_distribute_account_guid_rp1_wxcol_results]").html(liHtml);
									}else{
										$(doc).find("font[inputboxid=page_choice_distribute_gifts_account_guid_rp1_wxcol_results]").html(liHtml);
									}
									
									//关闭当前窗口
									art.dialog.close(); 
								}
							});
							
	                   
					}
				}
			});
		});
		
		
	});
	</script>
</head>
<body >
	<div class="btnClass" style="height:100%; margin: 20px 50px;overflow:auto">
		<ul id="user_tree" class="ztree"></ul>
		<input type="button" value="确认" class="btn" style="margin-left: 100px;margin-bottom:30px;"/>
	</div>
</body>
</html>