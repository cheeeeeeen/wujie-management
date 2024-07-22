package com.ruoyi.wujie.mapper;

import java.util.List;
import com.ruoyi.wujie.domain.NCase;

/**
 * 案件信息Mapper接口
 * 
 * @author ruoyi
 * @date 2023-12-05
 */
public interface NCaseMapper 
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
     * 删除案件信息
     * 
     * @param caseId 案件信息主键
     * @return 结果
     */
    public int deleteNCaseByCaseId(Long caseId);

    /**
     * 批量删除案件信息
     * 
     * @param caseIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteNCaseByCaseIds(Long[] caseIds);
}
