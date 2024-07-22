package com.ruoyi.biz.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.vg.VG;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

/**
 * 上传文件信息
 *
 * @author: ck
 * @time: 2023/11/01 16:01
 * @description:
 */
@ApiModel(value = "上传文件信息" )
@Data
public class FileInfoVo implements Serializable {

    private static final long serialVersionUID = 1L;


    /**
     * 主键id
     */
    @ApiModelProperty(value = "主键id")
    private Long id;

    /**
     * 客户ID
     */
    @ApiModelProperty(value = "客户ID")
    @NotNull(groups = {VG.Add.class}, message = "客户ID不能为空")
    private Long customId;

    /**
     * 文件名称
     */
    @ApiModelProperty(value = "文件名称")
    @NotNull(groups = {VG.Add.class}, message = "文件名称不能为空")
    private String fileName;

    /**
     * 文件类型
     */
    @ApiModelProperty(value = "文件类型")
    @NotNull(groups = {VG.Add.class}, message = "文件类型不能为空")
    private String fileType;

    /**
     * 文件大小(byte)
     */
    @ApiModelProperty(value = "文件大小(byte)")
    private Long fileSize;

    /**
     * 文件服务器存储绝对路径
     */
    @ApiModelProperty(value = "文件服务器存储绝对路径")
    @NotNull(groups = {VG.Add.class}, message = "文件地址不能为空")
    private String filePath;

    /**
     * 文件地址
     */
    @ApiModelProperty(value = "文件地址")
    private String url;

    /**
     * 创建者
     */
    @ApiModelProperty(value = "创建者")
    private String createBy;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

}