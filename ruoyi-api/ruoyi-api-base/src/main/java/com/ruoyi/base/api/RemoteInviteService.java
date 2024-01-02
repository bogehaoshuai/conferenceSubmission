package com.ruoyi.base.api;

import com.ruoyi.base.api.domain.BaseInvite;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@FeignClient(value = "ruoyi-base", contextId = "server3")
public interface RemoteInviteService {
    @RequestMapping("/invite/getList/{conferenceId}")
    public List<BaseInvite> getInviteById(@PathVariable("conferenceId")Long conferenceId);

}
