package com.netcourse.entity;
// Generated Dec 27, 2016 8:45:42 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import com.netcourse.util.MD5;

/**
 * User generated by hbm2java
 */
public class User  implements java.io.Serializable {


    private Integer UId;
    private String userName;
    private String email;
    private String password;
    private Date birth;
    private String phone;
    private String country;
    private Set<Course> courses=new HashSet<>();
    
    public Set<Course> getCourses() {
        return courses;
    }
    
    public void setCourses(Set<Course> courses) {
        this.courses = courses;
    }
    
    public User() {
    }

	
    public User(String userName, String email, String password, String phone, String country) {
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.country = country;
    }
    public User(String userName, String email, String password, Date birth, String phone, String country) {
       this.userName = userName;
       this.email = email;
       this.password = password;
       this.birth = birth;
       this.phone = phone;
       this.country = country;
    }
   
    public Integer getUId() {
        return this.UId;
    }
    
    public void setUId(Integer UId) {
        this.UId = UId;
    }
    public String getUserName() {
        return this.userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public Date getBirth() {
        return this.birth;
    }
    
    public void setBirth(Date birth) {
        this.birth = birth;
    }
    public String getPhone() {
        return this.phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getCountry() {
        return this.country;
    }
    
    public void setCountry(String country) {
        this.country = country;
    }




}


