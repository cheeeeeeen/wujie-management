import request from '@/utils/request'

// 查询合同信息列表
export function listContract(query) {
  return request({
    url: '/wujie/contract/list',
    method: 'get',
    params: query
  })
}

// 查询合同信息详细
export function getContract(id) {
  return request({
    url: '/wujie/contract/' + id,
    method: 'get'
  })
}

// 新增合同信息
export function addContract(data) {
  return request({
    url: '/wujie/contract',
    method: 'post',
    data: data
  })
}

// 修改合同信息
export function updateContract(data) {
  return request({
    url: '/wujie/contract',
    method: 'put',
    data: data
  })
}

// 删除合同信息
export function delContract(id) {
  return request({
    url: '/wujie/contract/' + id,
    method: 'delete'
  })
}
