package com.ruoyi.biz.domain.dto;

import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.vg.VG;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * 上传文件信息
 *
 * @author: ck
 * @time: 2023/11/01 16:01
 * @description:
 */
@ApiModel(value = "上传文件信息" )
@Data
public class FileInfoDto extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

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
    private String fileName;

    /**
     * 文件类型
     */
    @ApiModelProperty(value = "文件类型")
    private String fileType;

}