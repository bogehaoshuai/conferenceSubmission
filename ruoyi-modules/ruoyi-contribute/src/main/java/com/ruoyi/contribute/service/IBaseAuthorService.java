package com.ruoyi.contribute.service;

import java.util.List;
import com.ruoyi.contribute.domain.BaseAuthor;

/**
 * 作者信息Service接口
 * 
 * @author null
 * @date 2023-11-18
 */
public interface IBaseAuthorService 
{
    /**
     * 查询作者信息
     * 
     * @param authorId 作者信息主键
     * @return 作者信息
     */
    public BaseAuthor selectBaseAuthorByAuthorId(Long authorId);

    /**
     * 查询作者信息列表
     * 
     * @param baseAuthor 作者信息
     * @return 作者信息集合
     */
    public List<BaseAuthor> selectBaseAuthorList(BaseAuthor baseAuthor);

    /**
     * 新增作者信息
     * 
     * @param baseAuthor 作者信息
     * @return 结果
     */
    public int insertBaseAuthor(BaseAuthor baseAuthor);

    /**
     * 修改作者信息
     * 
     * @param baseAuthor 作者信息
     * @return 结果
     */
    public int updateBaseAuthor(BaseAuthor baseAuthor);

    /**
     * 批量删除作者信息
     * 
     * @param authorIds 需要删除的作者信息主键集合
     * @return 结果
     */
    public int deleteBaseAuthorByAuthorIds(Long[] authorIds);

    /**
     * 删除作者信息信息
     * 
     * @param authorId 作者信息主键
     * @return 结果
     */
    public int deleteBaseAuthorByAuthorId(Long authorId);
}
