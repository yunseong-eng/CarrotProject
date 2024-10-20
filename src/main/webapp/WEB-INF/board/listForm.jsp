<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/list.css">
    <title>${category} 게시판 목록</title>
</head>
<body>
<div class="board-container">
    <h3>${category} 게시판</h3>

    <!-- 게시판 테이블 -->
    <table>
        <thead>
            <tr>
                <th>구분</th> <!-- 판매/구매 구분 -->
                <th>제목</th>
                <th>작성자</th>
                <th>작성시간</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="board" items="${boardList}">
                <tr>
                    <td>
                        <c:choose>
                            <c:when test="${board.postType == '판매'}">
                                <span class="sale">판매</span>
                            </c:when>
                            <c:otherwise>
                                <span class="purchase">구매</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a class="title-link" href="${pageContext.request.contextPath}/board/detailForm/${board.boardId}">
                            ${board.title}
                        </a>
                    </td>
                    <td>${board.userId}</td>
                    <td><fmt:formatDate value="${board.createTime}" pattern="yyyy-MM-dd HH:mm" /></td>
                    <td><fmt:formatNumber value="${board.views}" pattern="#,###"/></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- 페이징 처리 -->
    <div class="paging-container">
        <c:out value="${pagingHTML}" />
    </div>

    <!-- 글 작성 버튼 -->
    <form action="${pageContext.request.contextPath}/board/writeForm" method="get">
        <button type="submit" class="btn-write">글 작성</button>
    </form>
</div>

<!-- JavaScript로 페이징 처리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(document).on('click', '.paging', function() {
        var page = $(this).data('page');
        $.ajax({
            url: '${pageContext.request.contextPath}/board/listForm',
            type: 'GET',
            data: { category: '${category}', page: page },
            success: function(data) {
                $('.board-container').html($(data).find('.board-container').html());
                $('.paging-container').html($(data).find('.paging-container').html());
            }
        });
    });
</script>
</body>
</html>