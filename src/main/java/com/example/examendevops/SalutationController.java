package com.example.examendevops;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SalutationController {

    @GetMapping("/salutation")
    public String salutation() {
        return "Bonjour Master DevOps II";
    }
}
