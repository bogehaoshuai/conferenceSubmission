package com.ruoyi.base.mapper;

import java.util.List;
import com.ruoyi.base.domain.BaseInvite;

/**
 * 邀请审稿Mapper接口
 * 
 * @author null
 * @date 2023-11-09
 */
public interface BaseInviteMapper 
{
    /**
     * 查询邀请审稿
     * 
     * @param inviteId 邀请审稿主键
     * @return 邀请审稿
     */
    public BaseInvite selectBaseInviteByInviteId(Long inviteId);

    /**
     * 查询邀请审稿列表
     * 
     * @param baseInvite 邀请审稿
     * @return 邀请审稿集合
     */
    public List<BaseInvite> selectBaseInviteList(BaseInvite baseInvite);

    /**
     * 查询审稿人id列表
     * @param baseInvite
     * @return
     */
    public List<Long> selectInviteIdList(BaseInvite baseInvite);

    /**
     * 新增邀请审稿
     * 
     * @param baseInvite 邀请审稿
     * @return 结果
     */
    public int insertBaseInvite(BaseInvite baseInvite);

    /**
     * 修改邀请审稿
     * 
     * @param baseInvite 邀请审稿
     * @return 结果
     */
    public int updateBaseInvite(BaseInvite baseInvite);

    /**
     * 删除邀请审稿
     * 
     * @param inviteId 邀请审稿主键
     * @return 结果
     */
    public int deleteBaseInviteByInviteId(Long inviteId);

    /**
     * 批量删除邀请审稿
     * 
     * @param inviteIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBaseInviteByInviteIds(Long[] inviteIds);
}
