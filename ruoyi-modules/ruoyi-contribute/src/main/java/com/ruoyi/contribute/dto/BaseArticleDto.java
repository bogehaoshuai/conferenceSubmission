package com.ruoyi.contribute.dto;

import com.ruoyi.contribute.domain.BaseArticle;

import java.util.List;

public class BaseArticleDto extends BaseArticle {
    private List<Long> topicCodeList;

    public List<Long> getTopicCodeList() {
        return topicCodeList;
    }

    public void setTopicCodeList(List<Long> topicCodeList) {
        this.topicCodeList = topicCodeList;
    }
}
