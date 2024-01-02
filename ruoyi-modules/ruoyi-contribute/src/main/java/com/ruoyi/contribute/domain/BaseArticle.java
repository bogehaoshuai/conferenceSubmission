package com.ruoyi.contribute.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 文章管理对象 base_article
 *
 * @author null
 * @date 2023-11-21
 */
public class BaseArticle extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 文章id */
    private Long articleId;

    /** 文章名 */
    @Excel(name = "文章名")
    private String articleName;

    /** 文章摘要 */
    @Excel(name = "文章摘要")
    private String articleAbstract;

    /** 文章 */
    @Excel(name = "文章")
    private String article;

    /** 会议id */
    @Excel(name = "会议id")
    private Long conferenceId;

    /** 会议名 */
    @Excel(name = "会议名")
    private String conferenceName;

    /** 文章状态码 */
    @Excel(name = "文章状态码")
    private Long articleStatusCode;

    /** 文章状态 */
    @Excel(name = "文章状态")
    private String articleStatusName;

    /** 创建用户id */
    @Excel(name = "创建用户id")
    private Long creatorId;

    /** 创建用户名 */
    @Excel(name = "创建用户名")
    private String creatorName;

    /** 文章主题代码（逗号分隔） */
    @Excel(name = "文章主题代码", readConverterExp = "逗=号分隔")
    private String topicCode;

    /** 文章主题标签（逗号分隔） */
    @Excel(name = "文章主题标签", readConverterExp = "逗=号分隔")
    private String topicLabel;

    /** 文章主题值（逗号分隔） */
    @Excel(name = "文章主题值", readConverterExp = "逗=号分隔")
    private String topicValue;

    public void setArticleId(Long articleId)
    {
        this.articleId = articleId;
    }

    public Long getArticleId()
    {
        return articleId;
    }
    public void setArticleName(String articleName)
    {
        this.articleName = articleName;
    }

    public String getArticleName()
    {
        return articleName;
    }
    public void setArticleAbstract(String articleAbstract)
    {
        this.articleAbstract = articleAbstract;
    }

    public String getArticleAbstract()
    {
        return articleAbstract;
    }
    public void setArticle(String article)
    {
        this.article = article;
    }

    public String getArticle()
    {
        return article;
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
    public void setArticleStatusCode(Long articleStatusCode)
    {
        this.articleStatusCode = articleStatusCode;
    }

    public Long getArticleStatusCode()
    {
        return articleStatusCode;
    }
    public void setArticleStatusName(String articleStatusName)
    {
        this.articleStatusName = articleStatusName;
    }

    public String getArticleStatusName()
    {
        return articleStatusName;
    }
    public void setCreatorId(Long creatorId)
    {
        this.creatorId = creatorId;
    }

    public Long getCreatorId()
    {
        return creatorId;
    }
    public void setCreatorName(String creatorName)
    {
        this.creatorName = creatorName;
    }

    public String getCreatorName()
    {
        return creatorName;
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
                .append("articleId", getArticleId())
                .append("articleName", getArticleName())
                .append("articleAbstract", getArticleAbstract())
                .append("article", getArticle())
                .append("conferenceId", getConferenceId())
                .append("conferenceName", getConferenceName())
                .append("articleStatusCode", getArticleStatusCode())
                .append("articleStatusName", getArticleStatusName())
                .append("creatorId", getCreatorId())
                .append("creatorName", getCreatorName())
                .append("topicCode", getTopicCode())
                .append("topicLabel", getTopicLabel())
                .append("topicValue", getTopicValue())
                .toString();
    }
}
