package com.github.vsae.blog.core.service;

import com.github.vsae.blog.core.entity.BlogLink;
import com.github.vsae.blog.core.util.PageQueryUtil;
import com.github.vsae.blog.core.util.PageResult;

import java.util.List;
import java.util.Map;

public interface LinkService {
    /**
     * 查詢友鏈的分頁數據
     *
     * @param pageUtil
     * @return
     */
    PageResult getBlogLinkPage(PageQueryUtil pageUtil);

    int getTotalLinks();

    Boolean saveLink(BlogLink link);

    BlogLink selectById(Integer id);

    Boolean updateLink(BlogLink tempLink);

    Boolean deleteBatch(Integer[] ids);

    /**
     * 返回友鏈頁面所需的所有數據
     *
     * @return
     */
    Map<Byte, List<BlogLink>> getLinksForLinkPage();
}
