package com.ruoyi.base.service;

import java.util.List;
import com.ruoyi.base.domain.BaseInvite;
import com.ruoyi.base.dto.BaseInviteDto;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * 邀请审稿Service接口
 * 
 * @author null
 * @date 2023-11-09
 */
public interface IBaseInviteService 
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
    public List<BaseInvite> selectBaseMyInviteList(BaseInvite baseInvite);

    public List<BaseInvite> selectBaseInvite(BaseInvite baseInvite);

    /**
     * 新增邀请审稿
     * 
     * @param baseInvite 邀请审稿
     * @return 结果
     */
    public int insertBaseInvite(BaseInvite baseInvite);
    public int insertBaseInviteDto(BaseInviteDto baseInviteDto);


    /**
     * 修改邀请审稿
     * 
     * @param baseInvite 邀请审稿
     * @return 结果
     */
    public int updateBaseInvite(BaseInvite baseInvite);

    public int updateBaseInviteDto(BaseInviteDto baseInviteDto);


    /**
     * 批量删除邀请审稿
     * 
     * @param inviteIds 需要删除的邀请审稿主键集合
     * @return 结果
     */
    public int deleteBaseInviteByInviteIds(Long[] inviteIds);

    /**
     * 删除邀请审稿信息
     * 
     * @param inviteId 邀请审稿主键
     * @return 结果
     */
    public int deleteBaseInviteByInviteId(Long inviteId);
}
