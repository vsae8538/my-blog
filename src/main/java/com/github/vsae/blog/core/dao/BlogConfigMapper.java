package com.github.vsae.blog.core.dao;

import com.github.vsae.blog.core.entity.BlogConfig;

import java.util.List;

public interface BlogConfigMapper {
    List<BlogConfig> selectAll();

    BlogConfig selectByPrimaryKey(String configName);

    int updateByPrimaryKeySelective(BlogConfig record);

}