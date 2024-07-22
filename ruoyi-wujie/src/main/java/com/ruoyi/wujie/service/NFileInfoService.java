package com.ruoyi.wujie.service;

import com.ruoyi.wujie.domain.NFileInfo;

import java.util.List;

public interface NFileInfoService {
    public Boolean insert(NFileInfo fileInfo);

    public List<NFileInfo> listFileInfoByCustomId(Long customId);

    public List<NFileInfo> listFileInfoBycontractId(Long conTractId);

    public List<NFileInfo> listFileInfoByfinanceId(Long financeId);

    public List<NFileInfo> listFileInfoBycaseId(Long caseId);

    public List<NFileInfo> listFileInfoByStampId(Long stampId);

    //public Boolean update(NFileInfo fileInfo);

    public NFileInfo getFileInfoById(Long id);

    public int deleteById(Long id);

    List<NFileInfo> listFileInfo(NFileInfo fileInfoDto);
}
