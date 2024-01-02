package com.ruoyi.base.service;

import java.util.List;
import com.ruoyi.base.domain.BaseConference;

/**
 * 会议管理Service接口
 * 
 * @author null
 * @date 2023-11-07
 */
public interface IBaseConferenceService 
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

    public List<BaseConference> selectBaseConferenceMyList(BaseConference baseConference);
    public List<BaseConference> selectBaseConferenceArticleList(BaseConference baseConference);

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

    public int updateBaseConferenceToPublish(BaseConference baseConference);

    /**
     * 批量删除会议管理
     * 
     * @param conferenceIds 需要删除的会议管理主键集合
     * @return 结果
     */
    public int deleteBaseConferenceByConferenceIds(Long[] conferenceIds);

    /**
     * 删除会议管理信息
     * 
     * @param conferenceId 会议管理主键
     * @return 结果
     */
    public int deleteBaseConferenceByConferenceId(Long conferenceId);
}
