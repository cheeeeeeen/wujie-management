<template>
  <div class="app-container home">
    <div v-for="(value,index) in noticeRows">
    <el-card class="box-card" v-if="value.status !== '1' ">
      <div slot="header" class="clearfix">
        <span class="title">{{ value.noticeTitle }}</span>
        <div style="float: right; padding: 3px 0" type="text">{{value.createBy}}</div>
      </div>
      <div v-html="value.noticeContent">
      </div>
    </el-card>
    </div>
  </div>
</template>

<script>
import { listNotice, getNotice } from "@/api/system/notice";

export default {
  name: "Index",
  data() {
    return {
      noticeRows: [
      ],
    }
  },
  methods: {

  },
  mounted() {
    listNotice().then((res) => {
      console.log(res.rows);
      this.noticeRows = res.rows;
    });
  }
};
</script>

<style scoped lang="scss">
.home {
  .text {
    font-size: 14px;
  }

  .item {
    margin-bottom: 18px;
  }

  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }
  .clearfix:after {
    clear: both
  }

  .box-card {
    width: 480px;
    display: inline-block;
    margin: 20px;
    .title {
      font-size: large;
    }
  }
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }

  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }

  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans",
  "Helvetica Neue",
  Helvetica,
  Arial,
  sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }
}</style>

