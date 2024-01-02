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
        <!-- <el-form-item label="用户昵称" prop="nickName">
          <el-input
            v-model="queryParams.nickName"
            placeholder="请输入用户昵称"
            maxlength="30"
          />
        </el-form-item> -->
        <!-- <el-form-item label="手机号码" prop="phonenumber">
          <el-input
            v-model="queryParams.phonenumber"
            placeholder="请输入手机号码"
            maxlength="11"
          />
        </el-form-item> -->
        <el-form-item label="邮箱" prop="email">
          <el-input
            v-model="queryParams.email"
            placeholder="请输入邮箱"
            maxlength="50"
          />
        </el-form-item>
        <el-form-item label="单位" prop="affiliation">
          <el-input
            v-model="queryParams.affiliation"
            placeholder="请输入单位"
            maxlength="50"
          />
        </el-form-item>
        <el-form-item label="区域" prop="place">
          <el-input
            v-model="queryParams.email"
            placeholder="请输入区域"
            maxlength="50"
          />
        </el-form-item>
        <el-form-item
          v-if="queryParams.userId == undefined"
          label="用户名称"
          prop="userName"
        >
          <el-input
            v-model="queryParams.userName"
            placeholder="请输入用户名称"
            maxlength="30"
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
      <el-table
        v-loading="loading"
        :data="userList"
        @selection-change="handleSelectionChange"
      >
        <el-table-column type="selection" width="50" align="center" />
        <!-- <el-table-column
          label="用户编号"
          align="center"
          key="userId"
          prop="userId"
          v-if="columns[0].visible"
        /> -->
        <el-table-column
          label="用户名称"
          align="center"
          key="userName"
          prop="userName"
          v-if="columns[1].visible"
          :show-overflow-tooltip="true"
        />
        <!-- <el-table-column
          label="用户昵称"
          align="center"
          key="nickName"
          prop="nickName"
          v-if="columns[2].visible"
          :show-overflow-tooltip="true"
        /> -->
        <!-- <el-table-column
          label="手机号码"
          align="center"
          key="phonenumber"
          prop="phonenumber"
          v-if="columns[4].visible"
          width="120"
        /> -->
        <el-table-column
          label="电子邮箱"
          align="center"
          key="email"
          prop="email"
          v-if="columns[4].visible"
          width="120"
        />
        <el-table-column
          label="单位"
          align="center"
          key="affiliation"
          prop="affiliation"
          v-if="columns[4].visible"
          width="120"
        />
        <el-table-column
          label="区域"
          align="center"
          key="place"
          prop="place"
          v-if="columns[4].visible"
          width="120"
        />
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
import { listCommonUser } from "@/api/system/user";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "LookupUser",
  dicts: ["sys_normal_disable", "sys_user_sex"],
  props: {
    caller: {
      type: String,
    },
  },
  components: { Treeselect },
  data() {
    return {
      placeholder: "点击选择用户",
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
      // 用户表格数据
      userList: null,
      selectList: [],
      // 弹出层标题
      title: "",
      // 部门树选项
      deptOptions: undefined,
      // 是否显示弹出层
      openLookup: false,
      // 部门名称
      deptName: undefined,
      // 默认密码
      initPassword: undefined,
      // 日期范围
      dateRange: [],
      // 岗位选项
      postOptions: [],
      // 角色选项
      roleOptions: [],
      // 表单参数
      form: {},
      defaultProps: {
        children: "children",
        label: "label",
      },

      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userName: undefined,
        phonenumber: undefined,
        email: undefined,
        affiliation: undefined,
        place: undefined,
        status: undefined,
        deptId: undefined,
      },
      // 列信息
      columns: [
        { key: 0, label: `用户编号`, visible: true },
        { key: 1, label: `用户名称`, visible: true },
        { key: 2, label: `用户昵称`, visible: true },
        { key: 3, label: `部门`, visible: true },
        { key: 4, label: `手机号码`, visible: true },
        { key: 5, label: `状态`, visible: true },
        { key: 6, label: `创建时间`, visible: true },
      ],
    };
  },

  created() {
    this.getList();
  },
  methods: {
    resetPlaceholder() {
      this.placeholder = "点击选择用户";
    },
    openSelect() {
      this.openLookup = true;
    },
    /** 查询用户列表 */
    getList() {
      this.loading = true;
      console.log(this.queryParams);
      listCommonUser(this.addDateRange(this.queryParams, this.dateRange)).then(
        (response) => {
          this.userList = response.rows;
          this.total = response.total;
          this.loading = false;
        }
      );
    },
    /** 查询部门下拉树结构 */
    getDeptTree() {
      deptTreeSelect().then((response) => {
        this.deptOptions = response.data;
      });
    },
    // 筛选节点
    filterNode(value, data) {
      if (!value) return true;
      return data.label.indexOf(value) !== -1;
    },
    // 节点单击事件
    handleNodeClick(data) {
      this.queryParams.deptId = data.id;
      this.handleQuery();
    },

    // 取消按钮
    cancel() {
      this.openLookup = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        userId: undefined,
        deptId: undefined,
        userName: undefined,
        nickName: undefined,
        password: undefined,
        phonenumber: undefined,
        email: undefined,
        sex: undefined,
        status: "0",
        remark: undefined,
        postIds: [],
        roleIds: [],
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
      this.dateRange = [];
      this.resetForm("queryForm");
      this.queryParams.deptId = undefined;
      this.$refs.tree.setCurrentKey(null);
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.userId);
      this.single = selection.length != 1;
      this.multiple = !selection.length;
    },
    // 更多操作触发
    handleCommand(command, row) {
      switch (command) {
        case "handleResetPwd":
          this.handleResetPwd(row);
          break;
        case "handleAuthRole":
          this.handleAuthRole(row);
          break;
        default:
          break;
      }
    },
    /** 提交按钮 */
    submitForm: function () {
      // this.placeholder = this.conference.conferenceName;
      this.$emit("selectUser", this.ids);
      this.openLookup = false;
    },
  },
};
</script>
