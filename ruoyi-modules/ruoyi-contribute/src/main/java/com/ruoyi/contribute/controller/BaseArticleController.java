package com.ruoyi.contribute.controller;

import com.ruoyi.contribute.domain.BaseArticle;
import com.ruoyi.contribute.dto.BaseArticleDto;
import com.ruoyi.contribute.service.IBaseArticleService;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.web.page.TableDataInfo;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 文章管理Controller
 * 
 * @author null
 * @date 2023-11-07
 */
@RestController
@RequestMapping("/article")
public class BaseArticleController extends BaseController
{
    @Autowired
    private IBaseArticleService baseArticleService;

    /**
     * 根据id查论文
     */
    @GetMapping({"/getById/{id}"})
    public BaseArticle getById(@PathVariable Long id){
        return baseArticleService.selectBaseArticleByArticleId(id);
    }

    /**
     * 根据会议id查论文
     * @param conferenceId
     * @return
     */
    @GetMapping("/getList/{conferenceId}")
    public List<BaseArticle> selectBaseArticleListByConferenceId(@PathVariable("conferenceId")Long conferenceId){
        BaseArticle baseArticle = new BaseArticle();
        baseArticle.setConferenceId(conferenceId);
        return baseArticleService.selectBaseArticleListByConferenceId(baseArticle);
    }


    /**
     * 查询文章管理列表
     */
    //@RequiresPermissions("base:article:list")
//    @GetMapping("/list")
//    public TableDataInfo list(BaseArticle baseArticle)
//    {
//        startPage();
//        List<BaseArticle> list = baseArticleService.selectBaseArticleList(baseArticle);
//        return getDataTable(list);
//    }

    @GetMapping("/list")
    public TableDataInfo list(BaseArticle baseArticle)
    {
        startPage();
        List<BaseArticle> list = baseArticleService.selectBaseArticleList(baseArticle);
        return getDataTable(list);
    }

    @GetMapping("/myList")
    public TableDataInfo myList(BaseArticle baseArticle)
    {
        startPage();
        List<BaseArticle> list = baseArticleService.selectBaseMyArticleList(baseArticle);
        return getDataTable(list);
    }



    /**
     * 导出文章管理列表
     */
    //@RequiresPermissions("base:article:export")
    @Log(title = "文章管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BaseArticle baseArticle)
    {
        List<BaseArticle> list = baseArticleService.selectBaseArticleList(baseArticle);
        ExcelUtil<BaseArticle> util = new ExcelUtil<BaseArticle>(BaseArticle.class);
        util.exportExcel(response, list, "文章管理数据");
    }

    /**
     * 获取文章管理详细信息
     */
    //@RequiresPermissions("base:article:query")
    @GetMapping(value = "/{articleId}")
    public AjaxResult getInfo(@PathVariable("articleId") Long articleId)
    {
        return success(baseArticleService.selectBaseArticleByArticleId(articleId));
    }

    /**
     * 新增文章管理
     */
    //@RequiresPermissions("base:article:add")
//    @Log(title = "文章管理", businessType = BusinessType.INSERT)
//    @PostMapping
//    public AjaxResult add(@RequestBody BaseArticle baseArticle)
//    {
//        return toAjax(baseArticleService.insertBaseArticle(baseArticle));
//    }

    @Log(title = "文章管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BaseArticleDto baseArticleDto)
    {
        return toAjax(baseArticleService.insertBaseArticleDto(baseArticleDto));
    }

    /**
     * 修改文章管理
     */
    //@RequiresPermissions("base:article:edit")
    @Log(title = "文章管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BaseArticleDto baseArticleDto)
    {
        return toAjax(baseArticleService.updateBaseArticleDto(baseArticleDto));
    }

    @PutMapping("/update")
    public int update(@RequestBody BaseArticle baseArticle)
    {
        return baseArticleService.updateBaseArticle(baseArticle);
    }

    /**
     * 删除文章管理
     */
    //@RequiresPermissions("base:article:remove")
    @Log(title = "文章管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{articleIds}")
    public AjaxResult remove(@PathVariable Long[] articleIds)
    {
        return toAjax(baseArticleService.deleteBaseArticleByArticleIds(articleIds));
    }
}
