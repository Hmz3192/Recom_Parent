package com.zjnu.service.impl;

import com.zjnu.dao.UserMapper;
import com.zjnu.model.User;
import com.zjnu.model.UserExample;
import com.zjnu.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;


    @Override
    public User getOneById(Long id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<User> getVip() {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andVipNotEqualTo(0);
        example.setOrderByClause("vip DESC");
        List<User> users = userMapper.selectByExample(example);
        return users;

    }

    @Override
    public List<User> getCommon() {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andVipEqualTo(0);
        List<User> users = userMapper.selectByExample(example);
        return users;
    }
}
