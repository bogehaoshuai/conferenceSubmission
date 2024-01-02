import request from '@/utils/request'

// 查询审稿数量列表
export function listCount(query) {
  return request({
    url: '/review/count/list',
    method: 'get',
    params: query
  })
}

// 查询审稿数量详细
export function getCount(countId) {
  return request({
    url: '/review/count/' + countId,
    method: 'get'
  })
}

// 新增审稿数量
export function addCount(data) {
  return request({
    url: '/review/count',
    method: 'post',
    data: data
  })
}

// 修改审稿数量
export function updateCount(data) {
  return request({
    url: '/review/count',
    method: 'put',
    data: data
  })
}

// 删除审稿数量
export function delCount(countId) {
  return request({
    url: '/review/count/' + countId,
    method: 'delete'
  })
}
