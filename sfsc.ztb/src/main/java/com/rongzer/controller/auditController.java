package com.rongzer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rongzer.rdp.web.domain.system.LoginUser;
import com.rongzer.rdp.common.util.StringUtil;
import com.rongzer.service.AuditService;



@Controller
@RequestMapping("audit")
public class auditController {
	
	@Autowired
	private AuditService auditService;

	@RequestMapping(value="changestatusofpr",method = RequestMethod.POST)
    @ResponseBody
	public String changeStatusOfPr(HttpServletRequest request , String prIds, String teId,String limit) {
		String excuStr = "success";
		try{
			LoginUser user = (LoginUser) request.getSession().getAttribute("LoginUser");
			//当前用户			
			String userId = user.getLoginUserId();
			List<String> prList=(List<String>)JSONArray.fromObject(prIds);
			//最多10条
			int num= auditService.checkNum(userId,teId);
			int proMax=Integer.parseInt(limit);
			if(num+prList.size()>proMax){
				return excuStr="more";
			}else{
				if(StringUtil.isNotEmpty(prIds)){				
					auditService.changeStatusOfPr(prIds,userId,teId);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			excuStr = "error";
		}
		return excuStr;
    }
	
	@RequestMapping(value="delteSelected",method = RequestMethod.POST)
    @ResponseBody
	public String delteSelected(HttpServletRequest request , String prIds) {
		String excuStr = "success";
		try{
			//付款申请主键
			if(StringUtil.isNotEmpty(prIds)){				
				auditService.deleteSelected(prIds);
			}
		}catch(Exception e){
			e.printStackTrace();
			excuStr = "error";
		}
		return excuStr;
    }
}
