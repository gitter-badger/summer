/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.richeninfo.summer.quickstart.service.account;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.richeninfo.summer.commons.utils.Clock;
import com.richeninfo.summer.commons.utils.Digests;
import com.richeninfo.summer.commons.utils.Encodes;
import com.richeninfo.summer.quickstart.entity.User;
import com.richeninfo.summer.quickstart.repository.TaskDao;
import com.richeninfo.summer.quickstart.repository.UserDao;
import com.richeninfo.summer.quickstart.service.ServiceException;
import com.richeninfo.summer.quickstart.service.account.ShiroDbRealm.ShiroUser;

/**
 * 用户管理类.
 * 
 * @author calvin
 */
// Spring Service Bean的标识.
@Component
@Transactional
public class AccountService {

  public static final String HASH_ALGORITHM = "SHA-1";
  public static final int HASH_INTERATIONS = 1024;
  private static final int SALT_SIZE = 8;

  private static Logger logger = LoggerFactory.getLogger(AccountService.class);

  private UserDao userDao;
  private TaskDao taskDao;
  private Clock clock = Clock.DEFAULT;

  public void deleteUser(Long id) {
    if (isSupervisor(id)) {
      logger.warn("操作员{}尝试删除超级管理员用户", getCurrentUserName());
      throw new ServiceException("不能删除超级管理员用户");
    }
    userDao.delete(id);
    taskDao.deleteByUserId(id);

  }

  /**
   * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
   */
  private void entryptPassword(User user) {
    byte[] salt = Digests.generateSalt(SALT_SIZE);
    user.setSalt(Encodes.encodeHex(salt));

    byte[] hashPassword = Digests.sha1(user.getPlainPassword().getBytes(), salt, HASH_INTERATIONS);
    user.setPassword(Encodes.encodeHex(hashPassword));
  }

  public User findUserByLoginName(String loginName) {
    return userDao.findByLoginName(loginName);
  }

  public List<User> getAllUser() {
    return (List<User>) userDao.findAll();
  }

  /**
   * 取出Shiro中的当前用户LoginName.
   */
  private String getCurrentUserName() {
    ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
    return user.loginName;
  }

  public User getUser(Long id) {
    return userDao.findOne(id);
  }

  /**
   * 判断是否超级管理员.
   */
  private boolean isSupervisor(Long id) {
    return id == 1;
  }

  public void registerUser(User user) {
    entryptPassword(user);
    user.setRoles("user");
    user.setRegisterDate(clock.getCurrentDate());

    userDao.save(user);

    logger.info(user + "注册成功!");
  }

  public void setClock(Clock clock) {
    this.clock = clock;
  }

  @Autowired
  public void setTaskDao(TaskDao taskDao) {
    this.taskDao = taskDao;
  }

  @Autowired
  public void setUserDao(UserDao userDao) {
    this.userDao = userDao;
  }

  public void updateUser(User user) {
    if (StringUtils.isNotBlank(user.getPlainPassword())) {
      entryptPassword(user);
    }
    userDao.save(user);
  }
}
