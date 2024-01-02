package com.ruoyi.base.controller;

import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.annotation.RequiresPermissions;
import com.ruoyi.base.domain.BaseConferTopic;
import com.ruoyi.base.service.IBaseConferTopicService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 会议主题Controller
 * 
 * @author null
 * @date 2023-11-16
 */
@RestController
@RequestMapping("/topic")
public class BaseConferTopicController extends BaseController
{
    @Autowired
    private IBaseConferTopicService baseConferTopicService;

    /**
     * 查询会议主题列表
     */
    @RequiresPermissions("base:conference:list")
    @GetMapping("/list")
    public TableDataInfo list(BaseConferTopic baseConferTopic)
    {
        startPage();
        List<BaseConferTopic> list = baseConferTopicService.selectBaseConferTopicList(baseConferTopic);
        return getDataTable(list);
    }

    @GetMapping("/listByConference/{conferenceId}")
    public List<BaseConferTopic> listByConference(@PathVariable("conferenceId") Long conferenceId)
    {
        BaseConferTopic baseConferTopic = new BaseConferTopic();
        baseConferTopic.setConferenceId(conferenceId);
        List<BaseConferTopic> list = baseConferTopicService.selectBaseConferTopicList(baseConferTopic);
        return list;
    }


    /**
     * 导出会议主题列表
     */
//    @RequiresPermissions("base:conference:export")
    @Log(title = "会议主题", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BaseConferTopic baseConferTopic)
    {
        List<BaseConferTopic> list = baseConferTopicService.selectBaseConferTopicList(baseConferTopic);
        ExcelUtil<BaseConferTopic> util = new ExcelUtil<BaseConferTopic>(BaseConferTopic.class);
        util.exportExcel(response, list, "会议主题数据");
    }

    /**
     * 获取会议主题详细信息
     */
//    @RequiresPermissions("base:conference:query")
    @GetMapping(value = "/{topicCode}")
    public AjaxResult getInfo(@PathVariable("topicCode") Long topicCode)
    {
        return success(baseConferTopicService.selectBaseConferTopicByTopicCode(topicCode));
    }
    @GetMapping(value = "/getTopicByCode/{topicCode}")
    public BaseConferTopic getTopicByCode(@PathVariable("topicCode") Long topicCode)
    {
        return baseConferTopicService.selectBaseConferTopicByTopicCode(topicCode);
    }

    /**
     * 新增会议主题
     */
//    @RequiresPermissions("base:conference:add")
    @Log(title = "会议主题", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BaseConferTopic baseConferTopic)
    {
        return toAjax(baseConferTopicService.insertBaseConferTopic(baseConferTopic));
    }

    /**
     * 修改会议主题
     */
//    @RequiresPermissions("base:conference:edit")
    @Log(title = "会议主题", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BaseConferTopic baseConferTopic)
    {
        return toAjax(baseConferTopicService.updateBaseConferTopic(baseConferTopic));
    }

    /**
     * 删除会议主题
     */
//    @RequiresPermissions("base:conference:remove")
    @Log(title = "会议主题", businessType = BusinessType.DELETE)
	@DeleteMapping("/{topicCodes}")
    public AjaxResult remove(@PathVariable Long[] topicCodes)
    {
        return toAjax(baseConferTopicService.deleteBaseConferTopicByTopicCodes(topicCodes));
    }
}
