--MySQL
CREATE TABLE user (
    userId         VARCHAR(50) PRIMARY KEY,       -- 아이디
    password       VARCHAR(100) NOT NULL,         -- 비밀번호
    name           VARCHAR(100) NOT NULL,         -- 이름
    phoneNumber    VARCHAR(15) NOT NULL,          -- 핸드폰번호
    gender         CHAR(1),                       -- 성별 (M: 남성, F: 여성)
    address        VARCHAR(255),                  -- 주소
    email          VARCHAR(100) NOT NULL,         -- 이메일
    emailVerified  BOOLEAN DEFAULT FALSE,         -- 이메일 인증 여부
    emailToken     VARCHAR(255),                  -- 이메일 인증용 토큰 (NULL이 될 수 있음)
    role           VARCHAR(20) DEFAULT 'USER'     -- 권한 (USER 또는 ADMIN)
);

