import request from '@/utils/request'

// 查询rebuttal列表
export function listRebuttal(query) {
  return request({
    url: '/review/rebuttal/list',
    method: 'get',
    params: query
  })
}

export function listRebuttalByArticleId(id) {
  return request({
    url: '/review/rebuttal/getByArticleId/' + id,
    method: 'get'
  })
}

// 查询rebuttal详细
export function getRebuttal(rebuttalId) {
  return request({
    url: '/review/rebuttal/' + rebuttalId,
    method: 'get'
  })
}

// 新增rebuttal
export function addRebuttal(data) {
  return request({
    url: '/review/rebuttal',
    method: 'post',
    data: data
  })
}

// 修改rebuttal
export function updateRebuttal(data) {
  return request({
    url: '/review/rebuttal',
    method: 'put',
    data: data
  })
}

// 删除rebuttal
export function delRebuttal(rebuttalId) {
  return request({
    url: '/review/rebuttal/' + rebuttalId,
    method: 'delete'
  })
}
