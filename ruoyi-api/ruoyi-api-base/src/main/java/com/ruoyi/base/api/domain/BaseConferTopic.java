package com.ruoyi.base.api.domain;

import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 会议主题对象 base_confer_topic
 * 
 * @author null
 * @date 2023-11-16
 */
public class BaseConferTopic extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主题编码 */
    private Long topicCode;

    /** 主题标签 */
    @Excel(name = "主题标签")
    private String topicLabel;

    /** 主题键值 */
    @Excel(name = "主题键值")
    private String topicValue;

    /** 会议id */
    @Excel(name = "会议id")
    private Long conferenceId;

    /** 会议名 */
    @Excel(name = "会议名")
    private String conferenceName;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setTopicCode(Long topicCode) 
    {
        this.topicCode = topicCode;
    }

    public Long getTopicCode() 
    {
        return topicCode;
    }
    public void setTopicLabel(String topicLabel) 
    {
        this.topicLabel = topicLabel;
    }

    public String getTopicLabel() 
    {
        return topicLabel;
    }
    public void setTopicValue(String topicValue) 
    {
        this.topicValue = topicValue;
    }

    public String getTopicValue() 
    {
        return topicValue;
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
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("topicCode", getTopicCode())
            .append("topicLabel", getTopicLabel())
            .append("topicValue", getTopicValue())
            .append("conferenceId", getConferenceId())
            .append("conferenceName", getConferenceName())
            .append("status", getStatus())
            .toString();
    }
}
