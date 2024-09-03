CREATE TABLE IF NOT EXISTS `user_input_custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply_type` varchar(20) NOT NULL,
  `media_type` enum('fb','ig') NOT NULL DEFAULT 'fb',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `custom field` (`user_id`,`reply_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `user_input_custom_fields_assaign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` varchar(50) NOT NULL,
  `page_id` varchar(50) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value` text CHARACTER SET utf8mb4 NOT NULL,
  `assaign_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriber_id` (`subscriber_id`,`page_id`,`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `messenger_bot_subscriber_extra_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` varchar(50) NOT NULL,
  `page_id` varchar(50) NOT NULL,
  `input_flow_campaign_id` int(10) NOT NULL,
  `last_question_sent_id` int(10) NOT NULL,
  `last_question_sent_time` datetime NOT NULL,
  `email_quick_reply_button_id` varchar(30) NOT NULL,
  `phone_quick_reply_button_id` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriber_id` (`subscriber_id`,`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `instagram_reply_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auto_reply_campaign_name` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `reply_type` varchar(200) NOT NULL,
  `multiple_reply` enum('no','yes') NOT NULL,
  `nofilter_word_found_text` longtext NOT NULL,
  `auto_reply_text` longtext NOT NULL,
  `last_updated_at` datetime NOT NULL,
  `error_message` text NOT NULL,
  `hide_comment_after_comment_reply` enum('no','yes') NOT NULL,
  `is_delete_offensive` enum('hide','delete') NOT NULL,
  `offensive_words` longtext NOT NULL,
  `private_message_offensive_words` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_id` int(11) NOT NULL,
  `ig_username` varchar(200) NOT NULL,
  `trigger_matching_type` enum('exact','string') NOT NULL DEFAULT 'exact' COMMENT 'exact keyword or string match',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `visual_flow_builder_campaign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `unique_id` varchar(50) NOT NULL,
  `reference_name` text NOT NULL,
  `media_type` enum('fb','ig') NOT NULL DEFAULT 'fb',
  `json_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_system` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'system defined template or not',
  `action_type` enum('reply','UNSUBSCRIBE_QUICK_BOXER','RESUBSCRIBE_QUICK_BOXER','YES_START_CHAT_WITH_BOT','YES_START_CHAT_WITH_HUMAN','QUICK_REPLY_BIRTHDAY_REPLY_BOT','QUICK_REPLY_LOCATION_REPLY_BOT','QUICK_REPLY_PHONE_REPLY_BOT','QUICK_REPLY_EMAIL_REPLY_BOT','get-started','no match','STORY_MENTION','STORY_PRIVATE_REPLY','MESSAGE_UNSEND_PRIVATE_REPLY') NOT NULL DEFAULT 'reply',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `messenger_bot_subscribers_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_group_id` int(11) NOT NULL,
  `subscriber_table_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contact_group_id_2` (`contact_group_id`,`subscriber_table_id`),
  KEY `contact_group_id` (`contact_group_id`),
  KEY `subscriber_table_id` (`subscriber_table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `messenger_bot_message_sent_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` varchar(30) NOT NULL,
  `page_table_id` int(11) NOT NULL,
  `message_unique_id` varchar(100) NOT NULL,
  `message_type` enum('message','postback') NOT NULL DEFAULT 'message',
  `no_sent_click` int(12) NOT NULL,
  `error_count` int(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriber_id` (`subscriber_id`,`message_unique_id`,`page_table_id`),
  KEY `message_unique_id` (`message_unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `visual_flow_campaign_unique_ids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_table_id` int(11) NOT NULL,
  `visual_flow_campaign_id` int(11) NOT NULL,
  `element_unique_id` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_table_id` (`page_table_id`,`visual_flow_campaign_id`,`element_unique_id`),
  KEY `visual_flow_campaign_id` (`visual_flow_campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
