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
      <!-- <el-form-item label="文章id" prop="articleId">
        <el-input
          v-model="queryParams.articleId"
          placeholder="请输入文章id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->
      <el-form-item label="文章名" prop="articleName">
        <el-input v-model="queryParams.articleName" :disabled="true" />
      </el-form-item>
      <el-form-item label="作者姓名" prop="authorName">
        <el-input
          v-model="queryParams.authorName"
          placeholder="请输入作者姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="作者单位" prop="authorAffiliation">
        <el-input
          v-model="queryParams.authorAffiliation"
          placeholder="请输入作者单位"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="国家/地区" prop="authorPlace" label-width="80px">
        <el-input
          v-model="queryParams.authorPlace"
          placeholder="请输入国家/地区"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="作者邮箱" prop="authorEmail">
        <el-input
          v-model="queryParams.authorEmail"
          placeholder="请输入作者邮箱"
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
          v-if="articleStatusCode === 0"
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          >新增</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          v-if="articleStatusCode === 0 || articleStatusCode === 1"
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
          v-if="articleStatusCode === 0"
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
      :data="authorList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="作者姓名" align="center" prop="authorName" />
      <el-table-column
        label="作者单位"
        align="center"
        prop="authorAffiliation"
      />
      <el-table-column label="国家/地区" align="center" prop="authorPlace" />
      <el-table-column label="作者邮箱" align="center" prop="authorEmail" />
      <el-table-column label="显示排序" align="center" prop="orderNum" />
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            v-if="articleStatusCode === 0 || articleStatusCode === 1"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            >修改</el-button
          >
          <el-button
            v-if="articleStatusCode === 0"
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

    <!-- 添加或修改作者信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="文章名" prop="articleName">
          <el-input v-model="form.articleName" :disabled="true" />
        </el-form-item>
        <el-form-item label="作者姓名" prop="authorName">
          <el-input v-model="form.authorName" placeholder="请输入作者姓名" />
        </el-form-item>
        <el-form-item label="作者单位" prop="authorAffiliation">
          <el-input
            v-model="form.authorAffiliation"
            placeholder="请输入作者单位"
          />
        </el-form-item>
        <el-form-item label="国家/地区" prop="authorPlace">
          <el-input v-model="form.authorPlace" placeholder="请输入国家/地区" />
        </el-form-item>
        <el-form-item label="作者邮箱" prop="authorEmail">
          <el-input v-model="form.authorEmail" placeholder="请输入作者邮箱" />
        </el-form-item>
        <el-form-item label="显示排序" prop="orderNum">
          <el-input-number
            v-model="form.orderNum"
            controls-position="right"
            :min="0"
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
import { getArticle } from "@/api/base/article";
import {
  addAuthor,
  delAuthor,
  getAuthor,
  listAuthor,
  updateAuthor,
} from "@/api/base/author";

export default {
  name: "Author",
  data() {
    return {
      defaultArticleName: "",
      articleStatusCode: null,
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
      // 作者信息表格数据
      authorList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        authorName: null,
        authorAffiliation: null,
        authorPlace: null,
        authorEmail: null,
        articleId: null,
        articleName: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {},
    };
  },
  created() {
    const articleId = this.$route.params && this.$route.params.articleId;
    this.getArticle(articleId);
    this.getList();
  },
  methods: {
    getArticle(articleId) {
      getArticle(articleId).then((response) => {
        this.queryParams.articleId = response.data.articleId;
        this.queryParams.articleName = response.data.articleName;
        this.defaultArticleName = response.data.articleName;
        this.articleStatusCode = response.data.articleStatusCode;
        this.getList();
      });
    },
    /** 查询作者信息列表 */
    getList() {
      this.loading = true;
      listAuthor(this.queryParams).then((response) => {
        this.authorList = response.rows;
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
        authorId: null,
        authorName: null,
        authorAffiliation: null,
        authorPlace: null,
        authorEmail: null,
        articleId: null,
        articleName: null,
        orderNum: null,
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
      this.queryParams.articleName = this.defaultArticleName;
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.authorId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加作者信息";
      this.form.articleId = this.queryParams.articleId;
      this.form.articleName = this.queryParams.articleName;
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const authorId = row.authorId || this.ids;
      getAuthor(authorId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改作者信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.authorId != null) {
            updateAuthor(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addAuthor(this.form).then((response) => {
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
      const authorIds = row.authorId || this.ids;
      this.$modal
        .confirm('是否确认删除作者信息编号为"' + authorIds + '"的数据项？')
        .then(function () {
          return delAuthor(authorIds);
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
        "article/author/export",
        {
          ...this.queryParams,
        },
        `author_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
