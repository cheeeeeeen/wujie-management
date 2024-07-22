package com.ruoyi.biz.mapper;

import com.ruoyi.biz.domain.dto.FileInfoDto;
import com.ruoyi.biz.domain.entity.FileInfo;

import java.util.List;

public interface FileInfoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(FileInfo row);

    FileInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(FileInfo row);

    List<FileInfo> getFileInfoByCustomIds(Long customId);

    List<FileInfo> listFileInfo(FileInfoDto fileInfoDto);
}