package com.wking.mapper;

import com.wking.pojo.OrderItem;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Wking
 * @create 2020-12-15 14:59
 */
@Mapper
@Repository
public interface orderItemMapper {
    public void add(@Param("oid") String oid, @Param("o") OrderItem items);
    public List<OrderItem> selectpidByoid(String oid);
}
