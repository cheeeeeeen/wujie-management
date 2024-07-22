package com.ruoyi.web.controller.wujie;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.wujie.domain.NCase;
import com.ruoyi.wujie.service.NCaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 案件信息Controller
 * 
 * @author ruoyi
 * @date 2023-12-05
 */
@RestController
@RequestMapping("/case/case")
public class NCaseController extends BaseController
{
    @Autowired
    private NCaseService nCaseService;

    /**
     * 查询案件信息列表
     */
    @PreAuthorize("@ss.hasPermi('case:case:list')")
    @GetMapping("/list")
    public TableDataInfo list(NCase nCase)
    {
        startPage();
        List<NCase> list = nCaseService.selectNCaseList(nCase);
        return getDataTable(list);
    }

    /**
     * 导出案件信息列表
     */
    @PreAuthorize("@ss.hasPermi('case:case:export')")
    @Log(title = "案件信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, NCase nCase)
    {
        List<NCase> list = nCaseService.selectNCaseList(nCase);
        ExcelUtil<NCase> util = new ExcelUtil<NCase>(NCase.class);
        util.exportExcel(response, list, "案件信息数据");
    }

    /**
     * 获取案件信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('case:case:query')")
    @GetMapping(value = "/{caseId}")
    public AjaxResult getInfo(@PathVariable("caseId") Long caseId)
    {
        return success(nCaseService.selectNCaseByCaseId(caseId));
    }

    /**
     * 新增案件信息
     */
    @PreAuthorize("@ss.hasPermi('case:case:add')")
    @Log(title = "案件信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody NCase nCase)
    {
        return toAjax(nCaseService.insertNCase(nCase));
    }

    /**
     * 修改案件信息
     */
    @PreAuthorize("@ss.hasPermi('case:case:edit')")
    @Log(title = "案件信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody NCase nCase)
    {
        return toAjax(nCaseService.updateNCase(nCase));
    }

    /**
     * 删除案件信息
     */
    @PreAuthorize("@ss.hasPermi('case:case:remove')")
    @Log(title = "案件信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{caseIds}")
    public AjaxResult remove(@PathVariable Long[] caseIds)
    {
        return toAjax(nCaseService.deleteNCaseByCaseIds(caseIds));
    }
}
