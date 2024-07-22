package com.ruoyi.wujie.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 客户信息对象 n_customer
 * 
 * @author zdx
 * @date 2023-11-05
 */
public class NCustomer extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 客户姓名 */
    @Excel(name = "客户姓名")
    private String name;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String contractPhone;

    /** 联系地址 */
    @Excel(name = "联系地址")
    private String contractAddress;

    /** 客户类别，0联系人，1案源人，2服务成员 */
    @Excel(name = "客户类别，0联系人，1案源人，2服务成员")
    private String type;

    /** 银行信息 */
    @Excel(name = "银行信息")
    private String bankUsername;

    /** 开户行 */
    @Excel(name = "开户行")
    private String bankName;

    /** 银行账号 */
    @Excel(name = "银行账号")
    private String bankAccount;

    /** 名称/单位名称 */
    @Excel(name = "名称/单位名称")
    private String taxName;

    /** 纳税人识别号 */
    @Excel(name = "纳税人识别号")
    private String taxNumber;

    /** 单位电话 */
    @Excel(name = "单位电话")
    private String officePhone;

    /** 单位地址 */
    @Excel(name = "单位地址")
    private String officeAddress;

    private String idCardNum;
    // 身份证号

    private String contractPerson;

    /** 删除标记，1已删除 */
    private String del;

    public void setIdCardNum(String num) {this.idCardNum = num;}

    public String getIdCardNum() {return idCardNum;}

    public void setContractPerson(String contractPerson) { this.contractPerson = contractPerson;}

    public String getContractPerson() {
        return contractPerson;
    }
    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setContractPhone(String contractPhone) 
    {
        this.contractPhone = contractPhone;
    }

    public String getContractPhone() 
    {
        return contractPhone;
    }
    public void setContractAddress(String contractAddress) 
    {
        this.contractAddress = contractAddress;
    }

    public String getContractAddress() 
    {
        return contractAddress;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setBankUsername(String bankUsername) 
    {
        this.bankUsername = bankUsername;
    }

    public String getBankUsername() 
    {
        return bankUsername;
    }
    public void setBankName(String bankName) 
    {
        this.bankName = bankName;
    }

    public String getBankName() 
    {
        return bankName;
    }
    public void setBankAccount(String bankAccount) 
    {
        this.bankAccount = bankAccount;
    }

    public String getBankAccount() 
    {
        return bankAccount;
    }
    public void setTaxName(String taxName) 
    {
        this.taxName = taxName;
    }

    public String getTaxName() 
    {
        return taxName;
    }
    public void setTaxNumber(String taxNumber) 
    {
        this.taxNumber = taxNumber;
    }

    public String getTaxNumber() 
    {
        return taxNumber;
    }
    public void setOfficePhone(String officePhone) 
    {
        this.officePhone = officePhone;
    }

    public String getOfficePhone() 
    {
        return officePhone;
    }
    public void setOfficeAddress(String officeAddress) 
    {
        this.officeAddress = officeAddress;
    }

    public String getOfficeAddress() 
    {
        return officeAddress;
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
            .append("name", getName())
            .append("contractPhone", getContractPhone())
            .append("contractAddress", getContractAddress())
            .append("type", getType())
            .append("bankUsername", getBankUsername())
            .append("bankName", getBankName())
            .append("bankAccount", getBankAccount())
            .append("taxName", getTaxName())
            .append("taxNumber", getTaxNumber())
            .append("officePhone", getOfficePhone())
            .append("officeAddress", getOfficeAddress())
            .append("del", getDel())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
                .append("idCardNum", getIdCardNum())
                .append("contractPerson", getContractPerson())
            .toString();
    }
}
