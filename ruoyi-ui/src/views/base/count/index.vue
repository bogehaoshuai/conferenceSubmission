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
      <el-form-item label="审稿人id" prop="pcId">
        <el-input
          v-model="queryParams.pcId"
          placeholder="请输入审稿人id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="审稿人名" prop="pcName">
        <el-input
          v-model="queryParams.pcName"
          placeholder="请输入审稿人名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="会议id" prop="conferenceId">
        <el-input
          v-model="queryParams.conferenceId"
          placeholder="请输入会议id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="会议名" prop="conferenceName">
        <el-input
          v-model="queryParams.conferenceName"
          placeholder="请输入会议名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="待审数量" prop="count">
        <el-input
          v-model="queryParams.count"
          placeholder="请输入待审数量"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['review:count:add']"
          >新增</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['review:count:edit']"
          >修改</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['review:count:remove']"
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
          v-hasPermi="['review:count:export']"
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
      :data="countList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="计数id" align="center" prop="countId" />
      <el-table-column label="审稿人id" align="center" prop="pcId" />
      <el-table-column label="审稿人名" align="center" prop="pcName" />
      <el-table-column label="会议id" align="center" prop="conferenceId" />
      <el-table-column label="会议名" align="center" prop="conferenceName" />
      <el-table-column label="待审数量" align="center" prop="count" />
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['review:count:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['review:count:remove']"
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

    <!-- 添加或修改审稿数量对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="审稿人id" prop="pcId">
          <el-input v-model="form.pcId" placeholder="请输入审稿人id" />
        </el-form-item>
        <el-form-item label="审稿人名" prop="pcName">
          <el-input v-model="form.pcName" placeholder="请输入审稿人名" />
        </el-form-item>
        <el-form-item label="会议id" prop="conferenceId">
          <el-input v-model="form.conferenceId" placeholder="请输入会议id" />
        </el-form-item>
        <el-form-item label="会议名" prop="conferenceName">
          <el-input v-model="form.conferenceName" placeholder="请输入会议名" />
        </el-form-item>
        <el-form-item label="待审数量" prop="count">
          <el-input v-model="form.count" placeholder="请输入待审数量" />
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
import {
  listCount,
  getCount,
  delCount,
  addCount,
  updateCount,
} from "@/api/base/count";

export default {
  name: "Count",
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
      // 审稿数量表格数据
      countList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        pcId: null,
        pcName: null,
        conferenceId: null,
        conferenceName: null,
        count: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        pcId: [
          { required: true, message: "审稿人id不能为空", trigger: "blur" },
        ],
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询审稿数量列表 */
    getList() {
      this.loading = true;
      listCount(this.queryParams).then((response) => {
        this.countList = response.rows;
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
        countId: null,
        pcId: null,
        pcName: null,
        conferenceId: null,
        conferenceName: null,
        count: null,
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
      this.ids = selection.map((item) => item.countId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加审稿数量";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const countId = row.countId || this.ids;
      getCount(countId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改审稿数量";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.countId != null) {
            updateCount(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCount(this.form).then((response) => {
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
      const countIds = row.countId || this.ids;
      this.$modal
        .confirm('是否确认删除审稿数量编号为"' + countIds + '"的数据项？')
        .then(function () {
          return delCount(countIds);
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
        "review/count/export",
        {
          ...this.queryParams,
        },
        `count_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
