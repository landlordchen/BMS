package com.rongzer.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rongzer.mapper.AuditMapper;
import com.rongzer.rdp.common.util.StringUtil;



@Service
public class AuditService {
	
	@Autowired
	private AuditMapper auditMapper;
	
	
	public void changeStatusOfPr(String prIds, String userId,String teId) {
		List<String> prList = (List<String>)JSONArray.fromObject(prIds);
		List<Map<String,String>> paramsList = new ArrayList<Map<String,String>>();
		if(null!=prList&&prList.size()>0){
			for(String prId:prList){
				Map<String,String> params = new HashMap<String,String>();
				params.put("REF_ID",StringUtil.getUuid32());
				params.put("TENDER_ID", teId);
				params.put("PRODUCT_ID", prId);
				params.put("userId", userId);
			/*	paramsList.add(params);*/
				auditMapper.changeStatusOfPr(params);
			}
			/*if(null!=paramsList&&paramsList.size()>0){
				int ediTotalNum = paramsList.size();
				if(ediTotalNum<=50){
					auditMapper.changeStatusOfPr(paramsList);
				}else{
					int k=1;
					while(true){
						if(50*(k-1)+50>ediTotalNum){
							List<Map<String, String>> batchList = new ArrayList<Map<String,String>>();
							batchList = paramsList.subList(50*(k-1), ediTotalNum);
							if(batchList.size()>0){
								auditMapper.changeStatusOfPr(batchList);
							}
							break;
						}else{
							List<Map<String, String>> batchList = new ArrayList<Map<String,String>>();
							batchList = paramsList.subList(50*(k-1), 50*(k-1)+50);
							auditMapper.changeStatusOfPr(batchList);
							k++;
						}
					}
				}
			}*/
		}
	}
	
	public void deleteSelected(String prIds) {
		List<String> prList = (List<String>)JSONArray.fromObject(prIds);
		List<Map<String,String>> paramsList = new ArrayList<Map<String,String>>();
		if(null!=prList&&prList.size()>0){
			for(String prId:prList){
				/*Map<String,String> params = new HashMap<String,String>();
				params.put("REF_ID", prId);*/
				auditMapper.deleteSelected(prId);
			}
			/*if(null!=paramsList&&paramsList.size()>0){
				int ediTotalNum = paramsList.size();
				if(ediTotalNum<=50){
					auditMapper.deleteSelected(paramsList);
				}else{
					int k=1;
					while(true){
						if(50*(k-1)+50>ediTotalNum){
							List<Map<String, String>> batchList = new ArrayList<Map<String,String>>();
							batchList = paramsList.subList(50*(k-1), ediTotalNum);
							if(batchList.size()>0){
								auditMapper.deleteSelected(batchList);
							}
							break;
						}else{
							List<Map<String, String>> batchList = new ArrayList<Map<String,String>>();
							batchList = paramsList.subList(50*(k-1), 50*(k-1)+50);
							auditMapper.deleteSelected(batchList);
							k++;
						}
					}
				}
			}*/
		}
	}

	public int checkNum(String userId, String teId) {
		Map<String,String> params = new HashMap<String,String>();
		params.put("userId", userId);
		params.put("teId", teId);
		return auditMapper.check(params);
	}
	
}