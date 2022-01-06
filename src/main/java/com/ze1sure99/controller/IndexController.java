package com.ze1sure99.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
    @RequestMapping("/welcome")
    public  String index(){
        return "MerchantPayment";
    }
}
