package com.ruoyi.review.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.base.api.RemoteArticleService;
import com.ruoyi.base.api.RemoteConferTopicService;
import com.ruoyi.base.api.RemoteConferenceService;
import com.ruoyi.base.api.RemoteInviteService;
import com.ruoyi.base.api.domain.BaseArticle;
import com.ruoyi.base.api.domain.BaseConferTopic;
import com.ruoyi.base.api.domain.BaseConference;
import com.ruoyi.base.api.domain.BaseInvite;
import com.ruoyi.review.dto.AllocationDto;
import com.ruoyi.review.service.IBaseRebuttalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.annotation.RequiresPermissions;
import com.ruoyi.review.domain.BaseAllocation;
import com.ruoyi.review.service.IBaseAllocationService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 稿件分配Controller
 * 
 * @author null
 * @date 2023-11-19
 */
@RestController
@RequestMapping("/allocation")
public class BaseAllocationController extends BaseController
{
    @Autowired
    private IBaseAllocationService baseAllocationService;

    @Autowired
    private RemoteInviteService inviteService;

    @Autowired
    private RemoteArticleService articleService;

    @Autowired
    private RemoteConferenceService conferenceService;

    @Autowired
    private RemoteConferTopicService topicService;

    /**
     * 查询稿件分配列表
     */
    @RequiresPermissions("review:allocation:list")
    @GetMapping("/list")
    public TableDataInfo list(BaseAllocation baseAllocation)
    {
        startPage();
        List<AllocationDto> list = baseAllocationService.selectBaseAllocationDtoList(baseAllocation);
        return getDataTable(list);
    }

    @GetMapping("/listByArticleId/{id}")
    public TableDataInfo listByArticleId(@PathVariable("id") long id)
    {
        BaseAllocation baseAllocation = new BaseAllocation();
        baseAllocation.setArticleId(id);
        List<BaseAllocation> list = baseAllocationService.selectBaseAllocationList(baseAllocation);
        return getDataTable(list);
    }

    /**
     * 导出稿件分配列表

    @RequiresPermissions("review:allocation:export")
    @Log(title = "稿件分配", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BaseAllocation baseAllocation)
    {
        List<BaseAllocation> list = baseAllocationService.selectBaseAllocationList(baseAllocation);
        ExcelUtil<BaseAllocation> util = new ExcelUtil<BaseAllocation>(BaseAllocation.class);
        util.exportExcel(response, list, "稿件分配数据");
    }
    */

    /**
     * 获取稿件分配详细信息
     */
    //@RequiresPermissions("review:allocation:query")
    @GetMapping(value = "/{allocationId}")
    public AjaxResult getInfo(@PathVariable("allocationId") Long allocationId)
    {
        return success(baseAllocationService.selectBaseAllocationByAllocationId(allocationId));
    }

    /**
     * 新增稿件分配
     */
    //@RequiresPermissions("review:allocation:add")
    @Log(title = "稿件分配", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BaseAllocation baseAllocation)
    {
        return toAjax(baseAllocationService.insertBaseAllocation(baseAllocation));
    }

    /**
     * 稿件分配策略：随机
     * @return
     */
    @GetMapping("/random/{conferenceId}")
    public AjaxResult doAllocationByRandom(@PathVariable("conferenceId") Long conferenceId){
        //根据会议id获取所有审稿人信息
        List<BaseInvite> inviteTempList = inviteService.getInviteById(conferenceId);
        System.out.println(inviteTempList);
        List<BaseInvite> inviteList = new ArrayList<BaseInvite>();
        for(BaseInvite baseInvite: inviteTempList){
            if(baseInvite.getInviteStatusCode().equals(1L)){
                inviteList.add(baseInvite);
            }
        }
        System.out.println(inviteList);
        //根据会议id获取所有论文id，存入列表
        List<BaseArticle> articleTempList = articleService.getArticleListByConferenceId(conferenceId);

        List<BaseArticle> articleList = new ArrayList<BaseArticle>();
        for(BaseArticle baseArticle: articleTempList){
            if(baseArticle.getArticleStatusCode().equals(1L)){
                articleList.add(baseArticle);
            }
        }
        System.out.println(articleList);
        baseAllocationService.allocationByInviteAndArticle(inviteList, articleList);

        BaseConference baseConference = new BaseConference();
        baseConference.setConferenceId(conferenceId);
        baseConference.setConferenceStatusCode(4);
        baseConference.setConferenceStatusName("审稿中");
        System.out.println(baseConference);
        return conferenceService.edit(baseConference);
    }


    /**
     * 稿件分配策略：根据topic
     * @param conferenceId
     * @return
     */
    @GetMapping("/topic/{conferenceId}")
    public AjaxResult doAllocationByTopic(@PathVariable("conferenceId") Long conferenceId){
        List<BaseInvite> inviteTempList = inviteService.getInviteById(conferenceId);
        System.out.println(inviteTempList);
        List<BaseArticle> articleTempList = articleService.getArticleListByConferenceId(conferenceId);
        System.out.println(articleTempList);
        //获取会议的全部topic
        List<BaseConferTopic> topicList = topicService.listByConference(conferenceId);
        System.out.println(topicList);
        //遍历topic
        for(BaseConferTopic topic : topicList){
            Long topicCode = topic.getTopicCode();
            //根据topic从base_invite表中找到对应的审稿人列表
            List<BaseInvite> inviteList = new ArrayList<BaseInvite>();
            for(BaseInvite baseInvite: inviteTempList){
                String inviteTopic = baseInvite.getTopicCode();
                if(Arrays.asList(inviteTopic.split(",")).contains(topicCode.toString())
                        && baseInvite.getInviteStatusCode().equals(1L)) {
                    inviteList.add(baseInvite);
                }
            }
            //若该topic审稿人小于3 则在全部审稿人中随机分配
            if (inviteList.size() < 3){
                inviteList = new ArrayList<BaseInvite>();
                for(BaseInvite baseInvite: inviteTempList){
                    if(baseInvite.getInviteStatusCode().equals(1L)) {
                        inviteList.add(baseInvite);
                    }
                }
            }

            //根据topic从base_article表中找到对应的文章列表
            List<BaseArticle> articleList = new ArrayList<BaseArticle>();
            for(BaseArticle baseArticle: articleTempList){
                String articleTopic = baseArticle.getTopicCode();
                if(Arrays.asList(articleTopic.split(",")).contains(topicCode.toString())
                        && baseArticle.getArticleStatusCode().equals(1L)){
                    articleList.add(baseArticle);
                }
            }

            baseAllocationService.allocationByInviteAndArticle(inviteList, articleList);
        }
        BaseConference baseConference = new BaseConference();
        baseConference.setConferenceId(conferenceId);
        baseConference.setConferenceStatusCode(4);
        baseConference.setConferenceStatusName("审稿中");

        return conferenceService.edit(baseConference);
    }


    /**
     * 修改稿件分配
     */
    //@RequiresPermissions("review:allocation:edit")
    @Log(title = "稿件分配", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BaseAllocation baseAllocation)
    {
        return toAjax(baseAllocationService.updateBaseAllocation(baseAllocation));
    }

    /**
     * 删除稿件分配
     */
    //@RequiresPermissions("review:allocation:remove")
    @Log(title = "稿件分配", businessType = BusinessType.DELETE)
	@DeleteMapping("/{allocationIds}")
    public AjaxResult remove(@PathVariable Long[] allocationIds)
    {
        return toAjax(baseAllocationService.deleteBaseAllocationByAllocationIds(allocationIds));
    }
}
