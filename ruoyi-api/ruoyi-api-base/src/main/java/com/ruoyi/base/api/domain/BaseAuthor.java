package com.ruoyi.base.api.domain;

import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 作者信息对象 base_author
 * 
 * @author null
 * @date 2023-11-18
 */
public class BaseAuthor extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 作者id */
    private Long authorId;

    /** 作者姓名 */
    @Excel(name = "作者姓名")
    private String authorName;

    /** 作者单位 */
    @Excel(name = "作者单位")
    private String authorAffiliation;

    /** 国家/地区 */
    @Excel(name = "国家/地区")
    private String authorPlace;

    /** 作者邮箱 */
    @Excel(name = "作者邮箱")
    private String authorEmail;

    /** 文章id */
    @Excel(name = "文章id")
    private Long articleId;

    /** 文章名 */
    @Excel(name = "文章名")
    private String articleName;

    /** 顺序 */
    @Excel(name = "顺序")
    private Integer orderNum;

    public void setAuthorId(Long authorId) 
    {
        this.authorId = authorId;
    }

    public Long getAuthorId() 
    {
        return authorId;
    }
    public void setAuthorName(String authorName) 
    {
        this.authorName = authorName;
    }

    public String getAuthorName() 
    {
        return authorName;
    }
    public void setAuthorAffiliation(String authorAffiliation) 
    {
        this.authorAffiliation = authorAffiliation;
    }

    public String getAuthorAffiliation() 
    {
        return authorAffiliation;
    }
    public void setAuthorPlace(String authorPlace) 
    {
        this.authorPlace = authorPlace;
    }

    public String getAuthorPlace() 
    {
        return authorPlace;
    }
    public void setAuthorEmail(String authorEmail) 
    {
        this.authorEmail = authorEmail;
    }

    public String getAuthorEmail() 
    {
        return authorEmail;
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
    public void setOrderNum(Integer orderNum) 
    {
        this.orderNum = orderNum;
    }

    public Integer getOrderNum() 
    {
        return orderNum;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("authorId", getAuthorId())
            .append("authorName", getAuthorName())
            .append("authorAffiliation", getAuthorAffiliation())
            .append("authorPlace", getAuthorPlace())
            .append("authorEmail", getAuthorEmail())
            .append("articleId", getArticleId())
            .append("articleName", getArticleName())
            .append("orderNum", getOrderNum())
            .toString();
    }
}
