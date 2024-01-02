package com.ruoyi.review;

import com.ruoyi.common.security.annotation.EnableCustomConfig;
import com.ruoyi.common.security.annotation.EnableRyFeignClients;
import com.ruoyi.common.swagger.annotation.EnableCustomSwagger2;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class RuoYiReviewApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(RuoYiReviewApplication.class, args);

    }
}
