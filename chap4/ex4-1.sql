-- 학교에 소속된 학생들의 데이터를 저장하는 DB 구축
CREATE TABLE 'students' (
    `id` INT NOT NULL,
    `name` VARCHAR(20) NOT NULL,
    `year` INT NOT NULL,
    `major` VARCHAR(20) NOT NULL,
    `student_number` INT NOT NULL,
    `phone` VARCHAR(11) NOT NULL,
    `address` VARCHAR(100) NOT NULL,
    `grade` INT NOT NULL DEFAULT 0,
    `avg_grade` DOUBLE NOT NULL DEFAULT 0.0,
    -- Default값 설정 
    `attendence` TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
