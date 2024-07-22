<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="120px">
      <el-form-item label="客户姓名" prop="customerId">
        <el-select v-model="queryParams.customerId" placeholder="请选择" filterable >
          <el-option v-for="item in customerList" :key="item.id" :label="item.name" :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="合同状态" prop="state">
        <!-- <el-input v-model="queryParams.state" placeholder="请输入合同状态" clearable @keyup.enter.native="handleQuery" /> -->
        <el-radio-group v-model="queryParams.state">
          <el-radio :label="0">待审核</el-radio>
          <el-radio :label="1">审核通过</el-radio>
        </el-radio-group>
      </el-form-item>
      <div class="newline">
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </div>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
          v-hasPermi="['wujie:contract:add']">新增</el-button>
      </el-col>
      <!-- <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate"
          v-hasPermi="['wujie:contract:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['wujie:contract:remove']">删除</el-button>
      </el-col> -->
      <!-- <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport"
          v-hasPermi="['wujie:contract:export']">导出</el-button>
      </el-col> -->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="contractList" @selection-change="handleSelectionChange">
      <!-- <el-table-column type="selection" width="55" align="center" /> -->
      <el-table-column label="id" align="center" prop="id" />
      <el-table-column label="客户姓名" align="center" prop="customerId">
        <template slot-scope="scope">
          {{ scope.row.ncustomer.name }}
        </template>
      </el-table-column>
      <el-table-column label="合同状态" align="center" prop="state" >
        <template slot-scope="scope">
          {{ statusType[scope.row.state] }}
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleDetail(scope.row)">详情</el-button>
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['wujie:contract:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)"
            v-hasPermi="['wujie:contract:remove']">删除</el-button>
          <el-upload ref="upload" :limit="1" :action="upload.url" :headers="upload.headers" :show-file-list="false"
            :auto-upload="true" :on-progress="handleFileUploadProgress" :on-success="handleFileSuccess">
            <el-button slot="trigger" size="small" type="primary" @click="SetUploadcolumn(scope.row)">上传文件</el-button>
          </el-upload>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
      @pagination="getList" />

    <!-- 添加或修改合同信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="客户姓名" prop="customerId">
          <el-select v-model="form.customerId" placeholder="请选择" filterable >
            <el-option v-for="item in customerList" :key="item.id" :label="item.name" :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="合同状态" prop="state">
          <el-radio-group v-model="form.state">
          <el-radio :label="0">待审核</el-radio>
          <el-radio :label="1">审核通过</el-radio>
        </el-radio-group>
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
import { listCustomer } from '@/api/customer/customer.js'
import { listContract, getContract, delContract, addContract, updateContract } from "@/api/wujie/contract";
import { getToken } from "@/utils/auth";
import { addFile } from '@/api/wujie/file';

const statusType = {
  0:'待审核',
  1:'审核通过'
}

export default {
  name: "Contract",
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
      // 合同信息表格数据
      contractList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        customerId: null,
        state: null,
        del: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
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
        contractId: null,
      },
      customerList: [],
      statusType,
    };
  },
  created() {
    this.getList();
    this.getCustomerList();
  },
  methods: {
    /** 查询合同信息列表 */
    getList() {
      this.loading = true;
      listContract(this.queryParams).then(response => {
        this.contractList = response.rows;
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
        customerId: null,
        state: null,
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
      this.title = "添加合同信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getContract(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改合同信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateContract(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addContract(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除合同信息编号为"' + ids + '"的数据项？').then(function () {
        return delContract(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('wujie/contract/export', {
        ...this.queryParams
      }, `contract_${new Date().getTime()}.xlsx`)
    },
    handleDetail(row) {
      this.$router.push({ path: "contract/detail", query: { id: row.id } });
    },
    SetUploadcolumn(column) {
      this.upload.contractId = column.id;
    },
    handleFileUploadProgress(event, file, fileList) {
      this.upload.isUploading = true;
    },
    handleFileSuccess(response, file, fileList) {
      this.upload.isUploading = false;
      this.form.filePath = response.url;
      let queryparams = {
        contractId: this.upload.contractId,
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
    getCustomerList() {
      listCustomer().then((res) => {
        this.customerList = res.rows
      })
    }
  }
};
</script>

<style>

.newline {
  display: inline-block;
  margin: 0 0 0 50px
}

</style>