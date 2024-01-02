package com.ruoyi.review.mapper;

import java.util.List;
import com.ruoyi.review.domain.BaseAllocation;

/**
 * 稿件分配Mapper接口
 * 
 * @author null
 * @date 2023-11-19
 */
public interface BaseAllocationMapper 
{
    /**
     * 查询稿件分配
     * 
     * @param allocationId 稿件分配主键
     * @return 稿件分配
     */
    public BaseAllocation selectBaseAllocationByAllocationId(Long allocationId);

    /**
     * 查询稿件分配列表
     * 
     * @param baseAllocation 稿件分配
     * @return 稿件分配集合
     */
    public List<BaseAllocation> selectBaseAllocationList(BaseAllocation baseAllocation);

    /**
     * 新增稿件分配
     * 
     * @param baseAllocation 稿件分配
     * @return 结果
     */
    public int insertBaseAllocation(BaseAllocation baseAllocation);

    /**
     * 修改稿件分配
     * 
     * @param baseAllocation 稿件分配
     * @return 结果
     */
    public int updateBaseAllocation(BaseAllocation baseAllocation);

    public int updateBaseAllocationByArticleId(BaseAllocation baseAllocation);

    /**
     * 删除稿件分配
     * 
     * @param allocationId 稿件分配主键
     * @return 结果
     */
    public int deleteBaseAllocationByAllocationId(Long allocationId);

    /**
     * 批量删除稿件分配
     * 
     * @param allocationIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBaseAllocationByAllocationIds(Long[] allocationIds);
}
