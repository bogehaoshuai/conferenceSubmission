package com.ruoyi.base.api.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 会议管理对象 base_conference
 * 
 * @author null
 * @date 2023-11-07
 */
public class BaseConference extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 会议id */
    private Long conferenceId;

    /** 会议全称 */
    @Excel(name = "会议全称")
    private String conferenceName;

    /** 会议简称 */
    @Excel(name = "会议简称")
    private String conferenceNickname;

    /** 举办时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "举办时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date holdDate;

    /** 举办地点 */
    @Excel(name = "举办地点")
    private String place;

    /** 截止日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "截止日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date deadlineDate;

    /** 结果日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结果日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date resultDate;

    /** 会议主席 */
    private Long chairId;

    /** 主席名 */
    private String chairName;

    /** 会议状态码 */
    private Integer conferenceStatusCode;

    /** 会议状态 */
    @Excel(name = "会议状态")
    private String conferenceStatusName;

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
    public void setConferenceNickname(String conferenceNickname) 
    {
        this.conferenceNickname = conferenceNickname;
    }

    public String getConferenceNickname() 
    {
        return conferenceNickname;
    }
    public void setHoldDate(Date holdDate) 
    {
        this.holdDate = holdDate;
    }

    public Date getHoldDate() 
    {
        return holdDate;
    }
    public void setPlace(String place) 
    {
        this.place = place;
    }

    public String getPlace() 
    {
        return place;
    }
    public void setDeadlineDate(Date deadlineDate) 
    {
        this.deadlineDate = deadlineDate;
    }

    public Date getDeadlineDate() 
    {
        return deadlineDate;
    }
    public void setResultDate(Date resultDate) 
    {
        this.resultDate = resultDate;
    }

    public Date getResultDate() 
    {
        return resultDate;
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
    public void setConferenceStatusCode(Integer conferenceStatusCode) 
    {
        this.conferenceStatusCode = conferenceStatusCode;
    }

    public Integer getConferenceStatusCode() 
    {
        return conferenceStatusCode;
    }
    public void setConferenceStatusName(String conferenceStatusName) 
    {
        this.conferenceStatusName = conferenceStatusName;
    }

    public String getConferenceStatusName() 
    {
        return conferenceStatusName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("conferenceId", getConferenceId())
            .append("conferenceName", getConferenceName())
            .append("conferenceNickname", getConferenceNickname())
            .append("holdDate", getHoldDate())
            .append("place", getPlace())
            .append("deadlineDate", getDeadlineDate())
            .append("resultDate", getResultDate())
            .append("chairId", getChairId())
            .append("chairName", getChairName())
            .append("conferenceStatusCode", getConferenceStatusCode())
            .append("conferenceStatusName", getConferenceStatusName())
            .toString();
    }
}
