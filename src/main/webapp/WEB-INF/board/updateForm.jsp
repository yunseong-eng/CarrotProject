<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/write.css">
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
    <div class="container">
        <h3>게시글 수정</h3>
        <form id="postForm" action="${pageContext.request.contextPath}/board/update" method="post" enctype="multipart/form-data" novalidate>
            <input type="hidden" name="boardId" value="${board.boardId}"> <!-- 게시글 ID 숨김 필드 -->
            <input type="hidden" name="userId" value="${board.userId}"> <!-- 로그인된 사용자 ID 숨김 필드 -->
            <table>
                <tr>
                    <th><label for="file">사진</label></th>
                    <td>
                        <input type="file" id="file" name="file"><br>
                        <img id="imagePreview" alt="이미지 미리보기" style="display:none; max-width: 200px;">
                        <!-- 기존 이미지가 있는 경우, 미리보기 -->
                        <c:if test="${board.imageFileName != null}">
                            <img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-143/board/${board.imageFileName}" alt="이미지 미리보기" style="max-width: 200px;">
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <th><label for="title">상품명</label></th>
                    <td>
                        <input type="text" id="title" name="title" value="${board.title}"> <!-- 기존 제목 표시 -->
                        <div id="titleError" class="error-message"></div>
                    </td>
                </tr>
                <tr>
                    <th><label for="category">카테고리</label></th>
                    <td>
                        <select id="category" name="category">
                            <option value="의류" ${board.category == '의류' ? 'selected' : ''}>의류</option>
                            <option value="신발" ${board.category == '신발' ? 'selected' : ''}>신발</option>
                        </select>
                        <div id="categoryError" class="error-message"></div>
                    </td>
                </tr>
                <tr>
                    <th><label for="postType">유형</label></th>
                    <td>
                        <select id="postType" name="postType">
                            <option value="판매" ${board.postType == '판매' ? 'selected' : ''}>판매</option>
                            <option value="구매" ${board.postType == '구매' ? 'selected' : ''}>구매</option>
                        </select>
                        <div id="postTypeError" class="error-message"></div>
                    </td>
                </tr>
                <tr>
                    <th><label for="content">내용</label></th>
                    <td>
                        <textarea id="content" name="content" rows="8">${board.content}</textarea> <!-- 기존 내용 표시 -->
                        <div id="contentError" class="error-message"></div>
                    </td>
                </tr>
                <tr>
                    <th><label for="shippingFeeSelect">배송비</label></th>
                    <td>
                        <select id="shippingFeeSelect" name="shippingFeeOption">
                            <option value="O" ${board.shippingFee == 'O' ? 'selected' : ''}>O</option>
                            <option value="X" ${board.shippingFee == 'X' ? 'selected' : ''}>X</option>
                        </select>
                        <div id="shippingFeeSelectError" class="error-message"></div>
                    </td>
                </tr>
                <tr>
                    <th><label for="shippingFee">배송비 금액</label></th>
                    <td>
                        <input type="text" id="shippingFee" name="shippingFee" value="${board.shippingFee}">
                        <div id="shippingFeeError" class="error-message"></div>
                    </td>
                </tr>
                <tr>
                    <th><label for="includes">구성품 여부</label></th>
                    <td>
                        <select id="includes" name="includes">
                            <option value="Y" ${board.includes == 'Y' ? 'selected' : ''}>포함</option>
                            <option value="N" ${board.includes == 'N' ? 'selected' : ''}>미포함</option>
                        </select>
                        <div id="includesError" class="error-message"></div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="button-cell">
                        <button type="button" id="submitBtn">수정 완료</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/board.js"></script>
</body>
</html>
