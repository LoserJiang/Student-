# 高校教学管理系统 (Student Management System)

## 📚 项目简介

本项目是一个基于 **B/S 架构**的高校教学管理软件，采用 **MVC 设计模式**开发。系统涵盖专业管理、班级管理、学生管理、教师管理、课程管理、成绩管理等核心教学业务模块，支持管理员、教务员、教师、学生四类用户角色。

---

## ✨ 功能特性

### 👑 管理员 / 教务员
- 学生信息管理（增删改查）
- 教师信息管理（增删改查）
- 班级信息管理（增删改查）
- 专业信息管理（增删改查）
- 课程信息管理（增删改查）
- 成绩管理（录入、修改、查询、导出）
- 班级排课管理
- **📊 成绩统计分析**（按课程统计平均分、最高分、最低分、各分数段人数，并生成柱状图）

### 👨‍🏫 教师
- 查看课表
- 查看班级和学生信息
- 录入学生成绩

### 👨‍🎓 学生
- 查看课程信息
- 查询个人成绩
- 查看同班同学

---

## 🛠 技术栈

| 技术 | 说明 |
|------|------|
| **前端** | JSP + HTML + CSS + JavaScript + ECharts |
| **后端** | Servlet + JavaBean |
| **数据库** | MySQL 8.0.31 |
| **服务器** | Apache Tomcat 9.0 |
| **开发工具** | Eclipse IDE |
| **版本控制** | Git + GitHub |
| **项目管理** | Maven（手动管理 JAR 包） |

---

## 📁 项目结构
Student/
├── src/ # 源代码目录
│ ├── cla2sub/servlet/ # 班级课程控制器
│ ├── classes/servlet/ # 班级管理控制器
│ ├── dao/ # 数据访问层
│ ├── entity/ # 实体类（JavaBean）
│ ├── filter/ # 过滤器（编码、登录）
│ ├── login/servlet/ # 登录控制器
│ ├── major/servlet/ # 专业管理控制器
│ ├── score/servlet/ # 成绩管理控制器
│ │ ├── EditScoreServlet.java
│ │ ├── SearchScoreServlet.java
│ │ ├── ReportScoreServlet.java
│ │ └── ScoreStatServlet.java # ⭐ 新增：成绩统计分析
│ ├── student/servlet/ # 学生管理控制器
│ ├── subject/servlet/ # 课程管理控制器
│ ├── teacher/servlet/ # 教师管理控制器
│ └── util/ # 工具类（数据库连接）
├── WebRoot/ # Web 应用根目录
│ ├── css/ # 样式文件
│ ├── images/ # 图片资源
│ ├── js/ # JavaScript 文件
│ ├── pages/ # JSP 页面
│ │ ├── add_student.jsp
│ │ ├── search_student.jsp
│ │ ├── search_score.jsp
│ │ └── score_stat.jsp # ⭐ 新增：成绩统计分析页面
│ ├── WEB-INF/
│ │ ├── classes/ # 编译后的 .class 文件
│ │ ├── lib/ # 依赖 JAR 包
│ │ └── web.xml # Web 应用配置
│ └── login.jsp # 登录页面
└── database/ # 数据库脚本
└── student.sql # 数据库建表及初始数据

---

## 🚀 部署指南

### 1. 环境准备

- **JDK 1.8** 或更高版本
- **Apache Tomcat 9.0** 或更高版本
- **MySQL 8.0** 或更高版本
- **Eclipse IDE for Enterprise Java Developers**

### 2. 导入数据库

```sql
-- 创建数据库
CREATE DATABASE student CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 使用数据库
USE student;

-- 执行项目中的 database/student.sql 文件
SOURCE /path/to/database/student.sql;
3. 修改数据库连接配置
打开 src/util/DB.java，修改数据库连接信息：
String url = "jdbc:mysql://localhost:3306/student?characterEncoding=utf8&serverTimezone=Asia/Shanghai&useSSL=false";
String name = "root";        // 你的 MySQL 用户名
String pwd = "你的密码";      // 你的 MySQL 密码
4. 部署到 Tomcat

将项目导入 Eclipse

配置 Tomcat 服务器（右键 Servers → New → Server）

右键项目 → Run As → Run on Server
