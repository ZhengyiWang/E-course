/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.netcourse.dao;

import com.netcourse.entity.User;
import com.netcourse.util.HibernateUtil;
import com.netcourse.util.MD5;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author vinson
 */
public class UserDao {

    private Transaction transaction;
    MD5 md5 = new MD5();

    // 登录查询
    public User login(String user, String pwd) {
        Session session = null;
        pwd = md5.getMD5(pwd);
        try {
            if (user != null && pwd != null) {
                session = HibernateUtil.getSession();
                // hql语句的字段(及其大小写)以User实体类为准
                // hql where = ' x '  (必须使用 ' )
                Query query = (Query) session.createQuery("from User as a where a.userName=:uname and a.password=:pass");
                query.setString("uname", user);
                query.setString("pass", pwd);
                List<User> list = (List<User>) query.list();
                if (!list.isEmpty()) {
                    return list.get(0);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    // 用户注册
    public boolean reg(User user) {
        Session session = null;
        try {
            session = HibernateUtil.getSession();
            Transaction trans = session.beginTransaction();
            session.save(user);
            trans.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public void useriD() {
        Session session = HibernateUtil.getSession();
        // hql语句的字段(及其大小写)以User实体类为准
        // hql where = ' x '  (必须使用 ' )
        Criteria criteria = session.createCriteria(User.class);
        criteria.add(Restrictions.eq("userName", "vinson"));
//        List userList = criteria.list();
        System.out.println(criteria.list().toArray());
    }

}
