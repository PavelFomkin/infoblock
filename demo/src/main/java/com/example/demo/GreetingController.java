package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.Candidate;

@Controller
public class GreetingController {

    @GetMapping("/")
    public String greeting(@RequestParam(name = "name", required = false, defaultValue = "World") String name, Model model) {
        Candidate candidate = new Candidate();
        candidate.setFirstName("Pavel");
        candidate.setLastName("Fomkin");
        candidate.setMiddleName("Sergeevich");
        candidate.setSnils("112389523530451");
        candidate.setEmail("pavel_foma@mail.ru");
        candidate.setPhone("89523530451");
        candidate.setBirthday("16.07.1990");
        candidate.setGenderType("MALE");
        model.addAttribute("candidate", candidate);
        return "greeting";
    }

}