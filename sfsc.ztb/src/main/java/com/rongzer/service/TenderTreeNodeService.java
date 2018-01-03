package com.rongzer.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rongzer.controller.CustomerTreeNodeModel;
import com.rongzer.mapper.TenderTreeNodeMapper;
import com.rongzer.rdp.common.util.StringUtil;



@Service
public class TenderTreeNodeService {
	
	@Autowired
	private TenderTreeNodeMapper treeNodeMapper;
	
	
	/**
	 * 得到无权限的企业中
	 * @param userId 
	 * @return
	 */
	public CustomerTreeNodeModel getNodeSysTreeByCust(String tenderid, String userId){
			
			Map<String,String> map = new HashMap<String, String>();
			//查企业组
			map.put("ternderId", tenderid);
			List<CustomerTreeNodeModel> cgroup = treeNodeMapper.getTenderInfo(map);
			
			if(cgroup !=null && cgroup.size() > 0){
				//查企业
				for (Iterator iterator = cgroup.iterator(); iterator.hasNext();) {
					CustomerTreeNodeModel treeNodeModel = (CustomerTreeNodeModel) iterator.next();
					Map<String,String> map2 = new HashMap<String, String>();
					map2.put("ternderId", treeNodeModel.getId());
					List<CustomerTreeNodeModel> customerList = treeNodeMapper.getChildTenderList(map2);
					this.createChildStructure(customerList,userId);
					treeNodeModel.setNodes(customerList);
				}
				CustomerTreeNodeModel rootTree = new CustomerTreeNodeModel();
				rootTree.setId("root");
				rootTree.setName("根目录");
				rootTree.setLevel("0");
				rootTree.setParentId(null);
				rootTree.setNodes(cgroup);
				return rootTree;
			}
		return new CustomerTreeNodeModel();
	}
	/**
	 * 得到无权限的企业中
	 * @param userId 
	 * @return
	 */
	public CustomerTreeNodeModel getNodeSysTreeByCust(String tenderid, String userId,String type){
			
			Map<String,String> map = new HashMap<String, String>();
			//查企业组
			map.put("ternderId", tenderid);
			List<CustomerTreeNodeModel> cgroup = treeNodeMapper.getTenderInfo(map);
			
			if(cgroup !=null && cgroup.size() > 0){
				//查企业
				for (Iterator iterator = cgroup.iterator(); iterator.hasNext();) {
					CustomerTreeNodeModel treeNodeModel = (CustomerTreeNodeModel) iterator.next();
					Map<String,String> map2 = new HashMap<String, String>();
					map2.put("ternderId", treeNodeModel.getId());
					List<CustomerTreeNodeModel> customerList = treeNodeMapper.getChildTenderList(map2);
					this.createChildStructure(customerList,userId,type);
					treeNodeModel.setNodes(customerList);
					treeNodeModel.setUrl("");
				}
				CustomerTreeNodeModel rootTree = new CustomerTreeNodeModel();
				rootTree.setId("root");
				rootTree.setName("根目录");
				rootTree.setLevel("0");
				rootTree.setParentId(null);
				rootTree.setNodes(cgroup);
				return rootTree;
			}
		return new CustomerTreeNodeModel();
	}
	/**
	 * 生成企业组结构
	 * @param customerList
	 * @param userId 
	 */
	private void createChildStructure(List<CustomerTreeNodeModel> customerList, String userId){
		
		if("2c8080fa45cb50840145cb5300310003".equals(userId)){//admin
			for(Iterator iterator = customerList.iterator(); iterator.hasNext();){
				CustomerTreeNodeModel treeNodeModel = (CustomerTreeNodeModel) iterator.next();
				List<CustomerTreeNodeModel> deptList = new ArrayList<CustomerTreeNodeModel>();
				//商品列表
				CustomerTreeNodeModel empTree = new CustomerTreeNodeModel();
				empTree.setId(StringUtil.getUuid32());
				empTree.setName("商品列表");
				empTree.setLevel("3");
				empTree.setParentId(treeNodeModel.getId());
				empTree.setUrl("ShowReport.wx?PAGEID=page_customer_employee_list&CUSTOMER_ID="+treeNodeModel.getId());		
				deptList.add(empTree);
				//材料审核列表
				CustomerTreeNodeModel auditTree = new CustomerTreeNodeModel();
				auditTree.setId(StringUtil.getUuid32());
				auditTree.setName("运营审核");
				auditTree.setLevel("3");
				auditTree.setParentId(treeNodeModel.getId());
				auditTree.setUrl("ShowReport.wx?PAGEID=supplierInfoAudit1&NODE_ID="+treeNodeModel.getId()+"&NODE_TYPE=I01302");
				deptList.add(auditTree);
				
				/*//价格审核列表
				CustomerTreeNodeModel priceAuditTree = new CustomerTreeNodeModel();
				priceAuditTree.setId(StringUtil.getUuid32());
				priceAuditTree.setName("产品审核");
				priceAuditTree.setLevel("3");
				priceAuditTree.setParentId(treeNodeModel.getId());
				priceAuditTree.setUrl("ShowReport.wx?PAGEID=supplierInfoAudit2&NODE_ID="+treeNodeModel.getId()+"&NODE_TYPE=I01302");
				deptList.add(priceAuditTree);*/
				//评价列表
				CustomerTreeNodeModel userTree = new CustomerTreeNodeModel();
				userTree.setId(StringUtil.getUuid32());
				userTree.setName("终审");
				userTree.setLevel("3");
				userTree.setParentId(treeNodeModel.getId());
				userTree.setUrl("ShowReport.wx?PAGEID=choseProduct&NODE_ID="+treeNodeModel.getId()+"&NODE_TYPE=I01302"+"&CREATE_USER="+userId);
				deptList.add(userTree);
				
				treeNodeModel.setNodes(deptList);
			}
		}else{
			
			for(Iterator iterator = customerList.iterator(); iterator.hasNext();){
				CustomerTreeNodeModel treeNodeModel = (CustomerTreeNodeModel) iterator.next();
				
				List<CustomerTreeNodeModel> deptList = new ArrayList<CustomerTreeNodeModel>();
				
				//商品列表
				CustomerTreeNodeModel empTree = new CustomerTreeNodeModel();
				empTree.setId(StringUtil.getUuid32());
				empTree.setName("商品列表");
				empTree.setLevel("3");
				empTree.setParentId(treeNodeModel.getId());
				empTree.setUrl("ShowReport.wx?PAGEID=page_customer_employee_list2&CUSTOMER_ID="+treeNodeModel.getId());		
				deptList.add(empTree);
				
				
				//评价列表
				CustomerTreeNodeModel userTree = new CustomerTreeNodeModel();
				userTree.setId(StringUtil.getUuid32());
				userTree.setName("终审");
				userTree.setLevel("3");
				userTree.setParentId(treeNodeModel.getId());
				userTree.setUrl("ShowReport.wx?PAGEID=choseProduct&NODE_ID="+treeNodeModel.getId()+"&NODE_TYPE=I01302"+"&CREATE_USER="+userId);
				deptList.add(userTree);
				treeNodeModel.setNodes(deptList);
			}
		}
		
	}
	/**
	 * 生成企业组结构
	 * @param customerList
	 * @param userId 
	 */
	private void createChildStructure(List<CustomerTreeNodeModel> customerList, String userId,String type){
		if("2c8080fa45cb50840145cb5300310003".equals(userId)){//admin
			for(Iterator iterator = customerList.iterator(); iterator.hasNext();){
				CustomerTreeNodeModel treeNodeModel = (CustomerTreeNodeModel) iterator.next();
				List<CustomerTreeNodeModel> deptList = new ArrayList<CustomerTreeNodeModel>();
				//商品列表
				CustomerTreeNodeModel empTree = new CustomerTreeNodeModel();
				empTree.setId(StringUtil.getUuid32());
				empTree.setName("商品列表");
				empTree.setLevel("3");
				empTree.setParentId(treeNodeModel.getId());
				empTree.setUrl("ShowReport.wx?PAGEID=page_customer_employee_list&CUSTOMER_ID="+treeNodeModel.getId());		
				deptList.add(empTree);
				//材料审核列表
				CustomerTreeNodeModel auditTree = new CustomerTreeNodeModel();
				auditTree.setId(StringUtil.getUuid32());
				auditTree.setName("运营审核");
				auditTree.setLevel("3");
				auditTree.setParentId(treeNodeModel.getId());
				auditTree.setUrl("ShowReport.wx?PAGEID=supplierInfoAudit1&NODE_ID="+treeNodeModel.getId()+"&NODE_TYPE=I01302");
				deptList.add(auditTree);
				
				/*//价格审核列表
				CustomerTreeNodeModel priceAuditTree = new CustomerTreeNodeModel();
				priceAuditTree.setId(StringUtil.getUuid32());
				priceAuditTree.setName("产品审核");
				priceAuditTree.setLevel("3");
				priceAuditTree.setParentId(treeNodeModel.getId());
				priceAuditTree.setUrl("ShowReport.wx?PAGEID=supplierInfoAudit2&NODE_ID="+treeNodeModel.getId()+"&NODE_TYPE=I01302");
				deptList.add(priceAuditTree);*/
				//评价列表
				CustomerTreeNodeModel userTree = new CustomerTreeNodeModel();
				userTree.setId(StringUtil.getUuid32());
				userTree.setName("终审");
				userTree.setLevel("3");
				userTree.setParentId(treeNodeModel.getId());
				userTree.setUrl("ShowReport.wx?PAGEID=choseProduct&NODE_ID="+treeNodeModel.getId()+"&NODE_TYPE=I01302"+"&CREATE_USER="+userId);
				deptList.add(userTree);
				
				CustomerTreeNodeModel finaltrTree = new CustomerTreeNodeModel();
				finaltrTree.setId(StringUtil.getUuid32());
				finaltrTree.setName("商品统计查看");
				finaltrTree.setLevel("3");
				finaltrTree.setParentId(treeNodeModel.getId());
				finaltrTree.setUrl("ShowReport.wx?PAGEID=tenderAll&NODE_ID="+treeNodeModel.getId()+"&NODE_TYPE=I01302"+"&CREATE_USER="+userId);
				deptList.add(finaltrTree);
				//选择统计
				finaltrTree = new CustomerTreeNodeModel();
				finaltrTree.setId(StringUtil.getUuid32());
				finaltrTree.setName("终审统计查看");
				finaltrTree.setLevel("3");
				finaltrTree.setParentId(treeNodeModel.getId());
				finaltrTree.setUrl("ShowReport.wx?PAGEID=tenderSel&NODE_ID="+treeNodeModel.getId()+"&NODE_TYPE=I01302"+"&CREATE_USER="+userId);
				deptList.add(finaltrTree);
				
				treeNodeModel.setNodes(deptList);
				treeNodeModel.setUrl("");
			}
		}else{
			for(Iterator iterator = customerList.iterator(); iterator.hasNext();){
				CustomerTreeNodeModel treeNodeModel = (CustomerTreeNodeModel) iterator.next();
				List<CustomerTreeNodeModel> deptList = new ArrayList<CustomerTreeNodeModel>();
				if("M3000".equals(type)){//供应商角色，可以看到左边商品列表，只能看到该供应商所属产品，可以增加，删除修改商品
					//商品列表
					CustomerTreeNodeModel empTree = new CustomerTreeNodeModel();
					empTree.setId(StringUtil.getUuid32());
					empTree.setName("商品列表");
					empTree.setLevel("3");
					empTree.setParentId(treeNodeModel.getId());
					empTree.setUrl("ShowReport.wx?PAGEID=page_customer_employee_list&CUSTOMER_ID="+treeNodeModel.getId());		
					deptList.add(empTree);
				}else if("M3001".equals(type)){//运营审核，登入只能看到左边运营审核，点击查看，在查看页可以对产品进行审核，并可以修改审核结果  
					//材料审核列表
					CustomerTreeNodeModel auditTree = new CustomerTreeNodeModel();
					auditTree.setId(StringUtil.getUuid32());
					auditTree.setName("运营审核");
					auditTree.setLevel("3");
					auditTree.setParentId(treeNodeModel.getId());
					auditTree.setUrl("ShowReport.wx?PAGEID=supplierInfoAudit1&NODE_ID="+treeNodeModel.getId()+"&NODE_TYPE=I01302");
					deptList.add(auditTree);
				}else if("M3002".equals(type)){//终审,登入只能看到左边终审，点击查看，在产品页可以对产品进行选择，并可以修改终审结果，此页面显示商品为运营审核通过的产品，没通过的不显示
					CustomerTreeNodeModel userTree = new CustomerTreeNodeModel();
					userTree.setId(StringUtil.getUuid32());
					userTree.setName("终审");
					userTree.setLevel("3");
					userTree.setParentId(treeNodeModel.getId());
					userTree.setUrl("ShowReport.wx?PAGEID=choseProduct&NODE_ID="+treeNodeModel.getId()+"&NODE_TYPE=I01302"+"&CREATE_USER="+userId);
					deptList.add(userTree);
				}else if("M4000".equals(type)){//商品统计查看,登入在左侧可以看到商品列表，该商品列表包含终审列，显示选择结果
					CustomerTreeNodeModel userTree = new CustomerTreeNodeModel();
					userTree.setId(StringUtil.getUuid32());
					userTree.setName("商品统计查看");
					userTree.setLevel("3");
					userTree.setParentId(treeNodeModel.getId());
					userTree.setUrl("ShowReport.wx?PAGEID=tenderAll&NODE_ID="+treeNodeModel.getId()+"&NODE_TYPE=I01302"+"&CREATE_USER="+userId);
					deptList.add(userTree);
					//选择统计
					userTree = new CustomerTreeNodeModel();
					userTree.setId(StringUtil.getUuid32());
					userTree.setName("终审统计查看");
					userTree.setLevel("3");
					userTree.setParentId(treeNodeModel.getId());
					userTree.setUrl("ShowReport.wx?PAGEID=tenderSel&NODE_ID="+treeNodeModel.getId()+"&NODE_TYPE=I01302"+"&CREATE_USER="+userId);
					deptList.add(userTree);
				}
				
				treeNodeModel.setNodes(deptList);
				treeNodeModel.setUrl("");
			}
		}
		
	}
}