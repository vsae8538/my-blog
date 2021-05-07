package com.github.vsae.blog.core.service;

import com.github.vsae.blog.core.controller.vo.BlogDetailVO;
import com.github.vsae.blog.core.controller.vo.SimpleBlogListVO;
import com.github.vsae.blog.core.entity.Blog;
import com.github.vsae.blog.core.util.PageQueryUtil;
import com.github.vsae.blog.core.util.PageResult;

import java.util.List;

public interface BlogService {
    String saveBlog(Blog blog);

    PageResult getBlogsPage(PageQueryUtil pageUtil);

    Boolean deleteBatch(Integer[] ids);

    int getTotalBlogs();

    /**
     * 根據id獲取詳情
     *
     * @param blogId
     * @return
     */
    Blog getBlogById(Long blogId);

    /**
     * 後台修改
     *
     * @param blog
     * @return
     */
    String updateBlog(Blog blog);

    /**
     * 獲取首頁文章列表
     *
     * @param page
     * @return
     */
    PageResult getBlogsForIndexPage(int page);

    /**
     * 首頁側邊欄數據列表
     * 0-點擊最多 1-最新發布
     *
     * @param type
     * @return
     */
    List<SimpleBlogListVO> getBlogListForIndexPage(int type);
    /**
     * 文章詳情
     *
     * @param blogId
     * @return
     */
    BlogDetailVO getBlogDetail(Long blogId);

    /**
     * 根據標籤獲取文章列表
     *
     * @param tagName
     * @param page
     * @return
     */
    PageResult getBlogsPageByTag(String tagName, int page);

    /**
     * 根據分類獲取文章列表
     *
     * @param categoryId
     * @param page
     * @return
     */
    PageResult getBlogsPageByCategory(String categoryId, int page);

    /**
     * 根據搜索獲取文章列表
     *
     * @param keyword
     * @param page
     * @return
     */
    PageResult getBlogsPageBySearch(String keyword, int page);

    BlogDetailVO getBlogDetailBySubUrl(String subUrl);
}
