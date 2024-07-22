package com.ruoyi.web.controller.wujie;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.wujie.domain.NFinance;
import com.ruoyi.wujie.service.NFinanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 合同信息Controller
 * 
 * @author ruoyi
 * @date 2023-11-12
 */
@RestController
@RequestMapping("/wujie/finance")
public class NFinanceController extends BaseController
{
    @Autowired
    private NFinanceService nFinanceService;

    /**
     * 查询合同信息列表
     * metodd:增加不同人员的查询权限相关内容
     */
    @PreAuthorize("@ss.hasPermi('wujie:finance:list')")
    @GetMapping("/list")
    public TableDataInfo list(NFinance nFinance)
    {
        startPage();
        List<NFinance> list = nFinanceService.selectNFinanceList(nFinance);
        return getDataTable(list);
    }

    /**
     * 导出合同信息列表
     */
    @PreAuthorize("@ss.hasPermi('wujie:finance:export')")
    @Log(title = "财务信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, NFinance nFinance)
    {
        List<NFinance> list = nFinanceService.selectNFinanceList(nFinance);
        ExcelUtil<NFinance> util = new ExcelUtil<NFinance>(NFinance.class);
        util.exportExcel(response, list, "财务信息数据");
    }

    /**
     * 获取合同信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('wujie:finance:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(nFinanceService.selectNFinanceById(id));
    }

    /**
     * 新增合同信息
     */
    @PreAuthorize("@ss.hasPermi('wujie:finance:add')")
    @Log(title = "合同信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody NFinance nFinance)
    {
        return toAjax(nFinanceService.insertNFinance(nFinance));
    }

    /**
     * 修改合同信息
     */
    @PreAuthorize("@ss.hasPermi('wujie:finance:edit')")
    @Log(title = "合同信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody NFinance nFinance)
    {
        return toAjax(nFinanceService.updateNFinance(nFinance));
    }

    /**
     * 删除合同信息
     */
    @PreAuthorize("@ss.hasPermi('wujie:finance:remove')")
    @Log(title = "合同信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(nFinanceService.deleteNFinanceByIds(ids));
    }
}
