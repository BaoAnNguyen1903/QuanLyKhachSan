package com.example.QuanLyKhachSan.model.entity.User;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class User {
    // uid int auto_increment primary key,
    // name varchar(64),
    // dob date,
    // gender char,
    // phone varchar(16),
    // email varchar(50),
    // username varchar(64),
    // password varchar(128),
    // avatar text,
    // role varchar(1)
    private int uid;
    private String name;
    private Date dob;
    private String gender;
    private String phone;
    private String email;
    private String username;
    private String password;
    private String avatar;
    private String role;
}
