<template>
    <div class="app-container">
        <el-descriptions title="用户信息" class="detail">
            <el-descriptions-item label="ID">{{ form.id }}</el-descriptions-item>
            <el-descriptions-item label="客户姓名"> {{ form.name }}</el-descriptions-item>
            <el-descriptions-item label="联系电话"> {{ form.contractPhone }}</el-descriptions-item>
            <el-descriptions-item label="联系地址"> {{ form.contractAddress }}</el-descriptions-item>
            <el-descriptions-item label="身份证号"> {{ form.idCardNum }}</el-descriptions-item>
            <!-- <el-descriptions-item label="客户类别"> {{ customerTypeEnum[form.type] }}</el-descriptions-item> -->
            <!-- <el-descriptions-item label="银行信息"> {{ form.bankUsername }}</el-descriptions-item> -->
            <el-descriptions-item label="开户行"> {{ form.bankName }}</el-descriptions-item>
            <el-descriptions-item label="银行账号"> {{ form.bankAccount }}</el-descriptions-item>
            <!-- <el-descriptions-item label="名称/单位名称"> {{ form.taxName }}</el-descriptions-item> -->
            <el-descriptions-item label="纳税人识别号"> {{ form.taxNumber }}</el-descriptions-item>
            <el-descriptions-item label="联系人电话"> {{ form.officePhone }}</el-descriptions-item>
            <!-- <el-descriptions-item label="单位地址"> {{ form.officeAddress }} </el-descriptions-item> -->
        </el-descriptions>
        <el-descriptions title="用户文件">
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
        <el-descriptions title="用户合同">
            <el-descriptions-item>
                <el-table :data="contractList">
                    <el-table-column label="id" align="center" prop="id" />
                    <el-table-column label="合同状态" align="center" prop="state">
                        <template slot-scope="scope">
                            {{ statusType[scope.row.state] }}
                        </template>
                    </el-table-column>
                    <el-table-column label="操作">
                        <template slot-scope="scope">
                            <el-button size="mini" type="text" icon="el-icon-edit"
                                @click="handleContractDetail(scope.row)">详情</el-button>
                        </template>
                    </el-table-column>
                </el-table>
            </el-descriptions-item>
        </el-descriptions>
    </div>
</template>

<script>
import { getCustomer } from "@/api/customer/customer"
import { customerFileList, deleteFile } from '@/api/wujie/file'
import { listContract } from '@/api/wujie/contract'

const customerTypeEnum = {
    0: '联系人',
    1: '案源人',
    2: '服务成员',
}
const statusType = {
    0: '待审核',
    1: '审核通过'
}

export default {
    name: 'CustomerDetail',
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
                idCardNum: null,
            },
            customerTypeEnum,
            statusType,
            fileList: [],
            contractList: [],
        }
    },
    mounted() {
        let customerId = this.getQueryVariable('id')
        getCustomer(customerId).then((res) => {
            this.form = res.data;
        })
        customerFileList(customerId).then((res) => {
            this.fileList = res.data
        })
        listContract({
            pageNum: 1,
            pageSize: 1000,//设置足够大的数
            customerId: customerId,
            state: null,
            del: null,
        }).then((res) => {
            this.contractList = res.rows;
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
        handleContractDetail(row) {
            this.$router.push({ path: "/contract/contract/detail", query: { id: row.id } });
        }
    }
}

</script>

<style>
.detail {
    margin: 0 0 30px 0
}
</style>