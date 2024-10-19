$(function() {
	//name 포커스 아웃 이벤트
	$('#name').blur(function() {
		if ($(this).val().trim() === '') {
			$('#nameDiv').html('이름을 입력해주세요.').css('color', 'red');
		} else {
			$('#nameDiv').empty(); // 올바르게 입력된 경우 메시지 제거
		}
	});

    //아이디 중복체크
    $('#userId').focusout(function() {
        $('#userIdDiv').empty();
        
        userId = $('#userId').val();
        
        if (userId == '') {
            $('#userIdDiv').html("<span style='color: red;'>먼저 아이디 입력</span>");
        } else {
            $.ajax({
                type: 'post',
                url: '/carrot/user/checkUserId',
                data: { 'userId': userId },
                dataType: 'text',
                success: function(data) {
                    if (data == 'exist') {
                        $('#userIdDiv').html('이미 사용중입니다.');
                        $('#userIdDiv').css('color', 'red');
                    }
                    else {
                    	console.log(userId);
                        $('#userIdDiv').html('사용 가능');
                        $('#userIdDiv').css('color', 'blue');
                    }
                },
                error: function(e) {
                    console.log(e);
                }
            });
        }
    });
    
    
    // 숫자만 입력받기
    $('#tel2, #tel3').on('input', function() {
        this.value = this.value.replace(/[^0-9]/g, ''); // 숫자가 아닌 문자는 제거
    });
	// 입력값에서 특수문자 제거
    $('#userId, #tel2, #tel3, #email1, #email2').on('input', function() {
        this.value = this.value.replace(/[^0-9a-zA-Z가-힣]/g, '');
    });
    //회원가입 버튼 비활성화
    $('#registerBtn').prop('disabled', true);
    /*
    // 입력란 상태에 따라 등록 버튼 활성화
    $('#name, #userId, #password, #repassword, #tel2, #tel3, #email1, #email2').on('keyup change', function() {
        const name = $('#name').val().trim();
        const userId = $('#userId').val().trim();
        const password = $('#password').val().trim();
        const repassword = $('#repassword').val().trim();
        const tel2 = $('#tel2').val().trim();
        const tel3 = $('#tel3').val().trim();
        const email1 = $('#email1').val().trim();
        const email2 = $('#email2').val().trim();

        // 모든 입력란이 채워졌는지 확인
        const allFilled = name !== '' && userId !== '' && password !== '' && repassword !== '' && tel2 !== '' && tel3 !== '' && email1 !== '' && email2 !== '';

        $('#registerBtn').prop('disabled', !allFilled); // 조건에 따라 버튼 활성화/비활성화
    });*/
    
    
        
    //등록
    $('#registerBtn').click(function(){

    	$('#nameDiv').empty();
    	$('#userIdDiv').empty();
    	$('#passwordDiv').empty();
    	$('#repasswordDiv').empty();
    	
    	if($('#password').val() != $('#repassword').val()){
    		$('#repasswordDiv').html('비밀번호가 일치하지 않습니다').css('color', 'red');
    	}
    	/*else if($('#name').val() == '')
    		$('#nameDiv').html('이름을 입력해주세요');
    	else if($('#userId').val() == '')
    		$('#userIdDiv').html('아이디를 입력해주세요');
    	else if($('#password').val() == '')
    		$('#passwordDiv').html('비밀번호를 입력해주세요');
		else if($('#tel2').val() == '')
			$('#telDiv').html('핸드폰을 입력해주세요');
		else if($('#tel3').val() == '')
			$('#telDiv').html('핸드폰을 입력해주세요');
		else if($('#email1').val() == '')
			$('#emailDiv').html('이메일을 입력해주세요');
		else if($('#email2').val() == '')
			$('#emailDiv').html('이메일을 입력해주세요');*/
    	else
    		$.ajax({
    			type: 'post',
                url: '/carrot/user/register',
                data: $('#registerForm').serialize(),
                success: function(response) {
	            	// registerForm 데이터 출력
					let formDataArray = $('#registerForm').serializeArray();
			        formDataArray.forEach(function(item) {
		            console.log(item.name + ': ' + item.value);
			        });
        			alert('가입완료');
					location.href = '/carrot';
            },
                error: function(e) {
                	alert('회원가입중 오류 발생');
                    console.log(e);
                }
    		});
    });
    
    	//인증하기 버튼을 눌렀을 때 동작
	$("#emailAuth").click(function() {
    	const email = $("#email").val(); //사용자가 입력한 이메일 값 얻어오기
    		
    	//Ajax로 전송
        $.ajax({
        	url : '/carrot/user/emailAuth',
        	data : {
        		email : email
        	},
        	type : 'POST',
        	dataType : 'json',
        	success : function(result) {
        		console.log("result : " + result);
        		$("#authCode").attr("disabled", false);
        		code = result;
        		alert("인증 코드가 입력하신 이메일로 전송 되었습니다.");
       		}
        }); //End Ajax
    }); // emailAuth
    
        $("#authCode").on("focusout", function() {
    	const inputCode = $("#authCode").val(); //인증번호 입력 칸에 작성한 내용 가져오기
    	
    	console.log("입력코드 : " + inputCode);
    	console.log("인증코드 : " + code);
    		
    	if(Number(inputCode) === code){
        	$("#emailAuthWarn").html('인증번호가 일치합니다.');
        	$("#emailAuthWarn").css('color', 'green');
    		$('#emailAuth').attr('disabled', true);
    		$('#email').attr('readonly', true);
    		$("#registerBtn").attr("disabled", false);
    	}else{
        	$("#emailAuthWarn").html('인증번호가 틀렸습니다.');
        	$("#emailAuthWarn").css('color', 'red');
        	$("#registerBtn").attr("disabled", true);
    	}
    });
});

//이메일 선택하면 자동입력
function change() {
        const emailSelect = document.getElementById("emailSelect").value;
        document.getElementById("email2").value = emailSelect;
    }

//우편번호 - Daum API
function checkPost() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('zipcode').value = data.zonecode;
			document.getElementById("addr1").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("addr2").focus();
		}
	}).open();
}