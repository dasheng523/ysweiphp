CREATE TABLE IF NOT EXISTS `wp_test` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`keyword`  varchar(100) NOT NULL  COMMENT '关键词',
`keyword_type`  tinyint(2) NOT NULL  DEFAULT 0 COMMENT '关键词匹配类型',
`title`  varchar(255) NOT NULL  COMMENT '问卷标题',
`intro`  text NOT NULL  COMMENT '封面简介',
`mTime`  int(10) NOT NULL  COMMENT '修改时间',
`cover`  int(10) UNSIGNED NOT NULL  COMMENT '封面图片',
`token`  varchar(255) NOT NULL  COMMENT 'Token',
`finish_tip`  text NOT NULL  COMMENT '评论语',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('test','测试问卷','0','','1','["keyword","keyword_type","title","intro","cover","finish_tip"]','1:基础','','','','','keyword:关键词\r\nkeyword_type|get_name_by_status:关键词匹配类型\r\ntitle:问卷标题\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,test_question&target=_blank&id=[id]|题目管理,test_answer&target=_blank&id=[id]|用户记录,preview&target=_blank&id=[id]|问卷预览','10','title','','1396061373','1448248071','1','MyISAM','Test');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword','关键词','varchar(100) NOT NULL','string','','','1','','0','1','1','1396624337','1396061575','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('keyword_type','关键词匹配类型','tinyint(2) NOT NULL','select','0','','1','0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配','0','1','1','1396624426','1396061765','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','问卷标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1396624461','1396061859','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','封面简介','text NOT NULL','textarea','','','1','','0','0','1','1396624505','1396061947','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('mTime','修改时间','int(10) NOT NULL','datetime','','','0','','0','0','1','1396624664','1396624664','','3','','regex','time','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cover','封面图片','int(10) UNSIGNED NOT NULL','picture','','','1','','0','0','1','1396624534','1396062093','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NOT NULL','string','','','0','','0','0','1','1396602871','1396602859','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('finish_tip','评论语','text NOT NULL','textarea','','详细说明见上面的提示，配置格式：[0-59]不合格','1','','0','0','1','1397142371','1396953940','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_test_question` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`title`  varchar(255) NOT NULL  COMMENT '题目标题',
`intro`  text NOT NULL  COMMENT '题目描述',
`cTime`  int(10) UNSIGNED NOT NULL  COMMENT '发布时间',
`token`  varchar(255) NOT NULL  COMMENT 'Token',
`is_must`  tinyint(2) NOT NULL  DEFAULT 1 COMMENT '是否必填',
`extra`  text NOT NULL  COMMENT '参数',
`type`  char(50) NOT NULL  DEFAULT 'radio' COMMENT '题目类型',
`test_id`  int(10) UNSIGNED NOT NULL  COMMENT 'test_id',
`sort`  int(10) UNSIGNED NOT NULL  DEFAULT 0 COMMENT '排序号',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('test_question','测试题目','0','','1','{"1":["title","extra","intro","sort"]}','1:基础','','','','','id:问题编号\r\ntitle:标题\r\nextra:参数\r\nids:操作:[EDIT]|编辑,[DELETE]|删除','10','title','','1396061373','1397145854','1','MyISAM','Test');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('title','题目标题','varchar(255) NOT NULL','string','','','1','','0','1','1','1397037377','1396061859','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('intro','题目描述','text NOT NULL','textarea','','','1','','0','0','1','1396954176','1396061947','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发布时间','int(10) UNSIGNED NOT NULL','datetime','','','0','','0','0','1','1396624612','1396075102','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NOT NULL','string','','','0','','0','0','1','1396602871','1396602859','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('is_must','是否必填','tinyint(2) NOT NULL','bool','1','','0','0:否\r\n1:是','0','0','1','1397035513','1396954649','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('extra','参数','text NOT NULL','textarea','','输入格式见上面的提示','1','','0','0','1','1397142592','1396954558','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('type','题目类型','char(50) NOT NULL','radio','radio','','0','radio:单选题','0','1','1','1397142548','1396954463','','3','','regex','radio','1','string');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('test_id','test_id','int(10) UNSIGNED NOT NULL','num','','','4','','0','1','1','1396954240','1396954240','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('sort','排序号','int(10) UNSIGNED NOT NULL','num','0','值越小越靠前','1','','0','0','1','1396955010','1396955010','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


CREATE TABLE IF NOT EXISTS `wp_test_answer` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`answer`  text NOT NULL  COMMENT '回答内容',
`openid`  varchar(255) NOT NULL  COMMENT 'OpenId',
`uid`  int(10) NOT NULL  COMMENT '用户UID',
`question_id`  int(10) UNSIGNED NOT NULL  COMMENT 'question_id',
`cTime`  int(10) UNSIGNED NOT NULL  COMMENT '发布时间',
`token`  varchar(255) NOT NULL  COMMENT 'Token',
`test_id`  int(10) UNSIGNED NOT NULL  COMMENT 'test_id',
`score`  int(10) UNSIGNED NOT NULL  DEFAULT 0 COMMENT '得分',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;
INSERT INTO `wp_model` (`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`,`addon`) VALUES ('test_answer','测试回答','0','','1','','1:基础','','','','','openid:OpenId\r\ntruename:姓名\r\nmobile:手机号\r\nscore:得分\r\ncTime|time_format:测试时间\r\nid:操作:detail?uid=[uid]&test_id=[test_id]|答题详情','10','title','','1396061373','1397145984','1','MyISAM','Test');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('answer','回答内容','text NOT NULL','textarea','','','0','','0','0','1','1396955766','1396955766','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('openid','OpenId','varchar(255) NOT NULL','string','','','0','','0','0','1','1396955581','1396955581','','3','','regex','get_openid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('uid','用户UID','int(10) NOT NULL','num','','','0','','0','0','1','1396955530','1396955530','','3','','regex','get_mid','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('question_id','question_id','int(10) UNSIGNED NOT NULL','num','','','4','','0','1','1','1396955412','1396955392','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('cTime','发布时间','int(10) UNSIGNED NOT NULL','datetime','','','0','','0','0','1','1396624612','1396075102','','3','','regex','time','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('token','Token','varchar(255) NOT NULL','string','','','0','','0','0','1','1396602871','1396602859','','3','','regex','get_token','1','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('test_id','test_id','int(10) UNSIGNED NOT NULL','num','','','4','','0','1','1','1396955403','1396955369','','3','','regex','','3','function');
INSERT INTO `wp_attribute` (`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) VALUES ('score','得分','int(10) UNSIGNED NOT NULL','num','0','','0','','0','0','1','1397040133','1397040133','','3','','regex','','3','function');
UPDATE `wp_attribute` SET model_id= (SELECT MAX(id) FROM `wp_model`) WHERE model_id=0;


