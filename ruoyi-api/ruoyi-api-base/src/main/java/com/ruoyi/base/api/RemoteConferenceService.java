package com.ruoyi.base.api;

import com.ruoyi.base.api.domain.BaseConference;
import com.ruoyi.common.core.web.domain.AjaxResult;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(value = "ruoyi-base", contextId = "server4")
public interface RemoteConferenceService {
    @PutMapping("/conference")
    public AjaxResult edit(@RequestBody BaseConference baseConference);

}
