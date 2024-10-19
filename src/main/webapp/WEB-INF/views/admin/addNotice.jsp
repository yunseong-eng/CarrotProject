<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <title>공지사항 등록</title>
</head>
<body>
    <h3>공지사항 등록</h3>
    
    <form action="${pageContext.request.contextPath}/admin/addNotice" method="post">
        <label for="title">제목</label>
        <input type="text" id="title" name="title" required><br><br>
        
        <label for="content">내용</label><br>
        <textarea id="content" name="content" rows="10" cols="50" required></textarea><br><br>
        
        <button type="submit">공지사항 등록</button>
    </form>
    
    <a href="${pageContext.request.contextPath}/admin/boards">게시판 목록으로 돌아가기</a>
</body>
</html>