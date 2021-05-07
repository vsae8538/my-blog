package com.github.vsae.blog.core.service;

import com.github.vsae.blog.core.entity.AdminUser;

public interface AdminUserService {

    AdminUser login(String userName, String password);

    /**
     * 獲取用戶信息
     *
     * @param loginUserId
     * @return
     */
    AdminUser getUserDetailById(Integer loginUserId);

    /**
     * 修改當前登錄用戶的密碼
     *
     * @param loginUserId
     * @param originalPassword
     * @param newPassword
     * @return
     */
    Boolean updatePassword(Integer loginUserId, String originalPassword, String newPassword);

    /**
     * 修改當前登錄用戶的名稱信息
     *
     * @param loginUserId
     * @param loginUserName
     * @param nickName
     * @return
     */
    Boolean updateName(Integer loginUserId, String loginUserName, String nickName);

}
