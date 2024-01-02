package com.ruoyi.review.service;

import java.util.List;

import com.ruoyi.base.api.domain.BaseArticle;
import com.ruoyi.base.api.domain.BaseInvite;
import com.ruoyi.review.domain.BaseAllocation;
import com.ruoyi.review.dto.AllocationDto;

/**
 * 稿件分配Service接口
 * 
 * @author null
 * @date 2023-11-19
 */
public interface IBaseAllocationService 
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
    public List<AllocationDto> selectBaseAllocationDtoList(BaseAllocation baseAllocation);

    public List<BaseAllocation> selectBaseAllocationList(BaseAllocation baseAllocation);

    /**
     * 平均分配论文并修改论文状态码
     * @param inviteList
     * @param articleList
     * @return
     */
    public int allocationByInviteAndArticle(List<BaseInvite> inviteList, List<BaseArticle> articleList);

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
     * 批量删除稿件分配
     * 
     * @param allocationIds 需要删除的稿件分配主键集合
     * @return 结果
     */
    public int deleteBaseAllocationByAllocationIds(Long[] allocationIds);

    /**
     * 删除稿件分配信息
     * 
     * @param allocationId 稿件分配主键
     * @return 结果
     */
    public int deleteBaseAllocationByAllocationId(Long allocationId);
}
