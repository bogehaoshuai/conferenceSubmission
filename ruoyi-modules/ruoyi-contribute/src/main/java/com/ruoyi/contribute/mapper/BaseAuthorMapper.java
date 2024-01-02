package com.ruoyi.contribute.mapper;

import java.util.List;
import com.ruoyi.contribute.domain.BaseAuthor;

/**
 * 作者信息Mapper接口
 * 
 * @author null
 * @date 2023-11-18
 */
public interface BaseAuthorMapper 
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
     * 删除作者信息
     * 
     * @param authorId 作者信息主键
     * @return 结果
     */
    public int deleteBaseAuthorByAuthorId(Long authorId);

    /**
     * 批量删除作者信息
     * 
     * @param authorIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBaseAuthorByAuthorIds(Long[] authorIds);
}
