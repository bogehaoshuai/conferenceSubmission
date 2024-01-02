import request from '@/utils/request'

// 查询会议主题列表
export function listTopic(query) {
  return request({
    url: '/base/topic/list',
    method: 'get',
    params: query
  })
}

// 查询会议主题详细
export function getTopic(topicCode) {
  return request({
    url: '/base/topic/' + topicCode,
    method: 'get'
  })
}

// 新增会议主题
export function addTopic(data) {
  return request({
    url: '/base/topic',
    method: 'post',
    data: data
  })
}

// 修改会议主题
export function updateTopic(data) {
  return request({
    url: '/base/topic',
    method: 'put',
    data: data
  })
}

// 删除会议主题
export function delTopic(topicCode) {
  return request({
    url: '/base/topic/' + topicCode,
    method: 'delete'
  })
}
