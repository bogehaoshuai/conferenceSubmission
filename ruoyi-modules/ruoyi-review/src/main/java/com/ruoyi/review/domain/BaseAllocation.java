package com.ruoyi.review.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 稿件分配对象 base_allocation
 * 
 * @author null
 * @date 2023-11-19
 */
public class BaseAllocation extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 分配id */
    private Long allocationId;

    /** 审稿人id */
    @Excel(name = "审稿人id")
    private Long pcId;

    /** 审稿人名 */
    @Excel(name = "审稿人名")
    private String pcName;

    /** 论文id */
    @Excel(name = "论文id")
    private Long articleId;

    /** 论文名 */
    @Excel(name = "论文名")
    private String articleName;

    /** 审稿状态码 */
    @Excel(name = "审稿状态码")
    private Long reviewStatusCode;

    /** 审稿状态 */
    @Excel(name = "审稿状态")
    private String reviewStatusName;

    /** 稿件评语 */
    @Excel(name = "稿件评语")
    private String comment;

    /** confidence_code */
    @Excel(name = "confidence_code")
    private Long confidenceCode;

    /** confidence名 */
    @Excel(name = "confidence名")
    private String confidenceName;

    /** 稿件评分码 */
    @Excel(name = "稿件评分码")
    private Long scoreCode;

    /** 稿件评分 */
    @Excel(name = "稿件评分")
    private String scoreName;

    public void setAllocationId(Long allocationId) 
    {
        this.allocationId = allocationId;
    }

    public Long getAllocationId() 
    {
        return allocationId;
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
    public void setReviewStatusCode(Long reviewStatusCode) 
    {
        this.reviewStatusCode = reviewStatusCode;
    }

    public Long getReviewStatusCode() 
    {
        return reviewStatusCode;
    }
    public void setReviewStatusName(String reviewStatusName) 
    {
        this.reviewStatusName = reviewStatusName;
    }

    public String getReviewStatusName() 
    {
        return reviewStatusName;
    }
    public void setComment(String comment) 
    {
        this.comment = comment;
    }

    public String getComment() 
    {
        return comment;
    }
    public void setConfidenceCode(Long confidenceCode) 
    {
        this.confidenceCode = confidenceCode;
    }

    public Long getConfidenceCode() 
    {
        return confidenceCode;
    }
    public void setConfidenceName(String confidenceName) 
    {
        this.confidenceName = confidenceName;
    }

    public String getConfidenceName() 
    {
        return confidenceName;
    }
    public void setScoreCode(Long scoreCode) 
    {
        this.scoreCode = scoreCode;
    }

    public Long getScoreCode() 
    {
        return scoreCode;
    }
    public void setScoreName(String scoreName) 
    {
        this.scoreName = scoreName;
    }

    public String getScoreName() 
    {
        return scoreName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("allocationId", getAllocationId())
            .append("pcId", getPcId())
            .append("pcName", getPcName())
            .append("articleId", getArticleId())
            .append("articleName", getArticleName())
            .append("reviewStatusCode", getReviewStatusCode())
            .append("reviewStatusName", getReviewStatusName())
            .append("comment", getComment())
            .append("confidenceCode", getConfidenceCode())
            .append("confidenceName", getConfidenceName())
            .append("scoreCode", getScoreCode())
            .append("scoreName", getScoreName())
            .toString();
    }
}
