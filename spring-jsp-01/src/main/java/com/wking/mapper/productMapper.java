package com.wking.mapper;

import com.wking.pojo.Goods;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Wking
 * @create 2020-12-14 16:50
 */
@Mapper
@Repository
public interface productMapper {
    List<Goods> findall();
    Goods getGoodsById(int pid);
    List<Goods> findByCid(int cid);
}
