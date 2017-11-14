/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.netcourse.dao;

import com.netcourse.entity.Course;
import com.netcourse.entity.User;
import com.netcourse.util.HibernateUtil;
import com.netcourse.util.MD5;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
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
public class CourseDao {

    private Transaction transaction;

    // UserCourseCount
    public int userCourseCount(User user) {
        Session session = null;
        try {
            session = HibernateUtil.getSession();
            User u = (User) session.load(User.class, user.getUId());
            return u.getCourses().size();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return 0;
    }

    // CourseCount
    public int courseCount() {
        Session session = null;
        try {
            session = HibernateUtil.getSession();
            Query query = session.createQuery("from Course");
            return query.list().size();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return 0;
    }

    // UserCourseCount
    public List showUserCourse(User user) {
        Session session = null;
        List<Course> courses_list = new ArrayList<Course>();
        try {
            session = HibernateUtil.getSession();
            User u = (User) session.load(User.class, user.getUId());
            courses_list = new ArrayList(u.getCourses());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return courses_list;
    }

    // UserCourseCount
    public List showCourse() {
        Session session = null;
        List<Course> courses_list = new ArrayList<Course>();
        try {
            session = HibernateUtil.getSession();
            Query courses = session.createQuery("from Course");
            courses_list = (List<Course>) courses.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return courses_list;
    }
}
