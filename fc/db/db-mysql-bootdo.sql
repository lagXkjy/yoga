/*
 Navicat Premium Data Transfer

 Source Server         : 47.96.82.165
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 47.96.82.165:3306
 Source Schema         : fc

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 26/11/2018 21:36:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log`
(
    `LOG_NR_`       bigint(20)                                       NOT NULL AUTO_INCREMENT,
    `TYPE_`         varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `PROC_DEF_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `TASK_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `TIME_STAMP_`   timestamp(0)                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
    `USER_ID_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL,
    `DATA_`         longblob                                         NULL,
    `LOCK_OWNER_`   varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL,
    `LOCK_TIME_`    timestamp(0)                                     NULL     DEFAULT NULL,
    `IS_PROCESSED_` tinyint(4)                                       NULL     DEFAULT 0,
    PRIMARY KEY (`LOG_NR_`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray`
(
    `ID_`            varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `REV_`           int(11)                                          NULL DEFAULT NULL,
    `NAME_`          varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `BYTES_`         longblob                                         NULL,
    `GENERATED_`     tinyint(4)                                       NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`) USING BTREE,
    CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property`
(
    `NAME_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `REV_`   int(11)                                          NULL DEFAULT NULL,
    PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst`
(
    `ID_`                varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `PROC_DEF_ID_`       varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `PROC_INST_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `EXECUTION_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `ACT_ID_`            varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `TASK_ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `ACT_NAME_`          varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `ACT_TYPE_`          varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `ASSIGNEE_`          varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `START_TIME_`        datetime(0)                                      NOT NULL,
    `END_TIME_`          datetime(0)                                      NULL DEFAULT NULL,
    `DURATION_`          bigint(20)                                       NULL DEFAULT NULL,
    `TENANT_ID_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`) USING BTREE,
    INDEX `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`) USING BTREE,
    INDEX `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`, `ACT_ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`, `ACT_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment`
(
    `ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `REV_`          int(11)                                           NULL DEFAULT NULL,
    `USER_ID_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `NAME_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `DESCRIPTION_`  varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TYPE_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `TASK_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `URL_`          varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `CONTENT_ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `TIME_`         datetime(0)                                       NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment`
(
    `ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `TYPE_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `TIME_`         datetime(0)                                       NOT NULL,
    `USER_ID_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `TASK_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `ACTION_`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `MESSAGE_`      varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `FULL_MSG_`     longblob                                          NULL,
    PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail`
(
    `ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `TYPE_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `TASK_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `ACT_INST_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `NAME_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `VAR_TYPE_`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `REV_`          int(11)                                           NULL DEFAULT NULL,
    `TIME_`         datetime(0)                                       NOT NULL,
    `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `DOUBLE_`       double                                            NULL DEFAULT NULL,
    `LONG_`         bigint(20)                                        NULL DEFAULT NULL,
    `TEXT_`         varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TEXT2_`        varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_DETAIL_TIME` (`TIME_`) USING BTREE,
    INDEX `ACT_IDX_HI_DETAIL_NAME` (`NAME_`) USING BTREE,
    INDEX `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink`
(
    `ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `GROUP_ID_`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TYPE_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `USER_ID_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TASK_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst`
(
    `ID_`                        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `PROC_INST_ID_`              varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `BUSINESS_KEY_`              varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PROC_DEF_ID_`               varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `START_TIME_`                datetime(0)                                       NOT NULL,
    `END_TIME_`                  datetime(0)                                       NULL DEFAULT NULL,
    `DURATION_`                  bigint(20)                                        NULL DEFAULT NULL,
    `START_USER_ID_`             varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `START_ACT_ID_`              varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `END_ACT_ID_`                varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `SUPER_PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `DELETE_REASON_`             varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TENANT_ID_`                 varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT '',
    `NAME_`                      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    UNIQUE INDEX `PROC_INST_ID_` (`PROC_INST_ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`) USING BTREE,
    INDEX `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst`
(
    `ID_`             varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `PROC_DEF_ID_`    varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `TASK_DEF_KEY_`   varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PROC_INST_ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `EXECUTION_ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `NAME_`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `DESCRIPTION_`    varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `OWNER_`          varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `ASSIGNEE_`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `START_TIME_`     datetime(0)                                       NOT NULL,
    `CLAIM_TIME_`     datetime(0)                                       NULL DEFAULT NULL,
    `END_TIME_`       datetime(0)                                       NULL DEFAULT NULL,
    `DURATION_`       bigint(20)                                        NULL DEFAULT NULL,
    `DELETE_REASON_`  varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `PRIORITY_`       int(11)                                           NULL DEFAULT NULL,
    `DUE_DATE_`       datetime(0)                                       NULL DEFAULT NULL,
    `FORM_KEY_`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `CATEGORY_`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `TENANT_ID_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT '',
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst`
(
    `ID_`                varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `PROC_INST_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `EXECUTION_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `TASK_ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `NAME_`              varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `VAR_TYPE_`          varchar(100) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `REV_`               int(11)                                           NULL DEFAULT NULL,
    `BYTEARRAY_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `DOUBLE_`            double                                            NULL DEFAULT NULL,
    `LONG_`              bigint(20)                                        NULL DEFAULT NULL,
    `TEXT_`              varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TEXT2_`             varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `CREATE_TIME_`       datetime(0)                                       NULL DEFAULT NULL,
    `LAST_UPDATED_TIME_` datetime(0)                                       NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`) USING BTREE,
    INDEX `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`, `VAR_TYPE_`) USING BTREE,
    INDEX `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group`
(
    `ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `REV_`  int(11)                                          NULL DEFAULT NULL,
    `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info`
(
    `ID_`        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `REV_`       int(11)                                          NULL DEFAULT NULL,
    `USER_ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `TYPE_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `KEY_`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `VALUE_`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `PASSWORD_`  longblob                                         NULL,
    `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership`
(
    `USER_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `GROUP_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    PRIMARY KEY (`USER_ID_`, `GROUP_ID_`) USING BTREE,
    INDEX `ACT_FK_MEMB_GROUP` (`GROUP_ID_`) USING BTREE,
    CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user`
(
    `ID_`         varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `REV_`        int(11)                                          NULL DEFAULT NULL,
    `FIRST_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `LAST_`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `EMAIL_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `PWD_`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `PICTURE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE `act_procdef_info`
(
    `ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `PROC_DEF_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `REV_`          int(11)                                         NULL DEFAULT NULL,
    `INFO_JSON_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    UNIQUE INDEX `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
    INDEX `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
    INDEX `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`) USING BTREE,
    CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment`
(
    `ID_`          varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `NAME_`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `CATEGORY_`    varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TENANT_ID_`   varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
    `DEPLOY_TIME_` timestamp(0)                                     NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model`
(
    `ID_`                           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `REV_`                          int(11)                                           NULL DEFAULT NULL,
    `NAME_`                         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `KEY_`                          varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `CATEGORY_`                     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `CREATE_TIME_`                  timestamp(0)                                      NULL DEFAULT NULL,
    `LAST_UPDATE_TIME_`             timestamp(0)                                      NULL DEFAULT NULL,
    `VERSION_`                      int(11)                                           NULL DEFAULT NULL,
    `META_INFO_`                    varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `DEPLOYMENT_ID_`                varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `EDITOR_SOURCE_VALUE_ID_`       varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `TENANT_ID_`                    varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT '',
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`) USING BTREE,
    INDEX `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) USING BTREE,
    INDEX `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`) USING BTREE,
    CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef`
(
    `ID_`                     varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `REV_`                    int(11)                                           NULL DEFAULT NULL,
    `CATEGORY_`               varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `NAME_`                   varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `KEY_`                    varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `VERSION_`                int(11)                                           NOT NULL,
    `DEPLOYMENT_ID_`          varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `RESOURCE_NAME_`          varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `DGRM_RESOURCE_NAME_`     varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `DESCRIPTION_`            varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `HAS_START_FORM_KEY_`     tinyint(4)                                        NULL DEFAULT NULL,
    `HAS_GRAPHICAL_NOTATION_` tinyint(4)                                        NULL DEFAULT NULL,
    `SUSPENSION_STATE_`       int(11)                                           NULL DEFAULT NULL,
    `TENANT_ID_`              varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT '',
    PRIMARY KEY (`ID_`) USING BTREE,
    UNIQUE INDEX `ACT_UNIQ_PROCDEF` (`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr`
(
    `ID_`            varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `REV_`           int(11)                                          NULL     DEFAULT NULL,
    `EVENT_TYPE_`    varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `EVENT_NAME_`    varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL,
    `EXECUTION_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `PROC_INST_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `ACTIVITY_ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `CONFIGURATION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL,
    `CREATED_`       timestamp(0)                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `PROC_DEF_ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `TENANT_ID_`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT '',
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`) USING BTREE,
    INDEX `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`) USING BTREE,
    CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution`
(
    `ID_`               varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `REV_`              int(11)                                          NULL DEFAULT NULL,
    `PROC_INST_ID_`     varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `BUSINESS_KEY_`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `PARENT_ID_`        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PROC_DEF_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `SUPER_EXEC_`       varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `ACT_ID_`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `IS_ACTIVE_`        tinyint(4)                                       NULL DEFAULT NULL,
    `IS_CONCURRENT_`    tinyint(4)                                       NULL DEFAULT NULL,
    `IS_SCOPE_`         tinyint(4)                                       NULL DEFAULT NULL,
    `IS_EVENT_SCOPE_`   tinyint(4)                                       NULL DEFAULT NULL,
    `SUSPENSION_STATE_` int(11)                                          NULL DEFAULT NULL,
    `CACHED_ENT_STATE_` int(11)                                          NULL DEFAULT NULL,
    `TENANT_ID_`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
    `NAME_`             varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `LOCK_TIME_`        timestamp(0)                                     NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`) USING BTREE,
    INDEX `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`) USING BTREE,
    INDEX `ACT_FK_EXE_PARENT` (`PARENT_ID_`) USING BTREE,
    INDEX `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`) USING BTREE,
    INDEX `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
    CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink`
(
    `ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `REV_`          int(11)                                          NULL DEFAULT NULL,
    `GROUP_ID_`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TYPE_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `USER_ID_`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TASK_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PROC_DEF_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`) USING BTREE,
    INDEX `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`) USING BTREE,
    INDEX `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`) USING BTREE,
    INDEX `ACT_FK_TSKASS_TASK` (`TASK_ID_`) USING BTREE,
    INDEX `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`) USING BTREE,
    CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job`
(
    `ID_`                  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `REV_`                 int(11)                                           NULL DEFAULT NULL,
    `TYPE_`                varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `LOCK_EXP_TIME_`       timestamp(0)                                      NULL DEFAULT NULL,
    `LOCK_OWNER_`          varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `EXCLUSIVE_`           tinyint(1)                                        NULL DEFAULT NULL,
    `EXECUTION_ID_`        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PROC_DEF_ID_`         varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `RETRIES_`             int(11)                                           NULL DEFAULT NULL,
    `EXCEPTION_STACK_ID_`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `EXCEPTION_MSG_`       varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `DUEDATE_`             timestamp(0)                                      NULL DEFAULT NULL,
    `REPEAT_`              varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `HANDLER_TYPE_`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `HANDLER_CFG_`         varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TENANT_ID_`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT '',
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`) USING BTREE,
    CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task`
(
    `ID_`               varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `REV_`              int(11)                                           NULL DEFAULT NULL,
    `EXECUTION_ID_`     varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PROC_INST_ID_`     varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PROC_DEF_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `NAME_`             varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `PARENT_TASK_ID_`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `DESCRIPTION_`      varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TASK_DEF_KEY_`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `OWNER_`            varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `ASSIGNEE_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `DELEGATION_`       varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PRIORITY_`         int(11)                                           NULL DEFAULT NULL,
    `CREATE_TIME_`      timestamp(0)                                      NULL DEFAULT NULL,
    `DUE_DATE_`         datetime(0)                                       NULL DEFAULT NULL,
    `CATEGORY_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    `SUSPENSION_STATE_` int(11)                                           NULL DEFAULT NULL,
    `TENANT_ID_`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT '',
    `FORM_KEY_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`) USING BTREE,
    INDEX `ACT_FK_TASK_EXE` (`EXECUTION_ID_`) USING BTREE,
    INDEX `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`) USING BTREE,
    INDEX `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
    CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable`
(
    `ID_`           varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NOT NULL,
    `REV_`          int(11)                                           NULL DEFAULT NULL,
    `TYPE_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `NAME_`         varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL,
    `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `TASK_ID_`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL,
    `DOUBLE_`       double                                            NULL DEFAULT NULL,
    `LONG_`         bigint(20)                                        NULL DEFAULT NULL,
    `TEXT_`         varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `TEXT2_`        varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    PRIMARY KEY (`ID_`) USING BTREE,
    INDEX `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`) USING BTREE,
    INDEX `ACT_FK_VAR_EXE` (`EXECUTION_ID_`) USING BTREE,
    INDEX `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`) USING BTREE,
    INDEX `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`) USING BTREE,
    CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog_content
-- ----------------------------
DROP TABLE IF EXISTS `blog_content`;
CREATE TABLE `blog_content`
(
    `cid`           bigint(20)                                              NOT NULL AUTO_INCREMENT,
    `title`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
    `slug`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `created`       bigint(20)                                              NULL DEFAULT NULL COMMENT '创建人id',
    `modified`      bigint(20)                                              NULL DEFAULT NULL COMMENT '最近修改人id',
    `content`       text CHARACTER SET utf8 COLLATE utf8_general_ci         NULL COMMENT '内容',
    `type`          varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '类型',
    `tags`          varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
    `categories`    varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类',
    `hits`          int(5)                                                  NULL DEFAULT NULL,
    `comments_num`  int(5)                                                  NULL DEFAULT 0 COMMENT '评论数量',
    `allow_comment` int(1)                                                  NULL DEFAULT 0 COMMENT '开启评论',
    `allow_ping`    int(1)                                                  NULL DEFAULT 0 COMMENT '允许ping',
    `allow_feed`    int(1)                                                  NULL DEFAULT 0 COMMENT '允许反馈',
    `status`        int(1)                                                  NULL DEFAULT NULL COMMENT '状态',
    `author`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
    `gtm_create`    datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间',
    `gtm_modified`  datetime(0)                                             NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 122
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '文章内容'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mytest
-- ----------------------------
DROP TABLE IF EXISTS `mytest`;
CREATE TABLE `mytest`
(
    `cid`        int(11)                                                     NOT NULL COMMENT '主键',
    `type`       varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '类型',
    `title`      varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '标题',
    `content`    varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '内容',
    `status`     int(255)                                                    NULL DEFAULT NULL COMMENT '状态值',
    `createBy`   varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '创建人',
    `createDate` datetime(0)                                                 NULL DEFAULT NULL COMMENT '创建时间',
    `remarks`    varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = latin1
  COLLATE = latin1_swedish_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_notify
-- ----------------------------
DROP TABLE IF EXISTS `oa_notify`;
CREATE TABLE `oa_notify`
(
    `id`          bigint(20)                                        NOT NULL AUTO_INCREMENT COMMENT '编号',
    `type`        char(1) CHARACTER SET utf8 COLLATE utf8_bin       NULL DEFAULT NULL COMMENT '类型',
    `title`       varchar(200) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL COMMENT '标题',
    `content`     varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '内容',
    `files`       varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '附件',
    `status`      char(1) CHARACTER SET utf8 COLLATE utf8_bin       NULL DEFAULT NULL COMMENT '状态',
    `create_by`   bigint(20)                                        NULL DEFAULT NULL COMMENT '创建者',
    `create_date` datetime(0)                                       NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8 COLLATE utf8_bin   NULL DEFAULT NULL COMMENT '更新者',
    `update_date` datetime(0)                                       NULL DEFAULT NULL COMMENT '更新时间',
    `remarks`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL COMMENT '备注信息',
    `del_flag`    char(1) CHARACTER SET utf8 COLLATE utf8_bin       NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `oa_notify_del_flag` (`del_flag`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 46
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '通知通告'
  ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for oa_notify_record
-- ----------------------------
DROP TABLE IF EXISTS `oa_notify_record`;
CREATE TABLE `oa_notify_record`
(
    `id`        bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
    `notify_id` bigint(20) NULL DEFAULT NULL COMMENT '通知通告ID',
    `user_id`   bigint(20) NULL DEFAULT NULL COMMENT '接受人',
    `is_read`   tinyint(1) NULL DEFAULT 0 COMMENT '阅读标记',
    `read_date` date       NULL DEFAULT NULL COMMENT '阅读时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `oa_notify_record_notify_id` (`notify_id`) USING BTREE,
    INDEX `oa_notify_record_user_id` (`user_id`) USING BTREE,
    INDEX `oa_notify_record_read_flag` (`is_read`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 27
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '通知通告发送记录'
  ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary`
(
    `id`             varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL COMMENT '编号',
    `PROC_INS_ID`    varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT '流程实例ID',
    `USER_ID`        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT '变动用户',
    `OFFICE_ID`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT '归属部门',
    `POST`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '岗位',
    `AGE`            char(1) CHARACTER SET utf8 COLLATE utf8_bin      NULL     DEFAULT NULL COMMENT '性别',
    `EDU`            varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '学历',
    `CONTENT`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '调整原因',
    `OLDA`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '现行标准 薪酬档级',
    `OLDB`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '现行标准 月工资额',
    `OLDC`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '现行标准 年薪总额',
    `NEWA`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '调整后标准 薪酬档级',
    `NEWB`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '调整后标准 月工资额',
    `NEWC`           varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '调整后标准 年薪总额',
    `ADD_NUM`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '月增资',
    `EXE_DATE`       varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '执行时间',
    `HR_TEXT`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '人力资源部门意见',
    `LEAD_TEXT`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '分管领导意见',
    `MAIN_LEAD_TEXT` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '集团主要领导意见',
    `create_by`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL COMMENT '创建者',
    `create_date`    datetime(0)                                      NOT NULL COMMENT '创建时间',
    `update_by`      varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL COMMENT '更新者',
    `update_date`    datetime(0)                                      NOT NULL COMMENT '更新时间',
    `remarks`        varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT '备注信息',
    `del_flag`       char(1) CHARACTER SET utf8 COLLATE utf8_bin      NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `OA_TEST_AUDIT_del_flag` (`del_flag`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '审批流程测试表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`
(
    `dept_id`   bigint(20)                                             NOT NULL AUTO_INCREMENT,
    `parent_id` bigint(20)                                             NULL DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
    `name`      varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
    `order_num` int(11)                                                NULL DEFAULT NULL COMMENT '排序',
    `del_flag`  tinyint(4)                                             NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
    PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '部门管理'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`
(
    `id`          bigint(64)                                       NOT NULL AUTO_INCREMENT COMMENT '编号',
    `name`        varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标签名',
    `value`       varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据值',
    `type`        varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类型',
    `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
    `sort`        decimal(10, 0)                                   NULL DEFAULT NULL COMMENT '排序（升序）',
    `parent_id`   bigint(64)                                       NULL DEFAULT 0 COMMENT '父级编号',
    `create_by`   int(64)                                          NULL DEFAULT NULL COMMENT '创建者',
    `create_date` datetime(0)                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   bigint(64)                                       NULL DEFAULT NULL COMMENT '更新者',
    `update_date` datetime(0)                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remarks`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
    `del_flag`    char(1) CHARACTER SET utf8 COLLATE utf8_bin      NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `sys_dict_value` (`value`) USING BTREE,
    INDEX `sys_dict_label` (`name`) USING BTREE,
    INDEX `sys_dict_del_flag` (`del_flag`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 125
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '字典表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`
(
    `id`          bigint(20)                                              NOT NULL AUTO_INCREMENT,
    `type`        int(11)                                                 NULL DEFAULT NULL COMMENT '文件类型',
    `url`         varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
    `create_date` datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 140
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '文件上传'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`
(
    `id`         bigint(20)                                               NOT NULL AUTO_INCREMENT,
    `user_id`    bigint(20)                                               NULL DEFAULT NULL COMMENT '用户id',
    `username`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL DEFAULT NULL COMMENT '用户名',
    `operation`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL DEFAULT NULL COMMENT '用户操作',
    `time`       int(11)                                                  NULL DEFAULT NULL COMMENT '响应时间',
    `method`     varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '请求方法',
    `params`     varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
    `ip`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL DEFAULT NULL COMMENT 'IP地址',
    `gmt_create` datetime(0)                                              NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 534
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '系统日志'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
    `menu_id`      bigint(20)                                              NOT NULL AUTO_INCREMENT,
    `parent_id`    bigint(20)                                              NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
    `name`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '菜单名称',
    `url`          varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
    `perms`        varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
    `type`         int(11)                                                 NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
    `icon`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '菜单图标',
    `order_num`    int(11)                                                 NULL DEFAULT NULL COMMENT '排序',
    `gmt_create`   datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间',
    `gmt_modified` datetime(0)                                             NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 104
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '菜单管理'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `role_id`        bigint(20)                                              NOT NULL AUTO_INCREMENT,
    `role_name`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
    `role_sign`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色标识',
    `remark`         varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    `user_id_create` bigint(255)                                             NULL DEFAULT NULL COMMENT '创建用户id',
    `gmt_create`     datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间',
    `gmt_modified`   datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '角色'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`
(
    `id`      bigint(20) NOT NULL AUTO_INCREMENT,
    `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
    `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3412
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task`
(
    `id`              bigint(20)                                              NOT NULL AUTO_INCREMENT,
    `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
    `method_name`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务调用的方法名',
    `is_concurrent`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务是否有状态',
    `description`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述',
    `update_by`       varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '更新者',
    `bean_class`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
    `create_date`     datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间',
    `job_status`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务状态',
    `job_group`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务分组',
    `update_date`     datetime(0)                                             NULL DEFAULT NULL COMMENT '更新时间',
    `create_by`       varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '创建者',
    `spring_bean`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Spring bean',
    `job_name`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM
  AUTO_INCREMENT = 8
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `user_id`        bigint(20)                                              NOT NULL AUTO_INCREMENT,
    `username`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '用户名',
    `name`           varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `password`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '密码',
    `dept_id`        bigint(20)                                              NULL DEFAULT NULL,
    `email`          varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
    `mobile`         varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
    `status`         tinyint(255)                                            NULL DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
    `user_id_create` bigint(255)                                             NULL DEFAULT NULL COMMENT '创建用户id',
    `gmt_create`     datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间',
    `gmt_modified`   datetime(0)                                             NULL DEFAULT NULL COMMENT '修改时间',
    `sex`            bigint(32)                                              NULL DEFAULT NULL COMMENT '性别',
    `birth`          datetime(0)                                             NULL DEFAULT NULL COMMENT '出身日期',
    `pic_id`         bigint(32)                                              NULL DEFAULT NULL,
    `live_address`   varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现居住地',
    `hobby`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爱好',
    `province`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
    `city`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在城市',
    `district`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在地区',
    PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 138
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_plus
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_plus`;
CREATE TABLE `sys_user_plus`
(
    `id`      bigint(20) NOT NULL AUTO_INCREMENT,
    `user_id` bigint(20) NOT NULL,
    `payment` double     NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`
(
    `id`      bigint(20) NOT NULL AUTO_INCREMENT,
    `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
    `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 135
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系'
  ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for system_sequence
-- ----------------------------
DROP TABLE IF EXISTS `system_sequence`;
CREATE TABLE `system_sequence`
(
    `NAME`          varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `CURRENT_VALUE` int(11)                                                NOT NULL DEFAULT 0,
    `INCREMENT`     int(11)                                                NOT NULL DEFAULT 1,
    PRIMARY KEY (`NAME`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Function structure for currval
-- ----------------------------
DROP FUNCTION IF EXISTS `currval`;
delimiter ;;
CREATE FUNCTION `currval`(seq_name VARCHAR(50))
    RETURNS int(11)
BEGIN
    DECLARE VALUE INTEGER;
    SET VALUE = 0;
    SELECT current_value
    INTO VALUE
    FROM system_sequence
    WHERE NAME = seq_name;
    RETURN VALUE;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for sys_seq
-- ----------------------------
DROP FUNCTION IF EXISTS `sys_seq`;
delimiter ;;
CREATE FUNCTION `sys_seq`(seq_name varchar(50))
    RETURNS int(11)
BEGIN
    UPDATE system_sequence
    SET CURRENT_VALUE = CURRENT_VALUE + INCREMENT
    where name = seq_name;
    return currval(seq_name);
END
;;
delimiter ;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`
(
    `id`                int(8)    NOT NULL,
    `sfzh`              varchar(20)    DEFAULT NULL COMMENT '身份证号码',
    `Initial_training`  varchar(3)     DEFAULT NULL,
    `payment_date`      varchar(20)    DEFAULT NULL,
    `payment_type`      varchar(3)     DEFAULT NULL,
    `payment_mode`      varchar(3)     DEFAULT NULL,
    `payment_account`   float          DEFAULT NULL,
    `book`              varchar(2)     DEFAULT NULL,
    `clothes`           varchar(2)     DEFAULT NULL,
    `schedule_date`     varchar(20)    DEFAULT NULL,
    `schedule_campus`   varchar(255)   DEFAULT NULL,
    `other_fees`        float          DEFAULT NULL,
    `enrollment_course` varchar(255)   DEFAULT NULL,
    `insert_time`       timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `insert_operator`   int(8)         DEFAULT NULL,
    `update_time`       timestamp NULL DEFAULT NULL,
    `update_operator`   int(8)         DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for t_member_baseinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_member_baseinfo`;
CREATE TABLE `t_member_baseinfo`
(
    `id`                 int(4)    NOT NULL,
    `name`               varchar(255)   DEFAULT NULL COMMENT '姓名',
    `type`               varchar(3)     DEFAULT NULL COMMENT '客户类型',
    `consultants`        varchar(255)   DEFAULT NULL COMMENT '所属顾问',
    `wechat`             varchar(255)   DEFAULT NULL COMMENT '微信号',
    `deptId`             varchar(255)   DEFAULT NULL COMMENT '门店Id',
    `phone`              varchar(255)   DEFAULT NULL COMMENT '联系电话',
    `consulting_course`  varchar(255)   DEFAULT NULL COMMENT '咨询课程',
    `accommodation`      varchar(3)     DEFAULT NULL COMMENT '是否住宿',
    `advisory_date`      varchar(40)    DEFAULT NULL COMMENT '咨询日期',
    `address`            varchar(255)   DEFAULT NULL COMMENT '所在省市',
    `customer_service`   varchar(255)   DEFAULT NULL COMMENT '所属客服',
    `sfzh`               varchar(255)   DEFAULT NULL COMMENT '身份证号码',
    `data_source`        varchar(3)     DEFAULT NULL COMMENT '数据来源',
    `certificate_number` varchar(255)   DEFAULT NULL COMMENT '证书编号',
    `bz`                 varchar(255)   DEFAULT NULL COMMENT '备注',
    `insert_time`        timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '插入时间',
    `insert_operator`    int(4)         DEFAULT NULL COMMENT '插入操作人id',
    `update_time`        timestamp NULL DEFAULT NULL COMMENT '更新时间',
    `update_operator`    int(4)         DEFAULT NULL COMMENT '更新操作人id',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='会员信息表';

-- ----------------------------
-- Table structure for t_custom_follow_plan
-- ----------------------------
DROP TABLE IF EXISTS `t_custom_follow_plan`;
CREATE TABLE `t_custom_follow_plan`
(
    `id`              int(11)   NOT NULL,
    `custom_id`       int(11)        DEFAULT NULL COMMENT '客户id',
    `talk_date`       varchar(40)    DEFAULT NULL COMMENT '沟通时间',
    `record_or_plan`  varchar(255)   DEFAULT NULL COMMENT '沟通记录或计划',
    `insert_time`     timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '插入时间',
    `insert_operator` int(11)        DEFAULT NULL COMMENT '插入操作人',
    `update_time`     timestamp NULL DEFAULT NULL COMMENT '更新时间',
    `update_operator` int(11)        DEFAULT NULL COMMENT '更新操作人',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for t_work_plan
-- ----------------------------
DROP TABLE IF EXISTS `t_work_plan`;
CREATE TABLE `t_work_plan`
(
    `ID`                 varchar(10)   NOT NULL,
    `content`            varchar(1000) NOT NULL COMMENT '交办事项',
    `dept_Id`            varchar(100)  NOT NULL COMMENT '部门Id',
    `dept_Name`          varchar(100)  NOT NULL COMMENT '部门名称',
    `start_Time`         varchar(23)   NOT NULL,
    `end_Time`           varchar(23)   NOT NULL COMMENT '结束时间',
    `schedule`           varchar(255)  DEFAULT NULL COMMENT '完成进度',
    `person_Liable_Name` varchar(100)  NOT NULL COMMENT '责任人名称',
    `person_Liable_id`   varchar(100)  NOT NULL COMMENT '责任人ID',
    `helper_name`        varchar(100)  DEFAULT NULL COMMENT '协助人名称',
    `helper_id`          varchar(100)  DEFAULT NULL COMMENT '协助人ID',
    `remarks`            varchar(1000) DEFAULT NULL COMMENT '备注',
    `remind_Type`        varchar(20)   DEFAULT NULL COMMENT '提醒方式，任务开始后，每天提醒？还是如何提醒',
    `state`              varchar(2)    DEFAULT '0' COMMENT '状态：0：草稿，1：发布，2：撤销，3：作废',
    `Level`              varchar(2)    DEFAULT NULL COMMENT '级别，\r\n1：已完成绿底、\r\n2：紧急/重要红字、\r\n3：未完成/需修改黄底、\r\n4：蓝底为新增/更新',
    `Task_Annex`         varchar(500)  DEFAULT NULL COMMENT '任务附件名，使用“??”（两个英文的问号）隔开',
    `Task_Annex_path`    varchar(500)  DEFAULT NULL COMMENT '任务附件名，使用“??”（两个英文的问号）隔开,\r\n使用相对路径\r\n~~/a/b/c.txt',
    `execute_Annex`      varchar(500)  DEFAULT NULL COMMENT '执行情况附件名，使用“??”（两个英文的问号）隔开',
    `execute_Annex_path` varchar(500)  DEFAULT NULL COMMENT '执行情况附件名，使用“??”（两个英文的问号）隔开,',
    `createTime`         varchar(50)   DEFAULT NULL,
    `createAuthor`       int(50)       DEFAULT NULL,
    `lastModifyTime`     varchar(50)   DEFAULT NULL,
    `lastModifyAuthor`   int(50)       DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='工作计划';

-- ----------------------------
-- Table structure for t_work_plan_follow_up
-- ----------------------------
DROP TABLE IF EXISTS `t_work_plan_follow_up`;
CREATE TABLE `t_work_plan_follow_up`
(
    `ID`                 int(11)       NOT NULL,
    `WORK_PLAN_ID`       varchar(255)  NOT NULL COMMENT '工作计划ID',
    `FOLLOW_UP`          varchar(1000) NOT NULL COMMENT '根据情况内容',
    `Task_Annex`         varchar(500) DEFAULT NULL COMMENT '任务附件名，使用“??”（两个英文的问号）隔开',
    `Task_Annex_path`    varchar(500) DEFAULT NULL COMMENT '任务附件名，使用“??”（两个英文的问号）隔开,\r\n使用相对路径\r\n~~/a/b/c.txt',
    `execute_Annex`      varchar(500) DEFAULT NULL COMMENT '执行情况附件名，使用“??”（两个英文的问号）隔开',
    `execute_Annex_path` varchar(500) DEFAULT NULL COMMENT '执行情况附件名，使用“??”（两个英文的问号）隔开,',
    `create_Time`        varchar(23)  DEFAULT NULL COMMENT '创建时间',
    `create_Author`      int(11)      DEFAULT NULL COMMENT '创建人ID',
    `last_Modify_Time`   varchar(23)  DEFAULT NULL COMMENT '最后更改时间',
    `last_Modify_Author` int(11)      DEFAULT NULL COMMENT '最后更改人ID'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for t_employee_info
-- ----------------------------
DROP TABLE IF EXISTS `t_employee_info`;
CREATE TABLE `t_employee_info`
(
    `phone_Number`                  varchar(50) NOT NULL COMMENT '手机号',
    `card_Id`                       varchar(18) NOT NULL COMMENT '身份证号码',
    `employee_Type`                 varchar(5) NOT NULL COMMENT '员工类型',
    `nation`                       varchar(255) DEFAULT NULL COMMENT '民族',
    `hu_Kou_Type`                    varchar(16)  DEFAULT NULL COMMENT '户口类型',
    `marital_Status`                varchar(5)   DEFAULT NULL COMMENT '婚姻状况',
    `emergency_Contact`             varchar(50)  DEFAULT NULL COMMENT '紧急联系人',
    `emergency_Contact_Phone`        varchar(50)  DEFAULT NULL COMMENT '紧急联系人号码',
    `highest_Degree`                varchar(255) DEFAULT NULL COMMENT '最高学历',
    `graduate_School`               varchar(255) DEFAULT NULL COMMENT '毕业院校',
    `professional`                 varchar(255) DEFAULT NULL COMMENT '专业',
    `graduation_Time`                varchar(50)  DEFAULT NULL COMMENT '毕业时间',
    `nature_Academic_Qualifications` varchar(255) DEFAULT NULL COMMENT '学历性质',
    `join_Work_Time`                 varchar(50)  DEFAULT NULL COMMENT '参加工作时间',
    `enter_Company_Time`             varchar(50)  DEFAULT NULL COMMENT '入司时间',
    `work_Post`                   varchar(255) DEFAULT NULL COMMENT '工作岗位',
    `job_Position`                  varchar(255) DEFAULT NULL COMMENT '职位',
    `duration_Emp_Time`              varchar(50)  DEFAULT NULL COMMENT '任职时间',
    `political_Landscape`           varchar(50)  DEFAULT NULL COMMENT '政治面貌'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for t_stock
-- ----------------------------
DROP TABLE IF EXISTS `t_stock`;
CREATE TABLE `t_stock`
(
    `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
    `stock`    int(11) DEFAULT NULL COMMENT '库存量'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods`
(
    `id`        int(11) NOT NULL,
    `dept_id`   varchar(255) DEFAULT NULL COMMENT '门店id',
    `title`     varchar(255) DEFAULT NULL COMMENT '标题',
    `sub_title` varchar(255) DEFAULT NULL COMMENT '副标题',
    `price`     int(11)      DEFAULT NULL COMMENT '价格，存入时x100',
    `detail`    text COMMENT '商品详情',
    `image`     varchar(255) DEFAULT NULL COMMENT '图片url',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for t_campaign
-- ----------------------------
DROP TABLE IF EXISTS `t_campaign`;
CREATE TABLE `t_campaign`
(
    `id`                 int(11) NOT NULL,
    `activity_name`      varchar(255) DEFAULT NULL COMMENT '活动名称',
    `activity_content`   varchar(255) DEFAULT NULL COMMENT '活动内容',
    `activity_addr`      varchar(255) DEFAULT NULL COMMENT '活动场地',
    `activity_date`      varchar(40)  DEFAULT NULL COMMENT '活动日期',
    `activity_enrollees` varchar(255) DEFAULT NULL COMMENT '报名人员',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course`
(
    `id`            int(11) NOT NULL,
    `dept_id`       varchar(255) DEFAULT NULL COMMENT '门店id',
    `course_name`   varchar(255) DEFAULT NULL COMMENT '课程名称',
    `price`         int(11)      DEFAULT NULL COMMENT '单价',
    `course_detail` varchar(255) DEFAULT NULL COMMENT '课程描述',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for t_course_packages
-- ----------------------------
DROP TABLE IF EXISTS `t_course_packages`;
CREATE TABLE `t_course_packages`
(
    `id`           int(11) NOT NULL,
    `dept_id`      int(11)      DEFAULT NULL COMMENT '门店id',
    `package_name` varchar(255) DEFAULT NULL COMMENT '套餐名称',
    `subTitle`     varchar(255) DEFAULT NULL COMMENT '副标题',
    `course_ids`   varchar(255) DEFAULT NULL COMMENT '课程Ids',
    `goods_ids`    varchar(255) DEFAULT NULL COMMENT '商品Ids',
    `total_price`  float(10, 2) DEFAULT NULL COMMENT '套餐价格',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


-- ----------------------------
-- Table structure for t_somatometric_record
-- ----------------------------
DROP TABLE IF EXISTS `t_somatometric_record`;
CREATE TABLE `t_somatometric_record`
(
    `id`                      int(11) NOT NULL,
    `member_id`               int(11)      DEFAULT NULL COMMENT '会员id',
    ` measure_time`           varchar(40)  DEFAULT NULL COMMENT '测量时间',
    `weight`                  float(3, 2)  DEFAULT NULL COMMENT '体重',
    `body_fat_rate`           float(6, 2)  DEFAULT NULL COMMENT '体脂率',
    `moisture_datio`          float(6, 2)  DEFAULT NULL COMMENT '水分率',
    `muscle_rate`             float(6, 2)  DEFAULT NULL COMMENT '肌肉率',
    `body_shape_judgment`     varchar(255) DEFAULT NULL COMMENT '体型判断',
    `metabolic_age`           varchar(255) DEFAULT NULL COMMENT '代谢年龄',
    `bone_content`            float(6, 2)  DEFAULT NULL COMMENT '骨含量',
    `lactone_content`         float(6, 2)  DEFAULT NULL COMMENT '内脂含量',
    `somatometric_comparison` varchar(255) DEFAULT NULL COMMENT '体测对比',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
