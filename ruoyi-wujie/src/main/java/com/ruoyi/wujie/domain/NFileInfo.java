package com.ruoyi.wujie.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 上传文件信息对象 n_file_info
 *
 * @author ruoyi
 * @date 2023-11-06
 */
public class NFileInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long fileId;

    /** 文件关联内容类型，1客户，2合同，3财务，4案件，5知识 */
    @Excel(name = "文件关联内容类型，1客户，2合同，3财务，4案件，5知识,6盖章")
    private String useType;

    /** 客户ID */
    @Excel(name = "客户ID")
    private Long customerId;

    /** 合同ID */
    @Excel(name = "合同ID")
    private Long contractId;

    /** 财务ID */
    @Excel(name = "财务ID")
    private Long financeId;

    private Long stampId;
    // 盖章申请id

    private String stampType;
    // 盖章状态

    /** 案件ID */
    @Excel(name = "案件ID")
    private Long caseId;

    /** 知识ID */
    @Excel(name = "知识ID")
    private Long knowledgeId;

    /** 文件名称 */
    @Excel(name = "文件名称")
    private String fileName;

    /** 文件类型 */
    @Excel(name = "文件类型")
    private String fileType;

    /** 文件大小(byte) */
    @Excel(name = "文件大小(byte)")
    private Long fileSize;

    /** 文件服务器存储绝对路径 */
    @Excel(name = "文件服务器存储绝对路径")
    private String filePath;

    /** 删除标记，1已删除 */
    @Excel(name = "删除标记，1已删除")
    private String del;

    private String createBy;
    public void setFileId(Long id)
    {
        this.fileId = id;
    }

    public Long getFileId()
    {
        return fileId;
    }
    public void setUseType(String useType)
    {
        this.useType = useType;
    }

    public String getUseType()
    {
        return useType;
    }
    public void setCustomerId(Long customerId)
    {
        this.customerId = customerId;
    }

    public Long getCustomerId()
    {
        return customerId;
    }
    public void setContractId(Long contractId)
    {
        this.contractId = contractId;
    }

    public Long getContractId()
    {
        return contractId;
    }
    public void setFinanceId(Long financeId)
    {
        this.financeId = financeId;
    }

    public Long getFinanceId()
    {
        return financeId;
    }
    public void setCaseId(Long caseId)
    {
        this.caseId = caseId;
    }

    public Long getCaseId()
    {
        return caseId;
    }
    public void setKnowledgeId(Long knowledgeId)
    {
        this.knowledgeId = knowledgeId;
    }

    public Long getKnowledgeId()
    {
        return knowledgeId;
    }
    public void setFileName(String fileName)
    {
        this.fileName = fileName;
    }

    public String getFileName()
    {
        return fileName;
    }
    public void setFileType(String fileType)
    {
        this.fileType = fileType;
    }

    public String getFileType()
    {
        return fileType;
    }
    public void setFileSize(Long fileSize)
    {
        this.fileSize = fileSize;
    }

    public Long getFileSize()
    {
        return fileSize;
    }
    public void setFilePath(String filePath)
    {
        this.filePath = filePath;
    }

    public String getFilePath()
    {
        return filePath;
    }
    public void setDel(String del)
    {
        this.del = del;
    }

    public String getDel()
    {
        return del;
    }

    public void setStampId(Long stampId) {
        this.stampId = stampId;
    }

    public Long getStampId() {
        return stampId;
    }

    public void setStampType(String stampType) {
        this.stampType = stampType;
    }

    public String getStampType() {
        return stampType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("fileId", getFileId())
                .append("useType", getUseType())
                .append("customerId", getCustomerId())
                .append("contractId", getContractId())
                .append("financeId", getFinanceId())
                .append("caseId", getCaseId())
                .append("knowledgeId", getKnowledgeId())
                .append("fileName", getFileName())
                .append("fileType", getFileType())
                .append("fileSize", getFileSize())
                .append("filePath", getFilePath())
                .append("del", getDel())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("stampId", getStampId())
                .append("stampType",getStampType())
                .toString();
    }
}