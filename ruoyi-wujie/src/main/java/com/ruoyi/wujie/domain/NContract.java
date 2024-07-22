package com.ruoyi.wujie.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 合同信息对象 n_contract
 * 
 * @author ruoyi
 * @date 2023-11-12
 */
public class NContract extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 客户ID */
    @Excel(name = "客户ID")
    private Long customerId;

    /** 合同状态，0待审核，1审核通过 */
    @Excel(name = "合同状态，0待审核，1审核通过")
    private String state;

    /** 删除标记，1已删除 */
    @Excel(name = "删除标记，1已删除")
    private String del;

    private NCustomer nCustomer;

    public NCustomer getNCustomer() {
        return nCustomer;
    }

    public void setNCustomer(NCustomer nCustomer) {
        this.nCustomer = nCustomer;
    }

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setCustomerId(Long customerId) 
    {
        this.customerId = customerId;
    }

    public Long getCustomerId() 
    {
        return customerId;
    }
    public void setState(String state) 
    {
        this.state = state;
    }

    public String getState() 
    {
        return state;
    }
    public void setDel(String del) 
    {
        this.del = del;
    }

    public String getDel() 
    {
        return del;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("customerId", getCustomerId())
            .append("state", getState())
            .append("del", getDel())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
                .append("nCustomer", getNCustomer())
            .toString();
    }
}
