package com.ruoyi.web.controller.biz.custom;


import com.ruoyi.biz.domain.dto.FileInfoDto;
import com.ruoyi.biz.domain.entity.FileInfo;
import com.ruoyi.biz.domain.vo.FileInfoVo;
import com.ruoyi.biz.service.FileInfoService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.ServerConfig;
import com.ruoyi.common.vg.VG;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
*  文件管理
*/
@Api(tags = "文件管理")
@RestController
@RequestMapping("/custom-file-info")
public class CustomFileInfoController extends BaseController {

    @Autowired
    private FileInfoService fileInfoService;
    @Autowired
    private ServerConfig serverConfig;

    /**
    * 新增
     *
     * 1.先上传文件  调用文件上传接口 拿到文件信息 2.然后再调用这个接口 保存文件信息 和 客户端关联关系
    *
    * @param fileInfo
    * @return
    */
    @PostMapping("")
    @ApiOperation("新增")
    public R<Boolean> create(@RequestBody @Validated(VG.Add.class) FileInfo fileInfo) {
        return R.ok(fileInfoService.insert(fileInfo));
    }

    /**
     * 新增   使用from data 上传文件
     *
     * @param file
     * @return
     */
    /*@PostMapping("/insert")
    @ApiOperation("新增")
    public R<Boolean> insert(@RequestParam(value = "file", required = false) MultipartFile file,
                             @Validated(VG.Add.class)  FileInfoDto fileInfoDto) {
        return R.ok(fileInfoService.insert(file,fileInfoDto,serverConfig.getUrl()));
    }*/

    /**
    * 更新
    *
    * @param fileInfo
    * @return
    */
//    @PutMapping("")
//    @ApiOperation("更新")
    /*
    public R<Boolean> update(@RequestBody FileInfo fileInfo) {
        return R.ok(fileInfoService.update(fileInfo));
    }
    */
    /**
    * 详情
    *
    * @param id 根据ID删除
    * @return
    */
    @GetMapping(value = "/{id}")
    @ApiOperation("详情")
    public R<FileInfo> detail(@PathVariable("id") Long id) {
        return R.ok(fileInfoService.getFileInfoById(id));
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
        return R.ok(fileInfoService.deleteById(id)>0);
    }


    /**
     * 根据客户ID获取当前客户所有的文件列表
     *
     * @param customId 客户ID
     * @return
     */
    @GetMapping(value = "/list/{customId}")
    @ApiOperation("根据客户ID获取当前客户所有的文件列表")
    public R<List<FileInfoVo>> getFileInfoByCustomId(@PathVariable("customId") Long customId) {
        return R.ok(fileInfoService.listFileInfoByCustomId(customId));
    }


    /**
     * 获取客户文件列表
     */
    @ApiOperation("获取客户文件列表")
    @GetMapping("/page")
    public TableDataInfo list(FileInfoDto fileInfoDto) {
        startPage();
        List<FileInfoVo> list = fileInfoService.listFileInfo(fileInfoDto);
        return getDataTable(list);
    }
}