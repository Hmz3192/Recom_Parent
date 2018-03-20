package com.zjnu.service;

import com.zjnu.model.User;

import java.util.List;

public interface UserService {

    User getOneById(Long id);

    List<User> getVip();

    List<User> getCommon();

}
