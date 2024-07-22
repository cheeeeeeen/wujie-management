package com.ruoyi.wujie.mapper;

import com.ruoyi.wujie.domain.NFileInfo;

import java.util.List;

public interface NFileInfoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(NFileInfo row);

    NFileInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(NFileInfo row);

    List<NFileInfo> getFileInfoByCustomIds(Long customId);

    List<NFileInfo> getFileInfoByContractIds(Long contractId);

    List<NFileInfo> getFileInfoByFinanceIds(Long financeId);
    List<NFileInfo> listFileInfo(NFileInfo fileInfoDto);

    List<NFileInfo> getFileInfoBycaseIds(Long caseId);

    List<NFileInfo> getFileInfoByStampIds(Long stampId);
}
