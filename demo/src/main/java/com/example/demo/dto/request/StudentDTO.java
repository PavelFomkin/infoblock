package com.example.demo.dto.request;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonSetter;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StudentDTO {

    @NotNull
    @Email
    String email;
    String password;
    @NotNull
    String firstName;
    @NotNull
    String lastName;
    @NotNull
    String middleName;
    @NotNull
    @Pattern(regexp="\\d{10,11}")
    String phoneNumber;
    @DateTimeFormat(pattern = "dd.MM.yyyy")
    String birthday;
    @NotNull
    String sex;
    @NotNull
    String snils;
    @NotNull
    String city;
    @NotNull
    String category;
    @NotNull
    String region;
    Boolean emailVerified = false;

    @JsonSetter("emailVerified")
    public void setEmailVerified(Boolean val) {
        if (val != null) {
            emailVerified = val;
        }
    }
}
