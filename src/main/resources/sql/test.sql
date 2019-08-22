-- ����ͼ���
CREATE TABLE `book` (
  `book_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ͼ��ID',
  `name` varchar(100) NOT NULL COMMENT 'ͼ������',
  `number` int(11) NOT NULL COMMENT '�ݲ�����',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='ͼ���';

-- ��ʼ��ͼ������
INSERT INTO `book` (`book_id`, `name`, `number`)
VALUES
	(1000, 'Java�������', 10),
	(1001, '���ݽṹ', 10),
	(1002, '���ģʽ', 10),
	(1003, '����ԭ��', 10);

-- ����ԤԼͼ���
CREATE TABLE `appointment` (
  `book_id` bigint(20) NOT NULL COMMENT 'ͼ��ID',
  `student_id` bigint(20) NOT NULL COMMENT 'ѧ��',
  `appoint_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'ԤԼʱ��' ,
  PRIMARY KEY (`book_id`, `student_id`),
  INDEX `idx_appoint_time` (`appoint_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ԤԼͼ���';
