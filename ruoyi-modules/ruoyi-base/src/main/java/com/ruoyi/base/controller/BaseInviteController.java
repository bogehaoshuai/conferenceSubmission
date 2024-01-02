package com.ruoyi.base.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

//import com.ruoyi.base.dto.BaseInviteDto;
import com.ruoyi.base.domain.BaseInvite;
import com.ruoyi.base.dto.BaseInviteDto;
import com.ruoyi.base.service.IBaseInviteService;
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
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 邀请审稿Controller
 * 
 * @author null
 * @date 2023-11-09
 */
@RestController
@RequestMapping("/invite")
public class BaseInviteController extends BaseController
{
    @Autowired
    private IBaseInviteService baseInviteService;

    /**
     * 查询邀请审稿列表
     */
//    @RequiresPermissions("base:invite:list")
    @GetMapping("/list")
    public TableDataInfo list(BaseInvite baseInvite)
    {
        startPage();
        List<BaseInvite> list = baseInviteService.selectBaseInviteList(baseInvite);
        return getDataTable(list);
    }
    @GetMapping("/mylist")
    public TableDataInfo mylist(BaseInvite baseInvite)
    {
        startPage();
        List<BaseInvite> list = baseInviteService.selectBaseMyInviteList(baseInvite);
        return getDataTable(list);
    }

    /**
     * 根据会议id获取列表
     * @param conferenceId
     * @return
     */
    @GetMapping("/getList/{conferenceId}")
    public List<BaseInvite> getListByArticleId(@PathVariable("conferenceId")Long conferenceId){
        BaseInvite baseInvite = new BaseInvite();
        baseInvite.setConferenceId(conferenceId);
        return baseInviteService.selectBaseInvite(baseInvite);
    }

    /**
     * 导出邀请审稿列表
     */
//    @RequiresPermissions("base:invite:export")
    @Log(title = "邀请审稿", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BaseInvite baseInvite)
    {
        List<BaseInvite> list = baseInviteService.selectBaseInviteList(baseInvite);
        ExcelUtil<BaseInvite> util = new ExcelUtil<BaseInvite>(BaseInvite.class);
        util.exportExcel(response, list, "邀请审稿数据");
    }

    /**
     * 获取邀请审稿详细信息
     */
//    @RequiresPermissions("base:invite:query")
    @GetMapping(value = "/{inviteId}")
    public AjaxResult getInfo(@PathVariable("inviteId") Long inviteId)
    {
        return success(baseInviteService.selectBaseInviteByInviteId(inviteId));
    }

    /**
     * 新增邀请审稿
     */
//    @RequiresPermissions("base:invite:add")
    @Log(title = "邀请审稿", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BaseInviteDto baseInviteDto)
    {
        return toAjax(baseInviteService.insertBaseInviteDto(baseInviteDto));
    }

    /**
     * 修改邀请审稿
     */
//    @RequiresPermissions("base:invite:edit")
//    @Log(title = "邀请审稿", businessType = BusinessType.UPDATE)
//    @PutMapping
//    public AjaxResult edit(@RequestBody BaseInvite baseInvite)
//    {
//        return toAjax(baseInviteService.updateBaseInvite(baseInvite));
//    }
    @Log(title = "邀请审稿", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BaseInviteDto baseInviteDto)
    {
        return toAjax(baseInviteService.updateBaseInviteDto(baseInviteDto));
    }

    /**
     * 删除邀请审稿
     */
//    @RequiresPermissions("base:invite:remove")
    @Log(title = "邀请审稿", businessType = BusinessType.DELETE)
	@DeleteMapping("/{inviteIds}")
    public AjaxResult remove(@PathVariable Long[] inviteIds)
    {
        return toAjax(baseInviteService.deleteBaseInviteByInviteIds(inviteIds));
    }
}
