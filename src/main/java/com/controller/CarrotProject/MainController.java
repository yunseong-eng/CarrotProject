package com.controller.CarrotProject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @RequestMapping(value = "/")
    public String index() {
        // 메인 페이지로 이동
        return "index";
    }
}
