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
import com.ruoyi.base.domain.BaseConference;
import com.ruoyi.base.service.IBaseConferenceService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 会议管理Controller
 * 
 * @author null
 * @date 2023-11-07
 */
@RestController
@RequestMapping("/conference")
public class BaseConferenceController extends BaseController
{
    @Autowired
    private IBaseConferenceService baseConferenceService;

    /**
     * 查询会议管理列表
     */
    //@RequiresPermissions("base:conference:list")
    @GetMapping("/list")
    public TableDataInfo list(BaseConference baseConference)
    {
        startPage();
        List<BaseConference> list = baseConferenceService.selectBaseConferenceList(baseConference);
        return getDataTable(list);
    }

    @GetMapping("/mylist")
    public TableDataInfo mylist(BaseConference baseConference)
    {
        startPage();
        List<BaseConference> list = baseConferenceService.selectBaseConferenceMyList(baseConference);
        return getDataTable(list);
    }

    @GetMapping("/articlelist")
    public TableDataInfo articlelist(BaseConference baseConference)
    {
        startPage();
        List<BaseConference> list = baseConferenceService.selectBaseConferenceArticleList(baseConference);
        return getDataTable(list);
    }

    /**
     * 导出会议管理列表
     */
    //@RequiresPermissions("base:conference:export")
    @Log(title = "会议管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BaseConference baseConference)
    {
        List<BaseConference> list = baseConferenceService.selectBaseConferenceList(baseConference);
        ExcelUtil<BaseConference> util = new ExcelUtil<BaseConference>(BaseConference.class);
        util.exportExcel(response, list, "会议管理数据");
    }

    /**
     * 获取会议管理详细信息
     */
    //@RequiresPermissions("base:conference:query")
    @GetMapping(value = "/{conferenceId}")
    public AjaxResult getInfo(@PathVariable("conferenceId") Long conferenceId)
    {
        return success(baseConferenceService.selectBaseConferenceByConferenceId(conferenceId));
    }

    /**
     * 新增会议管理
     */
    //@RequiresPermissions("base:conference:add")
    @Log(title = "会议管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BaseConference baseConference)
    {
        return toAjax(baseConferenceService.insertBaseConference(baseConference));
    }

    /**
     * 修改会议管理
     */
    //@RequiresPermissions("base:conference:edit")
    @Log(title = "会议管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BaseConference baseConference)
    {
        return toAjax(baseConferenceService.updateBaseConference(baseConference));
    }

    @PutMapping("/toPublish")
    public int editToPublish(@RequestBody BaseConference baseConference)
    {
        return baseConferenceService.updateBaseConferenceToPublish(baseConference);
    }

    /**
     * 删除会议管理
     */
    //@RequiresPermissions("base:conference:remove")
    @Log(title = "会议管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{conferenceIds}")
    public AjaxResult remove(@PathVariable Long[] conferenceIds)
    {
        return toAjax(baseConferenceService.deleteBaseConferenceByConferenceIds(conferenceIds));
    }
}
