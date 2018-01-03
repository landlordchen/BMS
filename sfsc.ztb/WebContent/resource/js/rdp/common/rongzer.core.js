function initLeftNav(nav){
	var funcId = nav.attr("funcId");
	var topUrl = nav.attr("url");
	var menuurl =  ctx+"/common/getMenuTreeById.htm";
	initLeftNavUtil(funcId,topUrl,menuurl);
}


function initLeftNavUtil(funcId,url,menuurl){
	if(url!=null&&url.indexOf("mainc")<0){
		$(".navbar-default").hide();
		$("#page-wrapper").css("margin-left","0px");
		$(".J_menuTabs").hide();
		$("#frmright").attr("src", url);
		return false;
	}
	$(".navbar-default").show();
	var width = $(".navbar-default").width();
	$("#page-wrapper").css("margin-left",width);
	$(".J_menuTabs").show();
	
	
	var str = "";
	var forTree = function(o){
		for(var i=0;i<o.length;i++){
			var urlstr = "";
			try{
				var url =o[i]["url"];
				if(o[i]["nodes"] != null&&o[i]["nodes"].length>0){
					url = "";
				}
				
				urlstr = "<li class=''><a href='"+url+"' class='J_menuItem nav_img "+o[i]["icon"]+"' target='frmright' style='color:#fff;'><span class='nav-label'>"+ o[i]["name"] +"</span></a><ul class='nav'>";
				str += urlstr;
				if(o[i]["nodes"] != null){
					forTree(o[i]["nodes"]);
				}
				str += "</ul></li>";
			}catch(e){}
		}
		return str;
	}
	
	$.ajaxSetup({ 
	    async : false 
	}); 
	
	$.post(menuurl, {"id":funcId}, function(result){
		var myArray=new Array()
		myArray[0] = result;
		$("#side-menu").html(forTree(myArray));
		
		$("#side-menu li").click(function(){
			$("#side-menu li").removeClass("active");
			$(this).addClass("active");
		});
		
		$("#side-menu li").each(function(index, element) {
			var $ul = $(this).find("ul:first");
			var ulContent = $ul.html();
	        if(ulContent!=null&&ulContent!=""){
	        	$(this).find("a:first").append($("<span class='fa arrow'></span>"));
				//$ul.css("padding-left","25px");
			}else{
				$ul.remove();
			}
	    });
		$("#side-menu li:first").click();
		$("#side-menu").metisMenu();
		contabs.initDataId();
		$("#side-menu li:first").find("li:first a")[0].click();
	}, "json"); 
	
	$(".sidebar-collapse").slimScroll({
		height: "100%",
		railOpacity: .9,
		alwaysVisible: !1
	});
	return false;
};


















$(function(){
	initLeftNav($(".navbar-header").find("a[name=topBar]:first"));
	$(".navbar-header").find("a[name=topBar]").on("click",function(){
		$(".navbar-header").find("a[name=topBar]").removeClass("active");
		$(this).addClass("active");
		$(".J_tabCloseAll").click();
		initLeftNav($(this));
		
	});
	$(".user-info").wordLimit(30);
	//退出系统
	$("#exitHandler").click(function(){
		layer.confirm('确定要退出系统吗', {
			  btn: ['确定','取消'] //按钮
			}, function(){
				$.ajax({
					url:ctx+"/logout.htm",
					type:"post",
					success:function(){
						top.window.location.href = ctx+"/index.htm";
					}
				});
			}, function(){
			  
			});
	});
});
