<template>
    <div class="app-container">
        <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
            <el-form-item label="客户姓名" prop="name">
                <el-input v-model="queryParams.name" placeholder="请输入客户姓名" clearable @keyup.enter.native="handleQuery" />
            </el-form-item>
            <el-form-item label="电话" prop="phone">
                <el-input v-model="queryParams.phone" placeholder="请输入电话" clearable @keyup.enter.native="handleQuery" />
            </el-form-item>
            <el-form-item>
                <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
                <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
            </el-form-item>
        </el-form>

        <!-- <el-row :gutter="10" class="mb8">
        <el-col :span="1.5">
          <el-button
            type="primary"
            plain
            icon="el-icon-plus"
            size="mini"
            @click="handleAdd"
            v-hasPermi="['system:custom:add']"
          >新增</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="success"
            plain
            icon="el-icon-edit"
            size="mini"
            :disabled="single"
            @click="handleUpdate"
            v-hasPermi="['system:custom:edit']"
          >修改</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="danger"
            plain
            icon="el-icon-delete"
            size="mini"
            :disabled="multiple"
            @click="handleDelete"
            v-hasPermi="['system:custom:remove']"
          >删除</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="warning"
            plain
            icon="el-icon-download"
            size="mini"
            @click="handleExport"
            v-hasPermi="['system:custom:export']"
          >导出</el-button>
        </el-col>
        <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
      </el-row> -->

        <el-table v-loading="loading" :data="customList" @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="55" align="center" />
            <el-table-column label="主键id" align="center" prop="id" />
            <el-table-column label="客户姓名" align="center" prop="name" />
            <el-table-column label="电话" align="center" prop="phone" />
            <el-table-column label="地址" align="center" prop="address" />
            <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
                <template slot-scope="scope">
                    <el-upload ref="upload" :limit="1" accept=".jpg, .png" :action="upload.url" :headers="upload.headers"
                        :file-list="upload.fileList" :on-progress="handleFileUploadProgress" :on-success="handleFileSuccess"
                        :auto-upload="true" :show-file-list="false">
                        <el-button slot="trigger" size="mini" type="primary" icon="el-icon-edit"
                            @click="handleid(scope.row.id)">上传</el-button>
                    </el-upload>
                    <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)"
                        v-hasPermi="['system:custom:edit']">修改</el-button>
                    <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)"
                        v-hasPermi="['system:custom:remove']">删除</el-button>
                </template>
            </el-table-column>
        </el-table>

        <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
            @pagination="getList" />

        <!-- 添加或修改客户信息对话框 -->
        <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
            <el-form ref="form" :model="form" :rules="rules" label-width="80px">
                <el-form-item label="客户姓名" prop="name">
                    <el-input v-model="form.name" placeholder="请输入客户姓名" />
                </el-form-item>
                <el-form-item label="电话" prop="phone">
                    <el-input v-model="form.phone" placeholder="请输入电话" />
                </el-form-item>
                <el-form-item label="地址" prop="address">
                    <el-input v-model="form.address" type="textarea" placeholder="请输入内容" />
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button type="primary" @click="submitForm">确 定</el-button>
                <el-button @click="cancel">取 消</el-button>
            </div>
        </el-dialog>
    </div>
</template>
  
<script>
import { listCustom, getCustom, delCustom, addCustom, updateCustom, uploadfile } from "@/api/biz/custom";
import { getToken } from "@/utils/auth";

export default {
    name: "Custom",
    data() {
        return {
            // 遮罩层
            loading: true,
            // 选中数组
            ids: [],
            // 非单个禁用
            single: true,
            // 非多个禁用
            multiple: true,
            // 显示搜索条件
            showSearch: true,
            // 总条数
            total: 0,
            // 客户信息表格数据
            customList: [],
            // 弹出层标题
            title: "",
            // 是否显示弹出层
            open: false,
            // 查询参数
            queryParams: {
                pageNum: 1,
                pageSize: 10,
                name: null,
                phone: null,
                address: null,
            },
            // 表单参数
            form: {},
            // 表单校验
            rules: {
                name: [
                    { required: true, message: "客户姓名不能为空", trigger: "blur" }
                ],
                phone: [
                    { required: true, message: "电话不能为空", trigger: "blur" }
                ],
            },
            upload: {
                // 是否禁用上传
                isUploading: false,
                // 设置上传的请求头部
                headers: { Authorization: "Bearer " + getToken() },
                // 上传的地址
                url: process.env.VUE_APP_BASE_API + "/common/upload",
                // 上传的文件列表
                fileList: [],
                id: null,
            },
        };
    },
    created() {
        this.getList();
    },
    methods: {
        /** 查询客户信息列表 */
        getList() {
            this.loading = true;
            listCustom(this.queryParams).then(response => {
                this.customList = response.rows;
                this.total = response.total;
                this.loading = false;
            });
        },
        // 取消按钮
        cancel() {
            this.open = false;
            this.reset();
        },
        // 表单重置
        reset() {
            this.form = {
                id: null,
                name: null,
                phone: null,
                address: null,
                del: null,
                createBy: null,
                createTime: null,
                updateBy: null,
                updateTime: null
            };
            this.resetForm("form");
        },
        /** 搜索按钮操作 */
        handleQuery() {
            this.queryParams.pageNum = 1;
            this.getList();
        },
        /** 重置按钮操作 */
        resetQuery() {
            this.resetForm("queryForm");
            this.handleQuery();
        },
        // 多选框选中数据
        handleSelectionChange(selection) {
            this.ids = selection.map(item => item.id)
            this.single = selection.length !== 1
            this.multiple = !selection.length
        },
        /** 新增按钮操作 */
        handleAdd() {
            this.reset();
            this.open = true;
            this.title = "添加客户信息";
        },
        /** 修改按钮操作 */
        handleUpdate(row) {
            this.reset();
            const id = row.id || this.ids
            getCustom(id).then(response => {
                this.form = response.data;
                this.open = true;
                this.title = "修改客户信息";
            });
        },
        /** 提交按钮 */
        submitForm() {
            this.$refs["form"].validate(valid => {
                if (valid) {
                    if (this.form.id != null) {
                        updateCustom(this.form).then(response => {
                            this.$modal.msgSuccess("修改成功");
                            this.open = false;
                            this.getList();
                        });
                    } else {
                        addCustom(this.form).then(response => {
                            this.$modal.msgSuccess("新增成功");
                            this.open = false;
                            this.getList();
                        });
                    }
                }
            });
        },
        /** 删除按钮操作 */
        handleDelete(row) {
            const ids = row.id || this.ids;
            this.$modal.confirm('是否确认删除客户信息编号为"' + ids + '"的数据项？').then(function () {
                return delCustom(ids);
            }).then(() => {
                this.getList();
                this.$modal.msgSuccess("删除成功");
            }).catch(() => { });
        },
        /** 导出按钮操作 */
        handleExport() {
            this.download('system/custom/export', {
                ...this.queryParams
            }, `custom_${new Date().getTime()}.xlsx`)
        },
        submitUpload() {
            console.log("!");
            console.log(this.$refs.upload.submit);
            this.$refs.upload.submit();
        },
        // 文件上传中处理
        handleFileUploadProgress(event, file, fileList) {
            this.upload.isUploading = true;
        },
        // 文件上传成功处理
        handleFileSuccess(response, file, fileList) {
            console.log(response);
            this.upload.isUploading = false;
            let fileparams = {
                customId: this.upload.id,
                fileName: response.originalFileName,
                fileType: response.fileType,
                filePath: response.url,
            }
            uploadfile(fileparams).then(() => {
                this.$modal.msgSuccess(response.msg);
            }
            )

        },
        handleid(id) {
            this.upload.id = id;
        },
    }
};
</script>
  