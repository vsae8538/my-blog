package com.github.vsae.blog.core.service;

import java.util.Map;

public interface ConfigService {
    /**
     * 修改配置項
     *
     * @param configName
     * @param configValue
     * @return
     */
    int updateConfig(String configName, String configValue);

    /**
     * 獲取所有的配置項
     *
     * @return
     */
    Map<String,String> getAllConfigs();
}
