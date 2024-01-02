package com.ruoyi.base.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.base.domain.BaseArticle;
import com.ruoyi.base.remote.ArticleService;
import com.ruoyi.common.security.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.base.mapper.BaseConferenceMapper;
import com.ruoyi.base.domain.BaseConference;
import com.ruoyi.base.service.IBaseConferenceService;

/**
 * 会议管理Service业务层处理
 *
 * @author null
 * @date 2023-11-07
 */
@Service
public class BaseConferenceServiceImpl implements IBaseConferenceService {
    @Autowired
    private BaseConferenceMapper baseConferenceMapper;

    @Autowired
    private ArticleService articleService;

    /**
     * 查询会议管理
     *
     * @param conferenceId 会议管理主键
     * @return 会议管理
     */
    @Override
    public BaseConference selectBaseConferenceByConferenceId(Long conferenceId) {
        return baseConferenceMapper.selectBaseConferenceByConferenceId(conferenceId);
    }

    /**
     * 查询会议管理列表
     *
     * @param baseConference 会议管理
     * @return 会议管理
     */
    @Override
    public List<BaseConference> selectBaseConferenceList(BaseConference baseConference) {
//        1. 如果已经设置待查找的会议状态码则直接返回查询内容
        if (baseConference.getConferenceStatusCode() != null) {
            return baseConferenceMapper.selectBaseConferenceList(baseConference);
        }
//        2.1如果访问的是普通用户，则只可以看到2已审核和3投稿中的会议
        List<BaseConference> x = new ArrayList<>();
        baseConference.setConferenceStatusCode(2);
        x.addAll(baseConferenceMapper.selectBaseConferenceList(baseConference));
        baseConference.setConferenceStatusCode(3);
        x.addAll(baseConferenceMapper.selectBaseConferenceList(baseConference));
        baseConference.setConferenceStatusCode(4);
        x.addAll(baseConferenceMapper.selectBaseConferenceList(baseConference));
        baseConference.setConferenceStatusCode(5);
        x.addAll(baseConferenceMapper.selectBaseConferenceList(baseConference));
        if (!SecurityUtils.isAdmin(SecurityUtils.getUserId())) {
            return x;
        }
//        2.2如果访问的是管理员，则可以看到全部会议

        baseConference.setConferenceStatusCode(0);
        x.addAll(baseConferenceMapper.selectBaseConferenceList(baseConference));
        baseConference.setConferenceStatusCode(1);
        x.addAll(baseConferenceMapper.selectBaseConferenceList(baseConference));
        baseConference.setConferenceStatusCode(99);
        x.addAll(baseConferenceMapper.selectBaseConferenceList(baseConference));


        return x;
    }

    @Override
    public List<BaseConference> selectBaseConferenceMyList(BaseConference baseConference) {
        baseConference.setChairId(SecurityUtils.getUserId());
        return baseConferenceMapper.selectBaseConferenceList(baseConference);
    }

    @Override
    public List<BaseConference> selectBaseConferenceArticleList(BaseConference baseConference) {
        baseConference.setChairId(SecurityUtils.getUserId());
        return baseConferenceMapper.selectBaseArticleConferenceList(baseConference);
    }

    /**
     * 新增会议管理
     *
     * @param baseConference 会议管理
     * @return 结果
     */
    @Override
    public int insertBaseConference(BaseConference baseConference) {
        baseConference.setConferenceStatusCode(0);
        baseConference.setConferenceStatusName("待提交");
        baseConference.setChairId(SecurityUtils.getUserId());
        baseConference.setChairName(SecurityUtils.getUsername());
        return baseConferenceMapper.insertBaseConference(baseConference);
    }

    /**
     * 修改会议管理
     *
     * @param baseConference 会议管理
     * @return 结果
     */
    @Override
    public int updateBaseConference(BaseConference baseConference) {
        return baseConferenceMapper.updateBaseConference(baseConference);
    }

    @Override
    public int updateBaseConferenceToPublish(BaseConference baseConference){
        System.out.println(baseConference);
        boolean isReviewFinished = true;
        //查article是否都审核结束了
        for (BaseArticle baseArticle : articleService.getArticleListByConferenceId(baseConference.getConferenceId())) {
            if(baseArticle.getArticleStatusCode().longValue() < 4){
                isReviewFinished = false;
                break;
            }
        }
        System.out.println(isReviewFinished);
        if(isReviewFinished == true){
            baseConference.setConferenceStatusCode(5);
            baseConference.setConferenceStatusName("发布结果");
            return baseConferenceMapper.updateBaseConference(baseConference);
        }
        return 0;
    }

    /**
     * 批量删除会议管理
     *
     * @param conferenceIds 需要删除的会议管理主键
     * @return 结果
     */
    @Override
    public int deleteBaseConferenceByConferenceIds(Long[] conferenceIds) {
        return baseConferenceMapper.deleteBaseConferenceByConferenceIds(conferenceIds);
    }

    /**
     * 删除会议管理信息
     *
     * @param conferenceId 会议管理主键
     * @return 结果
     */
    @Override
    public int deleteBaseConferenceByConferenceId(Long conferenceId) {
        return baseConferenceMapper.deleteBaseConferenceByConferenceId(conferenceId);
    }
}
