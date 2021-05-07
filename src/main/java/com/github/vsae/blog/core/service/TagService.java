package com.github.vsae.blog.core.service;

import com.github.vsae.blog.core.entity.BlogTagCount;
import com.github.vsae.blog.core.util.PageQueryUtil;
import com.github.vsae.blog.core.util.PageResult;

import java.util.List;

public interface TagService {

    /**
     * 查詢標籤的分頁數據
     *
     * @param pageUtil
     * @return
     */
    PageResult getBlogTagPage(PageQueryUtil pageUtil);

    int getTotalTags();

    Boolean saveTag(String tagName);

    Boolean deleteBatch(Integer[] ids);

    List<BlogTagCount> getBlogTagCountForIndex();
}
