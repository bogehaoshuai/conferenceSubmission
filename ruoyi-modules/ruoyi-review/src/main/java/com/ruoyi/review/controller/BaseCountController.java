package com.ruoyi.review.controller;

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
import com.ruoyi.review.domain.BaseCount;
import com.ruoyi.review.service.IBaseCountService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 审稿数量Controller
 * 
 * @author null
 * @date 2023-11-19
 */
@RestController
@RequestMapping("/count")
public class BaseCountController extends BaseController
{
    @Autowired
    private IBaseCountService baseCountService;

    /**
     * 查询审稿数量列表
     */
    @RequiresPermissions("review:count:list")
    @GetMapping("/list")
    public TableDataInfo list(BaseCount baseCount)
    {
        startPage();
        List<BaseCount> list = baseCountService.selectBaseCountList(baseCount);
        return getDataTable(list);
    }

    /**
     * 导出审稿数量列表
     */
    @RequiresPermissions("review:count:export")
    @Log(title = "审稿数量", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BaseCount baseCount)
    {
        List<BaseCount> list = baseCountService.selectBaseCountList(baseCount);
        ExcelUtil<BaseCount> util = new ExcelUtil<BaseCount>(BaseCount.class);
        util.exportExcel(response, list, "审稿数量数据");
    }

    /**
     * 获取审稿数量详细信息
     */
    @RequiresPermissions("review:count:query")
    @GetMapping(value = "/{countId}")
    public AjaxResult getInfo(@PathVariable("countId") Long countId)
    {
        return success(baseCountService.selectBaseCountByCountId(countId));
    }

    /**
     * 新增审稿数量
     */
    @RequiresPermissions("review:count:add")
    @Log(title = "审稿数量", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BaseCount baseCount)
    {
        return toAjax(baseCountService.insertBaseCount(baseCount));
    }

    /**
     * 修改审稿数量
     */
    @RequiresPermissions("review:count:edit")
    @Log(title = "审稿数量", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BaseCount baseCount)
    {
        return toAjax(baseCountService.updateBaseCount(baseCount));
    }

    /**
     * 删除审稿数量
     */
    @RequiresPermissions("review:count:remove")
    @Log(title = "审稿数量", businessType = BusinessType.DELETE)
	@DeleteMapping("/{countIds}")
    public AjaxResult remove(@PathVariable Long[] countIds)
    {
        return toAjax(baseCountService.deleteBaseCountByCountIds(countIds));
    }
}
