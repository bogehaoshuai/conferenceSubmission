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
      <el-form-item label="会议全称" prop="conferenceName">
        <el-input
          v-model="queryParams.conferenceName"
          placeholder="请输入会议全称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="会议简称" prop="conferenceNickname">
        <el-input
          v-model="queryParams.conferenceNickname"
          placeholder="请输入会议简称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="主席名" prop="chairName">
        <el-input
          v-model="queryParams.chairName"
          placeholder="请输入主席名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="举办时间">
        <el-date-picker
          v-model="daterangeHoldDate"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="举办地点" prop="place">
        <el-input
          v-model="queryParams.place"
          placeholder="请输入举办地点"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="截止日期">
        <el-date-picker
          v-model="daterangeDeadlineDate"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="结果日期">
        <el-date-picker
          v-model="daterangeResultDate"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="会议状态" prop="conferenceStatusName">
        <el-select
          v-model="queryParams.conferenceStatusName"
          placeholder="请选择会议状态"
          clearable
        >
          <el-option
            v-for="dict in dict.type.conference_status_code"
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
        <!-- <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          >新增</el-button
        > -->
        <!-- v-hasPermi="['base:conference:add']" -->
      </el-col>
      <!-- <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['base:conference:edit']"
          >修改</el-button
        >
      </el-col> -->
      <!-- <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['base:conference:remove']"
          >删除</el-button
        >
      </el-col> -->
      <!-- <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['base:conference:export']"
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
      :data="conferenceList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="会议全称" align="center" prop="conferenceName" />
      <el-table-column
        label="会议简称"
        align="center"
        prop="conferenceNickname"
      />
      <el-table-column label="主席名" align="center" prop="chairName" />
      <el-table-column label="已录用文章" align="center">
        <template slot-scope="scope">
          <router-link
            v-if="scope.row.conferenceStatusCode === 5"
            :to="'/base/conference-article/index/' + scope.row.conferenceId"
            class="link-type"
          >
            <span>查看会议录用文章</span>
          </router-link>
        </template>
      </el-table-column>

      <el-table-column
        label="举办时间"
        align="center"
        prop="holdDate"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.holdDate, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column label="举办地点" align="center" prop="place" />
      <el-table-column
        label="截止日期"
        align="center"
        prop="deadlineDate"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.deadlineDate, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="结果日期"
        align="center"
        prop="resultDate"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.resultDate, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="会议状态"
        align="center"
        prop="conferenceStatusName"
      >
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.conference_status_code"
            :value="scope.row.conferenceStatusName"
          />
        </template>
      </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
        fixed="right"
      >
        <template slot-scope="scope">
          <el-button
            v-if="scope.row.conferenceStatusCode === 1"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleAudit(scope.row)"
            v-hasPermi="['base:conference:remove']"
            >审核通过</el-button
          >
          <el-button
            v-if="scope.row.conferenceStatusCode === 1"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleRefuse(scope.row)"
            v-hasPermi="['base:conference:remove']"
            >拒绝</el-button
          >

          <!-- v-hasPermi="['base:conference:edit']" -->
          <!-- @click="handleUpdate(scope.row)" -->
          <!-- <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['base:conference:remove']"
            >删除</el-button
          > -->
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

    <!-- 添加或修改会议管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="会议全称" prop="conferenceName">
          <el-input
            v-model="form.conferenceName"
            placeholder="请输入会议全称"
          />
        </el-form-item>
        <el-form-item label="会议简称" prop="conferenceNickname">
          <el-input
            v-model="form.conferenceNickname"
            placeholder="请输入会议简称"
          />
        </el-form-item>
        <el-form-item label="举办时间" prop="holdDate">
          <el-date-picker
            clearable
            v-model="form.holdDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择举办时间"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="举办地点" prop="place">
          <el-input v-model="form.place" placeholder="请输入举办地点" />
        </el-form-item>
        <el-form-item label="截止日期" prop="deadlineDate">
          <el-date-picker
            clearable
            v-model="form.deadlineDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择截止日期"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="结果日期" prop="resultDate">
          <el-date-picker
            clearable
            v-model="form.resultDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择结果日期"
          >
          </el-date-picker>
        </el-form-item>
        <!-- <el-form-item label="会议主席" prop="chairId">
          <el-input v-model="form.chairId" placeholder="请输入会议主席" />
        </el-form-item>
        <el-form-item label="主席名" prop="chairName">
          <el-input v-model="form.chairName" placeholder="请输入主席名" />
        </el-form-item> -->
        <!-- <el-form-item label="会议状态" prop="conferenceStatusCode">
          <el-select
            v-model="form.conferenceStatusCode"
            placeholder="请选择会议状态"
          >
            <el-option
              v-for="dict in dict.type.conference_status_code"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item> -->
        <!-- <el-form-item label="会议状态" prop="conferenceStatusName">
          <el-select v-model="form.conferenceStatusName" placeholder="请选择会议状态">
            <el-option
              v-for="dict in dict.type.conference_status_code"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item> -->
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
  addConference,
  delConference,
  getConference,
  listConference,
  updateConference,
} from "@/api/base/conference";
import { addInvite } from "@/api/base/invite";
import { listTopic } from "@/api/base/topic";

export default {
  name: "Conference",
  dicts: ["conference_status_code"],
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
      // 会议管理表格数据
      conferenceList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 会议状态时间范围
      daterangeHoldDate: [],
      // 会议状态时间范围
      daterangeDeadlineDate: [],
      // 会议状态时间范围
      daterangeResultDate: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        conferenceName: null,
        conferenceNickname: null,
        holdDate: null,
        place: null,
        deadlineDate: null,
        resultDate: null,
        conferenceStatusName: null,
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
    /** 查询会议管理列表 */
    getList() {
      this.loading = true;
      this.queryParams.params = {};
      if (null != this.daterangeHoldDate && "" != this.daterangeHoldDate) {
        this.queryParams.params["beginHoldDate"] = this.daterangeHoldDate[0];
        this.queryParams.params["endHoldDate"] = this.daterangeHoldDate[1];
      }
      if (
        null != this.daterangeDeadlineDate &&
        "" != this.daterangeDeadlineDate
      ) {
        this.queryParams.params["beginDeadlineDate"] =
          this.daterangeDeadlineDate[0];
        this.queryParams.params["endDeadlineDate"] =
          this.daterangeDeadlineDate[1];
      }
      if (null != this.daterangeResultDate && "" != this.daterangeResultDate) {
        this.queryParams.params["beginResultDate"] =
          this.daterangeResultDate[0];
        this.queryParams.params["endResultDate"] = this.daterangeResultDate[1];
      }
      listConference(this.queryParams).then((response) => {
        this.conferenceList = response.rows;
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
        conferenceId: null,
        conferenceName: null,
        conferenceNickname: null,
        holdDate: null,
        place: null,
        deadlineDate: null,
        resultDate: null,
        chairId: null,
        chairName: null,
        conferenceStatusCode: null,
        conferenceStatusName: null,
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
      this.daterangeHoldDate = [];
      this.daterangeDeadlineDate = [];
      this.daterangeResultDate = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.conferenceId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "新增会议";
    },
    // 审核操作
    handleAudit(row) {
      this.reset();
      const conferenceId = row.conferenceId;
      getConference(conferenceId).then((response) => {
        this.form = response.data;
        this.form.conferenceStatusCode = 2;
        this.form.conferenceStatusName = "已审核";
        updateConference(this.form).then((response) => {
          this.$modal.msgSuccess("审核成功");
          this.open = false;
          this.getList();
        });
      });
      listTopic({ conferenceId: row.conferenceId }).then((response) => {
        const topicList = response.rows;
        let topicCodeList = [];
        console.log(topicList);
        if (topicList != null) {
          topicList.forEach((i) => {
            topicCodeList.push(i.topicCode);
          });
        }
        console.log(topicCodeList);
        addInvite({
          conferenceId: row.conferenceId,
          conferenceName: row.conferenceName,
          chairId: row.chairId,
          chairName: row.chairName,
          pcMemberIds: [row.chairId],
          topicCodeList: topicCodeList,
        });
      });
    },
    handleRefuse(row) {
      this.reset();
      const conferenceId = row.conferenceId;
      getConference(conferenceId).then((response) => {
        this.form = response.data;
        this.form.conferenceStatusCode = 99;
        this.form.conferenceStatusName = "已拒绝";
        console.log(this.form);
        updateConference(this.form).then((response) => {
          this.$modal.msgSuccess("拒绝会议");
          this.open = false;
          this.getList();
        });
      });
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const conferenceId = row.conferenceId || this.ids;
      getConference(conferenceId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改会议管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.conferenceId != null) {
            updateConference(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addConference(this.form).then((response) => {
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
      const conferenceIds = row.conferenceId || this.ids;
      this.$modal
        .confirm('是否确认删除会议管理编号为"' + conferenceIds + '"的数据项？')
        .then(function () {
          return delConference(conferenceIds);
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
        "base/conference/export",
        {
          ...this.queryParams,
        },
        `conference_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
