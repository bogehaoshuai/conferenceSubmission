package com.ruoyi.base.mapper;

import java.util.List;
import com.ruoyi.base.domain.BaseConferTopic;

/**
 * 会议主题Mapper接口
 * 
 * @author null
 * @date 2023-11-16
 */
public interface BaseConferTopicMapper 
{
    /**
     * 查询会议主题
     * 
     * @param topicCode 会议主题主键
     * @return 会议主题
     */
    public BaseConferTopic selectBaseConferTopicByTopicCode(Long topicCode);

    /**
     * 查询会议主题列表
     * 
     * @param baseConferTopic 会议主题
     * @return 会议主题集合
     */
    public List<BaseConferTopic> selectBaseConferTopicList(BaseConferTopic baseConferTopic);

    /**
     * 新增会议主题
     * 
     * @param baseConferTopic 会议主题
     * @return 结果
     */
    public int insertBaseConferTopic(BaseConferTopic baseConferTopic);

    /**
     * 修改会议主题
     * 
     * @param baseConferTopic 会议主题
     * @return 结果
     */
    public int updateBaseConferTopic(BaseConferTopic baseConferTopic);

    /**
     * 删除会议主题
     * 
     * @param topicCode 会议主题主键
     * @return 结果
     */
    public int deleteBaseConferTopicByTopicCode(Long topicCode);

    /**
     * 批量删除会议主题
     * 
     * @param topicCodes 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBaseConferTopicByTopicCodes(Long[] topicCodes);
}
