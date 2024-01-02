package com.ruoyi.base.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.base.mapper.BaseConferTopicMapper;
import com.ruoyi.base.domain.BaseConferTopic;
import com.ruoyi.base.service.IBaseConferTopicService;

/**
 * 会议主题Service业务层处理
 * 
 * @author null
 * @date 2023-11-16
 */
@Service
public class BaseConferTopicServiceImpl implements IBaseConferTopicService 
{
    @Autowired
    private BaseConferTopicMapper baseConferTopicMapper;

    /**
     * 查询会议主题
     * 
     * @param topicCode 会议主题主键
     * @return 会议主题
     */
    @Override
    public BaseConferTopic selectBaseConferTopicByTopicCode(Long topicCode)
    {
        return baseConferTopicMapper.selectBaseConferTopicByTopicCode(topicCode);
    }

    /**
     * 查询会议主题列表
     * 
     * @param baseConferTopic 会议主题
     * @return 会议主题
     */
    @Override
    public List<BaseConferTopic> selectBaseConferTopicList(BaseConferTopic baseConferTopic)
    {
        return baseConferTopicMapper.selectBaseConferTopicList(baseConferTopic);
    }

    /**
     * 新增会议主题
     * 
     * @param baseConferTopic 会议主题
     * @return 结果
     */
    @Override
    public int insertBaseConferTopic(BaseConferTopic baseConferTopic)
    {
        baseConferTopic.setStatus("0");
        return baseConferTopicMapper.insertBaseConferTopic(baseConferTopic);
    }

    /**
     * 修改会议主题
     * 
     * @param baseConferTopic 会议主题
     * @return 结果
     */
    @Override
    public int updateBaseConferTopic(BaseConferTopic baseConferTopic)
    {
        return baseConferTopicMapper.updateBaseConferTopic(baseConferTopic);
    }

    /**
     * 批量删除会议主题
     * 
     * @param topicCodes 需要删除的会议主题主键
     * @return 结果
     */
    @Override
    public int deleteBaseConferTopicByTopicCodes(Long[] topicCodes)
    {
        return baseConferTopicMapper.deleteBaseConferTopicByTopicCodes(topicCodes);
    }

    /**
     * 删除会议主题信息
     * 
     * @param topicCode 会议主题主键
     * @return 结果
     */
    @Override
    public int deleteBaseConferTopicByTopicCode(Long topicCode)
    {
        return baseConferTopicMapper.deleteBaseConferTopicByTopicCode(topicCode);
    }
}
