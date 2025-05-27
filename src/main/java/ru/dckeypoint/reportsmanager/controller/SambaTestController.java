package ru.dckeypoint.reportsmanager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ru.dckeypoint.reportsmanager.service.SambaService;


@Controller
@RequestMapping("/samba")
public class SambaTestController {


    @GetMapping
    public String startSambaServiceMethods() {
        SambaService.getFileFromSamba();
        return new String();
    }
    
}
