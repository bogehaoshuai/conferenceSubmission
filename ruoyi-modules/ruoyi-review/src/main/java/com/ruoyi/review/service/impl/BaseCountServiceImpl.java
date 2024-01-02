package com.ruoyi.review.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.review.mapper.BaseCountMapper;
import com.ruoyi.review.domain.BaseCount;
import com.ruoyi.review.service.IBaseCountService;

/**
 * 审稿数量Service业务层处理
 * 
 * @author null
 * @date 2023-11-19
 */
@Service
public class BaseCountServiceImpl implements IBaseCountService 
{
    @Autowired
    private BaseCountMapper baseCountMapper;

    /**
     * 查询审稿数量
     * 
     * @param countId 审稿数量主键
     * @return 审稿数量
     */
    @Override
    public BaseCount selectBaseCountByCountId(Long countId)
    {
        return baseCountMapper.selectBaseCountByCountId(countId);
    }

    /**
     * 查询审稿数量列表
     * 
     * @param baseCount 审稿数量
     * @return 审稿数量
     */
    @Override
    public List<BaseCount> selectBaseCountList(BaseCount baseCount)
    {
        return baseCountMapper.selectBaseCountList(baseCount);
    }

    /**
     * 新增审稿数量
     * 
     * @param baseCount 审稿数量
     * @return 结果
     */
    @Override
    public int insertBaseCount(BaseCount baseCount)
    {
        return baseCountMapper.insertBaseCount(baseCount);
    }

    /**
     * 修改审稿数量
     * 
     * @param baseCount 审稿数量
     * @return 结果
     */
    @Override
    public int updateBaseCount(BaseCount baseCount)
    {
        return baseCountMapper.updateBaseCount(baseCount);
    }

    /**
     * 批量删除审稿数量
     * 
     * @param countIds 需要删除的审稿数量主键
     * @return 结果
     */
    @Override
    public int deleteBaseCountByCountIds(Long[] countIds)
    {
        return baseCountMapper.deleteBaseCountByCountIds(countIds);
    }

    /**
     * 删除审稿数量信息
     * 
     * @param countId 审稿数量主键
     * @return 结果
     */
    @Override
    public int deleteBaseCountByCountId(Long countId)
    {
        return baseCountMapper.deleteBaseCountByCountId(countId);
    }
}
