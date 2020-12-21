package com.wking.mapper;

import com.wking.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * @author Wking
 * @create 2020-12-15 15:56
 */
@Mapper
@Repository
public interface userMapper {
    public int register(User u);
    public User login(User u);
}
