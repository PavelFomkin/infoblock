package com.example.demo.dto;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Candidate {

    String firstName;
    String lastName;
    String phone;
    String email;
    String middleName;
    String snils;
    String birthday;
    String genderType;
}
