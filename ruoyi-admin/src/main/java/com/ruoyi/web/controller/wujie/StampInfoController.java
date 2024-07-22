package com.ruoyi.wujie.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.wujie.domain.StampInfo;
import com.ruoyi.wujie.service.IStampInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 盖章中心Controller
 *
 * @author myh
 * @date 2023-12-26
 */
@RestController
@RequestMapping("/stamp")
public class StampInfoController extends BaseController
{
    @Autowired
    private IStampInfoService stampInfoService;

    /**
     * 查询盖章中心列表
     */
    @GetMapping("/list")
    public TableDataInfo list(StampInfo stampInfo)
    {
        startPage();
        List<StampInfo> list = stampInfoService.selectStampInfoList(stampInfo);
        return getDataTable(list);
    }

    /**
     * 导出盖章中心列表
     */
    @Log(title = "盖章中心", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, StampInfo stampInfo)
    {
        List<StampInfo> list = stampInfoService.selectStampInfoList(stampInfo);
        ExcelUtil<StampInfo> util = new ExcelUtil<StampInfo>(StampInfo.class);
        util.exportExcel(response, list, "盖章中心数据");
    }

    /**
     * 获取盖章中心详细信息
     */
    @GetMapping(value = "/{stampId}")
    public AjaxResult getInfo(@PathVariable("stampId") Long stampId)
    {
        return success(stampInfoService.selectStampInfoByStampId(stampId));
    }

    /**
     * 新增盖章中心
     */
    @Log(title = "盖章中心", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody StampInfo stampInfo)
    {
        return toAjax(stampInfoService.insertStampInfo(stampInfo));
    }

    /**
     * 修改盖章中心
     */
    @Log(title = "盖章中心", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody StampInfo stampInfo)
    {
        return toAjax(stampInfoService.updateStampInfo(stampInfo));
    }

    /**
     * 删除盖章中心
     */
    @Log(title = "盖章中心", businessType = BusinessType.DELETE)
    @DeleteMapping("/{stampIds}")
    public AjaxResult remove(@PathVariable Long[] stampIds)
    {
        return toAjax(stampInfoService.deleteStampInfoByStampIds(stampIds));
    }
}
