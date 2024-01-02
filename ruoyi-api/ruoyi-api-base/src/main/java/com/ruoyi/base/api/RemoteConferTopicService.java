package com.ruoyi.base.api;

import com.ruoyi.base.api.domain.BaseConferTopic;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@FeignClient(value="ruoyi-base",contextId = "server5")
public interface RemoteConferTopicService {
    @RequestMapping("/topic/getTopicByCode/{topicCode}")
    public BaseConferTopic getTopicByCode(@PathVariable("topicCode")Long Code);
    @RequestMapping("/topic/listByConference/{conferenceId}")
    public List<BaseConferTopic> listByConference(@PathVariable("conferenceId") Long conferenceId);
}
