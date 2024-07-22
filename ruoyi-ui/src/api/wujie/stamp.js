import request from '@/utils/request'

// 查询盖章中心列表
export function listInfo(query) {
  return request({
    url: '/stamp/list',
    method: 'get',
    params: query
  })
}

// 查询盖章中心详细
export function getInfo(stampId) {
  return request({
    url: '/stamp/' + stampId,
    method: 'get'
  })
}

// 新增盖章中心
export function addInfo(data) {
  return request({
    url: '/stamp',
    method: 'post',
    data: data
  })
}

// 修改盖章中心
export function updateInfo(data) {
  return request({
    url: '/stamp',
    method: 'put',
    data: data
  })
}

// 删除盖章中心
export function delInfo(stampId) {
  return request({
    url: '/stamp/' + stampId,
    method: 'delete'
  })
}
