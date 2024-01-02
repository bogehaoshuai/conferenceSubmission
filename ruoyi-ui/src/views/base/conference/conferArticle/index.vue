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
            <span>查看作者信息</span>
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
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
  </div>
</template>

<script>
import {
  addArticle,
  delArticle,
  getArticle,
  listArticle,
  updateArticle,
} from "@/api/base/article";
import { listAuthor } from "@/api/base/author";
import { getConference } from "@/api/base/conference";
import { listTopic } from "@/api/base/topic";

export default {
  name: "Article",
  dicts: ["article_status_code"],
  data() {
    return {
      defaultConferenceId: "",
      defaultConferenceName: "",
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
        articleStatusCode: 4,
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
    const conferenceId = this.$route.params && this.$route.params.conferenceId;
    this.getConference(conferenceId);
    this.getList();
  },
  methods: {
    getConference(conferenceId) {
      getConference(conferenceId).then((response) => {
        this.queryParams.conferenceId = response.data.conferenceId;
        this.queryParams.conferenceName = response.data.conferenceName;
        this.defaultConferenceId = conferenceId;
        this.defaultConferenceName = response.data.conferenceName;
        this.getList();
      });
    },
    /** 查询文章管理列表 */
    getList() {
      this.loading = true;
      listTopic({ topicCode: null }).then((response) => {
        this.topicList = response.rows;
      });
      listArticle(this.queryParams).then((response) => {
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
