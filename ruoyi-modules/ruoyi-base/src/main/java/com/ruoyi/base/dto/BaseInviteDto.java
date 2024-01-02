package com.ruoyi.base.dto;

import com.ruoyi.base.domain.BaseInvite;

import java.util.List;

public class BaseInviteDto extends BaseInvite {

    private List<Long> pcMemberIds;
    private List<Long> topicCodeList;
    public void setPcMemberIds(List<Long> pcMemberIds)
    {
        this.pcMemberIds = pcMemberIds;
    }

    public List<Long> getPcMemberIds()
    {
        return pcMemberIds;
    }

    public List<Long> getTopicCodeList() {
        return topicCodeList;
    }

    public void setTopicCodeList(List<Long> topicCodeList) {
        this.topicCodeList = topicCodeList;
    }
}
