package com.ruoyi.biz.service.impl;


import cn.hutool.core.collection.CollUtil;
import com.ruoyi.biz.domain.dto.FileInfoDto;
import com.ruoyi.biz.domain.entity.Custom;
import com.ruoyi.biz.domain.entity.FileInfo;
import com.ruoyi.biz.domain.vo.FileInfoVo;
import com.ruoyi.biz.mapper.FileInfoMapper;
import com.ruoyi.biz.service.CustomService;
import com.ruoyi.biz.service.FileInfoService;
//import com.ruoyi.common.config.RuoYiConfig;
//import com.ruoyi.common.domain.vo.FileUploadVo;
import com.ruoyi.common.enums.YesNoEnum;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.ServerConfig;
// com.ruoyi.common.utils.file.FileUploadUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 *
 */
@Service
public class FileInfoServiceImpl implements FileInfoService {

    @Autowired
    private FileInfoMapper fileInfoMapper;
    @Autowired
    private CustomService customService;
    @Autowired
    private ServerConfig serverConfig;

    public Boolean insert(FileInfo fileInfo) {
        Custom custom = customService.getCustomById(fileInfo.getCustomId());
        if (Objects.isNull(custom)) {
            throw new ServiceException("客户信息不存在");
        }
        fileInfo.setCreateTime(new Date());
        fileInfo.setCreateBy(SecurityUtils.getLoginUser().getUsername());
        fileInfo.setDel(YesNoEnum.NO.getValue().toString());
        return fileInfoMapper.insert(fileInfo) > 0;
    }

    /*@Override
    public Boolean insert(MultipartFile file, FileInfoDto fileInfoDto, String url) {
        if (Objects.isNull(file) || 0 == file.getSize()) {
            throw new ServiceException("文件不能为空");
        }
        //校验客户是否存在
        Custom custom = customService.getCustomById(fileInfoDto.getCustomId());
        if (Objects.isNull(custom)) {
            throw new ServiceException("客户信息不存在");
        }

        FileUploadVo upload = null;
        try {
            upload = FileUploadUtils.upload(url, RuoYiConfig.getUploadPath(), file);
        } catch (Exception e) {
            throw new ServiceException("文件上传失败");
        }
        if(Objects.isNull(upload)){
            throw new ServiceException("文件上传失败");
        }

        FileInfo fileInfo = new FileInfo();
        fileInfo.setCustomId(fileInfoDto.getCustomId());
        fileInfo.setCreateTime(new Date());
        fileInfo.setFileType(upload.getFileType());
        fileInfo.setFileSize(upload.getSize());
        fileInfo.setFileName(upload.getOriginalFileName());
        fileInfo.setFilePath(upload.getFileName());

        fileInfo.setCreateTime(new Date());
        fileInfo.setCreateBy(SecurityUtils.getLoginUser().getUsername());
        fileInfo.setDel(YesNoEnum.NO.getValue().toString());
        return fileInfoMapper.insert(fileInfo) > 0;
    }*/

    public Boolean update(FileInfo fileInfo) {
        fileInfo.setUpdateTime(new Date());
        return fileInfoMapper.updateByPrimaryKeySelective(fileInfo) > 0;
    }

    public FileInfo getFileInfoById(Long id) {
        return fileInfoMapper.selectByPrimaryKey(id);
    }

    public int deleteById(Long id) {
        return fileInfoMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<FileInfoVo> listFileInfoByCustomId(Long customId) {
        if (Objects.isNull(customId)) {
            return null;
        }
        List<FileInfo> fileInfoVos = fileInfoMapper.getFileInfoByCustomIds(customId);
        if (CollUtil.isEmpty(fileInfoVos)) {
            return null;
        }
        List<FileInfoVo> vos = new ArrayList<>();
        fileInfoVos.stream().forEach(it -> {
            FileInfoVo vo = new FileInfoVo();
            BeanUtils.copyProperties(it, vo);
            vo.setUrl(serverConfig.getUrl() + it.getFilePath());
            vos.add(vo);
        });
        return vos;
    }

    @Override
    public List<FileInfoVo> listFileInfo(FileInfoDto fileInfoDto) {
        List<FileInfo> fileInfoVos = fileInfoMapper.listFileInfo(fileInfoDto);
        if (CollUtil.isEmpty(fileInfoVos)) {
            return null;
        }
        List<FileInfoVo> vos = new ArrayList<>();
        fileInfoVos.stream().forEach(it -> {
            FileInfoVo vo = new FileInfoVo();
            BeanUtils.copyProperties(it, vo);
            vo.setUrl(serverConfig.getUrl() + it.getFilePath());
            vos.add(vo);
        });
        return vos;
    }
}