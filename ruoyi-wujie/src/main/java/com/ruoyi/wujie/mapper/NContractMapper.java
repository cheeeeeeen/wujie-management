package com.ruoyi.wujie.mapper;

import java.util.List;
import com.ruoyi.wujie.domain.NContract;

/**
 * 合同信息Mapper接口
 * 
 * @author ruoyi
 * @date 2023-11-12
 */
public interface NContractMapper 
{
    /**
     * 查询合同信息
     * 
     * @param id 合同信息主键
     * @return 合同信息
     */
    public NContract selectNContractById(Long id);

    /**
     * 查询合同信息列表
     * 
     * @param nContract 合同信息
     * @return 合同信息集合
     */
    public List<NContract> selectNContractList(NContract nContract);

    /**
     * 新增合同信息
     * 
     * @param nContract 合同信息
     * @return 结果
     */
    public int insertNContract(NContract nContract);

    /**
     * 修改合同信息
     * 
     * @param nContract 合同信息
     * @return 结果
     */
    public int updateNContract(NContract nContract);

    /**
     * 删除合同信息
     * 
     * @param id 合同信息主键
     * @return 结果
     */
    public int deleteNContractById(Long id);

    /**
     * 批量删除合同信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteNContractByIds(Long[] ids);
}
