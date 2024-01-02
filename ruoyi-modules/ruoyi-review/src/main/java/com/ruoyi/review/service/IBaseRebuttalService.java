package com.ruoyi.review.service;

import java.util.List;
import com.ruoyi.review.domain.BaseRebuttal;

/**
 * rebuttalService接口
 * 
 * @author null
 * @date 2023-11-19
 */
public interface IBaseRebuttalService 
{
    /**
     * 查询rebuttal
     * 
     * @param rebuttalId rebuttal主键
     * @return rebuttal
     */
    public BaseRebuttal selectBaseRebuttalByRebuttalId(Long rebuttalId);

    /**
     * 根据articleId查询rebuttal
     * @param articleId
     * @return
     */
    public BaseRebuttal selectBaseRebuttalByArticleId(Long articleId);

    /**
     * 查询rebuttal列表
     * 
     * @param baseRebuttal rebuttal
     * @return rebuttal集合
     */
    public List<BaseRebuttal> selectBaseRebuttalList(BaseRebuttal baseRebuttal);

    /**
     * 新增rebuttal
     * 
     * @param baseRebuttal rebuttal
     * @return 结果
     */
    public int insertBaseRebuttal(BaseRebuttal baseRebuttal);

    /**
     * 修改rebuttal
     * 
     * @param baseRebuttal rebuttal
     * @return 结果
     */
    public int updateBaseRebuttal(BaseRebuttal baseRebuttal);

    /**
     * 批量删除rebuttal
     * 
     * @param rebuttalIds 需要删除的rebuttal主键集合
     * @return 结果
     */
    public int deleteBaseRebuttalByRebuttalIds(Long[] rebuttalIds);

    /**
     * 删除rebuttal信息
     * 
     * @param rebuttalId rebuttal主键
     * @return 结果
     */
    public int deleteBaseRebuttalByRebuttalId(Long rebuttalId);
}
