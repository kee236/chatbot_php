

CREATE TABLE `user_input_custom_fields_assaign` (
  `id` int(11) NOT NULL,
  `subscriber_id` varchar(50) NOT NULL,
  `page_id` varchar(50) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value` text NOT NULL,
  `assaign_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_input_flow_campaign`
--

CREATE TABLE `user_input_flow_campaign` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `flow_data` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;