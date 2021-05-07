package com.github.vsae.blog.core.controller.admin;

import com.github.vsae.blog.core.service.CommentService;
import com.github.vsae.blog.core.util.CommonResult;
import com.github.vsae.blog.core.util.PageQueryUtil;
import com.github.vsae.blog.core.util.ResultGenerator;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;


@Controller
@RequestMapping("/admin")
public class CommentController {

    @Resource
    private CommentService commentService;

    @GetMapping("/comments/list")
    @ResponseBody
    public CommonResult list(@RequestParam Map<String, Object> params) {
        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))) {
            return ResultGenerator.genFailResult("參數異常！");
        }
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        return ResultGenerator.genSuccessResult(commentService.getCommentsPage(pageUtil));
    }

    @PostMapping("/comments/checkDone")
    @ResponseBody
    public CommonResult checkDone(@RequestBody Integer[] ids) {
        if (ids.length < 1) {
            return ResultGenerator.genFailResult("參數異常！");
        }
        if (commentService.checkDone(ids)) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult("審核失敗");
        }
    }

    @PostMapping("/comments/reply")
    @ResponseBody
    public CommonResult checkDone(@RequestParam("commentId") Long commentId,
                                  @RequestParam("replyBody") String replyBody) {
        if (commentId == null || commentId < 1 || StringUtils.isEmpty(replyBody)) {
            return ResultGenerator.genFailResult("參數異常！");
        }
        if (commentService.reply(commentId, replyBody)) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult("回覆失敗");
        }
    }

    @PostMapping("/comments/delete")
    @ResponseBody
    public CommonResult delete(@RequestBody Integer[] ids) {
        if (ids.length < 1) {
            return ResultGenerator.genFailResult("參數異常！");
        }
        if (commentService.deleteBatch(ids)) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult("刪除失敗");
        }
    }

    @GetMapping("/comments")
    public String list(HttpServletRequest request) {
        request.setAttribute("path", "comments");
        return "admin/comment";
    }


}
