CREATE TABLE `messenger_bot_broadcast_serial` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `broadcast_type` enum('Non Promo','24H Promo','OTN') NOT NULL DEFAULT 'Non Promo',
  `message_tag` varchar(255) NOT NULL DEFAULT 'NON_PROMOTIONAL_SUBSCRIPTION',
  `page_id` int(11) NOT NULL,
  `fb_page_id` varchar(200) NOT NULL,
  `page_name` varchar(200) NOT NULL,
  `label_ids` text NOT NULL,
  `excluded_label_ids` text NOT NULL,
  `label_names` text NOT NULL,
  `user_gender` varchar(20) NOT NULL,
  `user_time_zone` varchar(20) NOT NULL,
  `user_locale` varchar(50) NOT NULL,
  `template_type` enum('text','image','audio','video','file','quick reply','text with buttons','generic template','carousel','list','media') NOT NULL DEFAULT 'text',
  `message` mediumtext NOT NULL,
  `buttons` longtext NOT NULL,
  `images` longtext NOT NULL,
  `audio` varchar(255) NOT NULL,
  `video` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `campaign_name` varchar(200) NOT NULL,
  `postback_id` varchar(255) NOT NULL,
  `otn_postback_id` varchar(191) NOT NULL COMMENT 'otn_postback table id',
  `created_at` datetime NOT NULL,
  `schedule_type` enum('now','later') NOT NULL,
  `schedule_time` datetime NOT NULL,
  `timezone` varchar(100) NOT NULL,
  `error_message` text NOT NULL,
  `sent_count` int(11) NOT NULL,
  `posting_status` enum('0','1','2','3','4') DEFAULT NULL,
  `is_try_again` enum('0','1') NOT NULL DEFAULT '1',
  `last_try_error_count` int(11) NOT NULL,
  `total_thread` int(11) NOT NULL,
  `successfully_sent` int(11) NOT NULL,
  `successfully_delivered` int(11) NOT NULL,
  `successfully_opened` int(11) NOT NULL,
  `successfully_clicked` int(11) NOT NULL,
  `completed_at` datetime NOT NULL,
  `social_media` enum('fb','ig') NOT NULL DEFAULT 'fb'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_broadcast_serial_send`
--

CREATE TABLE `messenger_bot_broadcast_serial_send` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `subscribe_id` varchar(255) NOT NULL,
  `otn_token` varchar(255) NOT NULL,
  `subscriber_auto_id` int(11) NOT NULL,
  `subscriber_name` varchar(255) NOT NULL,
  `subscriber_lastname` varchar(200) NOT NULL,
  `sent_time` datetime NOT NULL,
  `delivered` enum('0','1') NOT NULL DEFAULT '0',
  `delivery_time` datetime NOT NULL,
  `opened` enum('0','1') NOT NULL DEFAULT '0',
  `open_time` datetime NOT NULL,
  `clicked` enum('0','1') NOT NULL DEFAULT '0',
  `click_ref` varchar(200) NOT NULL,
  `click_time` datetime NOT NULL,
  `processed` enum('0','1') NOT NULL DEFAULT '0',
  `error_message` tinytext NOT NULL,
  `message_sent_id` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_domain_whitelist`
--

CREATE TABLE `messenger_bot_domain_whitelist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `messenger_bot_user_info_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `domain` tinytext NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `messenger_bot_domain_whitelist`
--

INSERT INTO `messenger_bot_domain_whitelist` (`id`, `user_id`, `messenger_bot_user_info_id`, `page_id`, `domain`, `created_at`) VALUES
(3, 14, 0, 0, 'Dialogflow.com', '2024-08-27 02:13:51'),
(4, 15, 5, 9, 'https://dialogflow.cloud.google.com/#/agent/dialogflowv5-wtol/intents', '2024-08-27 08:16:23');

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_drip_campaign`
--

CREATE TABLE `messenger_bot_drip_campaign` (
  `id` int(11) NOT NULL,
  `campaign_name` varchar(250) NOT NULL,
  `page_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message_content` text NOT NULL,
  `message_content_hourly` text NOT NULL,
  `created_at` datetime NOT NULL,
  `last_sent_at` datetime NOT NULL,
  `drip_type` enum('default','messenger_bot_engagement_checkbox','messenger_bot_engagement_send_to_msg','messenger_bot_engagement_mme','messenger_bot_engagement_messenger_codes','messenger_bot_engagement_2way_chat_plugin','custom') NOT NULL DEFAULT 'default',
  `campaign_type` enum('messenger','email','sms') NOT NULL DEFAULT 'messenger',
  `engagement_table_id` int(11) NOT NULL,
  `between_start` varchar(50) NOT NULL DEFAULT '00:00',
  `between_end` varchar(50) NOT NULL DEFAULT '23:59',
  `timezone` varchar(250) NOT NULL,
  `message_tag` varchar(255) NOT NULL,
  `total_unsubscribed` int(11) NOT NULL,
  `last_unsubscribed_at` datetime NOT NULL,
  `external_sequence_sms_api_id` varchar(50) NOT NULL,
  `external_sequence_email_api_id` varchar(50) NOT NULL,
  `media_type` enum('fb','ig') NOT NULL DEFAULT 'fb',
  `visual_flow_campaign_id` int(11) NOT NULL,
  `visual_flow_sequence_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_drip_campaign_assign`
--

CREATE TABLE `messenger_bot_drip_campaign_assign` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_table_id` int(11) NOT NULL,
  `subscribe_id` varchar(30) NOT NULL COMMENT 'fb id',
  `messenger_bot_drip_campaign_id` int(11) NOT NULL,
  `drip_type` enum('default','messenger_bot_engagement_checkbox','messenger_bot_engagement_send_to_msg','messenger_bot_engagement_mme','messenger_bot_engagement_messenger_codes','messenger_bot_engagement_2way_chat_plugin','custom') NOT NULL DEFAULT 'default',
  `messenger_bot_drip_last_completed_day` int(11) NOT NULL,
  `messenger_bot_drip_last_completed_hour` float NOT NULL,
  `messenger_bot_drip_is_toatally_complete` enum('0','1') NOT NULL DEFAULT '0',
  `messenger_bot_drip_is_toatally_complete_hourly` enum('0','1') NOT NULL DEFAULT '0',
  `messenger_bot_drip_last_sent_at` datetime NOT NULL,
  `messenger_bot_drip_initial_date` datetime NOT NULL,
  `last_processing_started_at` datetime NOT NULL,
  `last_processing_started_at_hourly` datetime NOT NULL,
  `messenger_bot_drip_processing_status` enum('0','1') NOT NULL DEFAULT '0',
  `messenger_bot_drip_processing_status_hourly` enum('0','1') NOT NULL DEFAULT '0',
  `is_unsubscribed` enum('0','1') NOT NULL DEFAULT '0',
  `unsubscribed_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_drip_report`
--

CREATE TABLE `messenger_bot_drip_report` (
  `id` int(11) NOT NULL,
  `messenger_bot_drip_campaign_id` int(11) NOT NULL,
  `messenger_bot_subscriber_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subscribe_id` varchar(250) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `last_completed_day` int(11) NOT NULL,
  `last_completed_hour` int(11) NOT NULL,
  `is_sent` enum('0','1') NOT NULL DEFAULT '1',
  `is_opened` enum('0','1') NOT NULL DEFAULT '0',
  `is_delivered` enum('0','1') NOT NULL DEFAULT '0',
  `sent_at` datetime NOT NULL,
  `delivered_at` datetime NOT NULL,
  `opened_at` datetime NOT NULL,
  `sent_response` tinytext NOT NULL,
  `delivered_response` tinytext NOT NULL,
  `last_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_engagement_checkbox`
--

CREATE TABLE `messenger_bot_engagement_checkbox` (
  `id` int(11) NOT NULL,
  `domain_code` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL COMMENT 'auto id',
  `domain_name` varchar(255) NOT NULL,
  `btn_size` enum('small','medium','large','xlarge') NOT NULL DEFAULT 'medium',
  `skin` enum('light','dark') NOT NULL DEFAULT 'light' COMMENT 'light=black, dark=white',
  `center_align` enum('true','false') NOT NULL DEFAULT 'true',
  `button_click_success_message` tinytext NOT NULL,
  `validation_error` tinytext NOT NULL,
  `label_ids` varchar(250) NOT NULL COMMENT 'comma seperated,messenger_bot_broadcast_contact_group.id',
  `reference` varchar(250) NOT NULL,
  `template_id` int(11) NOT NULL COMMENT 'messenger_bot_postback.id',
  `language` varchar(200) NOT NULL DEFAULT 'en_US',
  `created_at` datetime NOT NULL,
  `redirect` enum('0','1') NOT NULL DEFAULT '0',
  `add_button_with_message` enum('0','1') NOT NULL DEFAULT '0',
  `button_with_message_content` tinytext NOT NULL COMMENT 'json',
  `success_redirect_url` tinytext NOT NULL,
  `for_woocommerce` enum('0','1') NOT NULL DEFAULT '0',
  `visual_flow_campaign_id` int(11) NOT NULL,
  `visual_flow_type` enum('flow','general') NOT NULL DEFAULT 'general'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_engagement_checkbox_reply`
--

CREATE TABLE `messenger_bot_engagement_checkbox_reply` (
  `id` int(11) NOT NULL,
  `user_ref` varchar(20) NOT NULL,
  `checkbox_plugin_id` int(11) NOT NULL,
  `reference` varchar(200) NOT NULL,
  `optin_time` datetime NOT NULL,
  `for_woocommerce` enum('0','1') NOT NULL DEFAULT '0',
  `wc_session_unique_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_message_sent_stat`
--

CREATE TABLE `messenger_bot_message_sent_stat` (
  `id` int(11) NOT NULL,
  `subscriber_id` varchar(30) NOT NULL,
  `page_table_id` int(11) NOT NULL,
  `message_unique_id` varchar(100) NOT NULL,
  `message_type` enum('message','postback') NOT NULL DEFAULT 'message',
  `no_sent_click` int(12) NOT NULL,
  `error_count` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_bot_persistent_menu`
--

CREATE TABLE `messenger_bot_persistent_menu` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `page_id` varchar(100) NOT NULL,
  `locale` varchar(20) NOT NULL DEFAULT 'default',
  `item_json` longtext NOT NULL,
  `composer_input_disabled` enum('0','1') NOT NULL DEFAULT '0',
  `poskback_id_json` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `messenger_bot_persistent_menu`
--

INSERT INTO `messenger_bot_persistent_menu` (`id`, `user_id`, `page_id`, `locale`, `item_json`, `composer_input_disabled`, `poskback_id_json`) VALUES
(6, 14, '14', 'default', '{\"locale\":\"default\",\"composer_input_disabled\":\"false\",\"call_to_actions\":{\"1\":{\"title\":\"\\u0e40\\u0e21\\u0e19\\u0e39\\u0e2b\\u0e25\\u0e31\\u0e01\",\"type\":\"postback\",\"payload\":\"menu main\"}}}', '0', '[\"menu main\"]');
