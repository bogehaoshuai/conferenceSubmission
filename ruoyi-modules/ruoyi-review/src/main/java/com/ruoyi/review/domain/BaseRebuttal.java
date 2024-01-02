package com.ruoyi.review.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * rebuttal对象 base_rebuttal
 * 
 * @author null
 * @date 2023-11-19
 */
public class BaseRebuttal extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** rebuttal_id */
    private Long rebuttalId;

    /** 文章id */
    @Excel(name = "文章id")
    private Long articleId;

    /** 文章名 */
    @Excel(name = "文章名")
    private String articleName;

    /** 录用码 */
    @Excel(name = "录用码")
    private Long acceptCode;

    /** 录用标签 */
    @Excel(name = "录用标签")
    private String acceptLabel;

    /** rebuttal消息 */
    @Excel(name = "rebuttal消息")
    private String rebuttalMessage;

    public void setRebuttalId(Long rebuttalId) 
    {
        this.rebuttalId = rebuttalId;
    }

    public Long getRebuttalId() 
    {
        return rebuttalId;
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
    public void setAcceptCode(Long acceptCode) 
    {
        this.acceptCode = acceptCode;
    }

    public Long getAcceptCode() 
    {
        return acceptCode;
    }
    public void setAcceptLabel(String acceptLabel) 
    {
        this.acceptLabel = acceptLabel;
    }

    public String getAcceptLabel() 
    {
        return acceptLabel;
    }
    public void setRebuttalMessage(String rebuttalMessage) 
    {
        this.rebuttalMessage = rebuttalMessage;
    }

    public String getRebuttalMessage() 
    {
        return rebuttalMessage;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("rebuttalId", getRebuttalId())
            .append("articleId", getArticleId())
            .append("articleName", getArticleName())
            .append("acceptCode", getAcceptCode())
            .append("acceptLabel", getAcceptLabel())
            .append("rebuttalMessage", getRebuttalMessage())
            .toString();
    }
}
