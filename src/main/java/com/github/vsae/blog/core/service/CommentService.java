package com.github.vsae.blog.core.service;

import com.github.vsae.blog.core.entity.BlogComment;
import com.github.vsae.blog.core.util.PageQueryUtil;
import com.github.vsae.blog.core.util.PageResult;

public interface CommentService {
    /**
     * 添加評論
     *
     * @param blogComment
     * @return
     */
    Boolean addComment(BlogComment blogComment);

    /**
     * 後台管理系統中評論分頁功能
     *
     * @param pageUtil
     * @return
     */
    PageResult getCommentsPage(PageQueryUtil pageUtil);

    int getTotalComments();

    /**
     * 批量審核
     *
     * @param ids
     * @return
     */
    Boolean checkDone(Integer[] ids);

    /**
     * 批量刪除
     *
     * @param ids
     * @return
     */
    Boolean deleteBatch(Integer[] ids);

    /**
     * 添加回覆
     *
     * @param commentId
     * @param replyBody
     * @return
     */
    Boolean reply(Long commentId, String replyBody);

    /**
     * 根據文章id和分頁參數獲取文章的評論列表
     *
     * @param blogId
     * @param page
     * @return
     */
    PageResult getCommentPageByBlogIdAndPageNum(Long blogId, int page);
}
