import request from '@/utils/request'

export function addFile(data) {
    return request({
        url:'file-info',
        method: 'post',
        data: data,
    })
}

export function customerFileList(id) {
    return request({
        method: 'get',
        url: 'file-info/list/' + id
    })
}

export function deleteFile(id) {
    return request({
        url: 'file-info/' +id,
        method: 'delete'
    })
}

export function contractFileList(id) {
    return request({
        method: 'get',
        url: 'file-info/list/contract/' + id
    })
}

export function financeFileList(id) {
    return request({
        method: 'get',
        url: 'file-info/list/finance/' + id
    })
}

export function caseFileList(id) {
    return request({
        method: 'get',
        url: 'file-info/list/case/' + id
    })
}

export function stampFileList(id) {
    return request({
        method: 'get',
        url: 'file-info/list/stamp/' + id
    })
}