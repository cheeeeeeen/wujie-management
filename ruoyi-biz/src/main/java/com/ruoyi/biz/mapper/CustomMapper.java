package com.ruoyi.biz.mapper;


import com.ruoyi.biz.domain.entity.Custom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Custom row);

    Custom getCustom(@Param("name") String name, @Param("phone") String phone);

    int insertSelective(Custom row);

    Custom selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Custom row);

    int updateByPrimaryKey(Custom row);

    List<Custom> listCustom(Custom custom);

}