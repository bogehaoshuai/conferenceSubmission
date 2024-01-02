<template>
  <div>
    <el-input :placeholder="placeholder" @click.native="openSelect" readonly />
    <el-dialog
      :title="title"
      :visible.sync="openLookup"
      width="500px"
      append-to-body
    >
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

      <el-table
        v-loading="loading"
        :data="conferenceList"
        highlight-current-row
        @current-change="handleCurrentChange"
      >
        <!-- <el-table-column type="index" width="55" align="center" /> -->
        <!-- <el-table-column label="会议id" align="center" prop="conferenceId" /> -->
        <el-table-column
          label="会议全称"
          align="center"
          prop="conferenceName"
        />
        <el-table-column
          label="会议简称"
          align="center"
          prop="conferenceNickname"
        />
        <el-table-column label="主席名" align="center" prop="chairName" />
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
          fixed="right"
        >
          <template slot-scope="scope">
            <dict-tag
              :options="dict.type.conference_status_code"
              :value="scope.row.conferenceStatusName"
            />
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
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listArticleConference, listMyConference } from "@/api/base/conference";

export default {
  name: "LookupConference",
  dicts: ["conference_status_code"],
  props: {
    caller: {
      type: String,
    },
  },
  data() {
    return {
      placeholder: "点击选择会议",
      openLookup: false,
      // 遮罩层
      loading: true,
      // 选中数据
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
      conference: null,
      // 弹出层标题
      title: "选择会议",
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
        conferenceStatusCode: null,
        conferenceStatusName: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      // rules: {
      //   chairId: [
      //     { required: true, message: "会议主席不能为空", trigger: "blur" },
      //   ],
      // },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    resetPlaceholder() {
      this.placeholder = "点击选择会议";
    },
    openSelect() {
      this.openLookup = true;
    },
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
      if (this.caller === "article") {
        this.queryParams.conferenceStatusCode = 3;
        listArticleConference(this.queryParams).then((response) => {
          this.conferenceList = response.rows;
          this.total = response.total;
          this.loading = false;
        });
      } else if (this.caller === "invite") {
        this.queryParams.conferenceStatusCode = 3;
        listMyConference(this.queryParams).then((response) => {
          this.conferenceList = response.rows;
          this.total = response.total;
          this.loading = false;
        });
      }
    },
    // 取消按钮
    cancel() {
      this.openLookup = false;
      this.placeholder = "点击选择会议";
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
    //单选框选中数据
    handleCurrentChange(current) {
      this.conference = current;
    },
    // 多选框选中数据
    // handleSelectionChange(selection) {
    //   this.ids = selection.map((item) => item.conferenceId);
    //   this.single = selection.length !== 1;
    //   this.multiple = !selection.length;
    // },
    /** 提交按钮 */
    submitForm() {
      this.placeholder = this.conference.conferenceName;
      this.$emit("selectConference", this.conference);
      this.openLookup = false;
    },
  },
};
</script>
