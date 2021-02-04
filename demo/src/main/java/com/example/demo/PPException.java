package com.example.demo;

public class PPException extends RuntimeException {
    private static final long serialVersionUID = 9084177414031833482L;

    public PPException() {
    }

    public PPException(String msg) {
        super(msg);
    }

    public PPException(Throwable cause) {
        super(cause);
    }

    public PPException(String msg, Throwable cause) {
        super(msg, cause);
    }
}
