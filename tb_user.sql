CREATE TABLE tb_user ( 
user_id VARCHAR(50) NOT NULL,
user_pw VARCHAR(100) NOT NULL,
user_name VARCHAR(100) NOT NULL,
user_email VARCHAR(50) NOT NULL,
user_point INT DEFAULT 0 NOT NULL,
session_key VARCHAR(50) DEFAULT 'none' NOT NULL,
session_limit TIMESTAMP,
user_img VARCHAR(100)  DEFAULT 'user/default-user.png' not null,
user_join_date TIMESTAMP DEFAULT sysdate NOT NULL, 
user_login_date TIMESTAMP DEFAULT sysdate NOT NULL,
user_signature VARCHAR(200) DEFAULT 'Hello...' NOT NULL,
PRIMARY KEY (user_id)
);
