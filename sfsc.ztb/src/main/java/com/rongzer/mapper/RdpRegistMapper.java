package com.rongzer.mapper;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface RdpRegistMapper {
	
	/**
	 * 增加RDP用户
	 * @param paramMap
	 * @return
	 */
	public int insertRdpCustomer(Map<String, String> paramMap);
	
	/**
	 * 增加RDP用户
	 * @param paramMap
	 * @return
	 */
	public int insertRdpCustomerRole(Map<String, String> paramMap);
	
	/**
	 * 校验用户名是否存在
	 * @param param
	 * @return
	 */
	public Map<String, String> checkRdpCustomer(String account);
	
	/**
	 * 校验供应商是否存在
	 * @param param
	 * @return
	 */
	public Map<String, String> checkRdpSupple(String nameCn);
	
	/**
	 * 查询所有的组织列表
	 * @param param
	 * @return
	 */
	public List<Map<String, String>> selectGroup();
}
