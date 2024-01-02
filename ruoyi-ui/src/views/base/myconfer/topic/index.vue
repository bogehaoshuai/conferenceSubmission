<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="会议名" prop="conferenceName">
        <el-input v-model="queryParams.conferenceName" :disabled="true" />
      </el-form-item>
      <el-form-item label="主题标签" prop="topicLabel">
        <el-input
          v-model="queryParams.topicLabel"
          placeholder="请输入主题标签"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="主题键值" prop="topicValue">
        <el-input
          v-model="queryParams.topicValue"
          placeholder="请输入主题键值"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="状态" prop="status">
        <el-select
          v-model="queryParams.status"
          placeholder="请选择状态"
          clearable
        >
          <el-option
            v-for="dict in dict.type.sys_normal_disable"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          icon="el-icon-search"
          size="mini"
          @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
          >重置</el-button
        >
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          v-if="conferenceStatusCode === 0"
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          >新增</el-button
        >
        <!-- v-hasPermi="['base:topic:add']" -->
      </el-col>
      <el-col :span="1.5">
        <el-button
          v-if="conferenceStatusCode === 0"
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          >修改</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          v-if="conferenceStatusCode === 0"
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          >导出</el-button
        >
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="topicList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主题编码" align="center" prop="topicCode" />
      <el-table-column label="主题标签" align="center" prop="topicLabel" />
      <el-table-column label="主题键值" align="center" prop="topicValue" />
      <el-table-column label="会议名" align="center" prop="conferenceName" />
      <el-table-column label="状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.sys_normal_disable"
            :value="scope.row.status"
          />
        </template>
      </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            v-if="conferenceStatusCode === 0"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            >修改</el-button
          >
          <el-button
            v-if="conferenceStatusCode === 0"
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改会议主题对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="会议名" prop="conferenceName">
          <el-input v-model="form.conferenceName" :disabled="true" />
        </el-form-item>
        <el-form-item label="主题标签" prop="topicLabel">
          <el-input v-model="form.topicLabel" placeholder="请输入主题标签" />
        </el-form-item>
        <el-form-item label="主题键值" prop="topicValue">
          <el-input v-model="form.topicValue" placeholder="请输入主题键值" />
        </el-form-item>

        <el-form-item label="状态" prop="status" v-if="!isAdd">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in dict.type.sys_normal_disable"
              :key="dict.value"
              :label="dict.value"
              >{{ dict.label }}</el-radio
            >
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
import { getConference } from "@/api/base/conference";
import {
  addTopic,
  delTopic,
  getTopic,
  listTopic,
  updateTopic,
} from "@/api/base/topic";

export default {
  name: "Topic",
  dicts: ["sys_normal_disable"],
  data() {
    return {
      conferenceStatusCode: null,
      isAdd: true,
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
      // 会议主题表格数据
      topicList: [],
      // 弹出层标题
      title: "",
      // 默认选择会议
      defaultConferName: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        topicLabel: null,
        topicValue: null,
        conferenceId: null,
        conferenceName: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        conferenceName: [
          { required: true, message: "会议名不能为空", trigger: "blur" },
        ],
      },
    };
  },
  created() {
    const conferenceId = this.$route.params && this.$route.params.conferenceId;
    this.getConfer(conferenceId);
    this.getList();
  },
  methods: {
    getConfer(conferenceId) {
      getConference(conferenceId).then((response) => {
        this.queryParams.conferenceName = response.data.conferenceName;
        this.queryParams.conferenceId = response.data.conferenceId;
        this.defaultConferName = response.data.conferenceName;
        this.conferenceStatusCode = response.data.conferenceStatusCode;
        this.getList();
      });
    },
    /** 查询会议主题列表 */
    getList() {
      this.loading = true;
      listTopic(this.queryParams).then((response) => {
        this.topicList = response.rows;
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
        topicCode: null,
        topicLabel: null,
        topicValue: null,
        conferenceName: null,
        status: null,
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
      this.queryParams.conferenceName = this.defaultConferName;
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.topicCode);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加会议主题";
      this.isAdd = true;
      this.form.conferenceId = this.queryParams.conferenceId;
      this.form.conferenceName = this.queryParams.conferenceName;
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.isAdd = false;
      const topicCode = row.topicCode || this.ids;
      getTopic(topicCode).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改会议主题";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.topicCode != null) {
            updateTopic(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTopic(this.form).then((response) => {
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
      const topicCodes = row.topicCode || this.ids;
      this.$modal
        .confirm('是否确认删除会议主题编号为"' + topicCodes + '"的数据项？')
        .then(function () {
          return delTopic(topicCodes);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "base/topic/export",
        {
          ...this.queryParams,
        },
        `topic_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
