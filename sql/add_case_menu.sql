create table stamp_info (
`stamp_id` bigint not null auto_increment comment "主键id",
`creator` varchar(20) comment "创建者",
`state` varchar(1) comment "审批状态,0待盖章，1已盖章",
`create_time` timestamp comment "创建时间",
`del` varchar(1) default '0' comment "删除标记",
`update_time` timestamp comment "更新时间",
`notice_creater_id` bigint comment "通知创建者的通知id",
`notice_sealed_by_id` bigint comment "通知盖章者的通知id",
primary key(`stamp_id`)
) comment "盖章中心"
    
