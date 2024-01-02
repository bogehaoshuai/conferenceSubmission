import request from "@/utils/request";

// 查询作者信息列表
export function listAuthor(query) {
  return request({
    url: "/contribute/author/list",
    method: "get",
    params: query,
  });
}

// 查询作者信息详细
export function getAuthor(authorId) {
  return request({
    url: "/contribute/author/" + authorId,
    method: "get",
  });
}

// 新增作者信息
export function addAuthor(data) {
  return request({
    url: "/contribute/author",
    method: "post",
    data: data,
  });
}

// 修改作者信息
export function updateAuthor(data) {
  return request({
    url: "/contribute/author",
    method: "put",
    data: data,
  });
}

// 删除作者信息
export function delAuthor(authorId) {
  return request({
    url: "/contribute/author/" + authorId,
    method: "delete",
  });
}
