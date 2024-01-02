package com.ruoyi.contribute.service.impl;

import com.ruoyi.base.api.RemoteConferTopicService;
import com.ruoyi.base.api.domain.BaseConferTopic;
import com.ruoyi.contribute.domain.BaseArticle;
import com.ruoyi.contribute.dto.BaseArticleDto;
import com.ruoyi.contribute.mapper.BaseArticleMapper;
import com.ruoyi.contribute.service.IBaseArticleService;
import com.ruoyi.common.security.utils.SecurityUtils;
import org.apache.http.annotation.Contract;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.ArrayList;
import java.util.List;

/**
 * 文章管理Service业务层处理
 *
 * @author null
 * @date 2023-11-07
 */
@Service
public class BaseArticleServiceImpl implements IBaseArticleService {
    @Autowired
    private BaseArticleMapper baseArticleMapper;

    @Autowired
    private RemoteConferTopicService topicService;

    /**
     * 查询文章管理
     *
     * @param articleId 文章管理主键
     * @return 文章管理
     */
    @Override
    public BaseArticle selectBaseArticleByArticleId(Long articleId) {
        return baseArticleMapper.selectBaseArticleByArticleId(articleId);
    }

    @Override
    public List<BaseArticle> selectBaseArticleListByConferenceId(BaseArticle baseArticle) {
        return baseArticleMapper.selectBaseArticleList(baseArticle);
    }

    /**
     * 查询文章管理列表
     *
     * @param baseArticle 文章管理
     * @return 文章管理
     */
//    @Override
//    public List<BaseArticle> selectBaseArticleList(BaseArticle baseArticle) {
//        if (!SecurityUtils.isAdmin(SecurityUtils.getUserId())) {
//            baseArticle.setCreatorId(SecurityUtils.getUserId());
//        }
//        return baseArticleMapper.selectBaseArticleList(baseArticle);
//    }
    @Override
    public List<BaseArticle> selectBaseArticleList(BaseArticle baseArticle) {

        return baseArticleMapper.selectBaseArticleList(baseArticle);
    }

    @Override
    public List<BaseArticle> selectBaseMyArticleList(BaseArticle baseArticle) {
        if (!SecurityUtils.isAdmin(SecurityUtils.getUserId())) {
            baseArticle.setCreatorId(SecurityUtils.getUserId());
        }
        return baseArticleMapper.selectBaseArticleList(baseArticle);
    }


    /**
     * 新增文章管理
     *
     * @param baseArticle 文章管理
     * @return 结果
     */
    @Override
    public int insertBaseArticle(BaseArticle baseArticle) {
        baseArticle.setCreatorId(SecurityUtils.getUserId());
        baseArticle.setCreatorName(SecurityUtils.getUsername());
        baseArticle.setArticleStatusCode(0L);
        baseArticle.setArticleStatusName("待提交");
        return baseArticleMapper.insertBaseArticle(baseArticle);
    }

    @Override
    @Transactional
    public int insertBaseArticleDto(BaseArticleDto baseArticleDto) {
        baseArticleDto.setCreatorId(SecurityUtils.getUserId());
        baseArticleDto.setCreatorName(SecurityUtils.getUsername());
        baseArticleDto.setArticleStatusCode(0L);
        baseArticleDto.setArticleStatusName("待提交");
        BaseArticle baseArticle = baseArticleDto;
        setTopic(baseArticle, baseArticleDto);
        return baseArticleMapper.insertBaseArticle(baseArticle);
    }


    /**
     * 修改文章管理
     *
     * @param baseArticle 文章管理
     * @return 结果
     */
    @Override
    public int updateBaseArticle(BaseArticle baseArticle) {
        return baseArticleMapper.updateBaseArticle(baseArticle);
    }

    @Override
    @Transactional
    public int updateBaseArticleDto(BaseArticleDto baseArticleDto) {
        BaseArticle baseArticle = baseArticleDto;
        setTopic(baseArticle, baseArticleDto);
        return baseArticleMapper.updateBaseArticle(baseArticle);
    }

    /**
     * 批量删除文章管理
     *
     * @param articleIds 需要删除的文章管理主键
     * @return 结果
     */
    @Override
    public int deleteBaseArticleByArticleIds(Long[] articleIds) {
        return baseArticleMapper.deleteBaseArticleByArticleIds(articleIds);
    }

    /**
     * 删除文章管理信息
     *
     * @param articleId 文章管理主键
     * @return 结果
     */
    @Override
    public int deleteBaseArticleByArticleId(Long articleId) {
        return baseArticleMapper.deleteBaseArticleByArticleId(articleId);
    }

    @Transactional
    public void setTopic(BaseArticle baseArticle, BaseArticleDto baseArticleDto) {
        List<Long> topicCodeList = baseArticleDto.getTopicCodeList();
        if (topicCodeList != null) {
            StringBuffer topicCode = new StringBuffer();
            StringBuffer topicLabel = new StringBuffer();
            StringBuffer topicValue = new StringBuffer();
            for (Long i : topicCodeList) {
                System.out.println(i);
                BaseConferTopic baseConferTopic = topicService.getTopicByCode(i);
                System.out.println(baseConferTopic);
                topicCode.append(",");
                topicCode.append(baseConferTopic.getTopicCode());
                topicLabel.append(",");
                topicLabel.append(baseConferTopic.getTopicLabel());
                topicValue.append(",");
                topicValue.append(baseConferTopic.getTopicValue());
            }
            baseArticle.setTopicCode(topicCode.toString().substring(1, topicCode.toString().length()));
            baseArticle.setTopicLabel(topicLabel.toString().substring(1, topicLabel.toString().length()));
            baseArticle.setTopicValue(topicValue.toString().substring(1, topicValue.toString().length()));
        }
    }
}
