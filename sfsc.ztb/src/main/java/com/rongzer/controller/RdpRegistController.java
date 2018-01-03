package com.rongzer.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rongzer.rdp.common.util.StringUtil;
import com.rongzer.service.RdpRegistService;



@Controller
@RequestMapping("rdpRegist")
public class RdpRegistController {
	
	@Autowired
	private RdpRegistService rdpRegistService;

	@RequestMapping(value="registIndex",method = RequestMethod.GET)
    @ResponseBody
	public String rdpRegistCustomer(HttpServletRequest request) {
		String excuStr = "success";
		String userAccount=request.getParameter("ACCOUNT");
		Map<String,String> mapParams=new HashMap<String, String>();
		Enumeration<String> eParams =request.getParameterNames();
		String strKey="";
		while(eParams.hasMoreElements()){
			strKey=eParams.nextElement();
			mapParams.put(strKey,request.getParameter(strKey));
		}
		try{
				rdpRegistService.insertRdpCustomer(mapParams);
			
		}catch(Exception e){
			e.printStackTrace();
			excuStr = "error";
		}
		return excuStr;
    }
	
	
	@RequestMapping(value="checkAccount",method = RequestMethod.GET)
    @ResponseBody
	public String checkAccountCustomer(HttpServletRequest request) {
		String excuStr = "success";
		String userAccount=request.getParameter("ACCOUNT");
		try{
			excuStr=rdpRegistService.checkRdpCustomer(userAccount);
			System.out.println(excuStr);
		}catch(Exception e){
			e.printStackTrace();
			excuStr = "error";
		}
		return excuStr;
    }
	
	@RequestMapping(value="checkNameCn",method = RequestMethod.GET)
    @ResponseBody
	public String checkNameCnCustomer(HttpServletRequest request) {
		String excuStr = "success";
		String nameCn=request.getParameter("NAME_CN");
		try{
			excuStr=rdpRegistService.checkRdpSupple(nameCn);
			//System.out.println(excuStr);
			
		}catch(Exception e){
			e.printStackTrace();
			excuStr = "error";
		}
		return excuStr;
    }
	
	
	@RequestMapping(value="selectGroup",method = RequestMethod.GET)
    @ResponseBody
	public List<Map<String,String>> selectGroupList() {
		String result=null;
		List<Map<String,String>> mapParams=rdpRegistService.selectGroup();
		
		return mapParams;
    }
}
