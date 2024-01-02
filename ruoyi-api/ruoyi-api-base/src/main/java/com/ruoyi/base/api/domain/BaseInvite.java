package com.ruoyi.base.api.domain;

import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 邀请审稿对象 base_invite
 *
 * @author null
 * @date 2023-11-20
 */
public class BaseInvite extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 邀请id */
    private Long inviteId;

    /** 会议id */
    @Excel(name = "会议id")
    private Long conferenceId;

    /** 会议名 */
    @Excel(name = "会议名")
    private String conferenceName;

    /** 主席id */
    @Excel(name = "主席id")
    private Long chairId;

    /** 主席名 */
    @Excel(name = "主席名")
    private String chairName;

    /** 审稿id */
    @Excel(name = "审稿id")
    private Long pcId;

    /** 审稿名 */
    @Excel(name = "审稿名")
    private String pcName;

    /** 审稿邮箱 */
    @Excel(name = "审稿邮箱")
    private String pcEmail;

    /** 审稿单位 */
    @Excel(name = "审稿单位")
    private String pcAffiliation;

    /** 审稿区域 */
    @Excel(name = "审稿区域")
    private String pcPlace;

    /** 邀请状态码 */
    @Excel(name = "邀请状态码")
    private Long inviteStatusCode;

    /** 邀请状态 */
    @Excel(name = "邀请状态")
    private String inviteStatusName;

    /** 审核主题编码（逗号分隔） */
    @Excel(name = "审核主题编码", readConverterExp = "逗=号分隔")
    private String topicCode;

    /** 审核主题标签（逗号分隔） */
    @Excel(name = "审核主题标签", readConverterExp = "逗=号分隔")
    private String topicLabel;

    /** 审核主题键值（逗号分隔） */
    @Excel(name = "审核主题键值", readConverterExp = "逗=号分隔")
    private String topicValue;

    public void setInviteId(Long inviteId)
    {
        this.inviteId = inviteId;
    }

    public Long getInviteId()
    {
        return inviteId;
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
    public void setChairId(Long chairId)
    {
        this.chairId = chairId;
    }

    public Long getChairId()
    {
        return chairId;
    }
    public void setChairName(String chairName)
    {
        this.chairName = chairName;
    }

    public String getChairName()
    {
        return chairName;
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
    public void setPcEmail(String pcEmail)
    {
        this.pcEmail = pcEmail;
    }

    public String getPcEmail()
    {
        return pcEmail;
    }
    public void setPcAffiliation(String pcAffiliation)
    {
        this.pcAffiliation = pcAffiliation;
    }

    public String getPcAffiliation()
    {
        return pcAffiliation;
    }
    public void setPcPlace(String pcPlace)
    {
        this.pcPlace = pcPlace;
    }

    public String getPcPlace()
    {
        return pcPlace;
    }
    public void setInviteStatusCode(Long inviteStatusCode)
    {
        this.inviteStatusCode = inviteStatusCode;
    }

    public Long getInviteStatusCode()
    {
        return inviteStatusCode;
    }
    public void setInviteStatusName(String inviteStatusName)
    {
        this.inviteStatusName = inviteStatusName;
    }

    public String getInviteStatusName()
    {
        return inviteStatusName;
    }
    public void setTopicCode(String topicCode)
    {
        this.topicCode = topicCode;
    }

    public String getTopicCode()
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("inviteId", getInviteId())
                .append("conferenceId", getConferenceId())
                .append("conferenceName", getConferenceName())
                .append("chairId", getChairId())
                .append("chairName", getChairName())
                .append("pcId", getPcId())
                .append("pcName", getPcName())
                .append("pcEmail", getPcEmail())
                .append("pcAffiliation", getPcAffiliation())
                .append("pcPlace", getPcPlace())
                .append("inviteStatusCode", getInviteStatusCode())
                .append("inviteStatusName", getInviteStatusName())
                .append("topicCode", getTopicCode())
                .append("topicLabel", getTopicLabel())
                .append("topicValue", getTopicValue())
                .toString();
    }
}
