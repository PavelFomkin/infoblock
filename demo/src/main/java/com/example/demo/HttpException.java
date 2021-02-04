package com.example.demo;

public class HttpException extends PPException {
    private static final long serialVersionUID = -7567916472979840894L;
    private Integer code;
    private String body;

    public HttpException() {
    }

    public HttpException(String msg) {
        super(msg);
    }

    public HttpException(Integer code, String msg) {
        this(code, (String)null, msg);
    }

    public HttpException(Integer code, String body, String msg) {
        super(msg);
        this.code = code;
        this.body = body;
    }

    public HttpException(Throwable cause) {
        super(cause);
    }

    public Integer getCode() {
        return this.code;
    }

    public String getBody() {
        return this.body;
    }
}

