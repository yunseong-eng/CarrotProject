package service;

import dto.UserDTO;

public interface UserService {
    // 회원가입
    void registerUser(UserDTO userDTO);

    // 로그인
    UserDTO loginUser(String userId, String password);

    // 아이디 중복 체크
    String isUserIdAvailable(String userId);
    
    //비밀번호 체크
    String checkUserPwd(String userId, String nowpwd);

    // 이메일 인증 처리
    void verifyEmail(String userId, String emailToken);

    // 회원 정보 조회
    UserDTO getUserInfo(String userId);

    // 회원 정보 수정
    void updateUserInfo(UserDTO userDTO);

    // 회원 삭제
    void deleteUser(String userId);
    
    // 관리자 인증 (관리자 권한 체크)
    boolean authenticateAdmin(String userId, String password);

    // 관리자 권한 체크
    boolean isAdmin(String userId);
}