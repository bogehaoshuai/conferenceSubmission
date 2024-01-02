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
      <!--      <el-form-item label="审稿人id" prop="pcId">-->
      <!--        <el-input-->
      <!--          v-model="queryParams.pcId"-->
      <!--          placeholder="请输入审稿人id"-->
      <!--          clearable-->
      <!--          @keyup.enter.native="handleQuery"-->
      <!--        />-->
      <!--      </el-form-item>-->
      <!--      <el-form-item label="审稿人名" prop="pcName">-->
      <!--        <el-input-->
      <!--          v-model="queryParams.pcName"-->
      <!--          placeholder="请输入审稿人名"-->
      <!--          clearable-->
      <!--          @keyup.enter.native="handleQuery"-->
      <!--        />-->
      <!--      </el-form-item>-->
      <!--      <el-form-item label="论文id" prop="articleId">-->
      <!--        <el-input-->
      <!--          v-model="queryParams.articleId"-->
      <!--          placeholder="请输入论文id"-->
      <!--          clearable-->
      <!--          @keyup.enter.native="handleQuery"-->
      <!--        />-->
      <!--      </el-form-item>-->
      <el-form-item label="论文名" prop="articleName">
        <el-input
          v-model="queryParams.articleName"
          placeholder="请输入论文名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <!--      <el-form-item label="审稿状态码" prop="reviewStatusCode">-->
      <!--        <el-select-->
      <!--          v-model="queryParams.reviewStatusCode"-->
      <!--          placeholder="请选择审稿状态码"-->
      <!--          clearable-->
      <!--        >-->
      <!--          <el-option-->
      <!--            v-for="dict in dict.type.review_status_code"-->
      <!--            :key="dict.value"-->
      <!--            :label="dict.label"-->
      <!--            :value="dict.value"-->
      <!--          />-->
      <!--        </el-select>-->
      <!--      </el-form-item>-->
      <el-form-item label="审稿状态" prop="reviewStatusName">
        <el-select
          v-model="queryParams.reviewStatusName"
          placeholder="请选择审稿状态"
          clearable
        >
          <el-option
            v-for="dict in dict.type.review_status_code"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="confidence_code" prop="confidenceCode">
        <el-select
          v-model="queryParams.confidenceCode"
          placeholder="confidence"
          clearable
        >
          <el-option
            v-for="dict in dict.type.confidence_code"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <!--      <el-form-item label="confidence" prop="confidenceName">-->
      <!--        <el-select-->
      <!--          v-model="queryParams.confidenceName"-->
      <!--          placeholder="请选择confidence"-->
      <!--          clearable-->
      <!--        >-->
      <!--          <el-option-->
      <!--            v-for="dict in dict.type.confidence_code"-->
      <!--            :key="dict.value"-->
      <!--            :label="dict.label"-->
      <!--            :value="dict.value"-->
      <!--          />-->
      <!--        </el-select>-->
      <!--      </el-form-item>-->
      <!--      <el-form-item label="稿件评分码" prop="scoreCode">-->
      <!--        <el-select-->
      <!--          v-model="queryParams.scoreCode"-->
      <!--          placeholder="请选择稿件评分码"-->
      <!--          clearable-->
      <!--        >-->
      <!--          <el-option-->
      <!--            v-for="dict in dict.type.score_code"-->
      <!--            :key="dict.value"-->
      <!--            :label="dict.label"-->
      <!--            :value="dict.value"-->
      <!--          />-->
      <!--        </el-select>-->
      <!--      </el-form-item>-->
      <el-form-item label="稿件评分" prop="scoreName">
        <el-select
          v-model="queryParams.scoreName"
          placeholder="请选择稿件评分"
          clearable
        >
          <el-option
            v-for="dict in dict.type.score_code"
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
      <!--      <el-col :span="1.5">-->
      <!--        <el-button-->
      <!--          type="primary"-->
      <!--          plain-->
      <!--          icon="el-icon-plus"-->
      <!--          size="mini"-->
      <!--          @click="handleAdd"-->
      <!--          v-hasPermi="['review:allocation:add']"-->
      <!--          >新增</el-button-->
      <!--        >-->
      <!--      </el-col>-->
      <!--      <el-col :span="1.5">-->
      <!--        <el-button-->
      <!--          type="danger"-->
      <!--          plain-->
      <!--          icon="el-icon-delete"-->
      <!--          size="mini"-->
      <!--          :disabled="multiple"-->
      <!--          @click="handleDelete"-->
      <!--          v-hasPermi="['review:allocation:remove']"-->
      <!--          >删除</el-button-->
      <!--        >-->
      <!--      </el-col>-->
      <!--      <el-col :span="1.5">-->
      <!--        <el-button-->
      <!--          type="warning"-->
      <!--          plain-->
      <!--          icon="el-icon-download"-->
      <!--          size="mini"-->
      <!--          @click="handleExport"-->
      <!--          v-hasPermi="['review:allocation:export']"-->
      <!--          >导出</el-button-->
      <!--        >-->
      <!--      </el-col>-->
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="allocationList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <!--      <el-table-column label="分配id" align="center" prop="allocationId" />-->
      <!--      <el-table-column label="审稿人id" align="center" prop="pcId" />-->
      <!--      <el-table-column label="审稿人名" align="center" prop="pcName" />-->
      <!--      <el-table-column label="论文id" align="center" prop="articleId" />-->
      <el-table-column label="论文名" align="center" prop="articleName" />
      <el-table-column label="摘要" align="center" prop="articleAbstract" />
      <el-table-column label="稿件评分" align="center" prop="scoreCode">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.score_code"
            :value="scope.row.scoreCode"
          />
        </template>
      </el-table-column>
      <el-table-column label="confidence" align="center" prop="confidenceCode">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.confidence_code"
            :value="scope.row.confidenceCode"
          />
        </template>
      </el-table-column>
      <!--      <el-table-column label="pdf文件" align="center" prop="articlePath" />-->
      <el-table-column label="rebuttal" align="center" prop="rebuttalMessage" />
      <el-table-column label="审稿状态" align="center" prop="reviewStatusName">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.review_status_code"
            :value="scope.row.reviewStatusName"
          />
        </template>
      </el-table-column>

      <!--      <el-table-column-->
      <!--        label="审稿状态码"-->
      <!--        align="center"-->
      <!--        prop="reviewStatusCode"-->
      <!--      >-->
      <!--        <template slot-scope="scope">-->
      <!--          <dict-tag-->
      <!--            :options="dict.type.review_status_code"-->
      <!--            :value="scope.row.reviewStatusCode"-->
      <!--          />-->
      <!--        </template>-->
      <!--      </el-table-column>-->

      <!--      <el-table-column label="稿件评语" align="center" prop="comment" />-->
      <!--      <el-table-column-->
      <!--        label="confidence"-->
      <!--        align="center"-->
      <!--        prop="confidenceName"-->
      <!--      >-->
      <!--        <template slot-scope="scope">-->
      <!--          <dict-tag-->
      <!--            :options="dict.type.confidence_code"-->
      <!--            :value="scope.row.confidenceName"-->
      <!--          />-->
      <!--        </template>-->
      <!--      </el-table-column>-->
      <!--      <el-table-column label="稿件评分" align="center" prop="scoreName">-->
      <!--        <template slot-scope="scope">-->
      <!--          <dict-tag-->
      <!--            :options="dict.type.score_code"-->
      <!--            :value="scope.row.scoreName"-->
      <!--          />-->
      <!--        </template>-->
      <!--      </el-table-column>-->
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            v-if="
              scope.row.reviewStatusCode === 0 ||
              scope.row.reviewStatusCode === 2
            "
            size="mini"
            type="text"
            icon="el-icon-add"
            @click="handleUpdate(scope.row)"
            >审核</el-button
          >
          <el-button size="mini" type="text" icon="el-icon-add">
            <a :href="scope.row.articlePath" target="_blank">文章预览 </a>
          </el-button>
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

    <!-- 添加或修改稿件分配对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <!--        <el-form-item label="审稿人id" prop="pcId">-->
        <!--          <el-input v-model="form.pcId" placeholder="请输入审稿人id" />-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="审稿人名" prop="pcName">-->
        <!--          <el-input v-model="form.pcName" placeholder="请输入审稿人名" />-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="论文id" prop="articleId">-->
        <!--          <el-input v-model="form.articleId" placeholder="请输入论文id" />-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="论文名" prop="articleName">-->
        <!--          <el-input v-model="form.articleName" placeholder="请输入论文名" />-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="审稿状态码" prop="reviewStatusCode">-->
        <!--          <el-select-->
        <!--            v-model="form.reviewStatusCode"-->
        <!--            placeholder="请选择审稿状态码"-->
        <!--          >-->
        <!--            <el-option-->
        <!--              v-for="dict in dict.type.review_status_code"-->
        <!--              :key="dict.value"-->
        <!--              :label="dict.label"-->
        <!--              :value="parseInt(dict.value)"-->
        <!--            ></el-option>-->
        <!--          </el-select>-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="审稿状态" prop="reviewStatusName">-->
        <!--          <el-select-->
        <!--            v-model="form.reviewStatusName"-->
        <!--            placeholder="请选择审稿状态"-->
        <!--          >-->
        <!--            <el-option-->
        <!--              v-for="dict in dict.type.review_status_code"-->
        <!--              :key="dict.value"-->
        <!--              :label="dict.label"-->
        <!--              :value="dict.value"-->
        <!--            ></el-option>-->
        <!--          </el-select>-->
        <!--        </el-form-item>-->
        <el-form-item label="稿件评语" prop="comment">
          <el-input
            v-model="form.comment"
            type="textarea"
            placeholder="请输入内容"
            maxlength="800"
          />
        </el-form-item>
        <el-form-item label="confidence_code" prop="confidenceCode">
          <el-select
            v-model="form.confidenceCode"
            placeholder="请选择confidence"
          >
            <el-option
              v-for="dict in dict.type.confidence_code"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <!--        <el-form-item label="confidence名" prop="confidenceName">-->
        <!--          <el-select-->
        <!--            v-model="form.confidenceName"-->
        <!--            placeholder="请选择confidence名"-->
        <!--          >-->
        <!--            <el-option-->
        <!--              v-for="dict in dict.type.confidence_code"-->
        <!--              :key="dict.value"-->
        <!--              :label="dict.label"-->
        <!--              :value="dict.value"-->
        <!--            ></el-option>-->
        <!--          </el-select>-->
        <!--        </el-form-item>-->
        <el-form-item label="稿件评分码" prop="scoreCode">
          <el-select v-model="form.scoreCode" placeholder="请选择稿件评分码">
            <el-option
              v-for="dict in dict.type.score_code"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <!--        <el-form-item label="稿件评分" prop="scoreName">-->
        <!--          <el-select v-model="form.scoreName" placeholder="请选择稿件评分">-->
        <!--            <el-option-->
        <!--              v-for="dict in dict.type.score_code"-->
        <!--              :key="dict.value"-->
        <!--              :label="dict.label"-->
        <!--              :value="dict.value"-->
        <!--            ></el-option>-->
        <!--          </el-select>-->
        <!--        </el-form-item>-->
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
  addAllocation,
  delAllocation,
  getAllocation,
  listAllocation,
  updateAllocation,
} from "@/api/base/allocation";

export default {
  name: "Allocation",
  dicts: ["review_status_code", "confidence_code", "score_code"],
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
      // 稿件分配表格数据
      allocationList: [],
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
        articleId: null,
        articleName: null,
        reviewStatusCode: null,
        reviewStatusName: null,
        comment: null,
        confidenceCode: null,
        confidenceName: null,
        scoreCode: null,
        scoreName: null,
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
    /** 查询稿件分配列表 */
    getList() {
      this.loading = true;
      listAllocation(this.queryParams).then((response) => {
        this.allocationList = response.rows;
        console.log(this.allocationList);
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
        allocationId: null,
        pcId: null,
        pcName: null,
        articleId: null,
        articleName: null,
        reviewStatusCode: null,
        reviewStatusName: null,
        comment: null,
        confidenceCode: null,
        confidenceName: null,
        scoreCode: null,
        scoreName: null,
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
      this.ids = selection.map((item) => item.allocationId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加稿件分配";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const allocationId = row.allocationId || this.ids;
      getAllocation(allocationId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "审核稿件";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.allocationId != null) {
            this.form.reviewStatusCode = 1;
            this.form.reviewStatusName = "已审稿";
            updateAllocation(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addAllocation(this.form).then((response) => {
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
      const allocationIds = row.allocationId || this.ids;
      this.$modal
        .confirm('是否确认删除稿件分配编号为"' + allocationIds + '"的数据项？')
        .then(function () {
          return delAllocation(allocationIds);
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
        "review/allocation/export",
        {
          ...this.queryParams,
        },
        `allocation_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
