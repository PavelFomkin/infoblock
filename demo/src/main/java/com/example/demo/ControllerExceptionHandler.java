package com.example.demo;

import java.io.IOException;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.ResponseErrorHandler;

import com.example.demo.dto.Response;
import com.example.demo.dto.ResponseStatus;

import lombok.extern.slf4j.Slf4j;

/**
 * Global exception handler
 *
 * @author A. Osipov
 * @since 10 апр. 2017 г.
 */
@Slf4j
@ControllerAdvice
public class ControllerExceptionHandler  implements ResponseErrorHandler {

    @ExceptionHandler(HttpClientErrorException.class)
    public ResponseEntity<Response<Void>> internal(HttpClientErrorException e) {
        HttpStatus httpStatus;
        try {
            httpStatus = HttpStatus.valueOf(String.valueOf(e.getStatusCode().name()));
        } catch (IllegalArgumentException exception) {
            httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
        }
        String message = "[" + e.getStatusCode() + "] " + e.getMessage();
        return Response.error(ResponseStatus.SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR, message);
    }

    @Override
    public boolean hasError(ClientHttpResponse clientHttpResponse) throws IOException {
        return !clientHttpResponse.getStatusCode().is2xxSuccessful();
    }

    @Override
    public void handleError(ClientHttpResponse clientHttpResponse) throws IOException {
        Response.error(ResponseStatus.SERVER_ERROR, clientHttpResponse.getStatusCode(), "[" + clientHttpResponse.getStatusCode().value() + "] " + clientHttpResponse.getStatusText());
    }
}




