package dao;

import dto.CommentDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentDAO {
    // 댓글 작성
    void insertComment(CommentDTO commentDTO);

    // 댓글 목록 조회
    List<CommentDTO> getCommentList(int boardId);

    // 대댓글 작성
    void insertReply(CommentDTO commentDTO);
    
    // 대댓글 조회
    List<CommentDTO> getRepliesForComment(int commentId);
}
