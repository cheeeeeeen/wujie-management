import request from '@/utils/request'

// 查询合同信息列表
export function listFinance(query) {
  return request({
    url: '/wujie/finance/list',
    method: 'get',
    params: query
  })
}

// 查询合同信息详细
export function getFinance(id) {
  return request({
    url: '/wujie/finance/' + id,
    method: 'get'
  })
}

// 新增合同信息
export function addFinance(data) {
  return request({
    url: '/wujie/finance',
    method: 'post',
    data: data
  })
}

// 修改合同信息
export function updateFinance(data) {
  return request({
    url: '/wujie/finance',
    method: 'put',
    data: data
  })
}

// 删除合同信息
export function delFinance(id) {
  return request({
    url: '/wujie/finance/' + id,
    method: 'delete'
  })
}
