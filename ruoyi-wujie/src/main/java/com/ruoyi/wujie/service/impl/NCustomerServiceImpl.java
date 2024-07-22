package com.ruoyi.wujie.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.wujie.domain.NCustomer;
import com.ruoyi.wujie.mapper.NCustomerMapper;
import com.ruoyi.wujie.service.NCustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 客户信息Service业务层处理
 * 
 * @author zdx
 * @date 2023-11-05
 */
@Service
public class NCustomerServiceImpl implements NCustomerService
{
    @Autowired
    private NCustomerMapper nCustomerMapper;

    /**
     * 查询客户信息
     * 
     * @param id 客户信息主键
     * @return 客户信息
     */
    @Override
    public NCustomer selectNCustomerById(Long id)
    {
        return nCustomerMapper.selectNCustomerById(id);
    }

    /**
     * 查询客户信息列表
     * 
     * @param nCustomer 客户信息
     * @return 客户信息
     */
    @Override
    public List<NCustomer> selectNCustomerList(NCustomer nCustomer)
    {
        return nCustomerMapper.selectNCustomerList(nCustomer);
    }

    /**
     * 新增客户信息
     * 
     * @param nCustomer 客户信息
     * @return 结果
     */
    @Override
    public int insertNCustomer(NCustomer nCustomer)
    {
        nCustomer.setCreateTime(DateUtils.getNowDate());
        nCustomer.setCreateBy(SecurityUtils.getLoginUser().getUsername());
        return nCustomerMapper.insertNCustomer(nCustomer);
    }

    /**
     * 修改客户信息
     * 
     * @param nCustomer 客户信息
     * @return 结果
     */
    @Override
    public int updateNCustomer(NCustomer nCustomer)
    {
        nCustomer.setUpdateTime(DateUtils.getNowDate());
        return nCustomerMapper.updateNCustomer(nCustomer);
    }

    /**
     * 批量删除客户信息
     * 
     * @param ids 需要删除的客户信息主键
     * @return 结果
     */
    @Override
    public int deleteNCustomerByIds(Long[] ids)
    {
        return nCustomerMapper.deleteNCustomerByIds(ids);
    }

    /**
     * 删除客户信息信息
     * 
     * @param id 客户信息主键
     * @return 结果
     */
    @Override
    public int deleteNCustomerById(Long id)
    {
        return nCustomerMapper.deleteNCustomerById(id);
    }
}
