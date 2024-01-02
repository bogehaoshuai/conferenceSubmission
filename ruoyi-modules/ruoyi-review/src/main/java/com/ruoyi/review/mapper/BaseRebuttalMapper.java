package com.ruoyi.review.mapper;

import java.util.List;
import com.ruoyi.review.domain.BaseRebuttal;

/**
 * rebuttalMapper接口
 * 
 * @author null
 * @date 2023-11-19
 */
public interface BaseRebuttalMapper 
{
    /**
     * 查询rebuttal
     * 
     * @param rebuttalId rebuttal主键
     * @return rebuttal
     */
    public BaseRebuttal selectBaseRebuttalByRebuttalId(Long rebuttalId);

    public BaseRebuttal selectBaseRebuttalByArticleId(Long articlId);

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
     * 删除rebuttal
     * 
     * @param rebuttalId rebuttal主键
     * @return 结果
     */
    public int deleteBaseRebuttalByRebuttalId(Long rebuttalId);

    /**
     * 批量删除rebuttal
     * 
     * @param rebuttalIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBaseRebuttalByRebuttalIds(Long[] rebuttalIds);
}
