<template>
    <div class="app-container">
        <el-descriptions title="合同信息" class="detail">
            <el-descriptions-item label="合同id">{{ form.id }}</el-descriptions-item>
            <el-descriptions-item label="客户姓名">
                <el-button @click="CustomerDetail()" type="text" class="upper">{{ getCustomerName() }}</el-button>
            </el-descriptions-item>
            <el-descriptions-item label="状态"> {{ statusType[form.state] }}</el-descriptions-item>
        </el-descriptions>

        <el-descriptions title="合同文件">
            <el-descriptions-item>
                <el-table :data="fileList">
                    <el-table-column label="文件名" prop="fileName"></el-table-column>
                    <el-table-column label="文件大小" prop="fileSize">
                        <template slot-scope="scope">
                            {{ formatSize(scope.row.fileSize) }}
                        </template>
                    </el-table-column>
                    <el-table-column label="上传时间" prop="createTime"></el-table-column>
                    <el-table-column label="上传人" prop="createBy"></el-table-column>
                    <el-table-column label="操作">
                        <template slot-scope="scope">
                            <el-button @click="handleDownload(scope.row)" size="mini" type="text">
                                下载
                            </el-button>
                            <el-button size="mini" type="text" icon="el-icon-delete"
                                @click="handleDelete(scope.row)">删除</el-button>
                        </template>
                    </el-table-column>
                </el-table>
            </el-descriptions-item>
        </el-descriptions>
        <el-descriptions title="合同财务信息" :column="1">
            <el-descriptions-item><div class="newline">总计收支：{{ calculateSum() }}</div></el-descriptions-item>
            <el-descriptions-item>
                <el-table :data="financeList">
                    <el-table-column label="财务信息ID" align="center" prop="id" />
                    <el-table-column label="类别" align="center">
                        <template slot-scope="scope">
                            {{ financetypeEnum[scope.row.type] }}
                        </template>
                    </el-table-column>
                    <el-table-column label="付款/收款方" align="center" prop="paypeople" />
                    <el-table-column label="金额" align="center" prop="count" />
                    <el-table-column label="财务状态" align="center" prop="state">
                        <template slot-scope="scope">
                            {{ financestateEnum[scope.row.state] }}
                        </template>
                    </el-table-column>
                    <el-table-column label="操作">
                        <template slot-scope="scope">
                            <el-button size="mini" type="text" icon="el-icon-edit"
                                @click="handleFinanceDetail(scope.row)">详情</el-button>
                        </template>
                    </el-table-column>
                </el-table>
            </el-descriptions-item>
        </el-descriptions>
    </div>
</template>

<script>
import { getContract } from "@/api/wujie/contract"
import { contractFileList, deleteFile } from '@/api/wujie/file'
import { listFinance } from '@/api/wujie/finance';

const statusType = {
    0: '待审核',
    1: '审核通过'
}

const financetypeEnum = {
  0: '付款',
  1: '收款',
}

const financestateEnum = {
  0: '未付款',
  1: '已收款',
  2: '已开票',
}

export default {
    name: 'ContractDetail',
    data() {
        return {
            form: {
                id: null,
                name: null,
                contractPhone: null,
                contractAddress: null,
                type: null,
                bankName: null,
                bankAccount: null,
                bankUsername: null,
                taxName: null,
                taxNumber: null,
                officeAddress: null,
                officePhone: null,
            },
            financeList: [],
            statusType,
            fileList: [],
            financetypeEnum,
            financestateEnum,
        }
    },
    mounted() {
        let contractId = this.getQueryVariable('id')
        getContract(contractId).then((res) => {
            this.form = res.data;
        })
        contractFileList(contractId).then((res) => {
            this.fileList = res.data
        })
        listFinance({
            pageNum: 1,
            pageSize: 1000,//设置足够大的数
            contractId: contractId,
            state: null,
            del: null,
        }).then((res) => {
            this.financeList = res.rows;
        })
    },
    methods: {
        getQueryVariable(variable) {
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i = 0; i < vars.length; i++) {
                var pair = vars[i].split("=");
                if (pair[0] == variable) { return pair[1]; }
            }
            return (false);
        },
        handleDownload(row) {
            let url = row.filePath;
            if(url.indexOf("https") < 0) {
                url = url.replace("http:", "https:");
            }
            // this.xhrequest(url, (blob, fileType) => {
            //     try {
            //         const href = window.URL.createObjectURL(blob); //创建下载的链接
            //         if (window.navigator.msSaveBlob) {
            //             window.navigator.msSaveBlob(blob, fileType);
            //         } else {
            //             // 谷歌浏览器 创建a标签 添加download属性下载
            //             const downloadElement = document.createElement("a");
            //             downloadElement.href = href;
            //             downloadElement.target = "_blank";
            //             downloadElement.download = row.fileName;
            //             document.body.appendChild(downloadElement);
            //             downloadElement.click(); // 点击下载
            //             document.body.removeChild(downloadElement); // 下载完成移除元素
            //             window.URL.revokeObjectURL(href); // 释放掉blob对象
            //         }
            //     } catch (e) {
            //         console.log("下载失败");
            //     }
            // })
            window.open(url);
        },
        async xhrequest(url, callback) {
            let DownUrl = url;
            let data = await fetch(DownUrl)
                .then((response) => response.blob())
                .then((res) => {
                    //获取文件格式
                    var index = DownUrl.lastIndexOf(".");
                    //获取文件后缀判断文件格式
                    var fileType = DownUrl.substr(index + 1);
                    let blod = new Blob([res]);
                    if (typeof callback == "function") {
                        callback(blod, fileType)
                    }
                });
            return data;
        },
        handleDelete(row) {
            deleteFile(row.fileId).then(() => {
                this.$modal.msgSuccess('删除成功')
                setInterval(() => {
                    location.reload();
                }, 500);
            });
        },

        formatSize(bytes) {
            const units = ['字节', 'KB', 'MB', 'GB', 'TB']
            let size = bytes;
            let unitIndex = 0;
            while (size > 1024 && unitIndex < units.length - 1) {
                size /= 1024;
                unitIndex++;
            }
            size = Math.round(size * 100) / 100
            return `${size}${units[unitIndex]}`
        },

        CustomerDetail() {
            this.$router.push({ path: "/customer/customer/detail", query: { id: this.form.customerId } })
        },

        handleFinanceDetail(row) {
            this.$router.push({ path: "/finance/finance/detail", query: { id: row.id } });
        },

        calculateSum() {
            if(!this.financeList || !this.financeList.length) {
                return 0;
            }
            else {
                let sum = 0
                for(let i = 0; i< this.financeList.length; i++) {
                    if(this.financeList[i].type === '0') {
                        sum -= this.financeList[i].count;
                    }
                    else {
                        sum += this.financeList[i].count;
                    }
                }
                return sum;
            }
        },
        getCustomerName() {
            return this.form?.ncustomer?.name
        }
    }
}

</script>

<style>
.detail {
    margin: 0 0 30px 0
}

.upper {
    margin: -8px 0 0 0
}

.newline {
    display: block;
    margin: 15px
}
</style>