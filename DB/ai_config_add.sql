CREATE TABLE `ai_configurations` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,  -- ID ของผู้ใช้ที่เป็นเจ้าของการตั้งค่า
  `service_name` ENUM('dialogflow', 'gemini') NOT NULL, -- ประเภทของบริการ AI
  `settings` JSON NOT NULL, -- ข้อมูลการตั้งค่าในรูปแบบ JSON
  `status` ENUM('active', 'inactive') NOT NULL DEFAULT 'active',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `conversation_logs` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,  -- ID ของผู้ใช้ในระบบของคุณ
  `ai_service_id` INT(11) NOT NULL, -- อ้างอิงไปยังตาราง ai_configurations
  `channel` ENUM('messenger', 'line', 'อื่นๆ') NOT NULL, -- ช่องทางการสนทนา
  `external_user_id` VARCHAR(255) NOT NULL, -- ID ของผู้ใช้จากช่องทางนั้นๆ (เช่น LINE User ID)
  `message_in` TEXT NOT NULL,  -- ข้อความที่ผู้ใช้ส่งมา
  `message_out` TEXT NOT NULL, -- ข้อความที่บอทตอบกลับ
  `intent` VARCHAR(255) DEFAULT NULL, -- Intent ที่ Dialogflow ตรวจจับได้
  `timestamp` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`ai_service_id`) REFERENCES `ai_configurations`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;