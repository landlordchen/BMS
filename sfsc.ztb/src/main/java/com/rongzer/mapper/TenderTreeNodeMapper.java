package com.rongzer.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.rongzer.controller.CustomerTreeNodeModel;



@Repository
public interface TenderTreeNodeMapper {
	
	/**
	 * 根据活动ID 获取活动
	 * @param 主活动ID
	 * @return
	 */
	public List<CustomerTreeNodeModel> getTenderInfo(Map<String,String> param);
	

	/**
	 * @param 主活动ID
	 * 根据获取主ID 获取子活动信息
	 * @return
	 */
	public List<CustomerTreeNodeModel> getChildTenderList(Map<String,String> param);
	
}
