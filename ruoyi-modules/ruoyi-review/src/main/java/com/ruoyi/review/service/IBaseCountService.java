package com.ruoyi.review.service;

import java.util.List;
import com.ruoyi.review.domain.BaseCount;

/**
 * 审稿数量Service接口
 * 
 * @author null
 * @date 2023-11-19
 */
public interface IBaseCountService 
{
    /**
     * 查询审稿数量
     * 
     * @param countId 审稿数量主键
     * @return 审稿数量
     */
    public BaseCount selectBaseCountByCountId(Long countId);

    /**
     * 查询审稿数量列表
     * 
     * @param baseCount 审稿数量
     * @return 审稿数量集合
     */
    public List<BaseCount> selectBaseCountList(BaseCount baseCount);

    /**
     * 新增审稿数量
     * 
     * @param baseCount 审稿数量
     * @return 结果
     */
    public int insertBaseCount(BaseCount baseCount);

    /**
     * 修改审稿数量
     * 
     * @param baseCount 审稿数量
     * @return 结果
     */
    public int updateBaseCount(BaseCount baseCount);

    /**
     * 批量删除审稿数量
     * 
     * @param countIds 需要删除的审稿数量主键集合
     * @return 结果
     */
    public int deleteBaseCountByCountIds(Long[] countIds);

    /**
     * 删除审稿数量信息
     * 
     * @param countId 审稿数量主键
     * @return 结果
     */
    public int deleteBaseCountByCountId(Long countId);
}
