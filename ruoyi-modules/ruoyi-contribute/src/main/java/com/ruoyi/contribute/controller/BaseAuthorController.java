package com.ruoyi.contribute.controller;

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
import com.ruoyi.contribute.domain.BaseAuthor;
import com.ruoyi.contribute.service.IBaseAuthorService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 作者信息Controller
 * 
 * @author null
 * @date 2023-11-18
 */
@RestController
@RequestMapping("/author")
public class BaseAuthorController extends BaseController
{
    @Autowired
    private IBaseAuthorService baseAuthorService;

    /**
     * 查询作者信息列表
     */
    @RequiresPermissions("base:article:list")
    @GetMapping("/list")
    public TableDataInfo list(BaseAuthor baseAuthor)
    {
        startPage();
        List<BaseAuthor> list = baseAuthorService.selectBaseAuthorList(baseAuthor);
        return getDataTable(list);
    }

    /**
     * 导出作者信息列表
     */
    //@RequiresPermissions("contribute:author:export")
    @Log(title = "作者信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BaseAuthor baseAuthor)
    {
        List<BaseAuthor> list = baseAuthorService.selectBaseAuthorList(baseAuthor);
        ExcelUtil<BaseAuthor> util = new ExcelUtil<BaseAuthor>(BaseAuthor.class);
        util.exportExcel(response, list, "作者信息数据");
    }

    /**
     * 获取作者信息详细信息
     */
    //@RequiresPermissions("contribute:author:query")
    @GetMapping(value = "/{authorId}")
    public AjaxResult getInfo(@PathVariable("authorId") Long authorId)
    {
        return success(baseAuthorService.selectBaseAuthorByAuthorId(authorId));
    }

    /**
     * 新增作者信息
     */
    //@RequiresPermissions("contribute:author:add")
    @Log(title = "作者信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BaseAuthor baseAuthor)
    {
        return toAjax(baseAuthorService.insertBaseAuthor(baseAuthor));
    }

    /**
     * 修改作者信息
     */
    //@RequiresPermissions("contribute:author:edit")
    @Log(title = "作者信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BaseAuthor baseAuthor)
    {
        return toAjax(baseAuthorService.updateBaseAuthor(baseAuthor));
    }

    /**
     * 删除作者信息
     */
    //@RequiresPermissions("contribute:author:remove")
    @Log(title = "作者信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{authorIds}")
    public AjaxResult remove(@PathVariable Long[] authorIds)
    {
        return toAjax(baseAuthorService.deleteBaseAuthorByAuthorIds(authorIds));
    }
}
