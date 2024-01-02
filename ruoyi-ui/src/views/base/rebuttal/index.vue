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
      <el-form-item label="文章id" prop="articleId">
        <el-input
          v-model="queryParams.articleId"
          placeholder="请输入文章id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文章名" prop="articleName">
        <el-input
          v-model="queryParams.articleName"
          placeholder="请输入文章名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="录用码" prop="acceptCode">
        <el-select
          v-model="queryParams.acceptCode"
          placeholder="请选择录用码"
          clearable
        >
          <el-option
            v-for="dict in dict.type.accept_code"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="录用标签" prop="acceptLabel">
        <el-select
          v-model="queryParams.acceptLabel"
          placeholder="请选择录用标签"
          clearable
        >
          <el-option
            v-for="dict in dict.type.accept_code"
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
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['review:rebuttal:add']"
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
          v-hasPermi="['review:rebuttal:edit']"
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
          v-hasPermi="['review:rebuttal:remove']"
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
          v-hasPermi="['review:rebuttal:export']"
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
      :data="rebuttalList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="rebuttal_id" align="center" prop="rebuttalId" />
      <el-table-column label="文章id" align="center" prop="articleId" />
      <el-table-column label="文章名" align="center" prop="articleName" />
      <el-table-column label="录用码" align="center" prop="acceptCode">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.accept_code"
            :value="scope.row.acceptCode"
          />
        </template>
      </el-table-column>
      <el-table-column label="录用标签" align="center" prop="acceptLabel">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.accept_code"
            :value="scope.row.acceptLabel"
          />
        </template>
      </el-table-column>
      <el-table-column
        label="rebuttal消息"
        align="center"
        prop="rebuttalMessage"
      />
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
            v-hasPermi="['review:rebuttal:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['review:rebuttal:remove']"
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

    <!-- 添加或修改rebuttal对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="文章id" prop="articleId">
          <el-input v-model="form.articleId" placeholder="请输入文章id" />
        </el-form-item>
        <el-form-item label="文章名" prop="articleName">
          <el-input v-model="form.articleName" placeholder="请输入文章名" />
        </el-form-item>
        <el-form-item label="录用码" prop="acceptCode">
          <el-select v-model="form.acceptCode" placeholder="请选择录用码">
            <el-option
              v-for="dict in dict.type.accept_code"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="录用标签" prop="acceptLabel">
          <el-select v-model="form.acceptLabel" placeholder="请选择录用标签">
            <el-option
              v-for="dict in dict.type.accept_code"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="rebuttal消息" prop="rebuttalMessage">
          <el-input
            v-model="form.rebuttalMessage"
            type="textarea"
            placeholder="请输入内容"
          />
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
  listRebuttal,
  getRebuttal,
  delRebuttal,
  addRebuttal,
  updateRebuttal,
} from "@/api/base/rebuttal";

export default {
  name: "Rebuttal",
  dicts: ["accept_code"],
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
      // rebuttal表格数据
      rebuttalList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        articleId: null,
        articleName: null,
        acceptCode: null,
        acceptLabel: null,
        rebuttalMessage: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {},
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询rebuttal列表 */
    getList() {
      this.loading = true;
      listRebuttal(this.queryParams).then((response) => {
        this.rebuttalList = response.rows;
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
        rebuttalId: null,
        articleId: null,
        articleName: null,
        acceptCode: null,
        acceptLabel: null,
        rebuttalMessage: null,
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
      this.ids = selection.map((item) => item.rebuttalId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加rebuttal";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const rebuttalId = row.rebuttalId || this.ids;
      getRebuttal(rebuttalId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改rebuttal";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.rebuttalId != null) {
            updateRebuttal(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addRebuttal(this.form).then((response) => {
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
      const rebuttalIds = row.rebuttalId || this.ids;
      this.$modal
        .confirm('是否确认删除rebuttal编号为"' + rebuttalIds + '"的数据项？')
        .then(function () {
          return delRebuttal(rebuttalIds);
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
        "review/rebuttal/export",
        {
          ...this.queryParams,
        },
        `rebuttal_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
