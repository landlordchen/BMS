package com.rongzer.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;



@Repository
public interface AuditMapper {
	
	/**
	 * 
	 * @param params
	 */
	public void changeStatusOfPr(Map<String, String> params);

	public Map<String, String> getProductInfo(String prId);

	public void deleteSelected(String prId);


	public int check(Map<String, String> params);
	
}
