package com.example.demo.dto.request;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonSetter;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StudentDTO {

    @NotNull
    @Email
    private String email;
    private String password;
    @NotNull
    @JsonProperty("first_name")
    private String firstName;
    @NotNull
    @JsonProperty("last_name")
    private String lastName;
    @NotNull
    @JsonProperty("middle_name")
    private String middleName;
    @Pattern(regexp="^\\d{10,11}$")
    @JsonProperty("phone_number")
    private String phoneNumber;
    @DateTimeFormat(pattern = "dd.MM.yyyy")
    private String birthday;
    private String sex;
    @NotNull
    private String snils;
    @NotNull
    private String city;
    @NotNull
    private String category;
    @NotNull
    private String region;
    private Boolean emailVerified = false;

    @JsonSetter("emailVerified")
    public void setEmailVerified(Boolean val) {
        if (val != null) {
            emailVerified = val;
        }
    }
}
