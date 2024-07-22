package com.ruoyi.web.controller.wujie;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.wujie.domain.NContract;
import com.ruoyi.wujie.service.NContractService;
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
@RequestMapping("/wujie/contract")
public class NContractController extends BaseController
{
    @Autowired
    private NContractService nContractService;

    /**
     * 查询合同信息列表
     */
    @PreAuthorize("@ss.hasPermi('wujie:contract:list')")
    @GetMapping("/list")
    public TableDataInfo list(NContract nContract)
    {
        startPage();
        List<NContract> list = nContractService.selectNContractList(nContract);
        return getDataTable(list);
    }

    /**
     * 导出合同信息列表
     */
    @PreAuthorize("@ss.hasPermi('wujie:contract:export')")
    @Log(title = "合同信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, NContract nContract)
    {
        List<NContract> list = nContractService.selectNContractList(nContract);
        ExcelUtil<NContract> util = new ExcelUtil<NContract>(NContract.class);
        util.exportExcel(response, list, "合同信息数据");
    }

    /**
     * 获取合同信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('wujie:contract:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(nContractService.selectNContractById(id));
    }

    /**
     * 新增合同信息
     */
    @PreAuthorize("@ss.hasPermi('wujie:contract:add')")
    @Log(title = "合同信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody NContract nContract)
    {
        return toAjax(nContractService.insertNContract(nContract));
    }

    /**
     * 修改合同信息
     */
    @PreAuthorize("@ss.hasPermi('wujie:contract:edit')")
    @Log(title = "合同信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody NContract nContract)
    {
        return toAjax(nContractService.updateNContract(nContract));
    }

    /**
     * 删除合同信息
     */
    @PreAuthorize("@ss.hasPermi('wujie:contract:remove')")
    @Log(title = "合同信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(nContractService.deleteNContractByIds(ids));
    }
}
