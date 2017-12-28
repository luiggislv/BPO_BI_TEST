/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : dwh_homeaway_new

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2017-11-09 13:44:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for api_jira_hamoc
-- ----------------------------
DROP TABLE IF EXISTS `api_jira_hamoc`;
CREATE TABLE `api_jira_hamoc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_key` varchar(20) NOT NULL COMMENT 'Codigo Issue',
  `issue_type` varchar(100) NOT NULL COMMENT 'tipo',
  `issue_status` varchar(100) NOT NULL COMMENT 'issue status',
  `issue_priority` varchar(100) NOT NULL COMMENT 'prioridad',
  `resolution` varchar(100) DEFAULT NULL COMMENT 'resolucion',
  `assignee` varchar(100) DEFAULT NULL COMMENT 'asignado a',
  `reporter` varchar(100) DEFAULT NULL COMMENT 'reportado a',
  `creator` varchar(100) NOT NULL COMMENT 'creado por',
  `created` varchar(100) NOT NULL COMMENT 'Fecha Creacion',
  `updated` varchar(100) DEFAULT NULL COMMENT 'Fecha updated',
  `summary` text,
  `risk_rate` varchar(100) DEFAULT NULL,
  `resolved` varchar(100) DEFAULT NULL COMMENT 'resolved',
  `end_date_time` varchar(100) DEFAULT NULL COMMENT 'Fecha end_date_time',
  `begin_date_time` varchar(100) DEFAULT NULL COMMENT 'Fecha begin_date_time',
  `time_detected` varchar(100) DEFAULT NULL COMMENT 'Fecha time_detected',
  `hamoc_notify` varchar(100) DEFAULT NULL COMMENT 'Fecha hamoc_notify',
  `resource_paged` varchar(100) DEFAULT NULL COMMENT 'Fecha resource_paged',
  `resource_engaged` varchar(100) DEFAULT NULL COMMENT 'Fecha resource_engaged',
  `first_notification` varchar(100) DEFAULT NULL COMMENT 'Fecha first_notification',
  `resolved_notification` varchar(100) DEFAULT NULL COMMENT 'Fecha resolved_notification',
  `service_category` varchar(100) DEFAULT NULL COMMENT 'service_category',
  `services` varchar(100) DEFAULT NULL COMMENT 'services',
  `service` varchar(100) DEFAULT NULL COMMENT 'service',
  `office_users_affected` varchar(100) DEFAULT NULL COMMENT 'office_users_affected',
  `outcome` varchar(100) DEFAULT NULL,
  `request_type` varchar(100) DEFAULT NULL,
  `env_affected` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha Creacion Registro',
  `updated_2` varchar(100) DEFAULT NULL,
  `created_2` varchar(100) DEFAULT NULL,
  `resolved_2` varchar(100) DEFAULT NULL,
  `end_date_time_2` varchar(100) DEFAULT NULL,
  `begin_date_time_2` varchar(100) DEFAULT NULL,
  `time_detected_2` varchar(100) DEFAULT NULL,
  `hamoc_notify_2` varchar(100) DEFAULT NULL,
  `resource_paged_2` varchar(100) DEFAULT NULL,
  `resource_engaged_2` varchar(100) DEFAULT NULL,
  `first_notification_2` varchar(100) DEFAULT NULL,
  `resolved_notification_2` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `issue_key` (`issue_key`)
) ENGINE=InnoDB AUTO_INCREMENT=4621 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for api_jira_labels
-- ----------------------------
DROP TABLE IF EXISTS `api_jira_labels`;
CREATE TABLE `api_jira_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_key` varchar(18) NOT NULL COMMENT 'Codigo Issue',
  `label` varchar(100) NOT NULL COMMENT 'label',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha Creacion Registro',
  PRIMARY KEY (`id`),
  KEY `key_label_ind` (`issue_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=250220 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for api_jira_servicedesk
-- ----------------------------
DROP TABLE IF EXISTS `api_jira_servicedesk`;
CREATE TABLE `api_jira_servicedesk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_key` varchar(20) NOT NULL COMMENT 'Codigo Issue',
  `created` varchar(100) NOT NULL COMMENT 'Fecha Creacion',
  `sla` varchar(100) DEFAULT NULL COMMENT 'sla',
  `assignee` varchar(100) DEFAULT NULL COMMENT 'Asignado a',
  `issue_status` varchar(100) NOT NULL COMMENT 'issue status',
  `resolution` varchar(100) DEFAULT NULL COMMENT 'resolucion',
  `updated` varchar(100) DEFAULT NULL,
  `summary` text,
  `risk_rate` varchar(100) DEFAULT NULL,
  `issue_type` varchar(100) NOT NULL COMMENT 'tipo',
  `issue_priority` varchar(100) DEFAULT NULL COMMENT 'prioridad',
  `flg_remotely` tinyint(1) DEFAULT NULL COMMENT '1 Verdadero, 0 Falso',
  `assign_time` varchar(100) DEFAULT NULL COMMENT 'tiempo de asignacion',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha Creacion Registro',
  `ctd_tickets` varchar(100) DEFAULT NULL COMMENT 'cantidad de tickets',
  `min_assignee` varchar(100) DEFAULT NULL,
  `min_first_notify` varchar(100) DEFAULT NULL,
  `min_resolved` varchar(100) DEFAULT NULL,
  `issue_id` varchar(100) DEFAULT NULL,
  `due_date` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `updated_2` varchar(100) DEFAULT NULL,
  `created_2` varchar(100) DEFAULT NULL,
  `assign_time_2` varchar(100) DEFAULT NULL,
  `min_assignee_2` varchar(100) DEFAULT NULL,
  `min_first_notify_2` varchar(100) DEFAULT NULL,
  `min_resolved_2` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `issue_key` (`issue_key`)
) ENGINE=InnoDB AUTO_INCREMENT=232970 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for api_jira_webops
-- ----------------------------
DROP TABLE IF EXISTS `api_jira_webops`;
CREATE TABLE `api_jira_webops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resolution` varchar(255) DEFAULT NULL,
  `updated` varchar(100) DEFAULT NULL,
  `summary` text,
  `risk_rate` varchar(100) DEFAULT NULL,
  `issue_key` varchar(20) DEFAULT NULL,
  `created` varchar(100) DEFAULT NULL,
  `assignee` varchar(100) DEFAULT NULL,
  `issue_type` varchar(100) DEFAULT NULL,
  `issue_status` varchar(100) DEFAULT NULL,
  `issue_priority` varchar(100) DEFAULT NULL,
  `timespent` varchar(100) DEFAULT NULL,
  `issue_component` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha Creacion Registro',
  `assign_time` varchar(100) DEFAULT NULL,
  `min_assignee` varchar(100) DEFAULT NULL,
  `min_first_notify` varchar(100) DEFAULT NULL,
  `min_resolved` varchar(100) DEFAULT NULL,
  `created_2` varchar(100) DEFAULT NULL,
  `updated_2` varchar(100) DEFAULT NULL,
  `min_assignee_2` varchar(100) DEFAULT NULL,
  `min_first_notify_2` varchar(100) DEFAULT NULL,
  `min_resolved_2` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `web_key_ind` (`issue_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24204 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for api_jira_winops
-- ----------------------------
DROP TABLE IF EXISTS `api_jira_winops`;
CREATE TABLE `api_jira_winops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resolution` varchar(255) DEFAULT NULL,
  `updated` varchar(100) DEFAULT NULL,
  `summary` text,
  `risk_rate` varchar(100) DEFAULT NULL,
  `issue_key` varchar(20) DEFAULT NULL,
  `created` varchar(100) DEFAULT NULL,
  `assignee` varchar(100) DEFAULT NULL,
  `issue_type` varchar(100) DEFAULT NULL,
  `issue_status` varchar(100) DEFAULT NULL,
  `issue_priority` varchar(100) DEFAULT NULL,
  `timespent` varchar(100) DEFAULT NULL,
  `issue_component` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha Creacion Registro',
  `assign_time` varchar(100) DEFAULT NULL,
  `min_assignee` varchar(100) DEFAULT NULL,
  `min_first_notify` varchar(100) DEFAULT NULL,
  `min_resolved` varchar(100) DEFAULT NULL,
  `created_2` varchar(100) DEFAULT NULL,
  `updated_2` varchar(100) DEFAULT NULL,
  `min_assignee_2` varchar(100) DEFAULT NULL,
  `min_first_notify_2` varchar(100) DEFAULT NULL,
  `min_resolved_2` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `win_key_ind` (`issue_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13921 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for api_jira_wl
-- ----------------------------
DROP TABLE IF EXISTS `api_jira_wl`;
CREATE TABLE `api_jira_wl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `worklog_id` varchar(18) NOT NULL COMMENT 'Codigo Worklog',
  `issue_key` varchar(18) NOT NULL COMMENT 'Codigo Issue',
  `author` varchar(100) NOT NULL COMMENT 'author',
  `started` varchar(100) DEFAULT NULL COMMENT 'Fecha que selecciono',
  `time_spent` varchar(100) DEFAULT NULL COMMENT 'time in string',
  `time_spent_seconds` varchar(100) DEFAULT NULL COMMENT 'time in seconds',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha Creacion Registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `worklog_id` (`worklog_id`),
  KEY `iss_key_ind` (`issue_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52290 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for api_jira_worklogs
-- ----------------------------
DROP TABLE IF EXISTS `api_jira_worklogs`;
CREATE TABLE `api_jira_worklogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `worklog_id` varchar(18) NOT NULL COMMENT 'Codigo Worklog',
  `issue_key` varchar(18) NOT NULL COMMENT 'Codigo Issue',
  `author` varchar(100) NOT NULL COMMENT 'author',
  `started` varchar(100) DEFAULT NULL COMMENT 'Fecha que selecciono',
  `time_spent` varchar(100) DEFAULT NULL COMMENT 'time in string',
  `time_spent_seconds` varchar(100) DEFAULT NULL COMMENT 'time in seconds',
  `iddia` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha Creacion Registro',
  `ctd_worklog` int(11) DEFAULT NULL,
  `id_t_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `worklog_id` (`worklog_id`),
  KEY `author_ind` (`author`) USING BTREE,
  KEY `issue_key_ind` (`issue_key`) USING BTREE,
  KEY `i_type_wok_ind` (`id_t_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49745 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for api_jira_worklogsweek
-- ----------------------------
DROP TABLE IF EXISTS `api_jira_worklogsweek`;
CREATE TABLE `api_jira_worklogsweek` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `worklog_id` varchar(18) NOT NULL COMMENT 'Codigo Worklog',
  `issue_key` varchar(18) NOT NULL COMMENT 'Codigo Issue',
  `author` varchar(100) NOT NULL COMMENT 'author',
  `started` varchar(100) DEFAULT NULL COMMENT 'Fecha que selecciono',
  `time_spent` varchar(100) DEFAULT NULL COMMENT 'time in string',
  `time_spent_secondsWeek` varchar(100) DEFAULT NULL COMMENT 'time in seconds',
  `iddia` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha Creacion Registro',
  `ctd_worklog` int(11) DEFAULT NULL,
  `id_t_type` int(11) DEFAULT NULL,
  `id_project_jira_week` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `worklog_id2` (`worklog_id`) USING BTREE,
  KEY `author_ind_w` (`author`) USING BTREE,
  KEY `issue_key_ind2` (`issue_key`) USING BTREE,
  KEY `i_type_wok_ind2` (`id_t_type`) USING BTREE,
  KEY `project_jira_week_ind` (`id_project_jira_week`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49745 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dim_assigned_on_time
-- ----------------------------
DROP TABLE IF EXISTS `dim_assigned_on_time`;
CREATE TABLE `dim_assigned_on_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assigned_id` varchar(18) NOT NULL COMMENT 'yes or no',
  `description` varchar(100) NOT NULL COMMENT 'Description',
  PRIMARY KEY (`id`),
  UNIQUE KEY `assigned_id` (`assigned_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dim_component
-- ----------------------------
DROP TABLE IF EXISTS `dim_component`;
CREATE TABLE `dim_component` (
  `idcomponent` int(11) NOT NULL,
  `descomponent` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcomponent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for dim_department
-- ----------------------------
DROP TABLE IF EXISTS `dim_department`;
CREATE TABLE `dim_department` (
  `id_department` int(11) NOT NULL,
  `des_department` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dim_enterprise_office
-- ----------------------------
DROP TABLE IF EXISTS `dim_enterprise_office`;
CREATE TABLE `dim_enterprise_office` (
  `id_ent_office` int(11) NOT NULL,
  `des_ent_office` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_ent_office`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for dim_enterprise_service
-- ----------------------------
DROP TABLE IF EXISTS `dim_enterprise_service`;
CREATE TABLE `dim_enterprise_service` (
  `id_ent_service` int(11) NOT NULL,
  `des_ent_servive` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_ent_service`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for dim_issue
-- ----------------------------
DROP TABLE IF EXISTS `dim_issue`;
CREATE TABLE `dim_issue` (
  `idissue` int(11) NOT NULL COMMENT '		',
  `des_issue` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idissue`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dim_issue
-- ----------------------------
INSERT INTO `dim_issue` VALUES ('1', 'Issue 1');
INSERT INTO `dim_issue` VALUES ('2', 'Issue 2');

-- ----------------------------
-- Table structure for dim_issuelink
-- ----------------------------
DROP TABLE IF EXISTS `dim_issuelink`;
CREATE TABLE `dim_issuelink` (
  `ID` int(124) NOT NULL AUTO_INCREMENT,
  `LINKTYPE` varchar(124) DEFAULT NULL,
  `INWARD` varchar(124) DEFAULT NULL,
  `OUTWARD` varchar(124) DEFAULT NULL,
  `SOURCE` varchar(124) DEFAULT NULL,
  `DESTINATION` varchar(124) DEFAULT NULL,
  `FLAGINOUT` tinyint(1) DEFAULT NULL,
  `SOURCE_TYPE` varchar(124) DEFAULT NULL,
  `DESTINATION_TYPE` varchar(124) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `source_inx` (`SOURCE`),
  KEY `dest_inx` (`DESTINATION`)
) ENGINE=InnoDB AUTO_INCREMENT=354417 DEFAULT CHARSET=utf8 COMMENT='0 = Inward\r\n1 = Outward';

-- ----------------------------
-- Table structure for dim_i_type
-- ----------------------------
DROP TABLE IF EXISTS `dim_i_type`;
CREATE TABLE `dim_i_type` (
  `id_i_type` int(11) NOT NULL,
  `des_i_type` varchar(45) DEFAULT NULL,
  `short_desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_i_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for dim_label
-- ----------------------------
DROP TABLE IF EXISTS `dim_label`;
CREATE TABLE `dim_label` (
  `id_label` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_label`),
  KEY `label_ind` (`label`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dim_operator
-- ----------------------------
DROP TABLE IF EXISTS `dim_operator`;
CREATE TABLE `dim_operator` (
  `id_operator` varchar(255) NOT NULL,
  `id_team` int(11) NOT NULL,
  `des_operator` varchar(255) DEFAULT NULL,
  KEY `fk_dim_operator_dim_team1` (`id_team`),
  KEY `fk_dim_id_op` (`id_operator`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for dim_priority
-- ----------------------------
DROP TABLE IF EXISTS `dim_priority`;
CREATE TABLE `dim_priority` (
  `idprioridad` int(11) NOT NULL,
  `desprioridad` varchar(45) DEFAULT NULL,
  `prioridad` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`idprioridad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for dim_production_category
-- ----------------------------
DROP TABLE IF EXISTS `dim_production_category`;
CREATE TABLE `dim_production_category` (
  `id_pro_category` int(11) NOT NULL,
  `des_pro_category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pro_category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for dim_production_service
-- ----------------------------
DROP TABLE IF EXISTS `dim_production_service`;
CREATE TABLE `dim_production_service` (
  `id_pro_service` int(11) NOT NULL,
  `des_pro_service` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pro_service`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for dim_reporter
-- ----------------------------
DROP TABLE IF EXISTS `dim_reporter`;
CREATE TABLE `dim_reporter` (
  `id_reporter` varchar(255) NOT NULL,
  `des_reporter` varchar(255) DEFAULT NULL,
  `id_department` int(11) NOT NULL,
  KEY `ind_department` (`id_department`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dim_resolution
-- ----------------------------
DROP TABLE IF EXISTS `dim_resolution`;
CREATE TABLE `dim_resolution` (
  `idresolution` int(11) NOT NULL,
  `des_resolution` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idresolution`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for dim_resolved_on_time
-- ----------------------------
DROP TABLE IF EXISTS `dim_resolved_on_time`;
CREATE TABLE `dim_resolved_on_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resolved_id` varchar(18) NOT NULL COMMENT 'yes or no',
  `description` varchar(100) NOT NULL COMMENT 'Description',
  PRIMARY KEY (`id`),
  UNIQUE KEY `resolved_id` (`resolved_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dim_sla
-- ----------------------------
DROP TABLE IF EXISTS `dim_sla`;
CREATE TABLE `dim_sla` (
  `id_sla` int(11) NOT NULL,
  `des_sla` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_sla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for dim_status
-- ----------------------------
DROP TABLE IF EXISTS `dim_status`;
CREATE TABLE `dim_status` (
  `id_status` int(11) NOT NULL,
  `des_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for dim_team
-- ----------------------------
DROP TABLE IF EXISTS `dim_team`;
CREATE TABLE `dim_team` (
  `id_team` int(11) NOT NULL,
  `des_team` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_team`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dim_team
-- ----------------------------
INSERT INTO `dim_team` VALUES ('1', 'Homeaway');
INSERT INTO `dim_team` VALUES ('2', 'Aynitech');

-- ----------------------------
-- Table structure for dim_t_types
-- ----------------------------
DROP TABLE IF EXISTS `dim_t_types`;
CREATE TABLE `dim_t_types` (
  `id_t_type` int(11) NOT NULL,
  `des_t_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_t_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dim_t_types
-- ----------------------------
INSERT INTO `dim_t_types` VALUES ('1', 'Type 1');
INSERT INTO `dim_t_types` VALUES ('2', 'Type 2');
INSERT INTO `dim_t_types` VALUES ('3', 'Type 3');
INSERT INTO `dim_t_types` VALUES ('4', 'Type 4');
INSERT INTO `dim_t_types` VALUES ('5', 'Type 5');
INSERT INTO `dim_t_types` VALUES ('6', 'Type 6');
INSERT INTO `dim_t_types` VALUES ('7', 'Type 7');
INSERT INTO `dim_t_types` VALUES ('8', 'Type 8');
INSERT INTO `dim_t_types` VALUES ('9', 'Type 9');
INSERT INTO `dim_t_types` VALUES ('10', 'Type 10');

-- ----------------------------
-- Table structure for dim_t_types2
-- ----------------------------
DROP TABLE IF EXISTS `dim_t_types2`;
CREATE TABLE `dim_t_types2` (
  `id_t_type` int(11) NOT NULL,
  `des_t_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_t_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dim_t_types2
-- ----------------------------
INSERT INTO `dim_t_types2` VALUES ('2', 'Type 2');
INSERT INTO `dim_t_types2` VALUES ('3', 'Type 3');
INSERT INTO `dim_t_types2` VALUES ('4', 'Type 4');
INSERT INTO `dim_t_types2` VALUES ('5', 'Type 55');
INSERT INTO `dim_t_types2` VALUES ('6', 'Type 6');
INSERT INTO `dim_t_types2` VALUES ('7', 'Type 7');
INSERT INTO `dim_t_types2` VALUES ('8', 'Type 8');
INSERT INTO `dim_t_types2` VALUES ('9', 'Type 9');
INSERT INTO `dim_t_types2` VALUES ('10', 'Type 10');
INSERT INTO `dim_t_types2` VALUES ('11', 'Type 11');

-- ----------------------------
-- Table structure for fact_tickets
-- ----------------------------
DROP TABLE IF EXISTS `fact_tickets`;
CREATE TABLE `fact_tickets` (
  `iddia` int(11) NOT NULL,
  `tic_key` varchar(45) NOT NULL DEFAULT '',
  `id_sla` int(11) NOT NULL,
  `id_operator` varchar(45) NOT NULL,
  `id_status` int(11) NOT NULL,
  `idresolution` int(11) NOT NULL,
  `id_t_type` int(11) NOT NULL,
  `idprioridad` int(11) NOT NULL,
  `idissue` int(11) NOT NULL,
  `flgremotely` varchar(45) NOT NULL,
  `assign_time` int(11) NOT NULL,
  `ctd_tickets` int(11) NOT NULL,
  `minutesassign` int(11) NOT NULL,
  `minutesfirstresponse` int(11) NOT NULL,
  `minutesresolution` int(11) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  KEY `fk_fact_tickets_dim_sla1` (`id_sla`),
  KEY `fk_fact_tickets_dim_operator1` (`id_operator`),
  KEY `fk_fact_tickets_dim_status1` (`id_status`),
  KEY `fk_fact_tickets_dim_t_types1` (`id_t_type`),
  KEY `fk_fact_tickets_dim_priority1` (`idprioridad`),
  KEY `fk_fact_tickets_dim_issue1` (`idissue`),
  KEY `fk_fact_tickets_ltm_dias1` (`iddia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for fact_webops
-- ----------------------------
DROP TABLE IF EXISTS `fact_webops`;
CREATE TABLE `fact_webops` (
  `iddia` int(11) NOT NULL,
  `web_key` varchar(45) NOT NULL DEFAULT '',
  `id_operator` varchar(45) NOT NULL,
  `id_t_type` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `idprioridad` int(11) NOT NULL,
  `timespent` int(11) DEFAULT NULL,
  `issue_component` int(11) DEFAULT NULL,
  `ctd_webops` int(11) NOT NULL DEFAULT '1',
  `assign_timeWeb` int(11) NOT NULL,
  `minutesassignWeb` int(11) NOT NULL,
  `minutesfirstresponseWeb` int(11) NOT NULL,
  `minutesresolutionWeb` int(11) NOT NULL,
  `tickets_associatedWeb` longtext,
  `assoc_changeWeb` varchar(255) DEFAULT NULL,
  `assigned_on_timeWeb` int(11) DEFAULT NULL,
  `resolved_on_timeWeb` int(11) DEFAULT NULL,
  `assigned_id_Web` varchar(45) DEFAULT NULL,
  `resolved_id_Web` varchar(45) DEFAULT NULL,
  `project_jira` varchar(100) DEFAULT NULL,
  KEY `fk_fac_incident_dim_component1` (`issue_component`),
  KEY `fk_fac_incident_dim_operator1` (`id_operator`),
  KEY `fk_fact_tickets_dim_status1` (`id_status`),
  KEY `fk_fact_tickets_dim_t_types1` (`id_t_type`),
  KEY `fk_fact_tickets_dim_priority1` (`idprioridad`),
  KEY `fk_fact_tickets_ltm_dias1` (`iddia`),
  KEY `fk_fact_assigned_web` (`assigned_id_Web`) USING BTREE,
  KEY `fk_fact_resolved_web` (`resolved_id_Web`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for fact_winops
-- ----------------------------
DROP TABLE IF EXISTS `fact_winops`;
CREATE TABLE `fact_winops` (
  `iddia` int(11) NOT NULL,
  `win_key` varchar(45) NOT NULL DEFAULT '',
  `id_operator` varchar(45) NOT NULL,
  `id_t_type` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `idprioridad` int(11) NOT NULL,
  `timespent` int(11) DEFAULT NULL,
  `issue_component` int(11) DEFAULT NULL,
  `ctd_winops` int(11) NOT NULL DEFAULT '1',
  `assign_timeWin` int(11) NOT NULL,
  `minutesassignWin` int(11) NOT NULL,
  `minutesfirstresponseWin` int(11) NOT NULL,
  `minutesresolutionWin` int(11) NOT NULL,
  `tickets_associatedWin` longtext,
  `assoc_changeWin` varchar(255) DEFAULT NULL,
  `assigned_on_timeWin` int(11) DEFAULT NULL,
  `resolved_on_timeWin` int(11) DEFAULT NULL,
  `assigned_id_Win` varchar(45) DEFAULT NULL,
  `resolved_id_Win` varchar(45) DEFAULT NULL,
  `project_jira` varchar(100) DEFAULT NULL,
  `id_project_jira` int(11) DEFAULT NULL,
  KEY `fk_fac_incident_dim_component1` (`issue_component`),
  KEY `fk_fac_incident_dim_operator1` (`id_operator`),
  KEY `fk_fact_tickets_dim_status1` (`id_status`),
  KEY `fk_fact_tickets_dim_t_types1` (`id_t_type`),
  KEY `fk_fact_tickets_dim_priority1` (`idprioridad`),
  KEY `fk_fact_tickets_ltm_dias1` (`iddia`),
  KEY `fk_fact_assigned` (`assigned_id_Win`) USING BTREE,
  KEY `fk_fact_resolved` (`resolved_id_Win`) USING BTREE,
  KEY `fk_fact_jira_project` (`id_project_jira`) USING BTREE,
  KEY `fk_fact_win_key_ind` (`win_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for fac_incident
-- ----------------------------
DROP TABLE IF EXISTS `fac_incident`;
CREATE TABLE `fac_incident` (
  `iddia` int(11) NOT NULL,
  `idprioridad` int(11) NOT NULL,
  `id_i_type` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `id_pro_category` int(11) NOT NULL,
  `id_pro_service` int(11) NOT NULL,
  `id_operator` varchar(45) NOT NULL,
  `id_ent_service` int(11) NOT NULL,
  `id_ent_office` int(11) NOT NULL,
  `inc_key` varchar(255) NOT NULL,
  `ctd_indidentes` int(11) NOT NULL,
  `txtfechaincidente` varchar(45) NOT NULL,
  `minutesdetected` int(11) NOT NULL,
  `minutesnotified` int(11) NOT NULL,
  `minutesresponse` int(11) NOT NULL,
  `minutesduration` int(11) NOT NULL,
  `minutesfirstnotification` int(11) NOT NULL,
  `minutesresolvednotification` int(11) NOT NULL,
  `minutesescalate` int(11) NOT NULL,
  `minutescreate` int(11) NOT NULL,
  `summaryInc` text,
  `id_reporter` varchar(45) NOT NULL,
  `outcome` varchar(100) DEFAULT NULL,
  `request_type` varchar(100) DEFAULT NULL,
  `env_affected` varchar(100) DEFAULT NULL,
  `txtbegindate` varchar(45) NOT NULL,
  KEY `fk_fac_incidentes_dim_prioridad1` (`idprioridad`),
  KEY `fk_fac_incident_dim_type_inc1` (`id_i_type`),
  KEY `fk_fac_incident_dim_category1` (`id_pro_category`),
  KEY `fk_fac_incident_dim_service1` (`id_pro_service`),
  KEY `fk_fac_incident_dim_operator1` (`id_operator`),
  KEY `fk_fac_incident_dim_enterprise_service1` (`id_ent_service`),
  KEY `fk_fac_incident_dim_enterprise_office1` (`id_ent_office`),
  KEY `fk_fac_incident_ltm_dias1` (`iddia`),
  KEY `fk_fac_incident_dim_reporter1` (`id_reporter`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for ltm_anhos
-- ----------------------------
DROP TABLE IF EXISTS `ltm_anhos`;
CREATE TABLE `ltm_anhos` (
  `idanho` int(11) NOT NULL,
  `idanhoanterior` int(11) DEFAULT NULL,
  `numerodias` int(11) DEFAULT NULL,
  PRIMARY KEY (`idanho`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for ltm_bimestres
-- ----------------------------
DROP TABLE IF EXISTS `ltm_bimestres`;
CREATE TABLE `ltm_bimestres` (
  `idbimestre` int(11) NOT NULL,
  `desbimestre` varchar(19) DEFAULT NULL,
  `idbimestreanterior` int(11) DEFAULT NULL,
  `idsemestre` int(11) NOT NULL,
  `idanho` int(11) NOT NULL,
  PRIMARY KEY (`idbimestre`),
  KEY `fk_ltm_bimestres_ltm_anhos1` (`idanho`),
  KEY `fk_ltm_bimestres_ltm_semestres1` (`idsemestre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for ltm_dayweek
-- ----------------------------
DROP TABLE IF EXISTS `ltm_dayweek`;
CREATE TABLE `ltm_dayweek` (
  `numerodiasemana` int(11) NOT NULL,
  `day_of_week` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`numerodiasemana`),
  UNIQUE KEY `ind_numdiasem` (`numerodiasemana`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ltm_dias
-- ----------------------------
DROP TABLE IF EXISTS `ltm_dias`;
CREATE TABLE `ltm_dias` (
  `iddia` int(11) NOT NULL,
  `numerodiasemana` int(11) DEFAULT NULL,
  `iddiaanterior` int(11) DEFAULT NULL,
  `idmesanterior` int(11) DEFAULT NULL,
  `idmes` int(11) NOT NULL,
  `idbimestre` int(11) NOT NULL,
  `idtrimestre` int(11) NOT NULL,
  `idsemestre` int(11) NOT NULL,
  `idanho` int(11) NOT NULL,
  `dia` int(11) NOT NULL,
  `idweek` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddia`),
  KEY `fk_ltm_dias_ltm_anhos1` (`idanho`),
  KEY `fk_ltm_dias_ltm_bimestres1` (`idbimestre`),
  KEY `fk_ltm_dias_ltm_semestres1` (`idsemestre`),
  KEY `fk_ltm_dias_ltm_trimestres1` (`idtrimestre`),
  KEY `fk_ltm_dias_ltm_meses1` (`idmes`),
  KEY `fk_ltm_dias_ltm_week` (`idweek`) USING BTREE,
  KEY `fk_ltm_dias_ltm_dia` (`dia`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for ltm_meses
-- ----------------------------
DROP TABLE IF EXISTS `ltm_meses`;
CREATE TABLE `ltm_meses` (
  `idmes` int(11) NOT NULL,
  `desmes` varchar(18) DEFAULT NULL,
  `idmesanterior` int(11) DEFAULT NULL,
  `idmesanterior2` int(11) DEFAULT NULL,
  `idmesanhoanterior` int(11) DEFAULT NULL,
  `idmesprimeroanho` int(11) DEFAULT NULL,
  `idmesultanho` int(11) DEFAULT NULL,
  `idmesultanhoanterior` int(11) DEFAULT NULL,
  `idmesfintrim` int(11) DEFAULT NULL,
  `numerodiasmes` int(11) DEFAULT NULL,
  `idtrimestreultanho` int(11) DEFAULT NULL,
  `idbimestre` int(11) NOT NULL,
  `idtrimestre` int(11) NOT NULL,
  `idsemestre` int(11) NOT NULL,
  `idanho` int(11) NOT NULL,
  `mes` varchar(5) DEFAULT NULL,
  `idmonthyear` int(2) NOT NULL,
  PRIMARY KEY (`idmes`),
  KEY `fk_ltm_meses_ltm_anhos1` (`idanho`),
  KEY `fk_ltm_meses_ltm_bimestres1` (`idbimestre`),
  KEY `fk_ltm_meses_ltm_trimestres1` (`idtrimestre`),
  KEY `fk_ltm_meses_ltm_semestres1` (`idsemestre`),
  KEY `fk_ltm_meses_ltm_monthyear1` (`idmonthyear`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for ltm_mes_anho
-- ----------------------------
DROP TABLE IF EXISTS `ltm_mes_anho`;
CREATE TABLE `ltm_mes_anho` (
  `idmonthyear` int(2) NOT NULL,
  `descmonthyear` varchar(20) NOT NULL,
  `shortdescmonthyear` varchar(10) NOT NULL,
  UNIQUE KEY `ind_idmonthyear` (`idmonthyear`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ltm_semestres
-- ----------------------------
DROP TABLE IF EXISTS `ltm_semestres`;
CREATE TABLE `ltm_semestres` (
  `idsemestre` int(11) NOT NULL,
  `dessemestre` varchar(19) DEFAULT NULL,
  `idsemestreanterior` int(11) DEFAULT NULL,
  `idanho` int(11) NOT NULL,
  PRIMARY KEY (`idsemestre`),
  KEY `fk_ltm_semestres_ltm_anhos1` (`idanho`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for ltm_trimestres
-- ----------------------------
DROP TABLE IF EXISTS `ltm_trimestres`;
CREATE TABLE `ltm_trimestres` (
  `idtrimestre` int(11) NOT NULL,
  `destrimestre` varchar(20) DEFAULT NULL,
  `idtrimestreanterior` int(11) DEFAULT NULL,
  `idtrimestreanhoant` int(11) DEFAULT NULL,
  `idtrimestreultanho` int(11) DEFAULT NULL,
  `idtrimestreultanhoant` int(11) DEFAULT NULL,
  `numtrimestre` int(11) DEFAULT NULL,
  `idsemestre` int(11) NOT NULL,
  `idanho` int(11) NOT NULL,
  `trimestre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idtrimestre`),
  KEY `fk_ltm_trimestres_ltm_semestres1` (`idsemestre`),
  KEY `fk_ltm_trimestres_ltm_anhos1` (`idanho`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for ltm_weeks
-- ----------------------------
DROP TABLE IF EXISTS `ltm_weeks`;
CREATE TABLE `ltm_weeks` (
  `idweek` int(11) NOT NULL,
  `weekstart` int(11) DEFAULT NULL,
  `weekend` int(11) DEFAULT NULL,
  `descrip` varchar(255) DEFAULT NULL,
  `idanho` int(11) DEFAULT NULL,
  PRIMARY KEY (`idweek`),
  UNIQUE KEY `fk_week_ind` (`idweek`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id_project_jira` int(11) NOT NULL,
  `project` varchar(100) NOT NULL,
  `project_jira` varchar(100) NOT NULL,
  `assign_target` int(8) NOT NULL,
  `resolve_target` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
