package com.ruoyi.contribute.service;

import com.ruoyi.contribute.domain.BaseArticle;
import com.ruoyi.contribute.dto.BaseArticleDto;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

/**
 * 文章管理Service接口
 * 
 * @author null
 * @date 2023-11-07
 */
public interface IBaseArticleService 
{
    /**
     * 查询文章管理
     * 
     * @param articleId 文章管理主键
     * @return 文章管理
     */
    public BaseArticle selectBaseArticleByArticleId(Long articleId);

    public List<BaseArticle> selectBaseArticleListByConferenceId(BaseArticle baseArticle);


    /**
     * 查询文章管理列表
     * 
     * @param baseArticle 文章管理
     * @return 文章管理集合
     */
    public List<BaseArticle> selectBaseArticleList(BaseArticle baseArticle);
    public List<BaseArticle> selectBaseMyArticleList(BaseArticle baseArticle);

    /**
     * 新增文章管理
     * 
     * @param baseArticle 文章管理
     * @return 结果
     */
    public int insertBaseArticle(BaseArticle baseArticle);
    public int insertBaseArticleDto(BaseArticleDto baseArticleDto);

    /**
     * 修改文章管理
     * 
     * @param baseArticle 文章管理
     * @return 结果
     */
    public int updateBaseArticle(BaseArticle baseArticle);

    public int updateBaseArticleDto(BaseArticleDto baseArticleDto);


    /**
     * 批量删除文章管理
     * 
     * @param articleIds 需要删除的文章管理主键集合
     * @return 结果
     */
    public int deleteBaseArticleByArticleIds(Long[] articleIds);

    /**
     * 删除文章管理信息
     * 
     * @param articleId 文章管理主键
     * @return 结果
     */
    public int deleteBaseArticleByArticleId(Long articleId);
}
