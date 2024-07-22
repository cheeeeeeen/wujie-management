<template>
    <div class="app-container">
        <el-descriptions title="财务信息详情" class="detail">
            <el-descriptions-item label="财务信息ID">{{ form.id }}</el-descriptions-item>
            <el-descriptions-item label="合同ID" v-if="form.contractId">
                <el-button @click="ContractDetail()" type="text" class="upper">{{ form.contractId }}</el-button>
            </el-descriptions-item>
            <el-descriptions-item label="状态"> {{ stateEnum[form.state] }}</el-descriptions-item>
            <el-descriptions-item label="类别"> {{ typeEnum[form.type] }}</el-descriptions-item>
            <el-descriptions-item label="付款/收款方"> {{ form.paypeople }}</el-descriptions-item>
            <el-descriptions-item label="金额"> {{ form.count }}</el-descriptions-item>
            <el-descriptions-item label="发票类型" v-if="form.invoiceType"> {{ invoiceTypeMap[form.invoiceType] }} </el-descriptions-item>
        </el-descriptions>

        <el-descriptions title="财务信息文件">
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

        <el-descriptions title="案件信息" v-if="form.nCase">
            <el-descriptions-item label="案件ID">{{ form.nCase.caseId }}</el-descriptions-item>
            <el-descriptions-item label="客户姓名"> {{ form.paypeople }}</el-descriptions-item>
            <el-descriptions-item label="委托人身份证/统一社会信用号码"> {{ form.nCase.ncustomer.idCardNum }}</el-descriptions-item>
            <el-descriptions-item label="案件类型"> {{ caseTypeMap[form.nCase.type] }} </el-descriptions-item>
            <el-descriptions-item label="地位" v-if="[1, 2, 3, 4, 5].includes(Number(form.nCase.type))">
                {{ roleTypeMap[form.nCase.role] }}
            </el-descriptions-item>
            <el-descriptions-item label="诉讼阶段" v-if="[1, 2, 3].includes(Number(form.nCase.type))">
                {{ stageTypeMap[form.nCase.stage] }}
            </el-descriptions-item>
            <el-descriptions-item label="案号" v-if="[1, 2, 3, 4, 5].includes(Number(form.nCase.type))">
                {{ form.nCase.caseNumber }}
            </el-descriptions-item>
            <el-descriptions-item label="案件性质/业务性质" v-if="[2, 3, 4, 5, 6, 7].includes(Number(form.nCase.type))">
                {{ form.nCase.caseCore }}
            </el-descriptions-item>
            <el-descriptions-item label="收费"> {{ form.nCase.reward }}</el-descriptions-item>
            <el-descriptions-item label="办案机关" v-if="[1, 2, 3, 4, 5].includes(Number(form.type))"> {{ form.nCase.caseOffice
            }}
            </el-descriptions-item>
            <el-descriptions-item label="顾问期限" v-if="Number(form.nCase.type) === 6"> {{
                `${form.nCase.startTime}-${form.nCase.endTime}`
            }}</el-descriptions-item>
            <el-descriptions-item label="罪名" v-if="Number(form.type) === 1"> {{ form.nCase.crimeName
            }}</el-descriptions-item>
            <el-descriptions-item label="被告人" v-if="Number(form.type) === 1"> {{ form.nCase.defendant
            }}</el-descriptions-item>
        </el-descriptions>
    </div>
</template>

<script>
import { getFinance } from '@/api/wujie/finance'
import { financeFileList, deleteFile } from '@/api/wujie/file'
import { caseTypeMap, roleTypeMap, stageTypeMap } from '../case/maps'
import {stateEnum, typeEnum, invoiceTypeMap} from './maps'

export default {
    name: 'financeDetail',
    data() {
        return {
            form: {
                id: null,
                state: null,
                contractId: null,
            },
            fileList: [],
            caseTypeMap,
            roleTypeMap,
            stageTypeMap,
            stateEnum,
            typeEnum,
            invoiceTypeMap,
        }
    },
    mounted() {
        let financeId = this.getQueryVariable('id')
        getFinance(financeId).then((res) => {
            this.form = res.data;
        })
        financeFileList(financeId).then((res) => {
            this.fileList = res.data
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

        ContractDetail() {
            this.$router.push({ path: "/contract/contract/detail", query: { id: this.form.contractId } })
        },
    }
}

</script>

<style>
.detail {
    margin: 0 0 30px 0
}

.upper {
    margin: -8px 0 0 0
}</style>