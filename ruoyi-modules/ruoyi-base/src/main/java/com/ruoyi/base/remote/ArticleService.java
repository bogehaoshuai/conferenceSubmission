package com.ruoyi.base.remote;


import com.ruoyi.base.domain.BaseArticle;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@FeignClient(value="ruoyi-contribute", contextId = "server1")
public interface ArticleService {

    @RequestMapping("/article/getList/{conferenceId}")
    public List<BaseArticle> getArticleListByConferenceId(@PathVariable("conferenceId")Long conferenceId);
}
