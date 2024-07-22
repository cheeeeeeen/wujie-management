package com.ruoyi.biz.service;


import com.ruoyi.biz.domain.dto.FileInfoDto;
import com.ruoyi.biz.domain.entity.FileInfo;
import com.ruoyi.biz.domain.vo.FileInfoVo;

import java.util.List;

/**
*
*/
public interface FileInfoService {

    public Boolean insert(FileInfo fileInfo);

    //public Boolean insert(MultipartFile file, FileInfoDto fileInfoDto, String url);

    public List<FileInfoVo> listFileInfoByCustomId(Long customId);

    public Boolean update(FileInfo fileInfo);

    public FileInfo getFileInfoById(Long id);

    public int deleteById(Long id);

    List<FileInfoVo> listFileInfo(FileInfoDto fileInfoDto);
}