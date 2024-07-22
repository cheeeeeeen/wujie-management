package com.ruoyi.wujie.mapper;

import com.ruoyi.wujie.domain.StampInfo;

import java.util.List;

/**
 * 盖章中心Mapper接口
 *
 * @author myh
 * @date 2023-12-26
 */
public interface StampInfoMapper
{
    /**
     * 查询盖章中心
     *
     * @param stampId 盖章中心主键
     * @return 盖章中心
     */
    public StampInfo selectStampInfoByStampId(Long stampId);

    /**
     * 查询盖章中心列表
     *
     * @param stampInfo 盖章中心
     * @return 盖章中心集合
     */
    public List<StampInfo> selectStampInfoList(StampInfo stampInfo);

    /**
     * 新增盖章中心
     *
     * @param stampInfo 盖章中心
     * @return 结果
     */
    public int insertStampInfo(StampInfo stampInfo);

    /**
     * 修改盖章中心
     *
     * @param stampInfo 盖章中心
     * @return 结果
     */
    public int updateStampInfo(StampInfo stampInfo);

    /**
     * 删除盖章中心
     *
     * @param stampId 盖章中心主键
     * @return 结果
     */
    public int deleteStampInfoByStampId(Long stampId);

    /**
     * 批量删除盖章中心
     *
     * @param stampIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteStampInfoByStampIds(Long[] stampIds);
}
