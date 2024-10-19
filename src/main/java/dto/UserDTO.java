package dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserDTO {
	private String userId; // 아이디
	private String password; // 비밀번호
	private String name; // 이름
	private String phoneNumber; // 핸드폰번호
	private String gender; // 성별 (M, F)
	private String address; // 주소
	private String email; // 이메일
	private boolean emailVerified; // 이메일 인증 여부
	private String emailToken; // 이메일 인증 토큰 private
	private String role; // 권한 (USER, ADMIN)

	private String tel1;
	private String tel2;
	private String tel3;
	private String addr1;
	private String addr2;
	private String email1;
	private String email2;

	public void setTel1(String tel1) {
		this.tel1 = tel1;
		setPhoneNumber(getFullTel());
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
		setPhoneNumber(getFullTel());
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
		setPhoneNumber(getFullTel());
	}

	/*
	 * public void setTel(String tel1, String tel2, String tel3) { this.tel1 = tel1;
	 * this.tel2 = tel2; this.tel3 = tel3; this.phoneNumber =
	 * String.format("%s-%s-%s", tel1, tel2, tel3); }
	 */

	// DB에서 저장된 phoneNumber를 회원정보 수정할때
	// tel1, tel2, tel3 에 나눠서 출력하기 위함  
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
		String[] parts = phoneNumber.split("-");
		if (parts.length == 3) {
			this.tel1 = parts[0];
			this.tel2 = parts[1];
			this.tel3 = parts[2];
		}
	}
	
	public void setAddress(String address) {
		this.address = address;
		String[] parts = address.split("&");
		if(parts.length == 2) {
			this.addr1 = parts[0];
			this.addr2 = parts[1];
		}
	}
	
	public void setEmail(String email) {
		this.email = email;
		String[] parts = email.split("@");
		if(parts.length == 2) {
			this.email1 = parts[0];
			this.email2 = parts[1];
		}
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
		setAddress(getFullAddress());
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
		setAddress(getFullAddress());
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
		setEmail(getFullEmail());
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
		setEmail(getFullEmail());
	}

	private String getFullTel() {
		return String.format("%s-%s-%s", tel1, tel2, tel3);
	}

	private String getFullAddress() {
		return String.format("%s&%s", addr1, addr2);
	}

	private String getFullEmail() {
		return String.format("%s@%s", email1, email2);
	}
}