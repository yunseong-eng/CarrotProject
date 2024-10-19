package service.impl;

import dao.UserDAO;
import dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;

	@Override
	public void registerUser(UserDTO userDTO) {
		userDAO.registerUser(userDTO);
	}

	@Override
	public UserDTO loginUser(String userId, String password) {
		UserDTO user = userDAO.loginUser(userId);

		// user가 null인지 확인
		if (user == null) {
			System.out.println("로그인 실패 : 입력한 ID가 없습니다.");
			return null; // 사용자 ID가 존재하지 않음
		}

		// 입력한 pwd와 DB pwd 비교 로직
		if (user.getPassword().equals(password)) {
			System.out.println("로그인 ID : " + user.getUserId());
			return user;
		} else {
			System.out.println("로그인 실패 : 비밀번호가 틀렸습니다.");
			return null;
		}
	}

	@Override
	public String isUserIdAvailable(String userId) {
		UserDTO userDTO = userDAO.checkUserId(userId);
		System.out.println("입력한 ID : " + userId);
		if (userDTO == null)
			return "non_exist";
		else
			System.out.println("DB ID : " + userDTO.getUserId());
		return "exist";
	}

	@Override
	public void verifyEmail(String userId, String emailToken) {
		/*
		 * UserDTO userDTO = userDAO.getUserInfo(userId); if (userDTO != null &&
		 * userDTO.getEmailToken().equals(emailToken)) { userDTO.setEmailVerified(true);
		 * userDAO.updateEmailVerified(userDTO); }
		 */
	}

	@Override
	public UserDTO getUserInfo(String userId) {
		return userDAO.getUserInfo(userId);
	}

	@Override
	public void updateUserInfo(UserDTO userDTO) {
		userDAO.updateUserInfo(userDTO);
	}

	@Override
	public void deleteUser(String userId) {
		userDAO.deleteUser(userId);
	}

	@Override
	public String checkUserPwd(String userId, String nowpwd) {
		UserDTO user = userDAO.checkUserPwd(userId);

		if (user != null && user.getPassword().equals(nowpwd)) {
			return "exist";
		} else {
			return "not exist";
		}
	}
	
	@Override
    public boolean authenticateAdmin(String userId, String password) {
        // DB에서 사용자 정보 조회
        UserDTO user = userDAO.loginUser(userId);
        if (user != null && user.getPassword().equals(password) && "ADMIN".equals(user.getRole())) {
            // 사용자 권한이 ADMIN인 경우에만 true 반환
            return true;
        }
        return false;
    }

	@Override
	public boolean isAdmin(String userId) {
	    // DB에서 해당 userId로 사용자 정보를 가져옴
	    UserDTO user = userDAO.getUserInfo(userId);

	    // 사용자 정보가 null이 아니고, 해당 사용자가 관리자인 경우 true 반환
	    if (user != null && "ADMIN".equals(user.getRole())) {
	        return true;
	    }
	    // 관리자가 아닌 경우 false 반환
	    return false;
	}
}