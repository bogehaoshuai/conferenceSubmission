package com.ruoyi.review.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.base.api.RemoteArticleService;
import com.ruoyi.base.api.domain.BaseInvite;
import com.ruoyi.common.security.utils.SecurityUtils;
import com.ruoyi.base.api.domain.BaseArticle;
import com.ruoyi.review.domain.BaseRebuttal;
import com.ruoyi.review.dto.AllocationDto;
import com.ruoyi.review.service.IBaseRebuttalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.review.mapper.BaseAllocationMapper;
import com.ruoyi.review.domain.BaseAllocation;
import com.ruoyi.review.service.IBaseAllocationService;

/**
 * 稿件分配Service业务层处理
 * 
 * @author null
 * @date 2023-11-19
 */
@Service
public class BaseAllocationServiceImpl implements IBaseAllocationService 
{
    @Autowired
    private BaseAllocationMapper baseAllocationMapper;

    @Autowired
    private IBaseRebuttalService baseRebuttalService;

    @Autowired
    private RemoteArticleService articleService;


    /**
     * 查询稿件分配
     * 
     * @param allocationId 稿件分配主键
     * @return 稿件分配
     */
    @Override
    public BaseAllocation selectBaseAllocationByAllocationId(Long allocationId)
    {
        return baseAllocationMapper.selectBaseAllocationByAllocationId(allocationId);
    }

    /**
     * 查询稿件分配列表
     * 
     * @param baseAllocation 稿件分配
     * @return 稿件分配
     */
    @Override
    public List<AllocationDto> selectBaseAllocationDtoList(BaseAllocation baseAllocation)
    {
        baseAllocation.setPcId(SecurityUtils.getUserId());
        List<BaseAllocation> baseAllocations = baseAllocationMapper.selectBaseAllocationList(baseAllocation);
        List<AllocationDto> allocationDtoList = new ArrayList<AllocationDto>();
        for (BaseAllocation allocation : baseAllocations) {
            //基础属性赋值
            AllocationDto allocationDto = new AllocationDto();
            allocationDto.setAllocationId(allocation.getAllocationId());
            allocationDto.setArticleName(allocation.getArticleName());
            allocationDto.setScoreCode(allocation.getScoreCode());
            allocationDto.setReviewStatusCode(allocation.getReviewStatusCode());
            allocationDto.setReviewStatusName(allocation.getReviewStatusName());
            allocationDto.setConfidenceCode(allocation.getConfidenceCode());
            allocationDto.setComment(allocation.getComment());
            allocationDto.setPcId(allocation.getPcId());
            allocationDto.setArticleId(allocation.getArticleId());

            //调用远程服务，填入论文摘要及文件地址
            BaseArticle article = articleService.getArticleById(allocation.getArticleId());
            allocationDto.setArticleAbstract(article.getArticleAbstract());
            allocationDto.setArticlePath(article.getArticle());

            //填入rebuttal
            BaseRebuttal baseRebuttal = baseRebuttalService.selectBaseRebuttalByArticleId(allocation.getArticleId());
            if(baseRebuttal != null){
                allocationDto.setRebuttalMessage(baseRebuttal.getRebuttalMessage());
            }

            allocationDtoList.add(allocationDto);
        }
        System.out.println(allocationDtoList);
        return allocationDtoList;
        //return baseAllocationMapper.selectBaseAllocationList(baseAllocation);
    }


    @Override
    public int allocationByInviteAndArticle(List<BaseInvite> inviteList, List<BaseArticle> articleList) {
        int paperIndex = 0;
        int pcNum = 0;
        while (paperIndex < articleList.size()) {
            for (BaseInvite baseInvite: inviteList) {
                BaseArticle baseArticle = articleList.get(paperIndex);
                if (paperIndex < articleList.size()) {
                    //pcMember.assignPaper(papers.get(paperIndex));
                    BaseAllocation baseAllocation = new BaseAllocation();
                    baseAllocation.setPcId(baseInvite.getPcId());
                    baseAllocation.setPcName(baseInvite.getPcName());
                    baseAllocation.setArticleId(baseArticle.getArticleId());
                    baseAllocation.setArticleName(baseArticle.getArticleName());
                    baseAllocation.setReviewStatusCode(0L);
                    baseAllocation.setReviewStatusName("待审稿");
                    insertBaseAllocation(baseAllocation);
                    pcNum++;
                    if(pcNum == 3){
                        pcNum = 0;
                        paperIndex++;
                        baseArticle.setArticleStatusCode(2L);
                        baseArticle.setArticleStatusName("待审稿");
                        articleService.update(baseArticle);
                        if(paperIndex == articleList.size())
                            break;
                    }
                }
            }
        }
        return 0;
    }

    @Override
    public List<BaseAllocation> selectBaseAllocationList(BaseAllocation baseAllocation){
        return baseAllocationMapper.selectBaseAllocationList(baseAllocation);
    }



    /**
     * 新增稿件分配
     * 
     * @param baseAllocation 稿件分配
     * @return 结果
     */
    @Override
    public int insertBaseAllocation(BaseAllocation baseAllocation)
    {
        return baseAllocationMapper.insertBaseAllocation(baseAllocation);
    }

    /**
     * 修改稿件分配
     * 
     * @param baseAllocation 稿件分配
     * @return 结果
     */
    @Override
    public int updateBaseAllocation(BaseAllocation baseAllocation)
    {
        int count = baseAllocationMapper.updateBaseAllocation(baseAllocation);
        System.out.println("hello");
        Long articleId = baseAllocation.getArticleId();
        //全部审稿人审完稿件，则修改稿件状态
        BaseAllocation articleAllocation = new BaseAllocation();
        articleAllocation.setArticleId(articleId);
        boolean isReviewFinished = true;
        boolean isAccepted = true;
        boolean isRebuttalExisted = true;
        for (BaseAllocation allocation : baseAllocationMapper.selectBaseAllocationList(articleAllocation)) {
            if(Long.valueOf(0).equals(allocation.getReviewStatusCode())){
                isReviewFinished = false;
                break;
            }
            if(allocation.getScoreCode().longValue() < 0){
                isAccepted = false;
            }
        }
        System.out.println("isreviewed:" + isReviewFinished);
        System.out.println("isaccepted:" + isAccepted);
        //审稿完成修改状态码，否则不改
        if(isReviewFinished == true){
            BaseArticle baseArticle = new BaseArticle();
            baseArticle.setArticleId(articleId);
            System.out.println(baseArticle);
            //文章录用 code=4
            if(isAccepted == true){
                //根据id修改状态码
                baseArticle.setArticleStatusCode(Long.valueOf(4));
                baseArticle.setArticleStatusName("已录用");
            }
            else{
                //查看是否存在rebuttal
                BaseRebuttal baseRebuttal = baseRebuttalService.selectBaseRebuttalByArticleId(articleId);
                System.out.println(baseRebuttal);
                if(baseRebuttal == null){
                    isRebuttalExisted = false;
                }
                if(isRebuttalExisted == true){
                    //不录用 code=99
                    baseArticle.setArticleStatusCode(Long.valueOf(99));
                    baseArticle.setArticleStatusName("不录用");
                }else {
                    //rebuttal code=3
                    baseArticle.setArticleStatusCode(Long.valueOf(3));
                    baseArticle.setArticleStatusName("rebuttal");
                }
            }
            //调用feign修改状态码
            articleService.update(baseArticle);
        }
        return count;
    }

    @Override
    public int updateBaseAllocationByArticleId(BaseAllocation baseAllocation){
        return baseAllocationMapper.updateBaseAllocationByArticleId(baseAllocation);
    }

    /**
     * 批量删除稿件分配
     * 
     * @param allocationIds 需要删除的稿件分配主键
     * @return 结果
     */
    @Override
    public int deleteBaseAllocationByAllocationIds(Long[] allocationIds)
    {
        return baseAllocationMapper.deleteBaseAllocationByAllocationIds(allocationIds);
    }

    /**
     * 删除稿件分配信息
     * 
     * @param allocationId 稿件分配主键
     * @return 结果
     */
    @Override
    public int deleteBaseAllocationByAllocationId(Long allocationId)
    {
        return baseAllocationMapper.deleteBaseAllocationByAllocationId(allocationId);
    }
}
