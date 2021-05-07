package com.github.vsae.blog.core.util;

import org.springframework.util.StringUtils;

/**
 * Http Response工具
 */
public class ResultGenerator {
    private static final String DEFAULT_SUCCESS_MESSAGE = "SUCCESS";
    private static final String DEFAULT_FAIL_MESSAGE = "FAIL";
    private static final int RESULT_CODE_SUCCESS = 200;
    private static final int RESULT_CODE_SERVER_ERROR = 500;

    public static CommonResult genSuccessResult() {
        CommonResult commonResult = new CommonResult();
        commonResult.setResultCode(RESULT_CODE_SUCCESS);
        commonResult.setMessage(DEFAULT_SUCCESS_MESSAGE);
        return commonResult;
    }

    public static CommonResult genSuccessResult(String message) {
        CommonResult commonResult = new CommonResult();
        commonResult.setResultCode(RESULT_CODE_SUCCESS);
        commonResult.setMessage(message);
        return commonResult;
    }

    public static CommonResult genSuccessResult(Object data) {
        CommonResult commonResult = new CommonResult();
        commonResult.setResultCode(RESULT_CODE_SUCCESS);
        commonResult.setMessage(DEFAULT_SUCCESS_MESSAGE);
        commonResult.setData(data);
        return commonResult;
    }

    public static CommonResult genFailResult(String message) {
        CommonResult commonResult = new CommonResult();
        commonResult.setResultCode(RESULT_CODE_SERVER_ERROR);
        if (StringUtils.isEmpty(message)) {
            commonResult.setMessage(DEFAULT_FAIL_MESSAGE);
        } else {
            commonResult.setMessage(message);
        }
        return commonResult;
    }

    public static CommonResult genErrorResult(int code, String message) {
        CommonResult commonResult = new CommonResult();
        commonResult.setResultCode(code);
        commonResult.setMessage(message);
        return commonResult;
    }
}
