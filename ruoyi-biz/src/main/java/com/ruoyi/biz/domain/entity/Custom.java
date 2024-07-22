package com.ruoyi.biz.domain.entity;

import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.vg.VG;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * 客户信息
 *
 * @author: ck
 * @time: 2023/11/01 17:09
 * @description:
 */
@ApiModel(value = "客户信息" )
@Data
public class Custom extends BaseEntity implements Serializable {
    /**
     * 主键id
     */
    @ApiModelProperty(value = "主键id")
    @NotNull(groups = {VG.Update.class}, message = "ID不能为空")
    private Long id;

    /**
     * 客户姓名
     */
    @ApiModelProperty(value = "客户姓名")
    @Length(groups = { VG.Add.class, VG.Update.class }, max = 255, message = "客户姓名长度不能超过255")
    @NotBlank(groups = { VG.Add.class, VG.Update.class }, message = "客户姓名不能为空")
    private String name;

    /**
     * 电话
     */
    @ApiModelProperty(value = "电话")
    @Length(groups = { VG.Add.class, VG.Update.class }, max = 255, message = "客户电话长度不能超过255")
    @NotBlank(groups = { VG.Add.class, VG.Update.class }, message = "客户电话长度不能为空")
    private String phone;

    /**
     * 地址
     */
    @ApiModelProperty(value = "地址")
    private String address;

    /**
     * 创建者
     */
    @ApiModelProperty(value = "创建者")
    private String createBy;

    /**
     * 更新者
     */
    @ApiModelProperty(value = "更新者")
    private String updateBy;

    /**
     * 是否刪除 1刪除
     */
    @ApiModelProperty(value = "刪除标记")
    private String del;

    private static final long serialVersionUID = 1L;
}