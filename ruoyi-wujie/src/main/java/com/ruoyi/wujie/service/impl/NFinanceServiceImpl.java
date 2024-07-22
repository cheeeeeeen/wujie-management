package com.ruoyi.wujie.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.wujie.domain.NFinance;
import com.ruoyi.wujie.mapper.NFinanceMapper;
import com.ruoyi.wujie.service.NFinanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 合同信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-11-12
 */
@Service
public class NFinanceServiceImpl implements NFinanceService 
{
    @Autowired
    private NFinanceMapper nFinanceMapper;

    /**
     * 查询合同信息
     * 
     * @param id 合同信息主键
     * @return 合同信息
     */
    @Override
    public NFinance selectNFinanceById(Long id)
    {
        return nFinanceMapper.selectNFinanceById(id);
    }

    /**
     * 查询合同信息列表
     * 
     * @param nFinance 合同信息
     * @return 合同信息
     */
    @Override
    public List<NFinance> selectNFinanceList(NFinance nFinance)
    {
        return nFinanceMapper.selectNFinanceList(nFinance);
    }

    /**
     * 新增合同信息
     * 
     * @param nFinance 合同信息
     * @return 结果
     */
    @Override
    public int insertNFinance(NFinance nFinance)
    {
        nFinance.setCreateTime(DateUtils.getNowDate());
        nFinance.setCreateBy(SecurityUtils.getLoginUser().getUsername());
        return nFinanceMapper.insertNFinance(nFinance);
    }

    /**
     * 修改合同信息
     * 
     * @param nFinance 合同信息
     * @return 结果
     */
    @Override
    public int updateNFinance(NFinance nFinance)
    {
        nFinance.setUpdateTime(DateUtils.getNowDate());
        return nFinanceMapper.updateNFinance(nFinance);
    }

    /**
     * 批量删除合同信息
     * 
     * @param ids 需要删除的合同信息主键
     * @return 结果
     */
    @Override
    public int deleteNFinanceByIds(Long[] ids)
    {
        return nFinanceMapper.deleteNFinanceByIds(ids);
    }

    /**
     * 删除合同信息信息
     * 
     * @param id 合同信息主键
     * @return 结果
     */
    @Override
    public int deleteNFinanceById(Long id)
    {
        return nFinanceMapper.deleteNFinanceById(id);
    }
}
