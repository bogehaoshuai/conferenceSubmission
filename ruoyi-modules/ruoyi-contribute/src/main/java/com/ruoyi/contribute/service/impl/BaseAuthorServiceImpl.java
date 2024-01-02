package com.ruoyi.contribute.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.contribute.mapper.BaseAuthorMapper;
import com.ruoyi.contribute.domain.BaseAuthor;
import com.ruoyi.contribute.service.IBaseAuthorService;

/**
 * 作者信息Service业务层处理
 * 
 * @author null
 * @date 2023-11-18
 */
@Service
public class BaseAuthorServiceImpl implements IBaseAuthorService 
{
    @Autowired
    private BaseAuthorMapper baseAuthorMapper;

    /**
     * 查询作者信息
     * 
     * @param authorId 作者信息主键
     * @return 作者信息
     */
    @Override
    public BaseAuthor selectBaseAuthorByAuthorId(Long authorId)
    {
        return baseAuthorMapper.selectBaseAuthorByAuthorId(authorId);
    }

    /**
     * 查询作者信息列表
     * 
     * @param baseAuthor 作者信息
     * @return 作者信息
     */
    @Override
    public List<BaseAuthor> selectBaseAuthorList(BaseAuthor baseAuthor)
    {
        return baseAuthorMapper.selectBaseAuthorList(baseAuthor);
    }

    /**
     * 新增作者信息
     * 
     * @param baseAuthor 作者信息
     * @return 结果
     */
    @Override
    public int insertBaseAuthor(BaseAuthor baseAuthor)
    {
        return baseAuthorMapper.insertBaseAuthor(baseAuthor);
    }

    /**
     * 修改作者信息
     * 
     * @param baseAuthor 作者信息
     * @return 结果
     */
    @Override
    public int updateBaseAuthor(BaseAuthor baseAuthor)
    {
        return baseAuthorMapper.updateBaseAuthor(baseAuthor);
    }

    /**
     * 批量删除作者信息
     * 
     * @param authorIds 需要删除的作者信息主键
     * @return 结果
     */
    @Override
    public int deleteBaseAuthorByAuthorIds(Long[] authorIds)
    {
        return baseAuthorMapper.deleteBaseAuthorByAuthorIds(authorIds);
    }

    /**
     * 删除作者信息信息
     * 
     * @param authorId 作者信息主键
     * @return 结果
     */
    @Override
    public int deleteBaseAuthorByAuthorId(Long authorId)
    {
        return baseAuthorMapper.deleteBaseAuthorByAuthorId(authorId);
    }
}
