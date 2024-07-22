-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('客户信息', '3', '1', 'customer', 'customer/customer/index', 1, 0, 'C', '0', '0', 'customer:customer:list', '#', 'admin', sysdate(), '', null, '客户信息菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('客户信息查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'customer:customer:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('客户信息新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'customer:customer:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('客户信息修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'customer:customer:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('客户信息删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'customer:customer:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('客户信息导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'customer:customer:export',       '#', 'admin', sysdate(), '', null, '');

-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('合同信息', '3', '1', 'contract', 'wujie/contract/index', 1, 0, 'C', '0', '0', 'wujie:contract:list', '#', 'admin', sysdate(), '', null, '合同信息菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('合同信息查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'wujie:contract:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('合同信息新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'wujie:contract:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('合同信息修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'wujie:contract:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('合同信息删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'wujie:contract:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('合同信息导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'wujie:contract:export',       '#', 'admin', sysdate(), '', null, '');

-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('财务信息', '3', '1', 'finance', 'wujie/finance/index', 1, 0, 'C', '0', '0', 'wujie:finance:list', '#', 'admin', sysdate(), '', null, '财务信息菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('财务信息查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'wujie:finance:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('财务信息新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'wujie:finance:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('财务信息修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'wujie:finance:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('财务信息删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'wujie:finance:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('财务信息导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'wujie:finance:export',       '#', 'admin', sysdate(), '', null, '');