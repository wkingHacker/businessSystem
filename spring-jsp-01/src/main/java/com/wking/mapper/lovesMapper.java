package com.wking.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Wking
 * @create 2020-12-17 11:40
 */
@Mapper
@Repository
public interface lovesMapper {
    void insert(int cid,int uid);
    List<Integer> select(int uid);
}
