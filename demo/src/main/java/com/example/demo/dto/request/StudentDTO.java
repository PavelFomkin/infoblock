package com.example.demo.dto.request;

import com.fasterxml.jackson.annotation.JsonSetter;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StudentDTO {

    String email;
    String password;
    String firstName;
    String lastName;
    String middleName;
    String phoneNumber;
    String birthday;
    String sex;
    String snils;
    String city;
    String category;
    String region;
    Boolean emailVerified = false;

    @JsonSetter("emailVerified")
    public void setEmailVerified(Boolean val) {
        if (val != null) {
            emailVerified = val;
        }
    }
}
