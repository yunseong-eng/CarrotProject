<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/detail.css">
<title>${board.title} - 상세페이지</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script>
    // 댓글 달기 폼 토글
    function toggleReplyForm(commentId) {
        var replyForm = document.getElementById("replyForm_" + commentId);
        if (replyForm.style.display === "none" || replyForm.style.display === "") {
            replyForm.style.display = "block";
        } else {
            replyForm.style.display = "none";
        }
    }
</script>
</head>
<body>

    <!-- 로그인된 사용자 ID를 가져옴 -->
    <c:set var="currentUserId" value="${currentUserId}" />

    <div class="container">
    <!-- 왼쪽 섹션: 이미지 -->
    <div class="left-section">
        <c:if test="${board.imageFileName != null}">
            <img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-143/board/${board.imageFileName}" 
            alt="게시글 이미지" width="300" height="300">
        </c:if>
    </div>
    
    <!-- 오른쪽 섹션: 게시글 정보 -->
    <div class="right-section">
        <!-- 게시글 제목 -->
        <h1>${board.title}</h1>

        <!-- 조회수 -->
        <div class="views">
            <i class="fas fa-eye"></i>
            <span>${board.views}</span>
        </div>

        <!-- 게시글 내용 -->
        <div class="details">
            <p style="white-space: pre-line;">${board.content}</p>
        </div>

        <!-- 판매/구매 상태 -->
        <div class="status">
            <strong>판매 상태</strong>
            <c:choose>
                <c:when test="${board.postType == '판매'}">
                    <span>판매중</span>
                </c:when>
                <c:otherwise>
                    <span class="blue">구매 요청</span>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- 판매자 정보 및 배송비 -->
        <div class="info">
            <p><strong>판매자 아이디</strong> <span>${board.userId}</span></p>
            <p><strong>배송비</strong>
                <c:choose>
                    <c:when test="${board.shippingFee == '0' || board.shippingFee == 'X'}">
                        <span>X (무료)</span>
                    </c:when>
                    <c:otherwise>
                        <span>O (₩${board.shippingFee})</span>
                    </c:otherwise>
                </c:choose>
            </p>
        </div>
    </div>
</div>

<!-- 게시글 수정 및 삭제 버튼 (본인이 작성한 게시글일 경우에만 표시) -->
<c:if test="${isOwner}">
    <div class="edit-delete-buttons">
        <a href="${pageContext.request.contextPath}/board/updateForm/${board.boardId}" class="btn btn-primary">수정</a>
        <form action="${pageContext.request.contextPath}/board/delete" method="post" style="display:inline;">
            <input type="hidden" name="boardId" value="${board.boardId}">
            <input type="hidden" name="category" value="${board.category}">
            <button type="submit" class="btn btn-danger">삭제</button>
        </form>
    </div>
</c:if>

<!-- 댓글 섹션 -->
<div class="comments-section">
    <h3>[ Comment ]</h3>
    <div class="comment-container">
        <!-- 댓글 작성 폼 -->
        <form class="comment-form" action="${pageContext.request.contextPath}/comment/write" method="post">
            <input type="hidden" name="boardId" value="${board.boardId}">
            <textarea name="content" placeholder="댓글을 입력하세요" style="height: 50px;"></textarea>
            <button type="submit">댓글 작성</button>
            <h4>댓글 작성 시 매너를 지켜주세요! 😊</h4>
        </form>

        <!-- 댓글 목록 -->
        <div class="comment-list">
        <c:forEach var="comment" items="${commentList}">
            <!-- 댓글만 보여줌: parentComment가 null인 경우만 -->
            <c:if test="${comment.parentComment == null}">
                <div class="comment">
                    <p><strong>${comment.userId}</strong>: ${comment.content}</p>
                    <p><small><fmt:formatDate value="${comment.createTime}" pattern="yyyy-MM-dd HH:mm"/></small></p>

                    <!-- 대댓글 작성 버튼 -->
                    <a href="javascript:void(0)" class="reply-toggle" onclick="toggleReplyForm(${comment.commentId})">답글 달기</a>

                    <!-- 대댓글 목록을 표시 (대댓글이 존재할 경우만) -->
                    <c:if test="${comment.replyList != null}">
                        <div class="reply-list">
                            <c:forEach var="reply" items="${comment.replyList}">
                                <div class="reply">
                                    <p><strong>${reply.userId}</strong>: ${reply.content}</p>
                                    <p><small><fmt:formatDate value="${reply.createTime}" pattern="yyyy-MM-dd HH:mm"/></small></p>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>

                    <!-- 대댓글 작성 폼 (기본적으로 숨김) -->
                    <form id="replyForm_${comment.commentId}" class="reply-form" action="${pageContext.request.contextPath}/comment/write" method="post" style="display: none;">
                        <input type="hidden" name="boardId" value="${board.boardId}">
                        <input type="hidden" name="parentComment" value="${comment.commentId}">
                        <textarea name="content" placeholder="대댓글을 입력하세요" style="height: 25px;"></textarea>
                        <button type="submit">대댓글 작성</button>
                    </form>
                </div>
            </c:if>
        </c:forEach>
	</div>
</div>
</body>
</html>
