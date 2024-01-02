package com.ruoyi.review.dto;

import com.ruoyi.review.domain.BaseAllocation;

public class AllocationDto extends BaseAllocation {

    private String articleAbstract;

    private String articlePath;

    private String rebuttalMessage;

    public void setArticleAbstract(String articleAbstract)
    {
        this.articleAbstract = articleAbstract;
    }

    public String getArticleAbstract()
    {
        return this.articleAbstract;
    }

    public void setArticlePath(String articlePath)
    {
        this.articlePath = articlePath;
    }

    public String getArticlePath()
    {
        return this.articlePath;
    }

    public void setRebuttalMessage(String rebuttalMessage){
        this.rebuttalMessage = rebuttalMessage;
    }

    public String getRebuttalMessage(){
        return this.rebuttalMessage;
    }

}
