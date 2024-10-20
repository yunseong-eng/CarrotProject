$(document).ready(function() {
    // 배송비 선택 시 배송비 금액 필드 활성화/비활성화
    toggleShippingFeeInput();

    // 폼 제출 시 유효성 검사 실행
    $('#postForm').on('submit', function(event) {
        clearErrorMessages(); // 기존 오류 메시지 초기화

        // 유효성 검사 실행 후 오류가 있을 경우 제출을 막음
        if (!validateForm()) {
            event.preventDefault(); // 유효성 검사 실패 시 폼 제출을 막음
        } else {
           
        }
    });

    // 배송비 선택 변경 시 input 상태 변경
    $('#shippingFeeSelect').on('change', function() {
        toggleShippingFeeInput();
    });

    // 이미지 미리보기 처리
    $('#file').on('change', function(event) {
        previewImage(event);
    });
});

// 배송비 선택에 따라 배송비 입력 필드 활성화/비활성화
function toggleShippingFeeInput() {
    const shippingFeeSelect = $('#shippingFeeSelect');
    const shippingFeeInput = $('#shippingFee');

    if (shippingFeeSelect.val() === "O") {
        shippingFeeInput.prop('disabled', false); // 필드를 활성화
        shippingFeeInput.attr('placeholder', "배송비를 입력하세요");
        shippingFeeInput.val('');  // 선택 시 초기화
        shippingFeeInput.prop('required', true); // 필수 입력 필드 설정
    } else {
        shippingFeeInput.prop('disabled', true); // 필드를 비활성화
        shippingFeeInput.val('무료');  // 선택 시 "무료"로 자동 설정
        shippingFeeInput.attr('placeholder', "배송비 없음");
        shippingFeeInput.prop('required', false); // 필수 입력 해제
    }
}

// 이미지 미리보기 함수
function previewImage(event) {
    const reader = new FileReader();
    reader.onload = function() {
        const imagePreview = $('#imagePreview');
        imagePreview.attr('src', reader.result);
        imagePreview.show();
    }
    reader.readAsDataURL(event.target.files[0]);
}

// 폼 유효성 검사 함수 (위에서부터 하나씩 오류를 표시)
function validateForm() {
    let isValid = true; // 폼 유효성을 체크하는 플래그

    // 제목 입력 확인
    if ($('#title').val().trim() === "") {
        displayErrorMessage('#titleError', "제목을 입력하세요.");
        $('#title').focus();
        return false; // 바로 return 해서 하나씩 처리
    }

    // 카테고리 선택 확인
    if ($('#category').val() === "") {
        displayErrorMessage('#categoryError', "카테고리를 선택하세요.");
        $('#category').focus();
        return false; // 바로 return 해서 하나씩 처리
    }

    // 게시글 유형 선택 확인
    if ($('#postType').val() === "") {
        displayErrorMessage('#postTypeError', "게시글 유형을 선택하세요.");
        $('#postType').focus();
        return false; // 바로 return 해서 하나씩 처리
    }

    // 내용 입력 확인
    if ($('#content').val().trim() === "") {
        displayErrorMessage('#contentError', "내용을 입력하세요.");
        $('#content').focus();
        return false; // 바로 return 해서 하나씩 처리
    }

    // 배송비가 "O"일 경우 금액 입력 확인
    if ($('#shippingFeeSelect').val() === "O" && $('#shippingFee').val().trim() === "") {
        displayErrorMessage('#shippingFeeError', "배송비 금액을 입력하세요.");
        $('#shippingFee').focus();
        return false; // 바로 return 해서 하나씩 처리
    }

    return true; // 모든 필드를 통과하면 true 반환
}

// 오류 메시지를 초기화하는 함수
function clearErrorMessages() {
    $('.error-message').empty(); // 기존 오류 메시지 제거
}

// 오류 메시지를 표시하는 함수
function displayErrorMessage(elementSelector, message) {
    $(elementSelector).text(message); // 지정한 위치에 오류 메시지 출력
}
