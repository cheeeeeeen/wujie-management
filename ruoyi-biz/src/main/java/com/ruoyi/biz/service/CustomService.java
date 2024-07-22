package com.ruoyi.biz.service;


import com.ruoyi.biz.domain.entity.Custom;

import java.util.List;

/**
*
*/
public interface CustomService {

    public Boolean insert(Custom custom);

    public Boolean update(Custom custom);

    public Custom getCustomById(Long id);

    public int deleteById(Long id);

    List<Custom> listCustom(Custom custom);
}