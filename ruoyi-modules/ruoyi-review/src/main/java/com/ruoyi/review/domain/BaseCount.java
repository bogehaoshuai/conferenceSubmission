package com.ruoyi.review.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 审稿数量对象 base_count
 * 
 * @author null
 * @date 2023-11-19
 */
public class BaseCount extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 计数id */
    private Long countId;

    /** 审稿人id */
    @Excel(name = "审稿人id")
    private Long pcId;

    /** 审稿人名 */
    @Excel(name = "审稿人名")
    private String pcName;

    /** 会议id */
    @Excel(name = "会议id")
    private Long conferenceId;

    /** 会议名 */
    @Excel(name = "会议名")
    private String conferenceName;

    /** 待审数量 */
    @Excel(name = "待审数量")
    private Long count;

    public void setCountId(Long countId) 
    {
        this.countId = countId;
    }

    public Long getCountId() 
    {
        return countId;
    }
    public void setPcId(Long pcId) 
    {
        this.pcId = pcId;
    }

    public Long getPcId() 
    {
        return pcId;
    }
    public void setPcName(String pcName) 
    {
        this.pcName = pcName;
    }

    public String getPcName() 
    {
        return pcName;
    }
    public void setConferenceId(Long conferenceId) 
    {
        this.conferenceId = conferenceId;
    }

    public Long getConferenceId() 
    {
        return conferenceId;
    }
    public void setConferenceName(String conferenceName) 
    {
        this.conferenceName = conferenceName;
    }

    public String getConferenceName() 
    {
        return conferenceName;
    }
    public void setCount(Long count) 
    {
        this.count = count;
    }

    public Long getCount() 
    {
        return count;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("countId", getCountId())
            .append("pcId", getPcId())
            .append("pcName", getPcName())
            .append("conferenceId", getConferenceId())
            .append("conferenceName", getConferenceName())
            .append("count", getCount())
            .toString();
    }
}
