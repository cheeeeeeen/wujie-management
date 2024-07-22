<template>
  <div class="app-container">
    <el-form v-show="showSearch" ref="queryForm" :model="queryParams" size="small" :inline="true" label-width="68px">
      <el-form-item label="客户姓名" prop="name">
        <el-input v-model="queryParams.name" placeholder="请输入客户姓名" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="联系电话" prop="contractPhone">
        <el-input v-model="queryParams.contractPhone" placeholder="请输入联系电话" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <!-- <el-form-item label="客户类型" prop="type">
        <el-select v-model="queryParams.type" clearable>
          <el-option 
            v-for="item in customerTypes"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          >
          </el-option>
        </el-select>
      </el-form-item> -->
      <!-- <el-form-item label="银行信息" prop="bankUsername">
        <el-input v-model="queryParams.bankUsername" placeholder="请输入银行信息" clearable @keyup.enter.native="handleQuery" />
      </el-form-item> -->
      <el-form-item label="开户行" prop="bankName">
        <el-input v-model="queryParams.bankName" placeholder="请输入开户行" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="银行账号" prop="bankAccount">
        <el-input v-model="queryParams.bankAccount" placeholder="请输入银行账号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="身份证号" prop="idCardNum">
        <el-input v-model="queryParams.idCardNum" placeholder="请输入身份证号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <!-- <el-form-item label="名称/单位名称" prop="taxName">
        <el-input v-model="queryParams.taxName" placeholder="请输入名称/单位名称" clearable @keyup.enter.native="handleQuery" />
      </el-form-item> -->
      <el-form-item label="纳税人识别号" prop="taxNumber">
        <el-input v-model="queryParams.taxNumber" placeholder="请输入纳税人识别号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="联系人电话" prop="officePhone">
        <el-input v-model="queryParams.officePhone" placeholder="请输入联系人电话" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <!-- <el-form-item label="地址" prop="location">
        <el-input v-model="queryParams.location" placeholder="请输入单位地址" clearable @keyup.enter.native="handleQuery" />
      </el-form-item> -->
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button v-hasPermi="['customer:customer:add']" type="primary" plain icon="el-icon-plus" size="mini"
          @click="handleAdd">新增</el-button>
      </el-col>
      <!-- <el-col :span="1.5">
        <el-button v-hasPermi="['customer:customer:edit']" type="success" plain icon="el-icon-edit" size="mini"
          :disabled="single" @click="handleUpdate">修改</el-button>
      </el-col> -->
      <!-- <el-col :span="1.5">
        <el-button v-hasPermi="['customer:customer:remove']" type="danger" plain icon="el-icon-delete" size="mini"
          :disabled="multiple" @click="handleDelete">删除</el-button>
      </el-col> -->
      <!-- <el-col :span="1.5">
        <el-button v-hasPermi="['customer:customer:export']" type="warning" plain icon="el-icon-download" size="mini"
          @click="handleExport">导出</el-button>
      </el-col> -->
      <right-toolbar :show-search.sync="showSearch" @queryTable="getList" />
    </el-row>

    <el-table v-loading="loading" :data="customerList" @selection-change="handleSelectionChange">
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="客户姓名" align="center" prop="name" />
      <el-table-column label="联系电话" align="center" prop="contractPhone" />
      <el-table-column label="联系地址" align="center" prop="contractAddress" />
      <el-table-column label="身份证号" align="center" prop="idCardNum"/>
      <!-- <el-table-column label="客户类别" align="center" prop="type" >
        <template slot-scope="scope">
          {{ customerTypeEnum[scope.row.type] }}
        </template>
      </el-table-column> -->
      <!-- <el-table-column label="银行信息" align="center" prop="bankUsername" /> -->
      <el-table-column label="开户行" align="center" prop="bankName" />
      <el-table-column label="银行账号" align="center" prop="bankAccount" />
      <!-- <el-table-column label="名称/单位名称" align="center" prop="taxName" /> -->
      <el-table-column label="纳税人识别号" align="center" prop="taxNumber" />
      <el-table-column label="联系人姓名" align="center" prop="contractPerson" />
      <el-table-column label="联系人电话" align="center" prop="officePhone" />
      <!-- <el-table-column label="单位地址" align="center" prop="officeAddress" /> -->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="180">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit"
            @click="handleDetail(scope.row)">详情</el-button>
          <el-button v-hasPermi="['customer:customer:edit']" size="mini" type="text" icon="el-icon-edit"
            @click="handleUpdate(scope.row)">修改</el-button>
          <el-button v-hasPermi="['customer:customer:remove']" size="mini" type="text" icon="el-icon-delete"
            @click="handleDelete(scope.row)">删除</el-button>
          <el-upload ref="upload" :limit="1" :action="upload.url" :headers="upload.headers" :show-file-list="false" :auto-upload="true"
            :on-progress="handleFileUploadProgress" :on-success="handleFileSuccess">
          <el-button slot="trigger" size="small" type="primary" @click="SetUploadcolumn(scope.row)">上传文件</el-button>
          </el-upload>
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
        <el-form-item label="联系电话" prop="contractPhone">
          <el-input v-model="form.contractPhone" placeholder="请输入联系电话" />
        </el-form-item>
        <el-form-item label="联系地址" prop="contractAddress">
          <el-input v-model="form.contractAddress" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="身份证号" prop="idCardNum">
          <el-input v-model="form.idCardNum" placeholder="请输入客户身份证号"></el-input>
        </el-form-item>
        <!-- <el-form-item label="客户类别" prop="type">
          <el-radio-group v-model="form.type">
            <el-radio :label="0">联系人</el-radio>
            <el-radio :label="1">案源人</el-radio>
            <el-radio :label="2">服务成员</el-radio>
          </el-radio-group>
        </el-form-item> -->
        <!-- <el-form-item label="银行信息" prop="bankUsername">
          <el-input v-model="form.bankUsername" placeholder="请输入银行信息" />
        </el-form-item> -->
        <el-form-item label="开户行" prop="bankName">
          <el-input v-model="form.bankName" placeholder="请输入开户行" />
        </el-form-item>
        <el-form-item label="银行账号" prop="bankAccount">
          <el-input v-model="form.bankAccount" placeholder="请输入银行账号" />
        </el-form-item>
        <!-- <el-form-item label="名称/单位名称" prop="taxName">
          <el-input v-model="form.taxName" placeholder="请输入名称/单位名称" />
        </el-form-item> -->
        <el-form-item label="纳税人识别号" prop="taxNumber">
          <el-input v-model="form.taxNumber" placeholder="请输入纳税人识别号" />
        </el-form-item>
        <el-form-item label="联系人电话" prop="officePhone">
          <el-input v-model="form.officePhone" placeholder="请输入单位电话" />
        </el-form-item>
        <el-form-item label="联系人姓名" prop="contractPerson">
          <el-input v-model="form.contractPerson" placeholder="请输入联系人姓名" />
        </el-form-item>
        <!-- <el-form-item label="单位地址" prop="officeAddress">
          <el-input v-model="form.officeAddress" placeholder="请输入单位地址" />
        </el-form-item> -->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>

      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listCustomer, getCustomer, delCustomer, addCustomer, updateCustomer } from '@/api/customer/customer'
import { addFile } from '@/api/wujie/file';
import { getToken } from "@/utils/auth";

// const customerTypeEnum = {
//   0:'联系人',
//   1:'案源人',
//   2:'服务成员',
// }

// const customerTypes = [
//   {
//     value: 0,
//     label: "联系人"
//   },
//   {
//     value: 1,
//     label: "案源人"
//   },
//   {
//     value: 2,
//     label: "服务成员"
//   }
// ]

export default {
  name: 'Customer',
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
      customerList: [],
      // 弹出层标题
      title: '',
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        contractPhone: null,
        contractAddress: null,
        type: null,
        bankUsername: null,
        bankName: null,
        bankAccount: null,
        taxName: null,
        taxNumber: null,
        officePhone: null,
        officeAddress: null,
        idCardNum: null,
        contractPerson: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: '客户姓名不能为空', trigger: 'blur' }
        ],
        contractPhone: [
          { required: true, message: '联系电话不能为空', trigger: 'blur' }
        ]
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
        customerId: null,
      },
      //customerTypeEnum,
      //customerTypes,
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询客户信息列表 */
    getList() {
      this.loading = true
      listCustomer(this.queryParams).then(response => {
        this.customerList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        name: null,
        contractPhone: null,
        contractAddress: null,
        type: null,
        bankUsername: null,
        bankName: null,
        bankAccount: null,
        taxName: null,
        taxNumber: null,
        officePhone: null,
        officeAddress: null,
        del: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        contractPerson: null,
        idCardNum: null,
      }
      this.resetForm('form')
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm('queryForm')
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = '添加客户信息'
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getCustomer(id).then(response => {
        this.form = response.data
        this.form.type = parseInt(this.form.type); // 补丁
        this.open = true
        this.title = '修改客户信息'
        console.log(this.form)
      })
    },
    handleDetail(row) {
      this.$router.push({ path: "/customer/customer/detail", query: {id: row.id} });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs['form'].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateCustomer(this.form).then(response => {
              this.$modal.msgSuccess('修改成功')
              this.open = false
              this.getList()
            })
          } else {
            addCustomer(this.form).then(response => {
              this.$modal.msgSuccess('新增成功')
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids
      this.$modal.confirm('是否确认删除客户信息编号为"' + ids + '"的数据项？').then(function () {
        return delCustomer(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess('删除成功')
      }).catch(() => { })
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('customer/customer/export', {
        ...this.queryParams
      }, `customer_${new Date().getTime()}.xlsx`)
    },
    // 文件上传中处理
    handleFileUploadProgress(event, file, fileList) {
      this.upload.isUploading = true;
    },
    // 文件上传成功处理
    handleFileSuccess(response, file, fileList) {
      this.upload.isUploading = false;
      this.form.filePath = response.url;
      let queryparams = {
        customerId: this.upload.customerId,
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
    SetUploadcolumn(column) {
      this.upload.customerId = column.id;
    }
  }
}
</script>

