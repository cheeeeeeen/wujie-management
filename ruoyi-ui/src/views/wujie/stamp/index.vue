<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="创建者" prop="creator">
        <el-input v-model="queryParams.creator" placeholder="请输入创建者" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd">新增盖章申请</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-tabs v-model="activeName" type="card">
      <el-tab-pane label="全部申请" name="all"></el-tab-pane>
      <el-tab-pane label="待审批申请" name="wait"></el-tab-pane>
      <el-tab-pane label="已通过申请" name="done"></el-tab-pane>
    </el-tabs>

    <el-table v-loading="loading" :data="filtedList">
      <el-table-column label="申请ID" align="center" prop="stampId" />
      <el-table-column label="创建者" align="center" prop="creator" />
      <el-table-column label="申请备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)">删除</el-button>
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleDetail(scope.row)">详情</el-button>
          <el-upload ref="upload" :limit="1" :action="upload.url" :headers="upload.headers" :show-file-list="false"
            :auto-upload="true" :on-progress="handleFileUploadProgress" :on-success="handleFileSuccess">
            <el-button slot="trigger" size="small" type="primary" @click="SetUploadcolumn(scope.row)">上传文件</el-button>
          </el-upload>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
      @pagination="getList" />

    <!-- 添加或修改盖章中心对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="申请备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入申请备注" />
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
import { listInfo, getInfo, delInfo, addInfo, updateInfo } from "@/api/wujie/stamp";
import { addFile } from '@/api/wujie/file';
import { getToken } from "@/utils/auth";

export default {
  name: "Info",
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
      // 盖章中心表格数据
      infoList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        creator: null,
        state: null,
        del: null,
        noticeCreaterId: null,
        noticeSealedById: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      activeName: 'all',
      upload: {
        // 是否禁用上传
        isUploading: false,
        // 设置上传的请求头部
        headers: { Authorization: "Bearer " + getToken() },
        // 上传的地址
        url: process.env.VUE_APP_BASE_API + "/common/upload",
        // 上传的文件列表
        fileList: [],
        stampId: null,
      },
    };
  },
  created() {
    this.getList();
  },
  computed: {
    filtedList: function () {
      if (this.activeName === 'all') {
        return this.infoList;
      }
      else if (this.activeName === 'wait') {
        return this.infoList.filter((info) =>
          info.state === "0"
        )
      }
      else {
        return this.infoList.filter((info) =>
          info.state === "1"
        )
      }
    }
  },
  methods: {
    /** 查询盖章中心列表 */
    getList() {
      this.loading = true;
      listInfo(this.queryParams).then(response => {
        this.infoList = response.rows;
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
        stampId: null,
        creator: null,
        state: '0',
        createTime: null,
        del: null,
        updateTime: null,
        noticeCreaterId: null,
        noticeSealedById: null,
        remark: null
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
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加盖章申请";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const stampId = row.stampId || this.ids
      getInfo(stampId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改盖章申请";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.stampId != null) {
            updateInfo(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addInfo(this.form).then(response => {
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
      const stampIds = row.stampId || this.ids;
      this.$modal.confirm('是否确认删除盖章中心编号为"' + stampIds + '"的数据项？').then(function () {
        return delInfo(stampIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    SetUploadcolumn(column) {
      this.upload.stampId = column.stampId;
    },
    handleFileUploadProgress(event, file, fileList) {
      this.upload.isUploading = true;
    },
    handleFileSuccess(response, file, fileList) {
      this.upload.isUploading = false;
      this.form.filePath = response.url;
      let queryparams = {
        stampId: this.upload.stampId,
        stampType: 0,
        useType: 1,
        fileName: `${response.originalFileName}.${response.fileType}`,
        fileType: response.fileType,
        filePath: `${response.url}`,
        fileSize: response.size
      }
      addFile(queryparams).then(() => {
        this.$modal.msgSuccess(response.msg);
        setInterval(() => {
          location.reload();
        }, 500);
      })
    },

    handleDetail(row) {
      this.$router.push({ path: "stamp/detail", query: { id: row.stampId } });
    },
  }
};
</script>
