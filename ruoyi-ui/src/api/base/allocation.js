import request from '@/utils/request'

// 查询稿件分配列表
export function listAllocation(baseAllocation) {
  return request({
    url: '/review/allocation/list',
    method: 'get',
    params: baseAllocation
  })
}

export function listAllocationByArticleId(id) {
  return request({
    url: '/review/allocation/listByArticleId/' + id,
    method: 'get',
  })
}

// 查询稿件分配详细
export function getAllocation(allocationId) {
  return request({
    url: '/review/allocation/' + allocationId,
    method: 'get'
  })
}

// 新增稿件分配
export function addAllocation(data) {
  return request({
    url: '/review/allocation',
    method: 'post',
    data: data
  })
}

// 修改稿件分配
export function updateAllocation(data) {
  return request({
    url: '/review/allocation',
    method: 'put',
    data: data
  })
}

// 删除稿件分配
export function delAllocation(allocationId) {
  return request({
    url: '/review/allocation/' + allocationId,
    method: 'delete'
  })
}

export function doAllocationByRandom(conferenceId){
  return request({
    url: '/review/allocation/random/' + conferenceId,
    method: 'get'
  })
}

export function doAllocationByTopic(conferenceId){
  return request({
    url: '/review/allocation/topic/' + conferenceId,
    method: 'get'
  })
}

