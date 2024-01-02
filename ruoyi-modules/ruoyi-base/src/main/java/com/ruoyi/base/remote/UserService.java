package com.ruoyi.base.remote;

import com.ruoyi.system.api.domain.SysUser;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@FeignClient(value="ruoyi-system")
public interface UserService {
    @RequestMapping("/user/getUserById/{userId}")
    public SysUser getUserById(@PathVariable("userId")Long id);
}
