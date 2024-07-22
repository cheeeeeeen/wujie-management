package com.ruoyi.wujie.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 盖章中心对象 stamp_info
 *
 * @author myh
 * @date 2023-12-26
 */
public class StampInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long stampId;

    /** 创建者 */
    @Excel(name = "创建者")
    private String creator;

    /** 审批状态,0待盖章，1已盖章 */
    @Excel(name = "审批状态,0待盖章，1已盖章")
    private String state;

    /** 删除标记 */
    @Excel(name = "删除标记")
    private String del;

    /** 通知创建者的通知id */
    @Excel(name = "通知创建者的通知id")
    private Long noticeCreaterId;

    /** 通知盖章者的通知id */
    @Excel(name = "通知盖章者的通知id")
    private Long noticeSealedById;

    public void setStampId(Long stampId)
    {
        this.stampId = stampId;
    }

    public Long getStampId()
    {
        return stampId;
    }
    public void setCreator(String creator)
    {
        this.creator = creator;
    }

    public String getCreator()
    {
        return creator;
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
    public void setNoticeCreaterId(Long noticeCreaterId)
    {
        this.noticeCreaterId = noticeCreaterId;
    }

    public Long getNoticeCreaterId()
    {
        return noticeCreaterId;
    }
    public void setNoticeSealedById(Long noticeSealedById)
    {
        this.noticeSealedById = noticeSealedById;
    }

    public Long getNoticeSealedById()
    {
        return noticeSealedById;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("stampId", getStampId())
                .append("creator", getCreator())
                .append("state", getState())
                .append("createTime", getCreateTime())
                .append("del", getDel())
                .append("updateTime", getUpdateTime())
                .append("noticeCreaterId", getNoticeCreaterId())
                .append("noticeSealedById", getNoticeSealedById())
                .append("remark", getRemark())
                .toString();
    }
}
