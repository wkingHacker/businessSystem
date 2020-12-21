package com.wking;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author Wking
 * @create 2020-12-14 17:05
 */
@SpringBootApplication
@MapperScan("com.wking.mapper")
public class appMain {
    public static void main(String[] args) {
        SpringApplication.run(appMain.class,args);
    }
}
