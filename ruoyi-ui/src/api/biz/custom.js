import request from '@/utils/request'

// 查询客户信息列表
export function listCustom(query) {
  return request({
    url: '/custom/page',
    method: 'get',
    params: query
  })
}

// 查询客户信息详细
export function getCustom(id) {
  return request({
    url: '/custom/' + id,
    method: 'get'
  })
}

// 新增客户信息
export function addCustom(data) {
  return request({
    url: '/custom',
    method: 'post',
    data: data
  })
}

// 修改客户信息
export function updateCustom(data) {
  return request({
    url: '/custom',
    method: 'put',
    data: data
  })
}

// 删除客户信息
export function delCustom(id) {
  return request({
    url: '/custom/' + id,
    method: 'delete'
  })
}

export function uploadfile(data) {
    return request({
        url:'/custom-file-info/',
        method: 'post',
        data:data
    })
}
