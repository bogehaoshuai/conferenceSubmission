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
      <el-form-item label="文章名" prop="articleName">
        <el-input
          v-model="queryParams.articleName"
          placeholder="请输入文章名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文章摘要" prop="articleAbstract">
        <el-input
          v-model="queryParams.articleAbstract"
          placeholder="请输入文章摘要"
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
      <el-form-item label="文章状态码" prop="articleStatusCode">
        <el-select
          v-model="queryParams.articleStatusCode"
          placeholder="请选择文章状态码"
          clearable
        >
          <el-option
            v-for="dict in dict.type.article_status_code"
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
          >新增</el-button
        >
        <!-- v-hasPermi="['base:article:add']" -->
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          >修改</el-button
        >
        <!-- v-hasPermi="['base:article:edit']" -->
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          >删除</el-button
        >
        <!-- v-hasPermi="['base:article:remove']" -->
      </el-col>
      <!-- <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['base:article:export']"
          >导出</el-button
        >
      </el-col> -->
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="articleList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="文章名" align="center" prop="articleName" />
      <el-table-column label="文章摘要" align="center" prop="articleAbstract" />
      <el-table-column label="会议名" align="center" prop="conferenceName" />
      <el-table-column label="文章主题" align="center" prop="topicLabel" />
      <el-table-column
        label="文章状态码"
        align="center"
        prop="articleStatusCode"
      >
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.article_status_code"
            :value="scope.row.articleStatusCode"
          />
        </template>
      </el-table-column>
      <el-table-column label="作者" align="center">
        <template slot-scope="scope">
          <router-link
            :to="'/base/article-author/index/' + scope.row.articleId"
            class="link-type"
          >
            <span v-if="scope.row.articleStatusCode === 0">添加作者信息</span>
            <span v-else-if="scope.row.articleStatusCode === 1">
              修改作者信息
            </span>
            <span v-else>查看作者信息</span>
          </router-link>
        </template>
      </el-table-column>
      <el-table-column label="评审结果" align="center">
        <template slot-scope="scope">
          <router-link
            v-if="scope.row.articleStatusCode >= 3"
            :to="'/base/article-allocation/index/' + scope.row.articleId"
            class="link-type"
          >
            <span>查看评审结果</span>
          </router-link>
        </template>
      </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            v-if="scope.row.articleStatusCode === 0"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleContribute(scope.row)"
            >提交</el-button
          >
          <el-button
            v-if="
              scope.row.articleStatusCode === 0 ||
              scope.row.articleStatusCode === 1
            "
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            >修改</el-button
          >
          <el-button
            v-if="scope.row.articleStatusCode === 0"
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['base:article:remove']"
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

    <!-- 添加或修改文章管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="文章名" prop="articleName">
          <el-input
            v-model="form.articleName"
            placeholder="请输入文章名"
            maxlength="50"
            type="text"
            show-word-limit
          />
        </el-form-item>
        <el-form-item label="文章摘要" prop="articleAbstract">
          <el-input
            v-model="form.articleAbstract"
            placeholder="请输入文章摘要"
            maxlength="800"
            type="textarea"
            show-word-limit
          />
        </el-form-item>
        <el-form-item label="文章" prop="article">
          <file-upload v-model="form.article" />
        </el-form-item>
        <el-form-item label="会议" prop="conferenceId">
          <LookupConference
            v-if="isAdd"
            ref="lookupConference"
            @selectConference="selectConference"
            caller="article"
          />
          <el-input v-else v-model="form.conferenceName" :disabled="true" />
        </el-form-item>
        <el-form-item label="文章主题" prop="topicCode">
          <el-select
            v-model="form.topicCodeList"
            multiple
            placeholder="请选择主题"
            v-if="isAdd"
          >
            <el-option
              v-for="topic in topicList"
              v-if="
                topic.conferenceId ===
                (conference === null ? -1 : conference.conferenceId)
              "
              :key="topic.topicCode"
              :label="topic.topicLabel"
              :value="topic.topicCode"
            />
          </el-select>
          <el-select
            v-model="form.topicCodeList"
            multiple
            placeholder="请选择主题"
            v-else
          >
            <el-option
              v-for="topic in topicList"
              v-if="topic.conferenceId === form.conferenceId"
              :key="topic.topicCode"
              :label="topic.topicLabel"
              :value="topic.topicCode"
            />
          </el-select>
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
  addArticle,
  delArticle,
  getArticle,
  listMyArticle,
  updateArticle,
} from "@/api/base/article";
import { listAuthor } from "@/api/base/author";
import { listTopic } from "@/api/base/topic";
import LookupConference from "../conference/lookup.vue";

export default {
  components: {
    LookupConference,
  },
  name: "Article",
  dicts: ["article_status_code"],
  data() {
    return {
      isAdd: false,
      topicList: [],
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
      // 文章管理表格数据
      articleList: [],
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
        articleAbstract: null,
        article: null,
        conferenceId: null,
        conferenceName: null,
        articleStatusCode: null,
        articleStatusName: null,
        creatorId: null,
        creatorName: null,
      },
      conference: null,
      // 表单参数
      form: {
        topicCodeList: [],
      },
      // 表单校验
      rules: {
        conferenceId: [
          { required: true, message: "会议不能为空", trigger: "change" },
        ],
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    selectConference(val) {
      this.conference = val;
    },
    // openSelect() {
    //   openLookup = true;
    // },
    /** 查询文章管理列表 */
    getList() {
      this.loading = true;
      listTopic({ topicCode: null }).then((response) => {
        this.topicList = response.rows;
      });
      listMyArticle(this.queryParams).then((response) => {
        this.articleList = response.rows;
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
        articleId: null,
        articleName: null,
        articleAbstract: null,
        article: null,
        conferenceId: null,
        conferenceName: null,
        authorId: null,
        authorName: null,
        conference: null,
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
    // handleTest() {
    //   console.log(this.form);
    // },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.articleId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    handleContribute(row) {
      this.reset();
      const articleId = row.articleId;
      listAuthor({ articleId: row.articleId }).then((response) => {
        if (response.total >= 1) {
          getArticle(articleId).then((response) => {
            this.form = response.data;
            this.form.articleStatusCode = 1;
            this.form.articleStatusName = "已投稿";
            updateArticle(this.form).then((response) => {
              this.$modal.msgSuccess("投稿成功");
              this.open = false;
              this.getList();
            });
          });
        } else {
          this.$modal.msgError("需要至少一位作者");
        }
      });
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.isAdd = true;
      this.reset();
      this.open = true;
      this.title = "添加文章管理";
      this.$refs.lookupConference.resetPlaceholder();
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.isAdd = false;
      this.reset();
      const articleId = row.articleId || this.ids;
      getArticle(articleId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改文章管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.form.conferenceId = this.conference.conferenceId;
      this.form.conferenceName = this.conference.conferenceName;
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.topicCodeList.length !== 0) {
            if (this.form.articleId != null) {
              updateArticle(this.form).then((response) => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addArticle(this.form).then((response) => {
                this.$modal.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              });
            }
          } else {
            this.$modal.msgError("文章主题不能为空");
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const articleIds = row.articleId || this.ids;
      this.$modal
        .confirm('是否确认删除文章管理编号为"' + articleIds + '"的数据项？')
        .then(function () {
          return delArticle(articleIds);
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
        "base/article/export",
        {
          ...this.queryParams,
        },
        `article_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
