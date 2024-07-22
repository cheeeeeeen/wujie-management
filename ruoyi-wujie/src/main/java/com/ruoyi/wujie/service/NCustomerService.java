package com.ruoyi.wujie.service;

import com.ruoyi.wujie.domain.NCustomer;

import java.util.List;

/**
 * 客户信息Service接口
 * 
 * @author zdx
 * @date 2023-11-05
 */
public interface NCustomerService
{
    /**
     * 查询客户信息
     * 
     * @param id 客户信息主键
     * @return 客户信息
     */
    public NCustomer selectNCustomerById(Long id);

    /**
     * 查询客户信息列表
     * 
     * @param nCustomer 客户信息
     * @return 客户信息集合
     */
    public List<NCustomer> selectNCustomerList(NCustomer nCustomer);

    /**
     * 新增客户信息
     * 
     * @param nCustomer 客户信息
     * @return 结果
     */
    public int insertNCustomer(NCustomer nCustomer);

    /**
     * 修改客户信息
     * 
     * @param nCustomer 客户信息
     * @return 结果
     */
    public int updateNCustomer(NCustomer nCustomer);

    /**
     * 批量删除客户信息
     * 
     * @param ids 需要删除的客户信息主键集合
     * @return 结果
     */
    public int deleteNCustomerByIds(Long[] ids);

    /**
     * 删除客户信息信息
     * 
     * @param id 客户信息主键
     * @return 结果
     */
    public int deleteNCustomerById(Long id);
}
