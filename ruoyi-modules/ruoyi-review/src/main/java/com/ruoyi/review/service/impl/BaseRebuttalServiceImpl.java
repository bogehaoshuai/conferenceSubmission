package com.ruoyi.review.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.review.mapper.BaseRebuttalMapper;
import com.ruoyi.review.domain.BaseRebuttal;
import com.ruoyi.review.service.IBaseRebuttalService;

/**
 * rebuttalService业务层处理
 * 
 * @author null
 * @date 2023-11-19
 */
@Service
public class BaseRebuttalServiceImpl implements IBaseRebuttalService 
{
    @Autowired
    private BaseRebuttalMapper baseRebuttalMapper;

    /**
     * 查询rebuttal
     * 
     * @param rebuttalId rebuttal主键
     * @return rebuttal
     */
    @Override
    public BaseRebuttal selectBaseRebuttalByRebuttalId(Long rebuttalId)
    {
        return baseRebuttalMapper.selectBaseRebuttalByRebuttalId(rebuttalId);
    }

    /**
     * 根据论文查寻rebuttal
     * @param articleId
     * @return
     */
    @Override
    public BaseRebuttal selectBaseRebuttalByArticleId(Long articleId)
    {
        return baseRebuttalMapper.selectBaseRebuttalByArticleId(articleId);
    }

    /**
     * 查询rebuttal列表
     * 
     * @param baseRebuttal rebuttal
     * @return rebuttal
     */
    @Override
    public List<BaseRebuttal> selectBaseRebuttalList(BaseRebuttal baseRebuttal)
    {
        return baseRebuttalMapper.selectBaseRebuttalList(baseRebuttal);
    }

    /**
     * 新增rebuttal
     * 
     * @param baseRebuttal rebuttal
     * @return 结果
     */
    @Override
    public int insertBaseRebuttal(BaseRebuttal baseRebuttal)
    {
        return baseRebuttalMapper.insertBaseRebuttal(baseRebuttal);
    }

    /**
     * 修改rebuttal
     * 
     * @param baseRebuttal rebuttal
     * @return 结果
     */
    @Override
    public int updateBaseRebuttal(BaseRebuttal baseRebuttal)
    {
        return baseRebuttalMapper.updateBaseRebuttal(baseRebuttal);
    }

    /**
     * 批量删除rebuttal
     * 
     * @param rebuttalIds 需要删除的rebuttal主键
     * @return 结果
     */
    @Override
    public int deleteBaseRebuttalByRebuttalIds(Long[] rebuttalIds)
    {
        return baseRebuttalMapper.deleteBaseRebuttalByRebuttalIds(rebuttalIds);
    }

    /**
     * 删除rebuttal信息
     * 
     * @param rebuttalId rebuttal主键
     * @return 结果
     */
    @Override
    public int deleteBaseRebuttalByRebuttalId(Long rebuttalId)
    {
        return baseRebuttalMapper.deleteBaseRebuttalByRebuttalId(rebuttalId);
    }
}
