import request from '@/utils/request'

// 查询案件信息列表
export function listCase(query) {
  return request({
    url: '/case/case/list',
    method: 'get',
    params: query
  })
}

// 查询案件信息详细
export function getCase(caseId) {
  return request({
    url: '/case/case/' + caseId,
    method: 'get'
  })
}

// 新增案件信息
export function addCase(data) {
  return request({
    url: '/case/case',
    method: 'post',
    data: data
  })
}

// 修改案件信息
export function updateCase(data) {
  return request({
    url: '/case/case',
    method: 'put',
    data: data
  })
}

// 删除案件信息
export function delCase(caseId) {
  return request({
    url: '/case/case/' + caseId,
    method: 'delete'
  })
}
