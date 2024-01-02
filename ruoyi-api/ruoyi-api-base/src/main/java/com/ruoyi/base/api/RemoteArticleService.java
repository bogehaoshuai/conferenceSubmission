package com.ruoyi.base.api;

import com.ruoyi.base.api.domain.BaseArticle;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@FeignClient(value="ruoyi-contribute", contextId = "server2")
public interface RemoteArticleService {
    @RequestMapping("/article/getById/{id}")
    public BaseArticle getArticleById(@PathVariable("id")Long id);

    @RequestMapping("/article/getList/{conferenceId}")
    public List<BaseArticle> getArticleListByConferenceId(@PathVariable("conferenceId")Long conferenceId);

    @PutMapping("/article/update")
    public int update(@RequestBody BaseArticle baseArticle);
}
