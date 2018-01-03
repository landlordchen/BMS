package com.rongzer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rongzer.rdp.web.domain.system.LoginUser;
import com.rongzer.service.TenderTreeNodeService;



@Controller
@RequestMapping("NodesTree")
public class TreeNodeController {
	
	@Autowired
	private TenderTreeNodeService treeNodeService;

	
	/**
	 * 查询用户树
	 * @return
	 */
	@RequestMapping("getNodesTreeBysys")
	@ResponseBody
	public CustomerTreeNodeModel getSysTree(HttpServletRequest req, HttpSession session,String type,String tenderid){

		LoginUser user = (LoginUser) req.getSession().getAttribute("LoginUser");
		String userId = user.getLoginUserId();
		//当前用户			
		if("0".equals(type)){
			return treeNodeService.getNodeSysTreeByCust(tenderid,userId);
		}else{
			return treeNodeService.getNodeSysTreeByCust(tenderid,userId,type);
		}
		
	}
	

	
}
