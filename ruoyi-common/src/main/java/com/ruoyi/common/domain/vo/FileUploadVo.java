package com.ruoyi.common.domain.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;

/**
 * 文件上传VO
 *
 * @author: Mr.DengYuanFang
 * @project: RuoYi-Vue
 * @version: 1.0
 * @createDate: 2023/11/02 15:05
 */
@ApiModel(value = "文件上传" )
public class FileUploadVo implements Serializable {

    /**
     * 文件名称
     */
    @ApiModelProperty(value = "文件原始名称")
    private String originalFileName;

    /**
     * 文件名称
     */
    @ApiModelProperty(value = "文件名称")
    private String fileName;

    /**
     * 大小
     */
    @ApiModelProperty(value = "大小")
    private Long size;

    /**
     * 新的文件名
     */
    @ApiModelProperty(value = "新的文件名")
    private String newFileName;

    /**
     * 文件URL
     */
    @ApiModelProperty(value = "文件URL")
    private String url;

    /**
     * 文件类型
     */
    @ApiModelProperty(value = "文件类型")
    private String fileType;

    public String getOriginalFileName() {
        return originalFileName;
    }

    public void setOriginalFileName(String originalFileName) {
        this.originalFileName = originalFileName;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Long getSize() {
        return size;
    }

    public void setSize(Long size) {
        this.size = size;
    }

    public String getNewFileName() {
        return newFileName;
    }

    public void setNewFileName(String newFileName) {
        this.newFileName = newFileName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }
}
