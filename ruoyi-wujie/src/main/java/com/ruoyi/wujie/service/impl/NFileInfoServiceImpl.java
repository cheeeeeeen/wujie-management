package com.ruoyi.wujie.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.ruoyi.common.enums.YesNoEnum;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.ServerConfig;
import com.ruoyi.wujie.domain.*;
import com.ruoyi.wujie.mapper.NFileInfoMapper;
import com.ruoyi.wujie.service.NContractService;
import com.ruoyi.wujie.service.NCustomerService;
import com.ruoyi.wujie.service.NFileInfoService;
import com.ruoyi.wujie.service.NCaseService;
import com.ruoyi.wujie.service.IStampInfoService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Service
public class NFileInfoServiceImpl implements NFileInfoService {
    @Autowired
    private NFileInfoMapper nfileInfoMapper;
    @Autowired
    private NCustomerService nCustomerService;

    @Autowired
    private NContractService nContractService;

    @Autowired
    private NFinanceServiceImpl nFinanceService;

    @Autowired
    private IStampInfoService stampInfoService;

    @Autowired
    private ServerConfig serverConfig;
    @Autowired
    private NCaseService nCaseService;

    public NFileInfoServiceImpl() {

    }

    /*
    * 增加一个文件
    * */
    public Boolean insert(NFileInfo nfileInfo){
        NCustomer nCustomer=this.nCustomerService.selectNCustomerById(nfileInfo.getCustomerId());
        NContract nContract=this.nContractService.selectNContractById(nfileInfo.getContractId());
        NFinance nFinance=this.nFinanceService.selectNFinanceById(nfileInfo.getFinanceId());
        NCase nCase = this.nCaseService.selectNCaseByCaseId(nfileInfo.getCaseId());
        StampInfo stampInfo = this.stampInfoService.selectStampInfoByStampId(nfileInfo.getStampId());
        if(Objects.isNull(nCustomer) && Objects.isNull(nContract) && Objects.isNull(nFinance) && Objects.isNull(nCase) && Objects.isNull(stampInfo)) {
            throw new ServiceException("文件缺失关联项ID");
        } else {
            nfileInfo.setCreateTime(new Date());
            nfileInfo.setCreateBy(SecurityUtils.getLoginUser().getUsername());
            nfileInfo.setDel(YesNoEnum.NO.getValue().toString());
            return this.nfileInfoMapper.insert(nfileInfo) > 0;
        }
    }

    public NFileInfo getFileInfoById(Long id) {
        return null;
    }

    public int deleteById(Long id) {
        return this.nfileInfoMapper.deleteByPrimaryKey(id);
    }

    /*
    * 查询用户的所有文件
    * */
    public List<NFileInfo> listFileInfoByCustomId(Long customerId) {
        if (Objects.isNull(customerId)) {
            return null;
        } else {
            List<NFileInfo> nFileInfo = this.nfileInfoMapper.getFileInfoByCustomIds(customerId);
            if (CollUtil.isEmpty(nFileInfo)) {
                return null;
            } else {
                List<NFileInfo> vos = new ArrayList();
                nFileInfo.stream().forEach((it) -> {
                    NFileInfo vo = new NFileInfo();
                    BeanUtils.copyProperties(it, vo);
                    vos.add(vo);
                });
                return vos;
            }
        }
    }

    public List<NFileInfo> listFileInfoBycontractId(Long contractId) {
        if (Objects.isNull(contractId)) {
            return null;
        } else {
            List<NFileInfo> nFileInfo = this.nfileInfoMapper.getFileInfoByContractIds(contractId);
            if (CollUtil.isEmpty(nFileInfo)) {
                return null;
            } else {
                List<NFileInfo> vos = new ArrayList();
                nFileInfo.stream().forEach((it) -> {
                    NFileInfo vo = new NFileInfo();
                    BeanUtils.copyProperties(it, vo);
                    //vo.setFilePath(this.serverConfig.getUrl() + it.getFilePath()); 不用的路径处理
                    vos.add(vo);
                });
                return vos;
            }
        }
    }

    public List<NFileInfo> listFileInfoByfinanceId(Long financeId) {
        if (Objects.isNull(financeId)) {
            return null;
        } else {
            List<NFileInfo> nFileInfo = this.nfileInfoMapper.getFileInfoByFinanceIds(financeId);
            if (CollUtil.isEmpty(nFileInfo)) {
                return null;
            } else {
                List<NFileInfo> vos = new ArrayList();
                nFileInfo.stream().forEach((it) -> {
                    NFileInfo vo = new NFileInfo();
                    BeanUtils.copyProperties(it, vo);
                    //vo.setFilePath(this.serverConfig.getUrl() + it.getFilePath()); 不用的路径处理
                    vos.add(vo);
                });
                return vos;
            }
        }
    }

    public List<NFileInfo> listFileInfoBycaseId(Long caseId) {
        if (Objects.isNull(caseId)) {
            return null;
        } else {
            List<NFileInfo> nFileInfo = this.nfileInfoMapper.getFileInfoBycaseIds(caseId);
            if (CollUtil.isEmpty(nFileInfo)) {
                return null;
            } else {
                List<NFileInfo> vos = new ArrayList();
                nFileInfo.stream().forEach((it) -> {
                    NFileInfo vo = new NFileInfo();
                    BeanUtils.copyProperties(it, vo);
                    //vo.setFilePath(this.serverConfig.getUrl() + it.getFilePath()); 不用的路径处理
                    vos.add(vo);
                });
                return vos;
            }
        }
    }

    public List<NFileInfo> listFileInfoByStampId(Long stampId) {
        if (Objects.isNull(stampId)) {
            return null;
        } else {
            List<NFileInfo> nFileInfo = this.nfileInfoMapper.getFileInfoByStampIds(stampId);
            if (CollUtil.isEmpty(nFileInfo)) {
                return null;
            } else {
                List<NFileInfo> vos = new ArrayList();
                nFileInfo.stream().forEach((it) -> {
                    NFileInfo vo = new NFileInfo();
                    BeanUtils.copyProperties(it, vo);
                    //vo.setFilePath(this.serverConfig.getUrl() + it.getFilePath()); 不用的路径处理
                    vos.add(vo);
                });
                return vos;
            }
        }
    }

    public List<NFileInfo> listFileInfo(NFileInfo fileInfo) {
        return null;
    }
}
