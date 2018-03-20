package com.zjnu.service;

import com.zjnu.model.User;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/3/16.
 */
public interface UserService {

    User getOneByName(String name);

    User getUserById(Long userId);

}
