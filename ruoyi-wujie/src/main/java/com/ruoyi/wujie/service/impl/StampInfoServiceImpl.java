package com.ruoyi.wujie.service.impl;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.wujie.domain.StampInfo;
import com.ruoyi.wujie.mapper.StampInfoMapper;
import com.ruoyi.wujie.service.IStampInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 盖章中心Service业务层处理
 *
 * @author myh
 * @date 2023-12-26
 */
@Service
public class StampInfoServiceImpl implements IStampInfoService
{
    @Autowired
    private StampInfoMapper stampInfoMapper;

    /**
     * 查询盖章中心
     *
     * @param stampId 盖章中心主键
     * @return 盖章中心
     */
    @Override
    public StampInfo selectStampInfoByStampId(Long stampId)
    {
        StampInfo response = stampInfoMapper.selectStampInfoByStampId(stampId);
        if(response == null) {
            return null;
        }
        String username = SecurityUtils.getLoginUser().getUsername();
        if(!username.equals(response.getCreator()) && !username.equals("administrator") && !username.equals("admin")) {
            throw new ServiceException("您无权限查看该盖章申请！");
        }
        return response;
    }

    /**
     * 查询盖章中心列表
     *
     * @param stampInfo 盖章中心
     * @return 盖章中心
     */
    @Override
    public List<StampInfo> selectStampInfoList(StampInfo stampInfo)
    {
        String username = SecurityUtils.getLoginUser().getUsername();
        if(!username.equals("administrator") && !username.equals("admin")) {
            stampInfo.setCreator(SecurityUtils.getLoginUser().getUsername());
        }
        return stampInfoMapper.selectStampInfoList(stampInfo);
    }

    /**
     * 新增盖章中心
     *
     * @param stampInfo 盖章中心
     * @return 结果
     */
    @Override
    public int insertStampInfo(StampInfo stampInfo)
    {
        stampInfo.setCreateTime(DateUtils.getNowDate());
        stampInfo.setCreator(SecurityUtils.getLoginUser().getUsername());
        return stampInfoMapper.insertStampInfo(stampInfo);
    }

    /**
     * 修改盖章中心
     *
     * @param stampInfo 盖章中心
     * @return 结果
     */
    @Override
    public int updateStampInfo(StampInfo stampInfo)
    {
        stampInfo.setUpdateTime(DateUtils.getNowDate());
        return stampInfoMapper.updateStampInfo(stampInfo);
    }

    /**
     * 批量删除盖章中心
     *
     * @param stampIds 需要删除的盖章中心主键
     * @return 结果
     */
    @Override
    public int deleteStampInfoByStampIds(Long[] stampIds)
    {
        return stampInfoMapper.deleteStampInfoByStampIds(stampIds);
    }

    /**
     * 删除盖章中心信息
     *
     * @param stampId 盖章中心主键
     * @return 结果
     */
    @Override
    public int deleteStampInfoByStampId(Long stampId)
    {
        return stampInfoMapper.deleteStampInfoByStampId(stampId);
    }
}
