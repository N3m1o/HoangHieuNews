package com.laptrinhjavaweb.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	// login
	@RequestMapping(value = "/login")
	public String showFormLogin(Model model) {
		return "login";
	}

	// Thuc hien dang nhap
	@RequestMapping(value = "/login", params = { "username", "password" }, method = RequestMethod.POST)
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model, HttpSession httpSession) {
		UserEntity userEntity = userService.getUserByUsername(username);
		if (userEntity != null && userEntity.getPassword().equals(password)) {
			httpSession.setAttribute("userEntity", userEntity);

			return "redirect:/home";

		} else {
			model.addAttribute("mess", "Nhập sai tài khoản hoặc mật khẩu");
			return "login";
		}
	}

	// Thuc hien Dang xuat
	@RequestMapping(value = "/logout")
	public String logOut(HttpSession httpSession) {
		httpSession.removeAttribute("userEntity");
		return "redirect:/home";
	}

	// Chức năng đăng ký
	@RequestMapping(value = "/register", params = { "user", "pass", "repass" }, method = RequestMethod.POST)
	public String signup(@RequestParam("user") String username, @RequestParam("pass") String password,
			@RequestParam("repass") String repass, Model model) {
		UserEntity userEntity = new UserEntity();
		userEntity.setUsername(username);
		userEntity.setPassword(password);
		userEntity.setFullname("Anonymous");
		userEntity.setGender(0);
		userEntity.setIsAuthor(0);
		userEntity.setIsAdmin(0);
		userEntity.setUser_img("https://pdp.edu.vn/wp-content/uploads/2021/05/hinh-anh-mat-cuoi-dep-cute-cam-xuc.jpg");
		if (!repass.equals(password)) {
			model.addAttribute("alert1", "Repeat Password phải trùng với Password");
			return "register";

		} else {
			if (userService.findByName(username) != null) {
				model.addAttribute("alert2", "Tên đăng nhập đã tồn tại");
				return "register";
			} else {
				userService.save(userEntity);
				return "redirect:/login";
			}
		}
	}

	@RequestMapping(value = "/register")
	public String getsignup() {
		return "register";
	}

	// Chỉnh sửa thông tin cá nhân
	@RequestMapping("/user/{userId}")
	public String showEditNewsPage(@PathVariable int userId, Model model, HttpSession httpSession) {
		Object obj = httpSession.getAttribute("userEntity");
		if (obj != null) {
			model.addAttribute("user", userService.findByUserId(userId));
			return "profile";
		} else {
			return "redirect:/home";
		}

	}

	//Lưu Thông tin sau khi sửa 
	@RequestMapping(value = "/user/{userId}", params = { "username", "fullname", "user_img", "gender",
			"short_description", "date_of_birth" }, method = RequestMethod.POST)
	public String editUser(@RequestParam("username") String username, @RequestParam("fullname") String fullname,
			@RequestParam("user_img") String user_img, @RequestParam("date_of_birth") Date date_of_birth,
			@RequestParam("gender") int gender, @RequestParam("short_description") String short_description,
			HttpSession httpSession) {
		Object obj = httpSession.getAttribute("userEntity");
		UserEntity userEntity = (UserEntity) obj;
		userEntity.setUsername(username);
		userEntity.setFullname(fullname);
		userEntity.setUser_img(user_img);
		userEntity.setGender(gender);
		userEntity.setShort_description(short_description);
		userEntity.setDateOfBirth(date_of_birth);
		userService.save(userEntity);
		return "redirect:/user/{userId}";
	}

	//Thêm Nhà Báo
	@RequestMapping(value = "/admin-users", params = { "username", "password", "fullname", "dateOfBirth", "user_img",
			"short_description", "gender" }, method = RequestMethod.POST)
	public String createNews(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("fullname") String fullname, @RequestParam("dateOfBirth") Date dateOfBirth,
			@RequestParam("user_img") String user_img, @RequestParam("short_description") String short_description,
			@RequestParam("gender") int gender, HttpSession httpSession) {

		UserEntity userEntity = new UserEntity();
		userEntity.setUsername(username);
		userEntity.setPassword(password);
		userEntity.setFullname(fullname);
		userEntity.setUser_img(user_img);
		userEntity.setShort_description(short_description);
		userEntity.setGender(gender);
		userEntity.setDateOfBirth(dateOfBirth);
		userEntity.setIsAuthor(1);
		userEntity.setIsAdmin(0);
		userService.save(userEntity);
		return "redirect:/admin-users";
	}
	
	//Trang Quản Trị Người Dùng của Admin
	@RequestMapping(value = "/admin-users")
	public String findAll(Model model, HttpSession httpSession) {

		return "redirect:/admin-users/all/1";
	}
	
	//Trang Quản Trị Người Dùng của Admin, phân trang, lọc
	@RequestMapping(value = "/admin-users/{filter}/{pageId}")
	public String findAllPagination(@PathVariable String filter, @PathVariable int pageId, Model model,
			HttpSession httpSession, HttpServletRequest request) {

		int usersNumber;
		int pageIdLimit;
		int pageIdNumber;
		if (filter.equals("all")) {
			List<UserEntity> allUsers = userService.findAllUsers();
			usersNumber = allUsers.size();
			if (usersNumber % 5 == 0 && usersNumber != 0) {
				pageIdLimit = allUsers.size() / 5;
			} else {
				pageIdLimit = allUsers.size() / 5 + 1;
			}
			pageIdNumber = userService.findAllUsersPagination((pageId - 1) * 5, 5).size();
			model.addAttribute("users", userService.findAllUsersPagination((pageId - 1) * 5, 5));
			model.addAttribute("combobox", 1);
			request.setAttribute("filter", "all");
		} else if (filter.equals("reader")) {
			List<UserEntity> allUsers = userService.findAllUsersReaders();
			usersNumber = allUsers.size();
			if (usersNumber % 5 == 0 && usersNumber != 0) {
				pageIdLimit = allUsers.size() / 5;
			} else {
				pageIdLimit = allUsers.size() / 5 + 1;
			}
			pageIdNumber = userService.findAllUsersPaginationReaders((pageId - 1) * 5, 5).size();
			model.addAttribute("users", userService.findAllUsersPaginationReaders((pageId - 1) * 5, 5));
			model.addAttribute("combobox", 2);
			request.setAttribute("filter", "reader");
		} else {
			List<UserEntity> allUsers = userService.findAllUsersAuthors();
			usersNumber = allUsers.size();
			if (usersNumber % 5 == 0 && usersNumber != 0) {
				pageIdLimit = allUsers.size() / 5;
			} else {
				pageIdLimit = allUsers.size() / 5 + 1;
			}
			pageIdNumber = userService.findAllUsersPaginationAuthors((pageId - 1) * 5, 5).size();
			model.addAttribute("users", userService.findAllUsersPaginationAuthors((pageId - 1) * 5, 5));
			model.addAttribute("combobox", 3);
			request.setAttribute("filter", "author");
		}

		request.setAttribute("pageId", pageId);
		request.setAttribute("usersNumber", usersNumber);
		request.setAttribute("pageIdLimit", pageIdLimit);
		request.setAttribute("pageIdNumber", pageIdNumber);
		request.setAttribute("usersNumber", usersNumber);
		return "AdminUsers";
	}
	
	//Admin Sửa thông tin tài khoản
	@RequestMapping(value = "/editAdminUsers/{userID}")
	public String showEditUserPage(@PathVariable int userID, Model model) {
		model.addAttribute("user", userService.findByUserId(userID));
		return "editAdminUsers";
	}
	
	//Admin Sửa thông tin tài khoản và lưu
	@RequestMapping(value = "/editAdminUsers/{userID}", params = {"userID", "username", "password", "fullname", "dateOfBirth", "user_img",
			"short_description", "gender" }, method = RequestMethod.POST)
	public String editUsers(@RequestParam("userID") int userID,@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("fullname") String fullname, @RequestParam("dateOfBirth") Date dateOfBirth,
			@RequestParam("user_img") String user_img, @RequestParam("short_description") String short_description,
			@RequestParam("gender") int gender, HttpSession httpSession) {

		UserEntity userEntity = userService.findByUserId(userID);
		userEntity.setUsername(username);
		userEntity.setPassword(password);
		userEntity.setFullname(fullname);
		userEntity.setUser_img(user_img);
		userEntity.setShort_description(short_description);
		userEntity.setGender(gender);
		userEntity.setDateOfBirth(dateOfBirth);
		userService.save(userEntity);
		return "redirect:/admin-users";
	}
	
	//Admin Xóa Tài Khoản
	@RequestMapping("/deleteAdminUsers/{userID}")
	public String deleteByAdmin(@PathVariable int userID, RedirectAttributes redirect) {
		UserEntity userEntity = userService.findByUserId(userID);
		userService.delete(userEntity);

		return "redirect:/admin-users";
	}
	
	//Tìm kiếm tài khoản trong trang admin
	@RequestMapping(value="/admin-users/all", params = {"searchString"})
	public String searchAdminUsers(@RequestParam("searchString") String s, Model model,  HttpSession httpSession, HttpServletRequest request ) {
		if (s.equals("")) {

			return "redirect:/admin-users/all/1";
		} else {
			
			model.addAttribute("users", userService.findAllUsersSearchString(s));
			model.addAttribute("combobox", 1);

		}
		return "AdminUsersSearch";
	}
	
}
