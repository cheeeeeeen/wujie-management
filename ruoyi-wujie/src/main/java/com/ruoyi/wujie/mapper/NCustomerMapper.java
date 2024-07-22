package com.ruoyi.wujie.mapper;

import java.util.List;
import com.ruoyi.wujie.domain.NCustomer;

/**
 * 客户信息Mapper接口
 * 
 * @author zdx
 * @date 2023-11-05
 */
public interface NCustomerMapper 
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
     * 删除客户信息
     * 
     * @param id 客户信息主键
     * @return 结果
     */
    public int deleteNCustomerById(Long id);

    /**
     * 批量删除客户信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteNCustomerByIds(Long[] ids);
}
