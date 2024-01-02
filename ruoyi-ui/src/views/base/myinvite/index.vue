<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="90px"
    >
      <el-form-item label="会议" prop="conferenceName">
        <el-input
          v-model="queryParams.conferenceName"
          placeholder="请输入会议"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="主席" prop="chairName">
        <el-input
          v-model="queryParams.chairName"
          placeholder="请输入主席"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="审稿人" prop="pcName">
        <el-input
          v-model="queryParams.pcName"
          placeholder="请输入审稿人"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="审稿人邮箱" prop="pcEmail">
        <el-input
          v-model="queryParams.pcEmail"
          placeholder="请输入审稿人邮箱"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="审稿人单位" prop="pcAffiliation">
        <el-input
          v-model="queryParams.pcAffiliation"
          placeholder="请输入审稿人单位"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="审稿人区域" prop="pcPlace">
        <el-input
          v-model="queryParams.pcPlace"
          placeholder="请输入审稿人区域"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="邀请状态" prop="inviteStatusCode">
        <el-select
          v-model="queryParams.inviteStatusCode"
          placeholder="请选择邀请状态"
          clearable
        >
          <el-option
            v-for="dict in dict.type.invite_status_code"
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

    <!-- <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['base:invite:add']"
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
          v-hasPermi="['base:invite:edit']"
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
          v-hasPermi="['base:invite:remove']"
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
          v-hasPermi="['base:invite:export']"
          >导出</el-button
        >
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row> -->

    <el-table
      v-loading="loading"
      :data="inviteList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="会议" align="center" prop="conferenceName" />
      <el-table-column label="主席" align="center" prop="chairName" />
      <el-table-column label="审稿人" align="center" prop="pcName" />
      <el-table-column label="审稿人邮箱" align="center" prop="pcEmail" />
      <el-table-column label="审稿人单位" align="center" prop="pcAffiliation" />
      <el-table-column label="审稿人区域" align="center" prop="pcPlace" />
      <el-table-column
        label="主题"
        width="300"
        align="center"
        prop="topicLabel"
      >
        <template slot-scope="scope">
          <el-select
            v-model="scope.row.topic"
            multiple
            placeholder="请选择主题"
            v-if="scope.row.inviteStatusCode === 0"
          >
            <el-option
              v-for="topic in topicList"
              v-if="topic.conferenceId === scope.row.conferenceId"
              :key="topic.topicCode"
              :label="topic.topicLabel"
              :value="topic.topicCode"
            />
          </el-select>
          <span v-else>
            {{ scope.row.topicLabel }}
          </span>
        </template>
      </el-table-column>
      <el-table-column
        label="邀请状态码"
        align="center"
        prop="inviteStatusCode"
      >
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.invite_status_code"
            :value="scope.row.inviteStatusCode"
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
            v-if="scope.row.inviteStatusCode === 0"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleConfirm(scope.row)"
            >确认</el-button
          >
          <el-button
            v-if="scope.row.inviteStatusCode === 0"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleRefuse(scope.row)"
            >拒绝</el-button
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
  </div>
</template>

<script>
import {
  addInvite,
  delInvite,
  getInvite,
  listMyInvite,
  updateInvite,
} from "@/api/base/invite";
import { listTopic } from "@/api/base/topic";
export default {
  name: "Invite",
  dicts: ["invite_status_code"],
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
      // 主题表格数据
      topicList: [],
      // 邀请审稿人表格数据
      inviteList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        conferenceId: null,
        conferenceName: null,
        chairId: null,
        chairName: null,
        pcId: null,
        pcName: null,
        pcEmail: null,
        pcAffiliation: null,
        pcPlace: null,
        inviteStatusCode: null,
        inviteStatusName: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        conferenceId: [
          { required: true, message: "会议id不能为空", trigger: "blur" },
        ],
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
    /** 查询邀请审稿人列表 */
    getList() {
      this.loading = true;
      listTopic({ topicCode: null }).then((response) => {
        this.topicList = response.rows;
      });
      listMyInvite(this.queryParams).then((response) => {
        this.inviteList = response.rows;
        this.total = response.total;
      });
      this.loading = false;
    },
    // 已经做在后端
    // getTopicList() {
    //   this.inviteList.forEach((i) => {
    //     const params = { conferenceId: i.conferenceId, pcId: i.pcId };
    //     listPcTopic(params).then((response) => {
    //       const topicList = response.rows;
    //       i.topicList = [];
    //       topicList.forEach((j) => {
    //         i.topicList.push(j.topicLabel);
    //       });
    //       i.topicList = i.topicList.join();
    //     });
    //   });
    // },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        inviteId: null,
        conferenceId: null,
        conferenceName: null,
        chairId: null,
        chairName: null,
        pcId: null,
        pcName: null,
        pcEmail: null,
        pcAffiliation: null,
        pcPlace: null,
        inviteStatusCode: null,
        inviteStatusName: null,
      };
      this.resetForm("form");
    },
    handleConfirm(row) {
      if (row.topic.length >= 1) {
        this.reset();
        const inviteId = row.inviteId;
        getInvite(inviteId).then((response) => {
          this.form = response.data;
          this.form.inviteStatusCode = 1;
          this.form.InviteStatusName = "已同意";
          this.form.topicCodeList = row.topic;
          updateInvite(this.form).then((response) => {
            this.$modal.msgSuccess("确认成功");
            this.open = false;
            this.getList();
          });
        });
      } else {
        this.$modal.msgError("确认时请至少选择一个主题");
        this.open = false;
      }
    },
    handleRefuse(row) {
      this.reset();
      const inviteId = row.inviteId;
      getInvite(inviteId).then((response) => {
        this.form = response.data;
        this.form.inviteStatusCode = 99;
        this.form.inviteStatusName = "已拒绝";
        updateInvite(this.form).then((response) => {
          this.$modal.msgSuccess("拒绝会议");
          this.open = false;
          this.getList();
        });
      });
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
      this.ids = selection.map((item) => item.inviteId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加邀请审稿人";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const inviteId = row.inviteId || this.ids;
      getInvite(inviteId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改邀请审稿人";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.inviteId != null) {
            updateInvite(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addInvite(this.form).then((response) => {
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
      const inviteIds = row.inviteId || this.ids;
      this.$modal
        .confirm('是否确认删除邀请审稿人编号为"' + inviteIds + '"的数据项？')
        .then(function () {
          return delInvite(inviteIds);
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
        "base/invite/export",
        {
          ...this.queryParams,
        },
        `invite_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
