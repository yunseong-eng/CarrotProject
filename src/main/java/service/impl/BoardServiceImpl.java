package service.impl;

import dao.BoardDAO;
import dto.BoardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.BoardService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardServiceImpl implements BoardService {
    @Autowired
    private BoardDAO boardDAO;

    private static final int PAGE_SIZE = 10;

    @Override
    public void writeBoard(BoardDTO boardDTO) {
        boardDAO.insertBoard(boardDTO);  // 게시글만 저장
    }

    @Override
    public Map<String, Object> getBoardList(String category, int page) {
        int startNum = (page - 1) * PAGE_SIZE;
        Map<String, Object> map = new HashMap<>();
        map.put("category", category);
        map.put("startNum", startNum);
        map.put("pageSize", PAGE_SIZE);

        List<BoardDTO> boardList = boardDAO.getBoardListByCategory(map);

        Map<String, Object> result = new HashMap<>();
        result.put("boardList", boardList);

        return result;
    }
    @Override
    public List<BoardDTO> getAllBoardList() {
        return boardDAO.getAllBoardList();
    }

    @Override
    public BoardDTO getBoardDetail(int boardId) {
        boardDAO.increaseViews(boardId);
        return boardDAO.getBoardDetail(boardId);
    }

    @Override
    public void updateBoard(BoardDTO boardDTO) {
        boardDAO.updateBoard(boardDTO);
    }

    @Override
    public void deleteBoard(int boardId) {
        // 게시글의 자식 댓글(대댓글)을 먼저 삭제
        boardDAO.deleteChildCommentsByBoardId(boardId);
        
        // 부모 댓글을 삭제
        boardDAO.deleteParentCommentsByBoardId(boardId);

        // 게시글 삭제
        boardDAO.deleteBoard(boardId);
    }

    @Override
    public List<BoardDTO> searchBoards(String searchKeyword) {
        return boardDAO.searchBoards(searchKeyword);  
    }
}
