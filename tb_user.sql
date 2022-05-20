CREATE TABLE tb_user ( 
user_id VARCHAR(50) NOT NULL PRIMARY KEY,
user_pw VARCHAR(100) NOT NULL,
user_name VARCHAR(100) NOT NULL,
user_email VARCHAR(50) NOT NULL,
user_point INT NOT NULL DEFAULT 0,
session_key VARCHAR(50) NOT NULL DEFAULT 'none',
session_limit TIMESTAMP,
user_img VARCHAR(100) NOT NULL DEFAULT 'user/default-user.png',
user_join_date TIMESTAMP NOT NULL DEFAULT NOW(),
user_login_date TIMESTAMP NOT NULL DEFAULT NOW(),
user_signature VARCHAR(200) NOT NULL DEFAULT 'Hello...',
);