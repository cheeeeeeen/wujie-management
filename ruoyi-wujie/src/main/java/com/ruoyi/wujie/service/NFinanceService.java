package com.ruoyi.wujie.service;

import java.util.List;
import com.ruoyi.wujie.domain.NFinance;

/**
 * 合同信息Service接口
 * 
 * @author ruoyi
 * @date 2023-11-12
 */
public interface NFinanceService
{
    /**
     * 查询合同信息
     * 
     * @param id 合同信息主键
     * @return 合同信息
     */
    public NFinance selectNFinanceById(Long id);

    /**
     * 查询合同信息列表
     * 
     * @param nFinance 合同信息
     * @return 合同信息集合
     */
    public List<NFinance> selectNFinanceList(NFinance nFinance);

    /**
     * 新增合同信息
     * 
     * @param nFinance 合同信息
     * @return 结果
     */
    public int insertNFinance(NFinance nFinance);

    /**
     * 修改合同信息
     * 
     * @param nFinance 合同信息
     * @return 结果
     */
    public int updateNFinance(NFinance nFinance);

    /**
     * 批量删除合同信息
     * 
     * @param ids 需要删除的合同信息主键集合
     * @return 结果
     */
    public int deleteNFinanceByIds(Long[] ids);

    /**
     * 删除合同信息信息
     * 
     * @param id 合同信息主键
     * @return 结果
     */
    public int deleteNFinanceById(Long id);
}
