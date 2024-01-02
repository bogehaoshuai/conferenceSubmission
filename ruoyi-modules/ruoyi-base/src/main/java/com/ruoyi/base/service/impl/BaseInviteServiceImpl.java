package com.ruoyi.base.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.base.domain.BaseConferTopic;
import com.ruoyi.base.dto.BaseInviteDto;
import com.ruoyi.base.domain.BaseInvite;
import com.ruoyi.base.mapper.BaseConferTopicMapper;
import com.ruoyi.base.mapper.BaseInviteMapper;
import com.ruoyi.base.remote.UserService;
import com.ruoyi.base.service.IBaseInviteService;
import com.ruoyi.common.security.utils.SecurityUtils;
import com.ruoyi.system.api.domain.SysUser;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 邀请审稿Service业务层处理
 *
 * @author null
 * @date 2023-11-09
 */
@Service
public class BaseInviteServiceImpl implements IBaseInviteService {
    @Autowired
    private BaseInviteMapper baseInviteMapper;

    @Autowired
    private BaseConferTopicMapper baseConferTopicMapper;

    @Autowired
    private UserService userService;

    /**
     * 查询邀请审稿
     *
     * @param inviteId 邀请审稿主键
     * @return 邀请审稿
     */
    @Override
    public BaseInvite selectBaseInviteByInviteId(Long inviteId) {
        return baseInviteMapper.selectBaseInviteByInviteId(inviteId);
    }

    /**
     * 查询邀请审稿列表
     *
     * @param baseInvite 邀请审稿
     * @return 邀请审稿
     */
    @Override
    public List<BaseInvite> selectBaseInviteList(BaseInvite baseInvite) {
        baseInvite.setChairId(SecurityUtils.getUserId());
        return baseInviteMapper.selectBaseInviteList(baseInvite);
    }

    @Override
    @Transactional
    public List<BaseInvite> selectBaseMyInviteList(BaseInvite baseInvite) {
        baseInvite.setPcId(SecurityUtils.getUserId());

        return baseInviteMapper.selectBaseInviteList(baseInvite);
    }

    @Override
    public List<BaseInvite> selectBaseInvite(BaseInvite baseInvite) {
        return baseInviteMapper.selectBaseInviteList(baseInvite);
    }

    /**
     * 新增邀请审稿
     *
     * @param baseInvite 邀请审稿
     * @return 结果
     */
    @Override
    public int insertBaseInvite(BaseInvite baseInvite) {
        baseInvite.setChairId(SecurityUtils.getUserId());
        baseInvite.setChairName(SecurityUtils.getUsername());
        baseInvite.setInviteStatusCode(0L);
        baseInvite.setInviteStatusName("待确认");
        return baseInviteMapper.insertBaseInvite(baseInvite);
    }

    @Override
    @Transactional
    public int insertBaseInviteDto(BaseInviteDto baseInviteDto) {
        BaseInvite baseInvite = baseInviteDto;
        for (Long i : baseInviteDto.getPcMemberIds()) {
            baseInvite.setPcId(i);
            SysUser user = userService.getUserById(i);
            baseInvite.setPcName(user.getUserName());
            baseInvite.setPcPlace(user.getPlace());
            baseInvite.setPcEmail(user.getEmail());
            baseInvite.setPcAffiliation(user.getAffiliation());
            if (i != baseInvite.getChairId()) {
                baseInvite.setInviteStatusCode(0L);
                baseInvite.setInviteStatusName("待确认");
            } else {
                baseInvite.setInviteStatusCode(1L);
                baseInvite.setInviteStatusName("已确认");
                setTopic(baseInvite, baseInviteDto);
//                List<Long> topicCodeList = baseInviteDto.getTopicCodeList();
//                StringBuffer topicCode = new StringBuffer();
//                StringBuffer topicLabel = new StringBuffer();
//                StringBuffer topicValue = new StringBuffer();
//                for (Long j : topicCodeList) {
//                    BaseConferTopic baseConferTopic = baseConferTopicMapper.selectBaseConferTopicByTopicCode(j);
//                    topicCode.append(baseConferTopic.getTopicCode());
//                    topicCode.append(",");
//                    topicLabel.append(baseConferTopic.getTopicLabel());
//                    topicLabel.append(",");
//                    topicValue.append(baseConferTopic.getTopicValue());
//                    topicValue.append(",");
//                }
//                baseInvite.setTopicCode(topicCode.toString().substring(0, topicCode.toString().length() - 1));
//                baseInvite.setTopicLabel(topicLabel.toString().substring(0, topicLabel.toString().length() - 1));
//                baseInvite.setTopicValue(topicValue.toString().substring(0, topicValue.toString().length() - 1));
            }

            baseInviteMapper.insertBaseInvite(baseInvite);
        }

        return 1;
    }

    /**
     * 修改邀请审稿
     *
     * @param baseInvite 邀请审稿
     * @return 结果
     */
    @Override
    public int updateBaseInvite(BaseInvite baseInvite) {
        return baseInviteMapper.updateBaseInvite(baseInvite);
    }

    @Override
    @Transactional
    public int updateBaseInviteDto(BaseInviteDto baseInviteDto) {
        BaseInvite baseInvite = baseInviteDto;
        setTopic(baseInvite, baseInviteDto);
//        List<Long> topicCodeList = baseInviteDto.getTopicCodeList();
//        StringBuffer topicCode = new StringBuffer();
//        StringBuffer topicLabel = new StringBuffer();
//        StringBuffer topicValue = new StringBuffer();
//        for (Long i : topicCodeList) {
//            BaseConferTopic baseConferTopic = baseConferTopicMapper.selectBaseConferTopicByTopicCode(i);
//            topicCode.append(baseConferTopic.getTopicCode());
//            topicCode.append(",");
//            topicLabel.append(baseConferTopic.getTopicLabel());
//            topicLabel.append(",");
//            topicValue.append(baseConferTopic.getTopicValue());
//            topicValue.append(",");
//        }
//        baseInvite.setTopicCode(topicCode.toString().substring(0, topicCode.toString().length() - 1));
//        baseInvite.setTopicLabel(topicLabel.toString().substring(0, topicLabel.toString().length() - 1));
//        baseInvite.setTopicValue(topicValue.toString().substring(0, topicValue.toString().length() - 1));
        return baseInviteMapper.updateBaseInvite(baseInvite);
    }

    /**
     * 批量删除邀请审稿
     *
     * @param inviteIds 需要删除的邀请审稿主键
     * @return 结果
     */
    @Override
    public int deleteBaseInviteByInviteIds(Long[] inviteIds) {
        return baseInviteMapper.deleteBaseInviteByInviteIds(inviteIds);
    }

    /**
     * 删除邀请审稿信息
     *
     * @param inviteId 邀请审稿主键
     * @return 结果
     */
    @Override
    public int deleteBaseInviteByInviteId(Long inviteId) {
        return baseInviteMapper.deleteBaseInviteByInviteId(inviteId);
    }

    @Transactional
    public void setTopic(BaseInvite baseInvite, BaseInviteDto baseInviteDto) {
        List<Long> topicCodeList = baseInviteDto.getTopicCodeList();
        if (topicCodeList != null) {
            StringBuffer topicCode = new StringBuffer();
            StringBuffer topicLabel = new StringBuffer();
            StringBuffer topicValue = new StringBuffer();
            for (Long i : topicCodeList) {
                BaseConferTopic baseConferTopic = baseConferTopicMapper.selectBaseConferTopicByTopicCode(i);
                topicCode.append(",");
                topicCode.append(baseConferTopic.getTopicCode());
                topicLabel.append(",");
                topicLabel.append(baseConferTopic.getTopicLabel());
                topicValue.append(",");
                topicValue.append(baseConferTopic.getTopicValue());
            }
            baseInvite.setTopicCode(topicCode.toString().substring(1, topicCode.toString().length()));
            baseInvite.setTopicLabel(topicLabel.toString().substring(1, topicLabel.toString().length()));
            baseInvite.setTopicValue(topicValue.toString().substring(1, topicValue.toString().length()));
        }
    }
}
