package com.ruoyi.review.controller;

import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.review.domain.BaseAllocation;
import com.ruoyi.review.service.IBaseAllocationService;
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
import com.ruoyi.review.domain.BaseRebuttal;
import com.ruoyi.review.service.IBaseRebuttalService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * rebuttalController
 * 
 * @author null
 * @date 2023-11-19
 */
@RestController
@RequestMapping("/rebuttal")
public class BaseRebuttalController extends BaseController
{
    @Autowired
    private IBaseRebuttalService baseRebuttalService;

    @Autowired
    private IBaseAllocationService baseAllocationService;

    /**
     * 查询rebuttal列表
     */
    @RequiresPermissions("review:rebuttal:list")
    @GetMapping("/list")
    public TableDataInfo list(BaseRebuttal baseRebuttal)
    {
        startPage();
        List<BaseRebuttal> list = baseRebuttalService.selectBaseRebuttalList(baseRebuttal);
        return getDataTable(list);
    }

    @GetMapping("/getByArticleId/{id}")
    public TableDataInfo getByArticleId(@PathVariable("id") long id)
    {
        BaseRebuttal baseRebuttal = new BaseRebuttal();
        baseRebuttal.setArticleId(id);
        List<BaseRebuttal> list = baseRebuttalService.selectBaseRebuttalList(baseRebuttal);
        return getDataTable(list);
    }

    /**
     * 导出rebuttal列表
     */
    @RequiresPermissions("review:rebuttal:export")
    @Log(title = "rebuttal", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BaseRebuttal baseRebuttal)
    {
        List<BaseRebuttal> list = baseRebuttalService.selectBaseRebuttalList(baseRebuttal);
        ExcelUtil<BaseRebuttal> util = new ExcelUtil<BaseRebuttal>(BaseRebuttal.class);
        util.exportExcel(response, list, "rebuttal数据");
    }

    /**
     * 获取rebuttal详细信息
     */
    @RequiresPermissions("review:rebuttal:query")
    @GetMapping(value = "/{rebuttalId}")
    public AjaxResult getInfo(@PathVariable("rebuttalId") Long rebuttalId)
    {
        return success(baseRebuttalService.selectBaseRebuttalByRebuttalId(rebuttalId));
    }

    /**
     * 新增rebuttal
     */
    //@RequiresPermissions("review:rebuttal:add")
    @Log(title = "rebuttal", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BaseRebuttal baseRebuttal)
    {
        //获取增加rebuttal的稿件id
        Long articleId = baseRebuttal.getArticleId();

        //将该稿件的审核状态码重新置为未审核
        BaseAllocation baseAllocation = new BaseAllocation();
        baseAllocation.setArticleId(articleId);
        baseAllocation.setReviewStatusCode(Long.valueOf(2));
        baseAllocation.setReviewStatusName("rebuttal");
        System.out.println(baseRebuttal);
        System.out.println(baseAllocation);
        baseAllocationService.updateBaseAllocationByArticleId(baseAllocation);

        return toAjax(baseRebuttalService.insertBaseRebuttal(baseRebuttal));
    }

    /**
     * 修改rebuttal
     */
    @RequiresPermissions("review:rebuttal:edit")
    @Log(title = "rebuttal", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BaseRebuttal baseRebuttal)
    {
        return toAjax(baseRebuttalService.updateBaseRebuttal(baseRebuttal));
    }

    /**
     * 删除rebuttal
     */
    @RequiresPermissions("review:rebuttal:remove")
    @Log(title = "rebuttal", businessType = BusinessType.DELETE)
	@DeleteMapping("/{rebuttalIds}")
    public AjaxResult remove(@PathVariable Long[] rebuttalIds)
    {
        return toAjax(baseRebuttalService.deleteBaseRebuttalByRebuttalIds(rebuttalIds));
    }
}
