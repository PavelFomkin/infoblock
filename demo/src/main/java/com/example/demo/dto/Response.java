package com.example.demo.dto;

//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

import java.util.Collections;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonInclude(Include.NON_NULL)
public class Response<T> {

    @JsonProperty(
            value = "code",
            required = true
    )
    private final ResponseStatus code;
    @JsonProperty("comment")
    private final String comment;
    @JsonProperty("data")
    private final T data;
    private final Map<String, Object> details;

    public static ResponseEntity<Response<Void>> ok() {
        return ResponseEntity.ok(new Response(ResponseStatus.SUCCESS, (String) null, (Map) null));
    }

    public static <T> ResponseEntity<Response<T>> ok(T data) {
        return ResponseEntity.ok(new Response(ResponseStatus.SUCCESS, (String) null, data));
    }

    public static <T> ResponseEntity<Response<T>> error(ResponseStatus status, HttpStatus httpStatus, String message) {
        return error(status, httpStatus, message, Collections.emptyMap());
    }

    public static <T> ResponseEntity<Response<T>> error(ResponseStatus status, HttpStatus httpStatus, String message, Map<String, Object> details) {
        return new ResponseEntity(new Response(status, message, details), httpStatus);
    }

    public Response(ResponseStatus code, String comment, T data) {
        this.code = code;
        this.comment = comment;
        this.data = data;
        this.details = Collections.emptyMap();
    }

    public Response(ResponseStatus code, String comment, Map<String, Object> details) {
        this.code = code;
        this.comment = comment;
        this.data = null;
        this.details = details;
    }

    @JsonAnyGetter
    public Map<String, Object> getDetails() {
        return this.details;
    }

    public String toString() {
        return "Response(code=" + this.code + ", comment=" + this.comment + ", data=" + this.data + ", details=" + this.getDetails() + ")";
    }
}

enum ResponseStatus {
    SUCCESS,
    INCORRECT_REQUEST_PARAMS,
    NOT_FOUND,
    SERVER_ERROR,
    TEMPORARILY_UNAVAILABLE,
    UNAUTHORIZED,
    WRONG_REQUEST,
    UNKNOWN_ERROR;

    private ResponseStatus() {
    }
}
