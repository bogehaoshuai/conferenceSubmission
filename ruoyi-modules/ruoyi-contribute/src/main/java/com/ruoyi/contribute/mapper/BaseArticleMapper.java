package com.ruoyi.contribute.mapper;

import com.ruoyi.contribute.domain.BaseArticle;

import java.util.List;

/**
 * 文章管理Mapper接口
 * 
 * @author null
 * @date 2023-11-07
 */
public interface BaseArticleMapper 
{
    /**
     * 查询文章管理
     * 
     * @param articleId 文章管理主键
     * @return 文章管理
     */
    public BaseArticle selectBaseArticleByArticleId(Long articleId);

    /**
     * 查询文章管理列表
     * 
     * @param baseArticle 文章管理
     * @return 文章管理集合
     */
    public List<BaseArticle> selectBaseArticleList(BaseArticle baseArticle);

    /**
     * 新增文章管理
     * 
     * @param baseArticle 文章管理
     * @return 结果
     */
    public int insertBaseArticle(BaseArticle baseArticle);

    /**
     * 修改文章管理
     * 
     * @param baseArticle 文章管理
     * @return 结果
     */
    public int updateBaseArticle(BaseArticle baseArticle);

    /**
     * 删除文章管理
     * 
     * @param articleId 文章管理主键
     * @return 结果
     */
    public int deleteBaseArticleByArticleId(Long articleId);

    /**
     * 批量删除文章管理
     * 
     * @param articleIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBaseArticleByArticleIds(Long[] articleIds);
}
