CREATE TABLE post_notice (
    boardId       INT PRIMARY KEY,                -- 게시글 ID (post_board 테이블의 외래키)
    isNotice      TINYINT(1) DEFAULT 1,           -- 공지사항 여부 (항상 1로 설정)
    FOREIGN KEY (boardId) REFERENCES post_board(boardId) ON DELETE CASCADE
);