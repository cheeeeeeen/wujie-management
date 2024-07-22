package com.ruoyi.wujie.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.wujie.mapper.NContractMapper;
import com.ruoyi.wujie.domain.NContract;
import com.ruoyi.wujie.service.NContractService;

/**
 * 合同信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-11-12
 */
@Service
public class NContractServiceImpl implements NContractService 
{
    @Autowired
    private NContractMapper nContractMapper;

    /**
     * 查询合同信息
     * 
     * @param id 合同信息主键
     * @return 合同信息
     */
    @Override
    public NContract selectNContractById(Long id)
    {
        return nContractMapper.selectNContractById(id);
    }

    /**
     * 查询合同信息列表
     * 
     * @param nContract 合同信息
     * @return 合同信息
     */
    @Override
    public List<NContract> selectNContractList(NContract nContract)
    {
        return nContractMapper.selectNContractList(nContract);
    }

    /**
     * 新增合同信息
     * 
     * @param nContract 合同信息
     * @return 结果
     */
    @Override
    public int insertNContract(NContract nContract)
    {
        nContract.setCreateTime(DateUtils.getNowDate());
        return nContractMapper.insertNContract(nContract);
    }

    /**
     * 修改合同信息
     * 
     * @param nContract 合同信息
     * @return 结果
     */
    @Override
    public int updateNContract(NContract nContract)
    {
        nContract.setUpdateTime(DateUtils.getNowDate());
        return nContractMapper.updateNContract(nContract);
    }

    /**
     * 批量删除合同信息
     * 
     * @param ids 需要删除的合同信息主键
     * @return 结果
     */
    @Override
    public int deleteNContractByIds(Long[] ids)
    {
        return nContractMapper.deleteNContractByIds(ids);
    }

    /**
     * 删除合同信息信息
     * 
     * @param id 合同信息主键
     * @return 结果
     */
    @Override
    public int deleteNContractById(Long id)
    {
        return nContractMapper.deleteNContractById(id);
    }
}
