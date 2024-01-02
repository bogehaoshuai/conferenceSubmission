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
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          >新增</el-button
        >
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
        <!-- v-hasPermi="['base:conference:remove']" -->
      </el-col>
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
      <el-table-column
        type="selection"
        width="55"
        align="center"
        :selectable="checkSelectable"
      />
      <el-table-column label="会议全称" align="center" prop="conferenceName" />

      <el-table-column
        label="会议简称"
        align="center"
        prop="conferenceNickname"
      />
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
      <el-table-column label="会议主题" align="center">
        <template slot-scope="scope">
          <router-link
            :to="'/base/myconfer-topic/index/' + scope.row.conferenceId"
            class="link-type"
          >
            <span v-if="scope.row.conferenceStatusCode === 0">
              新增会议主题
            </span>
            <span v-else>查看会议主题</span>
          </router-link>
        </template>
      </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
        fixed="right"
        width="150"
      >
        <template slot-scope="scope">
          <!-- <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['base:conference:edit']"
            >提交</el-button
          > -->
          <el-button
            v-if="scope.row.conferenceStatusCode === 0"
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleSubmit(scope.row)"
            >提交</el-button
          >
          <el-button
            v-if="
              scope.row.conferenceStatusCode === 0 ||
              scope.row.conferenceStatusCode === 1
            "
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            >删除</el-button
          >
          <el-button
            v-if="scope.row.conferenceStatusCode === 2"
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleStart(scope.row)"
            >开启投稿</el-button
          >
          <el-button
            v-if="scope.row.conferenceStatusCode === 3"
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleStartCheckByRandom(scope.row)"
            >开启审稿(随机)</el-button
          >
          <el-button
            v-if="scope.row.conferenceStatusCode === 3"
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleStartCheckByTopic(scope.row)"
            >开启审稿(topic)</el-button
          >

          <el-button
            v-if="scope.row.conferenceStatusCode === 4"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handlePublish(scope.row)"
            >发布审稿结果</el-button
          >
          <!-- v-hasPermi="['base:conference:remove']" -->
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
        <el-form-item label="举办地点" prop="place">
          <el-input v-model="form.place" placeholder="请输入举办地点" />
        </el-form-item>
        <el-form-item label="截止日期" prop="deadlineDate">
          <el-date-picker
            clearable
            v-model="form.deadlineDate"
            type="date"
            value-format="yyyy-MM-dd"
            :picker-options="pickerOptions1"
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
            :picker-options="pickerOptions2"
            placeholder="请选择结果日期"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="举办时间" prop="holdDate">
          <el-date-picker
            clearable
            v-model="form.holdDate"
            type="date"
            value-format="yyyy-MM-dd"
            :picker-options="pickerOptions3"
            placeholder="请选择举办时间"
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
  doAllocationByRandom,
  doAllocationByTopic,
} from "@/api/base/allocation";
import { listArticle, updateArticle } from "@/api/base/article";
import {
  addConference,
  delConference,
  getConference,
  listMyConference,
  updateConference,
  updateConferenceToPublish,
} from "@/api/base/conference";
import { listInvite, updateInvite } from "@/api/base/invite";
import { listTopic } from "@/api/base/topic";
export default {
  name: "Conference",
  dicts: ["conference_status_code"],
  data() {
    return {
      pickerOptions1: {
        disabledDate: (time) => {
          if (this.form.resultDate)
            return (
              time.getTime() < Date.now() - 1000 * 60 * 60 * 24 ||
              time.getTime() >
                new Date(this.form.resultDate).getTime() - 1000 * 60 * 60 * 24
            );
          else if (this.form.holdDate)
            return (
              time.getTime() < Date.now() - 1000 * 60 * 60 * 24 ||
              time.getTime() >
                new Date(this.form.holdDate).getTime() - 1000 * 60 * 60 * 24
            );
          else return time.getTime() < Date.now() - 1000 * 60 * 60 * 24;
        },
      },
      pickerOptions2: {
        disabledDate: (time) => {
          if (this.form.deadlineDate && this.form.holdDate)
            return (
              time.getTime() < new Date(this.form.deadlineDate).getTime() ||
              time.getTime() >
                new Date(this.form.holdDate).getTime() - 1000 * 60 * 60 * 24
            );
          else if (this.form.deadlineDate)
            return time.getTime() < new Date(this.form.deadlineDate).getTime();
          else if (this.form.holdDate)
            return (
              time.getTime() < Date.now() - 1000 * 60 * 60 * 24 ||
              time.getTime() >
                new Date(this.form.holdDate).getTime() - 1000 * 60 * 60 * 24
            );
          else return time.getTime() < Date.now();
        },
      },
      pickerOptions3: {
        disabledDate: (time) => {
          if (this.form.resultDate)
            return time.getTime() < new Date(this.form.resultDate).getTime();
          else if (this.form.deadlineDate)
            return time.getTime() < new Date(this.form.deadlineDate).getTime();
          else return time.getTime() < Date.now();
        },
      },
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
      rules: {
        conferenceName: [
          { required: true, message: "会议名称不能为空", trigger: "blur" },
        ],
        conferenceNickname: [
          { required: true, message: "会议昵称不能为空", trigger: "blur" },
        ],
        holdDate: [
          { required: true, message: "举办时间不能为空", trigger: "blur" },
        ],
        place: [
          { required: true, message: "举办地点不能为空", trigger: "blur" },
        ],
        deadlineDate: [
          { required: true, message: "截止日期不能为空", trigger: "blur" },
        ],
        resultDate: [
          { required: true, message: "结果日期不能为空", trigger: "blur" },
        ],
      },
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

      listMyConference(this.queryParams).then((response) => {
        this.conferenceList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    checkSelectable(row) {
      return row.conferenceStatusCode === 0 || row.conferenceStatusCode === 1;
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
        conferenceStatusCode: 0,
        conferenceStatusName: 0,
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
    handleStart(row) {
      this.reset();
      const conferenceId = row.conferenceId;
      getConference(conferenceId).then((response) => {
        this.form = response.data;
        this.form.conferenceStatusCode = 3;
        this.form.conferenceStatusName = "投稿中";
        updateConference(this.form).then((response) => {
          this.$modal.msgSuccess("开启成功");
          this.open = false;
          this.getList();
        });
      });
    },
    handleStartCheckByRandom(row) {
      this.reset();
      const conferenceId = row.conferenceId;
      listInvite({ conferenceId: row.conferenceId }).then((response) => {
        const inviteList = response.rows;
        let flagInvite = 0;
        if (inviteList.length !== 0) {
          inviteList.forEach((i) => {
            if (i.inviteStatusCode === 1) {
              flagInvite++;
            }
          });
        }
        if (flagInvite >= 2) {
          listArticle({ conferenceId: conferenceId }).then((response) => {
            const articleList = response.rows;
            console.log(articleList);
            let flagArticle = false;
            if (articleList.length !== 0) {
              articleList.forEach((i) => {
                if (i.articleStatusCode === 1) {
                  flagArticle = true;
                }
              });
            }
            if (flagArticle) {
              articleList.forEach((i) => {
                if (i.articleStatusCode === 0) {
                  const article = {
                    articleId: i.articleId,
                    articleStatusCode: -1,
                    articleStatusName: "未提交",
                  };
                  updateArticle(article);
                }
              });

              // articleList.forEach((i) => {
              //   if (i.articleStatusCode === 1) {
              //     const article = {
              //       articleId: i.articleId,
              //       articleStatusCode: 2,
              //       articleStatusName: "待审稿",
              //     };
              //     updateArticle(article);
              //   } else if (i.articleStatusCode === 0) {
              //     const article = {
              //       articleId: i.articleId,
              //       articleStatusCode: -1,
              //       articleStatusName: "未提交",
              //     };
              //     updateArticle(article);
              //   }
              // });
              inviteList.forEach((i) => {
                if (i.inviteStatusCode === 0) {
                  const invite = {
                    inviteId: i.inviteId,
                    inviteStatusCode: -1,
                    inviteStatusName: "已失效",
                  };
                  updateInvite(invite);
                }
              });

              doAllocationByRandom(conferenceId).then((response) => {
                this.$modal.msgSuccess("开启审稿成功");
                this.open = false;
                this.getList();
              });

              // getConference(conferenceId).then((response) => {
              //   this.form = response.data;
              //   this.form.conferenceStatusCode = 4;
              //   this.form.conferenceStatusName = "审稿中";
              //   console.log(this.form);
              //   updateConference(this.form).then((response) => {
              //     this.$modal.msgSuccess("开启审稿成功");
              //     this.open = false;
              //     this.getList();
              //   });
              // });
            } else {
              this.$modal.msgError("该会议下没有文章");
            }
          });
        } else {
          this.$modal.msgError("需要至少两位PcMember");
        }
      });
    },
    handleStartCheckByTopic(row) {
      this.reset();
      const conferenceId = row.conferenceId;
      listInvite({ conferenceId: row.conferenceId }).then((response) => {
        const inviteList = response.rows;
        let flagInvite = 0;
        if (inviteList.length !== 0) {
          inviteList.forEach((i) => {
            if (i.inviteStatusCode === 1) {
              flagInvite++;
            }
          });
        }
        if (flagInvite >= 2) {
          listArticle({ conferenceId: row.conferenceId }).then((response) => {
            const articleList = response.rows;
            let flagArticle = false;
            if (articleList.length !== 0) {
              articleList.forEach((i) => {
                if (i.articleStatusCode === 1) {
                  flagArticle = true;
                }
              });
            }
            if (flagArticle) {
              articleList.forEach((i) => {
                if (i.articleStatusCode === 0) {
                  const article = {
                    articleId: i.articleId,
                    articleStatusCode: -1,
                    articleStatusName: "未提交",
                  };
                  updateArticle(article);
                }
              });
              inviteList.forEach((i) => {
                if (i.inviteStatusCode === 0) {
                  const invite = {
                    inviteId: i.inviteId,
                    inviteStatusCode: -1,
                    inviteStatusName: "已失效",
                  };
                  updateInvite(invite);
                }
              });

              doAllocationByTopic(conferenceId).then((response) => {
                this.$modal.msgSuccess("开启审稿成功");
                this.open = false;
                this.getList();
              });
            } else {
              this.$modal.msgError("该会议下没有文章");
            }
          });
        } else {
          this.$modal.msgError("需要至少两位PcMember");
        }
      });
    },
    handlePublish(row) {
      this.reset();
      const conferenceId = row.conferenceId;
      getConference(conferenceId).then((response) => {
        this.form = response.data;
        console.log(this.form);
        updateConferenceToPublish(this.form).then((response) => {
          if (response == 1) {
            this.$modal.msgSuccess("发布成功");
          } else {
            this.$modal.msgError("该会议还有稿件未审核，无法发布结果");
          }
          this.open = false;
          this.getList();
        });
      });
    },
    handleSubmit(row) {
      const params = { conferenceId: row.conferenceId, status: "0" };
      listTopic(params).then((response) => {
        const topicList = response.rows;
        const total = response.total;
        if (total >= 1) {
          this.reset();
          const conferenceId = row.conferenceId;
          getConference(conferenceId).then((response) => {
            this.form = response.data;
            this.form.conferenceStatusCode = 1;
            this.form.conferenceStatusName = "待审核";
            console.log(this.form);
            updateConference(this.form).then((response) => {
              this.$modal.msgSuccess("提交成功");
              this.open = false;
              this.getList();
            });
          });
        } else {
          this.$modal.msgError("提交失败，请至少添加一个会议主题！");
          this.open = false;
          this.getList();
        }
      });
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "新增会议";
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
