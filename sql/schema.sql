#
# Table structure for table EXT_groups
#

CREATE TABLE EXT_groups (
  group_id INT(11) NOT NULL AUTO_INCREMENT,
  group_name VARCHAR(255) NOT NULL DEFAULT '0',
  description VARCHAR(255) NOT NULL DEFAULT '0' ,
  has_admin_access TINYINT(1) NOT NULL DEFAULT '0',
  can_manage_accounts TINYINT(1) NOT NULL DEFAULT '0',
  can_change_settings TINYINT(1) NOT NULL DEFAULT '0',
  can_manage_cats TINYINT(1) NOT NULL DEFAULT '0',
  upl_need_approval TINYINT(1) NOT NULL DEFAULT '1',
  locked TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY  (group_id)
) ;
# ----------------------------------------------------

#
# Table structure for table EXT_users
#

CREATE TABLE EXT_users (
  user_id INT(11) NOT NULL AUTO_INCREMENT,
  username VARCHAR(30) NOT NULL DEFAULT '',
  PASSWORD VARCHAR(64) NOT NULL DEFAULT '',
  firstname VARCHAR(64) DEFAULT '',
  lastname VARCHAR(64) DEFAULT '',
  group_id INT(11) NOT NULL DEFAULT 2,
  lastvisit DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  email VARCHAR(255) NOT NULL DEFAULT '',
  user_regdate DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  user_lang VARCHAR(255) NOT NULL DEFAULT '',
  user_website VARCHAR(255) NOT NULL DEFAULT '',
  user_location VARCHAR(255) NOT NULL DEFAULT '',
  user_occupation VARCHAR(255) NOT NULL DEFAULT '',
  reg_key VARCHAR(64) DEFAULT NULL,
  user_status TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY  (user_id),
  UNIQUE KEY username (username)
) ;
# ----------------------------------------------------

#
# Table structure for table EXT_categories
#

CREATE TABLE EXT_categories (
  cat_id INT(11) NOT NULL AUTO_INCREMENT,
  cat_parent INT(11) NOT NULL DEFAULT '0',
  cat_name VARCHAR(150) NOT NULL DEFAULT '',
  description TEXT NOT NULL,
	color VARCHAR(10) DEFAULT '#000000',
	bgcolor VARCHAR(10) DEFAULT '#EEF0F0',
	OPTIONS TINYINT(4) DEFAULT '0',
	enabled TINYINT(4) DEFAULT '0',
  PRIMARY KEY  (cat_id),
  UNIQUE KEY cat_id (cat_id)
) ;
# ----------------------------------------------------

#
# Table structure for table EXT_events
#

CREATE TABLE EXT_events (
  id INT(11) NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL DEFAULT '',
  description TEXT NOT NULL,
  contact TEXT NOT NULL,
  url VARCHAR(100) NOT NULL DEFAULT '',
  email VARCHAR(120) NOT NULL DEFAULT '',
  picture VARCHAR(100) NOT NULL DEFAULT '',
  cat TINYINT(2) NOT NULL DEFAULT '0',
  DAY TINYINT(2) NOT NULL DEFAULT '0',
  MONTH SMALLINT(2) NOT NULL DEFAULT '0',
  YEAR SMALLINT(4) NOT NULL DEFAULT '0',
  approved TINYINT(1) NOT NULL DEFAULT '0',
  start_date DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  end_date DATETIME DEFAULT '0000-00-00 00:00:00',
  recur_type VARCHAR(16) DEFAULT NULL,
  recur_val TINYINT(4) DEFAULT '0',
  recur_end_type TINYINT(1) UNSIGNED NOT NULL DEFAULT '0',
  recur_count TINYINT UNSIGNED NOT NULL DEFAULT '0',
  recur_until DATE DEFAULT '0000-00-00',
  PRIMARY KEY  (id),
  UNIQUE KEY id (id),
  KEY start_date (start_date)
) ;
# ----------------------------------------------------

#
# Table structure for table EXT_config
#

CREATE TABLE EXT_config (
  NAME VARCHAR(40) NOT NULL DEFAULT '',
  VALUE VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY  (NAME)
) ;
# ----------------------------------------------------

#
# Table structure for table EXT_template
#

CREATE TABLE EXT_templates (
	template_id INT(11) NOT NULL AUTO_INCREMENT ,
	template_type VARCHAR(16) NOT NULL ,
  template_description VARCHAR(255) DEFAULT NULL,
	template_status TINYINT(1) DEFAULT '0' NOT NULL ,
	template_value TEXT DEFAULT NULL,
	last_access DATETIME DEFAULT '0000-00-00 00:00:00' NOT NULL ,
	PRIMARY KEY (template_id) ,
	INDEX (template_status) ,
	UNIQUE (template_type),
	FULLTEXT (template_value)
) ;
# ----------------------------------------------------

#
# Table structure for table EXT_template
#

CREATE TABLE EXT_plugins (
  plugin_id INT(11) NOT NULL AUTO_INCREMENT,
  plugin_name VARCHAR(64) NOT NULL,
  plugin_priority TINYINT(2) UNSIGNED NOT NULL DEFAULT '50',
  plugin_path VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY(plugin_id)
) ;
# ----------------------------------------------------
