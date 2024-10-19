package dao;

import dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDAO {
    // 회원가입
    void registerUser(UserDTO userDTO);

    // 로그인
    UserDTO loginUser(String userId);

    // 아이디 중복 체크
    UserDTO checkUserId(String userId);
    
    //비밀번호 체크
    UserDTO checkUserPwd(String userId);

    // 이메일 인증 업데이트
    void updateEmailVerified(UserDTO userDTO);

    // 회원 정보 조회
    UserDTO getUserInfo(String userId);

    // 회원 정보 수정
    void updateUserInfo(UserDTO userDTO);

    // 회원 삭제
    void deleteUser(String userId);
    
}