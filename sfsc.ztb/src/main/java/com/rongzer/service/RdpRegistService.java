package com.rongzer.service;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rongzer.mapper.RdpRegistMapper;
import com.rongzer.rdp.common.service.RDPUtil;
import com.rongzer.rdp.common.util.CollectionUtil;
import com.rongzer.rdp.common.util.StringUtil;



@Service
public class RdpRegistService {
	
	@Autowired
	private RdpRegistMapper rdpRegistMapper;
	
	public Map<String,Object> insertRdpCustomer(Map<String,String> paramMap)
	{
		
			Map<String,Object> mapReturn = new HashMap<String,Object>();
			
			String uuid = StringUtil.getUuid32();
			String groupId= (String) paramMap.get("GROUP_ID");
			paramMap.put("USER_ID", uuid);  	
			paramMap.put("GROUP_ID", groupId);	//外服默认是1
			String rdpAccount = (String) paramMap.get("ACCOUNT");	//用户名
			String nameCn = null;	// 供应商				
			try {
				nameCn = URLDecoder.decode((String)paramMap.get("NAME_CN"), "UTF-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}	//供应商的名称
			paramMap.put("ACCOUNT", rdpAccount);
			paramMap.put("NAME_CN", nameCn);
			paramMap.put("SEX", "D00401");
			String time = StringUtil.getNowTime();
			paramMap.put("IS_DELETE", "0");
			paramMap.put("ADD_TIME", time);
			paramMap.put("ADD_USER", uuid);
			paramMap.put("UPDATE_TIME", time);
			paramMap.put("UPDATE_USER", uuid);
			String password = (String) paramMap.get("PASSWORD");
			paramMap.put("PASSWORD", password);
			
			try
			{
				// 插入用户数据
				rdpRegistMapper.insertRdpCustomer(paramMap);
				
				
				//如果选择的组织是供应商就添加角色
				if("2c8080dc592972cf01592972cf850000".equals(groupId)){
					// 新增用户的角色(默认是供应商)
					Map<String,String> mapRole = new HashMap<String,String>();
					String relativeId = StringUtil.getUuid32();
					mapRole.put("RELATIVE_ID", relativeId);
					mapRole.put("USER_ID", uuid); 
					String role=RDPUtil.getSysConfig("rdp.user.defaultRole");
					mapRole.put("ROLE_ID",role);  
					rdpRegistMapper.insertRdpCustomerRole(mapRole);
				}
				
				
			}catch(Exception e)
			{
				
				e.printStackTrace();
				RDPUtil.exception("customer create error "+e.toString());
			}

			mapReturn.putAll(paramMap);
			return mapReturn;
		}
	
	public String checkRdpCustomer(String account){
		String result="success";
		String rdpAccount =account;
		Map<String,String> mapReturn =rdpRegistMapper.checkRdpCustomer(rdpAccount);
		if(CollectionUtil.isEmpty(mapReturn)){
			result="success";
			
		}else{
			result="error";
		}
		return result;
	}
	
	public String checkRdpSupple(String nameCn){
		String result="success";
		String rdpName=null;
		try {
			rdpName = URLDecoder.decode(nameCn, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String,String> mapReturn =rdpRegistMapper.checkRdpSupple(rdpName);
		if(CollectionUtil.isEmpty(mapReturn)){
			result="success";
			
		}else{
			result="error";
		}
		return result;
	}
	
	public List<Map<String,String>> selectGroup(){
		String result="success";
		List<Map<String,String>> mapReturn =rdpRegistMapper.selectGroup();
		if(CollectionUtil.isEmpty(mapReturn)){
			result="error";
			
		}else{
			result="success";
		}
		
		return mapReturn;
	}
}