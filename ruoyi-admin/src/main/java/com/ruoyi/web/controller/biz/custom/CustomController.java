package com.ruoyi.web.controller.biz.custom;

import com.ruoyi.biz.domain.entity.Custom;
import com.ruoyi.biz.service.CustomService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.vg.VG;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import java.util.List;

/**
 *客户信息
 */
@Api(tags = "客户信息")
@RestController
@RequestMapping("/custom")
public class CustomController extends BaseController {

    @Autowired
    private CustomService customService;

    /**
     * 获取客户列表
     */
    @ApiOperation("获取客户列表")
    @GetMapping("/page")
    public TableDataInfo list(Custom custom)
    {
        startPage();
        List<Custom> list = customService.listCustom(custom);
        return getDataTable(list);
    }

    /**
     * 新增
     *
     * @param custom
     * @return
     */
    @PostMapping("")
    @ApiOperation("新增")
    public R<Boolean> create(@RequestBody @Validated(VG.Add.class) Custom custom) {
        return R.ok(customService.insert(custom));
    }

    /**
     * 更新
     *
     * @param custom
     * @return
     */
    @PutMapping("")
    @ApiOperation("更新")
    public R<Boolean> update(@RequestBody @Validated(VG.Update.class) Custom custom) {
        return R.ok(customService.update(custom));
    }

    /**
     * 详情
     *
     * @param id 根据ID删除
     * @return
     */
    @GetMapping(value = "/{id}")
    @ApiOperation("详情")
    public R<Custom> detail(@PathVariable("id") Long id) {
        return R.ok(customService.getCustomById(id));
    }

    /**
     * 删除
     *
     * @param id 根据ID删除
     * @return
     */
    @ApiOperation("删除")
    @DeleteMapping(value = "/{id}")
    public R delete(@PathVariable("id") Long id) {
        return R.ok(customService.deleteById(id) > 0);
    }
}