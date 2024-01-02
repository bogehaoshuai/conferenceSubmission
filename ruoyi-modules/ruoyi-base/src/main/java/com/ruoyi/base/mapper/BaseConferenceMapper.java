package com.ruoyi.base.mapper;

import java.util.List;
import com.ruoyi.base.domain.BaseConference;

/**
 * 会议管理Mapper接口
 * 
 * @author null
 * @date 2023-11-07
 */
public interface BaseConferenceMapper 
{
    /**
     * 查询会议管理
     * 
     * @param conferenceId 会议管理主键
     * @return 会议管理
     */
    public BaseConference selectBaseConferenceByConferenceId(Long conferenceId);

    /**
     * 查询会议管理列表
     * 
     * @param baseConference 会议管理
     * @return 会议管理集合
     */
    public List<BaseConference> selectBaseConferenceList(BaseConference baseConference);
    public List<BaseConference> selectBaseArticleConferenceList(BaseConference baseConference);

    /**
     * 新增会议管理
     * 
     * @param baseConference 会议管理
     * @return 结果
     */
    public int insertBaseConference(BaseConference baseConference);

    /**
     * 修改会议管理
     * 
     * @param baseConference 会议管理
     * @return 结果
     */
    public int updateBaseConference(BaseConference baseConference);

    /**
     * 删除会议管理
     * 
     * @param conferenceId 会议管理主键
     * @return 结果
     */
    public int deleteBaseConferenceByConferenceId(Long conferenceId);

    /**
     * 批量删除会议管理
     * 
     * @param conferenceIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBaseConferenceByConferenceIds(Long[] conferenceIds);
}
