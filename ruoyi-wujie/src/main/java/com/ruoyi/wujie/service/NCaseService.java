package com.ruoyi.wujie.service;

import com.ruoyi.wujie.domain.NCase;

import java.util.List;

/**
 * 案件信息Service接口
 * 
 * @author ruoyi
 * @date 2023-12-05
 */
public interface NCaseService
{
    /**
     * 查询案件信息
     * 
     * @param caseId 案件信息主键
     * @return 案件信息
     */
    public NCase selectNCaseByCaseId(Long caseId);

    /**
     * 查询案件信息列表
     * 
     * @param nCase 案件信息
     * @return 案件信息集合
     */
    public List<NCase> selectNCaseList(NCase nCase);

    /**
     * 新增案件信息
     * 
     * @param nCase 案件信息
     * @return 结果
     */
    public int insertNCase(NCase nCase);

    /**
     * 修改案件信息
     * 
     * @param nCase 案件信息
     * @return 结果
     */
    public int updateNCase(NCase nCase);

    /**
     * 批量删除案件信息
     * 
     * @param caseIds 需要删除的案件信息主键集合
     * @return 结果
     */
    public int deleteNCaseByCaseIds(Long[] caseIds);

    /**
     * 删除案件信息信息
     * 
     * @param caseId 案件信息主键
     * @return 结果
     */
    public int deleteNCaseByCaseId(Long caseId);
}
