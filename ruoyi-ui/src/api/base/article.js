import request from "@/utils/request";

// 查询文章管理列表
export function listArticle(query) {
  return request({
    url: "/contribute/article/list",
    method: "get",
    params: query,
  });
}

// 查询文章管理列表
export function listMyArticle(query) {
  return request({
    url: "/contribute/article/myList",
    method: "get",
    params: query,
  });
}

// 查询文章管理详细
export function getArticle(articleId) {
  return request({
    url: "/contribute/article/" + articleId,
    method: "get",
  });
}

// 新增文章管理
export function addArticle(data) {
  return request({
    url: "/contribute/article",
    method: "post",
    data: data,
  });
}

// 修改文章管理
export function updateArticle(data) {
  return request({
    url: "/contribute/article",
    method: "put",
    data: data,
  });
}

// 删除文章管理
export function delArticle(articleId) {
  return request({
    url: "/contribute/article/" + articleId,
    method: "delete",
  });
}
