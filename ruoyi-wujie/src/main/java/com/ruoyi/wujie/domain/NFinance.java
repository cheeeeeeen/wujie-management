package com.ruoyi.wujie.domain;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 合同信息对象 n_finance
 * 
 * @author ruoyi
 * @date 2023-11-12
 */
public class NFinance extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 合同ID */
    @Excel(name = "合同ID")
    private Long contractId;

    /** 类别，0付款，1收款 */
    @Excel(name = "类别，0付款，1收款")
    private String type;

    /** 付款/收款方 */
    @Excel(name = "付款/收款方")
    private String paypeople;

    /** 金额 */
    @Excel(name = "金额")
    private Long count;

    /** 财务状态，0未开票，1已开票，2已收/付款 */
    @Excel(name = "财务状态，0未开票，1已开票，2已收/付款")
    private String state;

    /** 删除标记，1已删除 */
    @Excel(name = "删除标记，1已删除")
    private String del;

    // 案件ID
    private Long caseId;

    // 案件
    @JsonProperty("nCase")
    private NCase nCase;

    //发票类型
    private String invoiceType;

    // 备注
    private String remark;

    @JsonProperty("nCustomer")
    private NCustomer nCustomer;
    public NCustomer getNCustomer() {
        return nCustomer;
    }
    public void setNCustomer(NCustomer nCustomer) {
        this.nCustomer = nCustomer;
    }
    public void setCaseId(Long id) {
        this.caseId = id;
    }

    public Long getCaseId() {
        return caseId;
    }

    public void setInvoiceType(String invoiceType) {
        this.invoiceType = invoiceType;
    }

    public String getInvoiceType() {
        return invoiceType;
    }

    public void setNCase(NCase nCase) {
        this.nCase = nCase;
    }

    public NCase getNCase() {
        return nCase;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getRemark() {
        return remark;
    }
    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setContractId(Long contractId) 
    {
        this.contractId = contractId;
    }

    public Long getContractId() 
    {
        return contractId;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setPaypeople(String paypeople) 
    {
        this.paypeople = paypeople;
    }

    public String getPaypeople() 
    {
        return paypeople;
    }
    public void setCount(Long count) 
    {
        this.count = count;
    }

    public Long getCount() 
    {
        return count;
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

    private NContract nContract;

    public NContract getnContract() {
        return nContract;
    }

    public void setnContract(NContract nContract) {
        this.nContract = nContract;
    }



    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("contractId", getContractId())
            .append("type", getType())
            .append("paypeople", getPaypeople())
            .append("count", getCount())
            .append("state", getState())
            .append("del", getDel())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
                .append("caseId", getCaseId())
                .append("remark", getRemark())
                .append("invoiceType", getInvoiceType())
            .toString();
    }
}
