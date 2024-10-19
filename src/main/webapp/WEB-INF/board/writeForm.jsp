<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/write.css">
    <meta charset="UTF-8">
    <title>게시글 작성</title>
</head>
<body>
    <div class="container">
        <h3>게시글 등록</h3>
        <form id="postForm" action="${pageContext.request.contextPath}/board/write" method="post" enctype="multipart/form-data" novalidate>
            <input type="hidden" name="userId" value="${currentUserId}"> <!-- 로그인된 사용자 ID를 숨겨진 필드로 포함 -->
            <table>
                <tr>
                    <th><label for="file">사진</label></th>
                    <td>
                        <input type="file" id="file" name="file"><br>
                        <img id="imagePreview" alt="이미지 미리보기" style="display:none; max-width: 200px;">
                    </td>
                </tr>
                <tr>
                    <th><label for="title">상품명</label></th>
                    <td>
                        <input type="text" id="title" name="title">
                        <div id="titleError" class="error-message"></div> <!-- 제목 오류 메시지 -->
                    </td>
                </tr>
                <tr>
                    <th><label for="category">카테고리</label></th>
                    <td>
                        <select id="category" name="category">
                            <option value="의류">의류</option>
                            <option value="신발">신발</option>
                        </select>
                        <div id="categoryError" class="error-message"></div> <!-- 카테고리 오류 메시지 -->
                    </td>
                </tr>
                <tr>
                    <th><label for="postType">유형</label></th>
                    <td>
                        <select id="postType" name="postType">
                            <option value="판매">판매</option>
                            <option value="구매">구매</option>
                        </select>
                        <div id="postTypeError" class="error-message"></div> <!-- 게시글 유형 오류 메시지 -->
                    </td>
                </tr>
                <tr>
                    <th><label for="content">내용</label></th>
                    <td>
                        <textarea id="content" name="content" rows="8" placeholder="번호를 필수로 입력해주세요"></textarea>
                        <div id="contentError" class="error-message"></div> <!-- 내용 오류 메시지 -->
                    </td>
                </tr>
                <tr>
                    <th><label for="shippingFeeSelect">배송비</label></th>
                    <td>
                        <select id="shippingFeeSelect" name="shippingFeeOption">
                            <option value="O">O</option>
                            <option value="X">X</option>
                        </select>
                        <div id="shippingFeeSelectError" class="error-message"></div> <!-- 배송비 선택 오류 메시지 -->
                    </td>
                </tr>
                <tr>
                    <th><label for="shippingFee">배송비 금액</label></th>
                    <td>
                        <input type="text" id="shippingFee" name="shippingFee" placeholder="배송비 없음">
                        <div id="shippingFeeError" class="error-message"></div> <!-- 배송비 금액 오류 메시지 -->
                    </td>
                </tr>
                <tr>
                    <th><label for="includes">구성품 여부</label></th>
                    <td>
                        <select id="includes" name="includes">
                            <option value="Y">포함</option>
                            <option value="N">미포함</option>
                        </select>
                        <div id="includesError" class="error-message"></div> <!-- 구성품 오류 메시지 -->
                    </td>
                </tr>
                <!-- 작성 버튼을 오른쪽 하단에 위치 -->
                <tr>
                    <td colspan="2" class="button-cell">
                        <button type="submit" id="submitBtn">작성 완료</button>
                    </td>
                </tr>             
            </table>
        </form>
    </div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/board.js"></script>
</body>
</html>
