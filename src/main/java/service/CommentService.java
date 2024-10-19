package service;

import dto.CommentDTO;

import java.util.List;

public interface CommentService {
    // 댓글 작성
    void writeComment(CommentDTO commentDTO);

    // 댓글 목록 조회
    List<CommentDTO> getCommentList(int boardId);
    
    // 대댓글
	void writeReply(CommentDTO commentDTO);
}
