package com.ruoyi.web.controller.wujie;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.ServerConfig;
import com.ruoyi.common.vg.VG;
import com.ruoyi.wujie.domain.NFileInfo;
import com.ruoyi.wujie.service.NFileInfoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api(tags="文件管理")
@RestController
@RequestMapping("/file-info")
public class NCustomerFileInfoController extends BaseController {
    @Autowired
    private NFileInfoService nFileInfoService;
    @Autowired
    private ServerConfig serverConfig;

    @PostMapping("")
    public R<Boolean> create(@RequestBody @Validated(VG.Add.class) NFileInfo nFileInfo) {
        return R.ok(nFileInfoService.insert(nFileInfo));
    }

    @GetMapping(value = "/{id}")
    @ApiOperation("详情")
    public R<NFileInfo> detail(@PathVariable("id") Long id){
        return R.ok(nFileInfoService.getFileInfoById(id));
    }

    @ApiOperation("删除")
    @DeleteMapping(value="/{id}")
    public R delete(@PathVariable("id") Long id){
        return R.ok(nFileInfoService.deleteById(id) > 0);
    }

    @GetMapping(value="/list/{customerId}")
    @ApiOperation("根据客户ID获取文件列表")
    public R<List<NFileInfo>> getFileInfoByCustomId(@PathVariable("customerId") Long customerId){
        return R.ok(nFileInfoService.listFileInfoByCustomId(customerId));
    }

    @GetMapping(value="/list/contract/{contractId}")
    @ApiOperation("根据合同ID获取文件列表")
    public R<List<NFileInfo>> getFileInfoBycontractId(@PathVariable("contractId") Long contractId){
        return R.ok(nFileInfoService.listFileInfoBycontractId(contractId));
    }

    @GetMapping(value="/list/finance/{financeId}")
    @ApiOperation("根据合同ID获取文件列表")
    public R<List<NFileInfo>> getFileInfoByfinanceId(@PathVariable("financeId") Long financeId){
        return R.ok(nFileInfoService.listFileInfoByfinanceId(financeId));
    }

    @GetMapping(value="/list/case/{caseId}")
    @ApiOperation("根据案件ID获取文件列表")
    public R<List<NFileInfo>> getFileInfoBycaseId(@PathVariable("caseId") Long caseId){
        return R.ok(nFileInfoService.listFileInfoBycaseId(caseId));
    }

    @GetMapping(value="/list/stamp/{stampId}")
    @ApiOperation("根据案件ID获取文件列表")
    public R<List<NFileInfo>> getFileInfoByStampId(@PathVariable("stampId") Long stampId){
        return R.ok(nFileInfoService.listFileInfoByStampId(stampId));
    }
    @ApiOperation("获取客户文件列表")
    @GetMapping("/page")
    public TableDataInfo list(NFileInfo nFileInfo) {
        startPage();
        List<NFileInfo> list = nFileInfoService.listFileInfo(nFileInfo);
        return getDataTable(list);
    }
}
