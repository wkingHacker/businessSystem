package com.wking.mapper;

import com.wking.pojo.Car;
import com.wking.pojo.Order;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Wking
 * @create 2020-12-15 14:50
 */
@Mapper
@Repository
public interface orderMapper {
public  void insertOrder(Order order);
public Order selectByoid(String oid);
public List<String> selectOidByUid(int uid);
}
