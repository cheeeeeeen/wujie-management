package com.ruoyi.biz.service.impl;


import cn.hutool.core.util.PhoneUtil;
import com.ruoyi.biz.domain.entity.Custom;
import com.ruoyi.biz.mapper.CustomMapper;
import com.ruoyi.biz.service.CustomService;
import com.ruoyi.common.enums.YesNoEnum;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 *
 */
@Service
public class CustomServiceImpl implements CustomService {

    @Autowired
    private CustomMapper customMapper;

    public Boolean insert(Custom custom) {
        Custom entity = customMapper.getCustom(custom.getName(), custom.getPhone());
        if (Objects.nonNull(entity)) {
            throw new ServiceException("用户名称或手机号已存在");
        }
        if (!PhoneUtil.isPhone(custom.getPhone())) {
            throw new ServiceException("请输入正确的手机号");
        }
        custom.setDel(YesNoEnum.NO.getValue().toString());
        //获取登录信息
        custom.setCreateBy(SecurityUtils.getLoginUser().getUsername());
        return customMapper.insert(custom) > 0;
    }

    public Boolean update(Custom custom) {
        Custom entity = customMapper.getCustom(custom.getName(), custom.getPhone());
        if (Objects.nonNull(entity) && !entity.getId().equals(custom.getId())) {
            throw new ServiceException("用户名称或手机号已存在");
        }
        if (!PhoneUtil.isPhone(custom.getPhone())) {
            throw new ServiceException("请输入正确的手机号");
        }

        custom.setUpdateBy(SecurityUtils.getLoginUser().getUsername());
        custom.setUpdateTime(new Date());
        return customMapper.updateByPrimaryKeySelective(custom)>0;
    }

    public Custom getCustomById(Long id) {
        return customMapper.selectByPrimaryKey(id);
    }

    public int deleteById(Long id) {
        return customMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<Custom> listCustom(Custom custom) {
        return customMapper.listCustom(custom);
    }
}