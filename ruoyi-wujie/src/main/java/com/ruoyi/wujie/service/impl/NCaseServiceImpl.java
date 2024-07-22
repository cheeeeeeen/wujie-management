package com.ruoyi.wujie.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.wujie.domain.NCase;
import com.ruoyi.wujie.mapper.NCaseMapper;
import com.ruoyi.wujie.service.NCaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 案件信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-12-05
 */
@Service
public class NCaseServiceImpl implements NCaseService
{
    @Autowired
    private NCaseMapper nCaseMapper;

    /**
     * 查询案件信息
     * 
     * @param caseId 案件信息主键
     * @return 案件信息
     */
    @Override
    public NCase selectNCaseByCaseId(Long caseId)
    {
        return nCaseMapper.selectNCaseByCaseId(caseId);
    }

    /**
     * 查询案件信息列表
     * 
     * @param nCase 案件信息
     * @return 案件信息
     */
    @Override
    public List<NCase> selectNCaseList(NCase nCase)
    {
        String username = SecurityUtils.getLoginUser().getUsername();
        if(!username.equals("administrator") && !username.equals("admin")) {
            nCase.setCreateBy(SecurityUtils.getLoginUser().getUsername());
        }
        return nCaseMapper.selectNCaseList(nCase);
    }

    /**
     * 新增案件信息
     * 
     * @param nCase 案件信息
     * @return 结果
     */
    @Override
    public int insertNCase(NCase nCase)
    {
        nCase.setCreateTime(DateUtils.getNowDate());
        nCase.setCreateBy(SecurityUtils.getLoginUser().getUsername());
        return nCaseMapper.insertNCase(nCase);
    }

    /**
     * 修改案件信息
     * 
     * @param nCase 案件信息
     * @return 结果
     */
    @Override
    public int updateNCase(NCase nCase)
    {
        nCase.setUpdateTime(DateUtils.getNowDate());
        return nCaseMapper.updateNCase(nCase);
    }

    /**
     * 批量删除案件信息
     * 
     * @param caseIds 需要删除的案件信息主键
     * @return 结果
     */
    @Override
    public int deleteNCaseByCaseIds(Long[] caseIds)
    {
        return nCaseMapper.deleteNCaseByCaseIds(caseIds);
    }

    /**
     * 删除案件信息信息
     * 
     * @param caseId 案件信息主键
     * @return 结果
     */
    @Override
    public int deleteNCaseByCaseId(Long caseId)
    {
        return nCaseMapper.deleteNCaseByCaseId(caseId);
    }
}
