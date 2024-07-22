<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="案件类型">
        <el-select v-model="queryParams.type" placeholder="请选择" clearable @change="handleSearchCaseTypeChange()">
          <el-option v-for="item in getCaseTypeList()" :key="item.key" :label="item.label" :value="item.key">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="客户姓名" prop="customerId">
        <el-select v-model="queryParams.customerId" placeholder="请选择" filterable>
          <el-option v-for="item in customerList" :key="item.id" :label="item.name" :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="委托人名称" prop="clientName">
        <el-input v-model="queryParams.clientName" placeholder="请输入委托人名称" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="委托人身份证/统一社会信用号码" prop="clientId" label-width="220px">
        <el-input v-model="queryParams.clientId" placeholder="请输入" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="收费" prop="reward">
        <el-input v-model="queryParams.reward" placeholder="请输入收费" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="地位" prop="role" v-if="[1, 2, 3, 4, 5].includes(queryParams.type)">
        <el-select v-model="queryParams.role" placeholder="请选择" clearable v-if="queryParams.type === 1">
          <el-option v-for="item in getRoleTypeList('xing')" :key="item.key" :label="item.label" :value="item.key">
          </el-option>
        </el-select>
        <el-select v-model="queryParams.role" placeholder="请选择" clearable
          v-if="queryParams.type === 2 || queryParams.type === 3">
          <el-option v-for="item in getRoleTypeList('min')" :key="item.key" :label="item.label" :value="item.key">
          </el-option>
        </el-select>
        <el-select v-model="queryParams.role" placeholder="请选择" clearable
          v-if="queryParams.type === 4 || queryParams.type === 5">
          <el-option v-for="item in getRoleTypeList('cai')" :key="item.key" :label="item.label" :value="item.key">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="诉讼阶段" v-if="[1, 2, 3].includes(queryParams.type)">
        <el-select v-model="queryParams.stage" placeholder="请选择" clearable v-if="queryParams.type === 1">
          <el-option v-for="item in getStageTypeList('xing')" :key="item.key" :label="item.label"
            :value="item.key"></el-option>
        </el-select>
        <el-select v-model="queryParams.stage" placeholder="请选择" clearable v-if="queryParams.type === 2">
          <el-option v-for="item in getStageTypeList('min')" :key="item.key" :label="item.label"
            :value="item.key"></el-option>
        </el-select>
        <el-select v-model="queryParams.stage" placeholder="请选择" clearable v-if="queryParams.type === 3">
          <el-option v-for="item in getStageTypeList('zheng')" :key="item.key" :label="item.label"
            :value="item.key"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="案号" prop="caseNumber" v-if="[1, 2, 3, 4, 5].includes(queryParams.type)">
        <el-input v-model="queryParams.caseNumber" placeholder="请输入案号" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="办案机关" prop="caseOffice" v-if="[1, 2, 3, 4, 5].includes(queryParams.type)">
        <el-input v-model="queryParams.caseOffice" placeholder="请输入办案机关" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="罪名" prop="crimeName" v-if="queryParams.type === 1">
        <el-input v-model="queryParams.crimeName" placeholder="请输入罪名" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="被告人" prop="defendant" v-if="queryParams.type === 1">
        <el-input v-model="queryParams.defendant" placeholder="请输入被告人" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd">新增</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="caseList">
      <el-table-column label="案件ID" align="center" prop="caseId" />
      <el-table-column label="委托人名称" align="center">
        <template slot-scope="scope">
          {{ scope.row.ncustomer.name }}
        </template>
      </el-table-column>
      <el-table-column label="委托人身份证/统一社会信用号码" align="center" prop="clientId">
        <template slot-scope="scope">
          {{ scope.row.ncustomer.idCardNum }}
        </template>
      </el-table-column>
      <el-table-column label="案件类别" align="center" prop="type">
        <template slot-scope="scope">
          {{ caseTypeMap[scope.row.type] }}
        </template>
      </el-table-column>
      <el-table-column label="地位" align="center" prop="role">
        <template slot-scope="scope">
          {{ roleTypeMap[scope.row.role] }}
        </template>
      </el-table-column>
      <el-table-column label="诉讼阶段" align="center" prop="stage">
        <template slot-scope="scope">
          {{ stageTypeMap[scope.row.stage] }}
        </template>
      </el-table-column>
      <el-table-column label="案号" align="center" prop="caseNumber" />
      <el-table-column label="案件性质/业务性质" align="center" prop="caseCore" />
      <el-table-column label="收费" align="center" prop="reward" />
      <el-table-column label="办案机关" align="center" prop="caseOffice" />
      <el-table-column label="顾问期限" align="center" prop="startTime" width="180">
        <template slot-scope="scope">
          <span>{{ `${scope.row.startTime ? `${parseTime(scope.row.startTime, '{y}-{m}-{d}')} -
                      ${parseTime(scope.row.endTime, '{y}-{m}-{d}')}` : ''}`
          }}</span>
        </template>
      </el-table-column>
      <el-table-column label="罪名" align="center" prop="crimeName" />
      <el-table-column label="被告人" align="center" prop="defendant" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="220px">
        <template slot-scope="scope">
          <el-button size="mini" type="text" @click="handleDetail(scope.row)">详情</el-button>
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)">删除</el-button>
          <el-button size="mini" type="text" @click="handleCreateInvoice(scope.row)">申请开票</el-button>
          <el-upload ref="upload" :limit="1" :action="upload.url" :headers="upload.headers" :show-file-list="false"
            :auto-upload="true" :on-progress="handleFileUploadProgress" :on-success="handleFileSuccess">
            <el-button slot="trigger" size="small" type="primary" @click="SetUploadcolumn(scope.row)">上传文件</el-button>
          </el-upload>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
      @pagination="getList" />

    <el-dialog title="申请开票" :visible.sync="invoiceForm" width="500px" append-to-body size="mini">
      <el-form ref="invoiceForm" :model="createInvoiceForm" :rules="invoiceFormRules">
        <el-form-item label="发票类型" prop="invoiceType">
          <el-checkbox-group v-model="createInvoiceForm.invoiceType">
            <el-checkbox label="专票"></el-checkbox>
            <el-checkbox label="普票"></el-checkbox>
          </el-checkbox-group>
        </el-form-item>
        <el-form-item label="金额" prop="count">
          <el-input v-model="createInvoiceForm.count" placeholder="请输入发票金额"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitInvoiceForm">确 定</el-button>
        <el-button @click="cancelInvoiceForm">取 消</el-button>
      </div>
    </el-dialog>
    <!-- 添加或修改案件信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1500px" append-to-body size="mini">
      <el-form v-if="newCaseFormStage === 0" :inline="true">
        <el-form-item label="客户姓名" prop="name">
          <el-input v-model="queryCustomerParams.name" placeholder="请输入客户姓名" clearable
            @keyup.enter.native="handleQuery" />
        </el-form-item>
        <el-form-item label="联系电话" prop="contractPhone">
          <el-input v-model="queryCustomerParams.contractPhone" placeholder="请输入联系电话" clearable
            @keyup.enter.native="handleQuery" />
        </el-form-item>
        <el-form-item label="纳税人识别号" prop="taxNumber">
          <el-input v-model="queryCustomerParams.taxNumber" placeholder="请输入纳税人识别号" clearable
            @keyup.enter.native="handleQuery" />
        </el-form-item>
        <el-form-item label="开户行" prop="bankName">
          <el-input v-model="queryCustomerParams.bankName" placeholder="请输入开户行" clearable
            @keyup.enter.native="handleQuery" />
        </el-form-item>
        <el-form-item label="银行账号" prop="bankAccount">
          <el-input v-model="queryCustomerParams.bankAccount" placeholder="请输入银行账号" clearable
            @keyup.enter.native="handleQuery" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleCustomerQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetCustomerQuery">重置</el-button>
        </el-form-item>
      </el-form>
      <el-form ref="form0" :model="form" :rules="rules" label-width="130px" v-if="newCaseFormStage === 0" :inline="true"
        label-position="left">
        <el-form-item label="已选择的客户ID" prop="customerId">
          <el-input v-model="form.customerId" disabled></el-input>
        </el-form-item>
      </el-form>
      <el-table v-loading="loading" :data="customerList" v-show="newCaseFormStage === 0">
        <el-table-column label="id" align="center" prop="id" />
        <el-table-column label="客户姓名" align="center" prop="name" />
        <el-table-column label="联系电话" align="center" prop="contractPhone" />
        <el-table-column label="开户行" align="center" prop="bankName" />
        <el-table-column label="银行账号" align="center" prop="bankAccount" />
        <el-table-column label="纳税人识别号" align="center" prop="taxNumber" />
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="180">
          <template slot-scope="scope">
            <el-button size="mini" type="text" icon="el-icon-edit"
              @click="handleSelectedCustomerID(scope.row)">选择</el-button>
          </template>
        </el-table-column>
      </el-table>
      <pagination v-show="totalCustomer > 0 && newCaseFormStage === 0" :total="totalCustomer"
        :page.sync="queryCustomerParams.pageNum" :limit.sync="queryCustomerParams.pageSize"
        @pagination="getCustomerList" />
      <el-form ref="form1" :model="form" :rules="rules" label-width="100px" v-show="newCaseFormStage === 1">
        <el-form-item label="案件类型" prop="type">
          <el-select v-model="form.type" placeholder="请选择" clearable @change="changeFormCaseType">
            <el-option v-for="item in getCaseTypeList()" :key="item.key" :label="item.label" :value="item.key">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <el-form ref="form2" :model="form" :rules="rules" label-width="220px" v-show="newCaseFormStage === 2">
        <el-form-item label="地位" prop="role" v-if="[1, 2, 3, 4, 5].includes(Number(form.type))">
          <el-select v-model="form.role" placeholder="请选择" clearable v-if="Number(form.type) === 1">
            <el-option v-for="item in getRoleTypeList('xing')" :key="item.key" :label="item.label" :value="item.key">
            </el-option>
          </el-select>
          <el-select v-model="form.role" placeholder="请选择" clearable
            v-if="Number(form.type) === 2 || Number(form.type) === 3">
            <el-option v-for="item in getRoleTypeList('min')" :key="item.key" :label="item.label" :value="item.key">
            </el-option>
          </el-select>
          <el-select v-model="form.role" placeholder="请选择" clearable
            v-if="Number(form.type) === 4 || Number(form.type) === 5">
            <el-option v-for="item in getRoleTypeList('cai')" :key="item.key" :label="item.label" :value="item.key">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="诉讼阶段" prop="stage" v-if="[1, 2, 3].includes(Number(form.type))">
          <el-select v-model="form.stage" placeholder="请选择" clearable v-if="Number(form.type) === 1">
            <el-option v-for="item in getStageTypeList('xing')" :key="item.key" :label="item.label"
              :value="item.key"></el-option>
          </el-select>
          <el-select v-model="form.stage" placeholder="请选择" clearable v-if="Number(form.type) === 2">
            <el-option v-for="item in getStageTypeList('min')" :key="item.key" :label="item.label"
              :value="item.key"></el-option>
          </el-select>
          <el-select v-model="form.stage" placeholder="请选择" clearable v-if="Number(form.type) === 3">
            <el-option v-for="item in getStageTypeList('zheng')" :key="item.key" :label="item.label"
              :value="item.key"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="案号" prop="caseNumber" v-if="[1, 2, 3, 4, 5].includes(Number(form.type))">
          <el-input v-model="form.caseNumber" placeholder="请输入案号" />
        </el-form-item>
        <el-form-item label="案件性质/业务性质" prop="caseCore" v-if="[2, 3, 4, 5, 6, 7].includes(Number(form.type))">
          <el-input v-model="form.caseCore" placeholder="请输入案件性质/业务性质" />
        </el-form-item>
        <el-form-item label="收费" prop="reward">
          <el-input v-model="form.reward" placeholder="请输入收费" />
        </el-form-item>
        <el-form-item label="办案机关" prop="caseOffice" v-if="[1, 2, 3, 4, 5].includes(Number(form.type))">
          <el-input v-model="form.caseOffice" placeholder="请输入办案机关" />
        </el-form-item>
        <el-form-item label="顾问期限" v-if="Number(form.type) === 6">
          <el-date-picker v-model="timeRange" type="daterange" range-separator="至" start-placeholder="开始日期"
            value-format="yyyy-MM-dd" end-placeholder="结束日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="罪名" prop="crimeName" v-if="Number(form.type) === 1">
          <el-input v-model="form.crimeName" placeholder="请输入罪名" />
        </el-form-item>
        <el-form-item label="被告人" prop="defendant" v-if="Number(form.type) === 1">
          <el-input v-model="form.defendant" placeholder="请输入被告人" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">
          {{ `${newCaseFormStage === 2 ? '确 定' : '下一步'}` }}
        </el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listCase, getCase, delCase, addCase, updateCase } from "@/api/wujie/case";
import { listCustomer } from '@/api/customer/customer.js'
import { addFile } from '@/api/wujie/file';
import { getToken } from "@/utils/auth";
import { caseTypeMap, roleTypeMap, stageTypeMap } from './maps'
import { addFinance } from "@/api/wujie/finance";

const roleTypeMapXing = {
  0: '被告人',
  1: '被害人',
}

const roleTypeMapMin = {
  2: '被告',
  3: '原告',
  4: '第三人',
}

const roleTypeMapCai = {
  5: '被申请人',
  6: '申请人',
}

const stageMapXing = {
  0: '未开始',
  1: '侦察',
  2: '审查起诉',
  3: '一审',
  4: '二审',
  5: '死刑复核',
  99: '结案',
}

const stageMapMin = {
  0: '未开始',
  3: '一审',
  4: '二审',
  6: '再审',
  99: '结案',
}

const stageMapZheng = {
  0: '未开始',
  3: '一审',
  4: '二审',
  6: '再审',
  7: '行政复议',
  99: '结案',
}


export default {
  name: "Case",
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
      totalCustomer: 0,
      // 案件信息表格数据
      caseList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        customerId: null,
        clientName: null,
        clientId: null,
        type: null,
        role: null,
        stage: null,
        caseNumber: null,
        caseCore: null,
        reward: null,
        caseOffice: null,
        del: null,
        startTime: null,
        endTime: null,
        crimeName: null,
        defendant: null,
      },
      queryCustomerParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        contractPhone: null,
        bankName: null,
        bankAccount: null,
        taxNumber: null,
      },
      // 表单参数
      form: {
        caseId: null,
        customerId: null,
        clientName: null,
        clientId: null,
        type: null,
        role: null,
        stage: null,
        caseNumber: null,
        caseCore: null,
        reward: null,
        caseOffice: null,
        del: null,
        startTime: null,
        endTime: null,
        crimeName: null,
        defendant: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        timeRange: [],
      },
      // 表单校验
      rules: {
        customerId: [
          { required: true, message: "关联的客户ID不能为空", trigger: "blur" }
        ],
        type: [
          { required: true, message: "案件类型不能为空", trigger: "blur" }
        ],
      },
      invoiceFormRules: {
        invoiceType: [
          { required: true, message: "发票类型不能为空", trigger: "blur" }
        ],
        count: [
          { required: true, message: "金额不能为空", trigger: "blur" }
        ]
      },
      customerList: [],
      roleTypeMapXing,
      roleTypeMapMin,
      roleTypeMapCai,
      caseTypeMap,
      roleTypeMap,
      stageTypeMap,
      newCaseFormStage: 0,
      timeRange: [],
      upload: {
        // 是否禁用上传
        isUploading: false,
        // 设置上传的请求头部
        headers: { Authorization: "Bearer " + getToken() },
        // 上传的地址
        url: process.env.VUE_APP_BASE_API + "/common/upload",
        // 上传的文件列表
        fileList: [],
        caseId: null,
      },
      createInvoiceForm: {
        caseId: null,
        type: '1', // 开票默认收款
        paypeople: null,
        state: '0', // 状态默认未开票
        count: null, // 金额
        invoiceType: [],
      },
      invoiceForm: false,
    };
  },
  created() {
    this.getList();
    this.getCustomerList();
  },
  mounted() {
  },
  methods: {
    /** 查询案件信息列表 */
    getList() {
      this.loading = true;
      listCase(this.queryParams).then(response => {
        this.caseList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    getCustomerList() {
      this.loading = true;
      listCustomer(this.queryCustomerParams).then((res) => {
        this.customerList = res.rows;
        this.totalCustomer = res.total;
        this.loading = false;
      })
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.newCaseFormStage = 0;
      this.reset();
    },
    // 表单重置
    reset() {
      this.newCaseFormStage = 0;
      this.form = {
        caseId: null,
        customerId: null,
        clientName: null,
        clientId: null,
        type: null,
        role: null,
        stage: null,
        caseNumber: null,
        caseCore: null,
        reward: null,
        caseOffice: null,
        del: null,
        startTime: null,
        endTime: null,
        crimeName: null,
        defendant: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
      };
      this.queryCustomerParams = {
        pageNum: 1,
        pageSize: 10,
        name: null,
        contractPhone: null,
        bankName: null,
        bankAccount: null,
        taxNumber: null,
      };
      this.timeRange = [];
      this.resetForm('form0');
      this.resetForm('form1');
      this.resetForm('form2');
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
      this.newCaseFormStage = 0;
      this.title = "添加案件信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const caseId = row.caseId || this.ids
      getCase(caseId).then(response => {
        this.form = response.data;
        this.timeRange.push(this.form.startTime);
        this.timeRange.push(this.form.endTime);
        this.open = true;
        this.newCaseFormStage = 0;
        this.title = "修改案件信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      if (this.newCaseFormStage === 0) {
        this.$refs["form0"].validate(valid => {
          if (valid) {
            this.newCaseFormStage++;
          }
          return;
        })
      }
      else if (this.newCaseFormStage === 1) {
        this.$refs['form1'].validate(valid => {
          if (valid) {
            this.newCaseFormStage++;
            console.log(this.form);
            console.log(this.timeRange);
          }
          return;
        })
      }
      else if (this.newCaseFormStage === 2) {
        this.$refs['form2'].validate(valid => {
          if (valid) {
            this.form.startTime = (this.timeRange && this.timeRange.length === 2) ? this.timeRange[0] : null;
            this.form.endTime = (this.timeRange && this.timeRange.length === 2) ? this.timeRange[1] : null;
            console.log(this.form.startTime, this.form.endTime);
            if (this.form.caseId != null) {
              updateCase(this.form).then(response => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.newCaseFormStage = 0;
                this.getList();
              });
            } else {
              addCase(this.form).then(response => {
                this.$modal.msgSuccess("新增成功");
                this.open = false;
                this.newCaseFormStage = 0;
                this.getList();
              });
            }
          }
        })
      }
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const caseIds = row.caseId || this.ids;
      this.$modal.confirm('是否确认删除案件信息编号为"' + caseIds + '"的数据项？').then(function () {
        return delCase(caseIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => { });
    },
    getRoleTypeList(type) {
      let roleTypeList = [];
      if (type === 'xing') {
        return this.MaptoList(roleTypeMapXing);
      }
      else if (type === 'min') {
        return this.MaptoList(roleTypeMapMin);
      }
      else if (type === 'cai') {
        return this.MaptoList(roleTypeMapCai);
      }
      return roleTypeList;
    },
    getStageTypeList(type) {
      let stageTypeList = [];
      if (type === 'xing') {
        return this.MaptoList(stageMapXing)
      }
      else if (type === 'min') {
        return this.MaptoList(stageMapMin)
      }
      else if (type === 'zheng') {
        return this.MaptoList(stageMapZheng);
      }
      return stageTypeList;
    },
    getCaseTypeList() {
      return this.MaptoList(caseTypeMap);
    },
    MaptoList(mp) {
      let list = [];
      Object.keys(mp).forEach((key) => {
        list.push({
          key: key,
          label: mp[key],
        })
      })
      return list;
    },
    handleSearchCaseTypeChange() {
      this.queryParams.role = null;
      this.queryParams.stage = null;
      this.queryParams.caseNumber = null;
      this.queryParams.caseOffice = null;
      this.queryParams.crimeName = null;
      this.queryParams.defendant = null;
    },
    handleCustomerQuery() {
      console.log("customerQuery")
      this.queryCustomerParams.pageNum = 1
      this.getCustomerList();
    },
    resetCustomerQuery() {
      console.log('resetCustomerQuery');
      this.queryCustomerParams = {
        pageNum: 1,
        pageSize: 10,
        name: null,
        contractPhone: null,
        bankName: null,
        bankAccount: null,
        taxNumber: null,
      }
    },
    handleSelectedCustomerID(row) {
      this.form.customerId = row.id;
    },
    changeFormCaseType() {
      this.timeRange = [];
      this.form.clientName = null;
      this.form.clientId = null;
      this.form.role = null;
      this.form.stage = null;
      this.form.caseNumber = null;
      this.form.caseCore = null;
      this.form.reward = null;
      this.form.caseOffice = null;
      this.form.crimeName = null;
      this.form.defendant = null;
      this.form.startTime = null;
      this.form.endTime = null;
    },
    SetUploadcolumn(column) {
      this.upload.caseId = column.caseId;
    },
    handleFileUploadProgress(event, file, fileList) {
      this.upload.isUploading = true;
    },
    handleFileSuccess(response, file, fileList) {
      this.upload.isUploading = false;
      this.form.filePath = response.url;
      let queryparams = {
        caseId: this.upload.caseId,
        useType: 1,
        fileName: `${response.originalFileName}.${response.fileType}`,
        fileType: response.fileType,
        filePath: `${response.url}`,
        fileSize: response.size
      }
      console.log(this.upload);
      addFile(queryparams).then(() => {
        this.$modal.msgSuccess(response.msg);
        setInterval(() => {
          location.reload();
        }, 500);
      })
    },
    handleDetail(row) {
      this.$router.push({ path: "case/detail", query: { id: row.caseId } });
    },
    handleCreateInvoice(row) {
      this.invoiceForm = true;
      this.createInvoiceForm.caseId = row.caseId;
      this.createInvoiceForm.paypeople = row.ncustomer.name;
    },
    submitInvoiceForm() {
      this.$refs["invoiceForm"].validate(valid => {
        if (valid) {
          if (this.createInvoiceForm.invoiceType.length === 2) {
            let params1 = {
              caseId: this.createInvoiceForm.caseId,
              type: '1', // 开票默认收款
              paypeople: this.createInvoiceForm.paypeople,
              state: '0', // 状态默认未开票
              count: this.createInvoiceForm.count, // 金额
              invoiceType: '0',
            }
            let params2 = {
              caseId: this.createInvoiceForm.caseId,
              type: '1', // 开票默认收款
              paypeople: this.createInvoiceForm.paypeople,
              state: '0', // 状态默认未开票
              count: this.createInvoiceForm.count, // 金额
              invoiceType: '1',
            };
            console.log(params1, params2);
            addFinance(params1).then((res) => {
              addFinance(params2).then((res) => {
                this.$modal.msgSuccess("新增成功");
                this.invoiceForm = false;
                this.getList();
              })
            })
          } else {
            let params = {
              caseId: this.createInvoiceForm.caseId,
              type: '1', // 开票默认收款
              paypeople: this.createInvoiceForm.paypeople,
              state: '0', // 状态默认未开票
              count: this.createInvoiceForm.count, // 金额
              invoiceType: this.createInvoiceForm.invoiceType[0] === "专票" ? 0 : 1,
            };
            console.log(params);
            addFinance(params).then((res) => {
              this.$modal.msgSuccess("新增成功");
              this.invoiceForm = false;
              this.getList();
            })
          }
        }
      })
    },
    cancelInvoiceForm() {
      this.invoiceForm = false;
    },
  }
};
</script>

<style>
.inline-button {
  display: inline-block;
}
</style>