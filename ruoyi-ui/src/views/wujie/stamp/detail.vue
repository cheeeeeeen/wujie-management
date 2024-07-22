<template>
    <div class="app-container">
        <el-descriptions title="申请信息详情" class="detail">
            <el-descriptions-item label="申请ID">{{ form.stampId }}</el-descriptions-item>
            <el-descriptions-item label="申请状态">{{ form.state === '0' ? "待通过" : "已通过" }}</el-descriptions-item>
            <el-descriptions-item label="申请人">{{ form.creator }}</el-descriptions-item>
            <el-descriptions-item label="申请备注">{{ form.remark }}</el-descriptions-item>
        </el-descriptions>

        <el-descriptions title="审批操作" v-hasPermi="['stamp:info:stamp']">
            <el-descriptions-item>
                <el-button type="primary" @click="handleStampTypeChange">通过申请</el-button>
            </el-descriptions-item>
            <el-descriptions-item>
                <el-upload ref="upload" :limit="1" :action="upload.url" :headers="upload.headers" :show-file-list="false"
                    :auto-upload="true" :on-progress="handleFileUploadProgress" :on-success="handleFileSuccess">
                    <el-button slot="trigger" type="primary">上传文件</el-button>
                </el-upload>
            </el-descriptions-item>
        </el-descriptions>

        <el-descriptions title="申请文件">
            <el-descriptions-item>
                <el-table :data="unstampedFileList">
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

        <el-descriptions title="盖章文件">
            <el-descriptions-item>
                <el-table :data="stampedFileList">
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
    </div>
</template>

<script>
import { getInfo, updateInfo } from '@/api/wujie/stamp'
import { stampFileList, deleteFile } from '@/api/wujie/file'
import { addFile } from '@/api/wujie/file';
import { getToken } from "@/utils/auth";

export default {
    name: 'stampDetail',
    data() {
        return {
            form: {
                stampId: null,
                state: null,
                remark: null,
                creator: null,
            },
            fileList: [],
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
        }
    },
    mounted() {
        let stampId = this.getQueryVariable('id')
        getInfo(stampId).then((res) => {
            this.form = res.data;
            stampFileList(stampId).then((res) => {
                this.fileList = res.data
            })
        })
    },
    computed: {
        unstampedFileList: function () {
            return this.fileList.filter((file) => Number(file.stampType) === 0)
        },

        stampedFileList: function () {
            return this.fileList.filter((file) => Number(file.stampType) === 1)
        }
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

        handleFileUploadProgress(event, file, fileList) {
            this.upload.isUploading = true;
        },
        handleFileSuccess(response, file, fileList) {
            this.upload.isUploading = false;
            this.form.filePath = response.url;
            let stampId = this.getQueryVariable('id');
            let queryparams = {
                stampId: stampId,
                stampType: 1,
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

        handleStampTypeChange() {
            updateInfo({ stampId: this.form.stampId, state: 1 }).then(() => {
                this.$modal.msgSuccess('审核状态变更成功')
                setInterval(() => {
                    location.reload();
                }, 1000);
            })
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
</style>