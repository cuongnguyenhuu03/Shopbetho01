package com.shopbetho.shop.controller.admin;

import com.shopbetho.shop.entity.AccountAdmin;
import com.shopbetho.shop.service.AccountAdminService;
import com.shopbetho.shop.service.EmailService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.Duration;

@Controller
public class LoginController {
    @Autowired
    private EmailService emailService;
    @Autowired
    private AccountAdminService accountAdminService;
    @Autowired
    private StringRedisTemplate redisTemplate;

    @GetMapping("/admin/login")
    public String getLoginPage(Model model) {
        return "client/login/popup_login";
    }
    @PostMapping("/admin/login/submit-email")
    public String Login(Model model, @RequestParam("email") String email) {
        String regex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";

        if(email.matches(regex)) {
            // Kiem tra email có tồn tại trong hệ thống hay không
            if (accountAdminService.findByEmail(email) == null) {
                model.addAttribute("error", "Email not found");
                return "client/login/popup_login";
            }
            //Tạo OTP ngẫu nhiên
            int otp = (int)(Math.random() * 900000) + 100000;
            String otpGen = String.valueOf(otp);
            //Gửi OTP qua email
            emailService.sendOtpEmail(email, otpGen);
            //Lưu OTP vào Redis với thời gian sống 5 phút
            redisTemplate.opsForValue().set("otp:" + email, otpGen, Duration.ofMinutes(5));
            model.addAttribute("email", email);
            return "client/login/verify_otp";
        } else {
            // Nếu email không hợp lệ, trả về thông báo lỗi
            model.addAttribute("error", "Invalid email format");
            return "client/login/popup_login";
        }
    };
    @GetMapping("/admin/dashboard/dashboardProduct")
    public String dashboardPage(HttpSession session, Model model) {
        AccountAdmin admin = (AccountAdmin) session.getAttribute("loggedInAdmin");
        model.addAttribute("admin", admin);
        model.addAttribute("success", session.getAttribute("success"));
        return "admin/dashboard/dashboardProduct";
    }

    @PostMapping("/admin/login/verify-otp")
    public String verifyOtp(
            @RequestParam("email") String email,
            @RequestParam("otp") String inputOtp,
            Model model,
            HttpSession session
    ) {
        String redisKey = "otp:" + email;
        String savedOtp = redisTemplate.opsForValue().get(redisKey);
        System.out.println("Saved OTP: " + savedOtp);
        // Kiểm tra xem OTP có tồn tại trong Redis hay không
        if (savedOtp == null) {
            model.addAttribute("error", "OTP has expired or is invalid. Please try again.");
            model.addAttribute("email", email);
            return "client/login/verify_otp";
        }
        // Kiểm tra xem OTP có khớp với OTP đã gửi không
        if (!savedOtp.equals(inputOtp)) {
            model.addAttribute("error", "Incorrect OTP. Please try again.");
            model.addAttribute("email", email);
            return "client/login/verify_otp";
        }

        // Xác thực thành công, xóa OTP
        redisTemplate.delete(redisKey);
        // Chuyển hướng đến trang dashboard
        // Ghi nhận admin vào session
        AccountAdmin admin = accountAdminService.findByEmail(email);
        session.setAttribute("loggedInAdmin", admin);
        session.setAttribute("success", "Login successful!");
        return "redirect:/admin";
    }
}
