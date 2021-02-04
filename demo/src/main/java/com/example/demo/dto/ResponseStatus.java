package com.example.demo.dto;

public enum ResponseStatus {
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
