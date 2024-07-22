package com.ruoyi.wujie.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 案件信息对象 n_case
 * 
 * @author ruoyi
 * @date 2023-12-05
 */
public class NCase extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 案件id */
    private Long caseId;

    /** 关联的客户ID */
    @Excel(name = "关联的客户ID")
    private Long customerId;

    /** 委托人名称（关联客户） */
    @Excel(name = "委托人名称", readConverterExp = "关=联客户")
    private String clientName;

    /** 委托人身份证/统一社会信用号码 */
    @Excel(name = "委托人身份证/统一社会信用号码")
    private String clientId;

    /** 案件类别，0其他 1刑事 2民事 3行政 4非诉 5仲裁 6法律顾问 */
    @Excel(name = "案件类别，0其他 1刑事 2民事 3行政 4非诉 5仲裁 6法律顾问")
    private String type;

    /** 地位，0被告/被申请人 1原告 2被害人 3第三人 4申请人 */
    @Excel(name = "地位，0被告/被申请人 1原告 2被害人 3第三人 4申请人")
    private String role;

    /** 案件阶段 0未开始 1侦察 2审查起诉 3一审 4二审 5再审 6死刑复核 7行政复议 */
    @Excel(name = "案件阶段 0未开始 1侦察 2审查起诉 3一审 4二审 5再审 6死刑复核 7行政复议")
    private String stage;

    /** 案号 */
    @Excel(name = "案号")
    private String caseNumber;

    /** 案件性质/业务性质 */
    @Excel(name = "案件性质/业务性质")
    private String caseCore;

    /** 收费 */
    @Excel(name = "收费")
    private String reward;

    /** 办案机关 */
    @Excel(name = "办案机关")
    private String caseOffice;

    /** 删除标记，1已删除 */
    @Excel(name = "删除标记，1已删除")
    private String del;

    /** 顾问期限开始 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "顾问期限开始", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startTime;

    /** 顾问期限结束 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "顾问期限结束", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endTime;

    /** 罪名 */
    @Excel(name = "罪名")
    private String crimeName;

    /** 被告人 */
    @Excel(name = "被告人")
    private String defendant;

    @JsonProperty("nCustomer")
    private NCustomer nCustomer;

    public NCustomer getNCustomer() {
        return nCustomer;
    }

    public void setNCustomer(NCustomer nCustomer) {
        this.nCustomer = nCustomer;
    }

    public void setCaseId(Long caseId) 
    {
        this.caseId = caseId;
    }

    public Long getCaseId() 
    {
        return caseId;
    }
    public void setCustomerId(Long customerId) 
    {
        this.customerId = customerId;
    }

    public Long getCustomerId() 
    {
        return customerId;
    }
    public void setClientName(String clientName) 
    {
        this.clientName = clientName;
    }

    public String getClientName() 
    {
        return clientName;
    }
    public void setClientId(String clientId) 
    {
        this.clientId = clientId;
    }

    public String getClientId() 
    {
        return clientId;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setRole(String role) 
    {
        this.role = role;
    }

    public String getRole() 
    {
        return role;
    }
    public void setStage(String stage) 
    {
        this.stage = stage;
    }

    public String getStage() 
    {
        return stage;
    }
    public void setCaseNumber(String caseNumber) 
    {
        this.caseNumber = caseNumber;
    }

    public String getCaseNumber() 
    {
        return caseNumber;
    }
    public void setCaseCore(String caseCore) 
    {
        this.caseCore = caseCore;
    }

    public String getCaseCore() 
    {
        return caseCore;
    }
    public void setReward(String reward) 
    {
        this.reward = reward;
    }

    public String getReward() 
    {
        return reward;
    }
    public void setCaseOffice(String caseOffice) 
    {
        this.caseOffice = caseOffice;
    }

    public String getCaseOffice() 
    {
        return caseOffice;
    }
    public void setDel(String del) 
    {
        this.del = del;
    }

    public String getDel() 
    {
        return del;
    }
    public void setStartTime(Date startTime) 
    {
        this.startTime = startTime;
    }

    public Date getStartTime() 
    {
        return startTime;
    }
    public void setEndTime(Date endTime) 
    {
        this.endTime = endTime;
    }

    public Date getEndTime() 
    {
        return endTime;
    }
    public void setCrimeName(String crimeName) 
    {
        this.crimeName = crimeName;
    }

    public String getCrimeName() 
    {
        return crimeName;
    }
    public void setDefendant(String defendant) 
    {
        this.defendant = defendant;
    }

    public String getDefendant() 
    {
        return defendant;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("caseId", getCaseId())
            .append("customerId", getCustomerId())
            .append("clientName", getClientName())
            .append("clientId", getClientId())
            .append("type", getType())
            .append("role", getRole())
            .append("stage", getStage())
            .append("caseNumber", getCaseNumber())
            .append("caseCore", getCaseCore())
            .append("reward", getReward())
            .append("caseOffice", getCaseOffice())
            .append("del", getDel())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("crimeName", getCrimeName())
            .append("defendant", getDefendant())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
                .append("nCustomer", getNCustomer())
            .toString();
    }
}
