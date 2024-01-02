import request from "@/utils/request";

// 查询会议管理列表
export function listConference(query) {
  return request({
    url: "/base/conference/list",
    method: "get",
    params: query,
  });
}
export function listArticleConference(query) {
  return request({
    url: "/base/conference/articlelist",
    method: "get",
    params: query,
  });
}

// 查询会议管理列表
export function listMyConference(query) {
  return request({
    url: "/base/conference/mylist",
    method: "get",
    params: query,
  });
}

// 查询会议管理详细
export function getConference(conferenceId) {
  return request({
    url: "/base/conference/" + conferenceId,
    method: "get",
  });
}

// 新增会议管理
export function addConference(data) {
  return request({
    url: "/base/conference",
    method: "post",
    data: data,
  });
}

// 修改会议管理
export function updateConference(data) {
  return request({
    url: "/base/conference",
    method: "put",
    data: data,
  });
}

// 修改状态码以发布评审结果
export function updateConferenceToPublish(data) {
  return request({
    url: "/base/conference/toPublish",
    method: "put",
    data: data,
  });
}


// 删除会议管理
export function delConference(conferenceId) {
  return request({
    url: "/base/conference/" + conferenceId,
    method: "delete",
  });
}
