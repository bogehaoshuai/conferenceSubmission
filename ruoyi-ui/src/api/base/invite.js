import request from "@/utils/request";

// 查询邀请审稿列表
export function listInvite(query) {
  return request({
    url: "/base/invite/list",
    method: "get",
    params: query,
  });
}

export function listMyInvite(query) {
  return request({
    url: "/base/invite/mylist",
    method: "get",
    params: query,
  });
}

// 查询邀请审稿详细
export function getInvite(inviteId) {
  return request({
    url: "/base/invite/" + inviteId,
    method: "get",
  });
}

// 新增邀请审稿
export function addInvite(data) {
  return request({
    url: "/base/invite",
    method: "post",
    data: data,
  });
}

// 修改邀请审稿
export function updateInvite(data) {
  return request({
    url: "/base/invite",
    method: "put",
    data: data,
  });
}

// 删除邀请审稿
export function delInvite(inviteId) {
  return request({
    url: "/base/invite/" + inviteId,
    method: "delete",
  });
}
