-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.1.18-MariaDB - mariadb.org binary distribution
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 niit 的数据库结构
CREATE DATABASE IF NOT EXISTS `niit` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `niit`;


-- 导出  表 niit.course 结构
CREATE TABLE IF NOT EXISTS `course` (
  `course_name` varchar(50) NOT NULL,
  `course_number` int(11) NOT NULL,
  `course_intro` varchar(500) NOT NULL,
  `course_list` varchar(500) NOT NULL,
  PRIMARY KEY (`course_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  niit.course 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` (`course_name`, `course_number`, `course_intro`, `course_list`) VALUES
	('C#', 9, 'C# 是一个简单的、现代的、通用的、面向对象的编程语言，它是由微软（Microsoft）开发的。\r\n本教程将告诉您基础的 C# 编程，同时将向您讲解 C# 编程语言相关的各种先进理念。', 'C# 简介,C# 程序结构,C# 基本语法,C# 数据类型,C# 类型转换,C# 运算符,C# 循环,C# 封装,C# 方法'),
	('C++', 9, 'C++ 是一种中级语言，它是由 Bjarne Stroustrup 于 1979 年在贝尔实验室开始设计开发的。C++ 进一步扩充和完善了 C 语言，是一种面向对象的程序设计语言。C++ 可运行于多种平台上，如 Windows、MAC 操作系统以及 UNIX 的各种版本。\r\n本教程通过通俗易懂的语言来讲解 C++ 编程语言。', 'C++ 简介,C++ 基础语法,C++ 数据类型,C++ 变量类型,C++ 变量作用域,C++ 存储类,C++ 运算符,C++ 循环,C++ 函数'),
	('Java', 9, 'Java 是由Sun Microsystems公司于1995年5月推出的高级程序设计语言。\r\nJava可运行于多个平台，如Windows, Mac OS，及其他多种UNIX版本的系统。\r\n本教程通过简单的实例将让大家更好的了解JAVA编程语言。', 'Java 简介,Java 基础语法,Java 对象和类,Java 基本数据类型,Java 变量类型,Java 循环结构,Java 分支结构,Java 方法,Java 异常处理'),
	('jQuery', 9, 'jQuery 是一个 JavaScript 库。\r\njQuery 极大地简化了 JavaScript 编程。\r\njQuery 很容易学习。', 'jQuery 简介,jQuery 语法,jQuery 选择器,jQuery 事件,jQuery 效果,jQuery - 获取内容和属性,jQuery - 设置内容和属性,jQuery 遍历,jQuery - AJAX 简介'),
	('Node.js', 9, '简单的说 Node.js 就是运行在服务端的 JavaScript。\r\nNode.js 是一个基于Chrome JavaScript 运行时建立的一个平台。\r\nNode.js是一个事件驱动I/O服务端JavaScript环境，基于Google的V8引擎，V8引擎执行Javascript的速度非常快，性能非常好。', 'Node.js 安装配置,Node.js 创建第一个应用,NPM 使用介绍,Node.js REPL(交互式解释器),Node.js 回调函数,Node.js 事件循环,Node.js模块系统,Node.js 路由,Node.js 函数'),
	('Python', 9, 'Python（蟒蛇）是一种动态解释型的编程语言。Python可以在Windows、UNIX、MAC等多种操作系统上使用，也可以在Java、.NET开发平台上使用。', 'Python 简介,Python 基础语法,Python 变量类型,Python 条件语句,Python 循环语句,Python 字符串,Python 列表(List),Python 元组,Python 字典(Dictionary)');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;


-- 导出  表 niit.exam 结构
CREATE TABLE IF NOT EXISTS `exam` (
  `course_name` varchar(50) NOT NULL,
  `problem` mediumtext NOT NULL,
  `answer` text NOT NULL,
  PRIMARY KEY (`course_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  niit.exam 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` (`course_name`, `problem`, `answer`) VALUES
	('C#', '下列的各类函数中，哪个不是类的成员函数p||p构造函数p||p析构函数p||p友元函数p||p拷贝初始化构造函数p||p作用域运算符"::"的功能是p||p标识作用域的级别的p||p指出作用域的范围的p||p给定作用域的大小的p||p标识成员是属于哪个类的p||p下列选项中，什么是不正确的p||p名空间是为了支持大规模程序的逻辑设计、排解名字冲突应运而生的p||p名空间定义的关键词为typenamep||p名空间定义的关键词为namespacep||p因为程序是跨文件的，所以名空间也是跨文件的p||p什么是析构函数的特征。p||p一个类中只能定义一个析构函数p||p析构函数名与类名不同p||p析构函数的定义只能在类体内p||p析构函数可以有一个或多个参数p||p下述静态数据成员的特性中，哪个是错误的。p||p说明静态数据成员时前边要加修饰符staticp||p静态数据成员要在类体外进行初始化p||p引用静态数据成员时，要在静态数据成员前加<类名>和作用域运算符p||p静态数据成员不是所有对象所共用的p||p已知fl(int)是类A的公有成员函数，P是指向成员函数f1()的指针，采用什么是正确的。p||pp=fl;p||pP=A::f1;p||pP=A::fl();p||pP=f1();p||p友元关系不能p||p是类是与类的关系p||p是一个类成员函数与另一个类的关系p||p继承p||p提高程序的运行效率p||p下列关于对象数组的描述中，哪个是错的p||p对象数组的下标是从0开始的p||p对象数组的数组名是一个常量指针p||p对象数组的每个元素是同一个类的对象p||p对象数组只能赋初值，而不能被赋值p||p下列说明中 const char *ptr; ptr应该是什么p||p指向字符常量的指针p||p指向字符的常量指针p||p指向字符串常量的指针p||p指向字符串的常量指针p||p已知：print()函数是一个类的常成员函数，它无返回值，下列表示中，哪个是正确的。p||pvoid print()const;p||pconst void print();p||pvoid const print();p||pvoid print(const);', 'C,D,B,A,D,B,C,D,C,A'),
	('C++', '下列的各类函数中，哪个不是类的成员函数p||p构造函数p||p析构函数p||p友元函数p||p拷贝初始化构造函数p||p作用域运算符"::"的功能是p||p标识作用域的级别的p||p指出作用域的范围的p||p给定作用域的大小的p||p标识成员是属于哪个类的p||p下列选项中，什么是不正确的p||p名空间是为了支持大规模程序的逻辑设计、排解名字冲突应运而生的p||p名空间定义的关键词为typenamep||p名空间定义的关键词为namespacep||p因为程序是跨文件的，所以名空间也是跨文件的p||p什么是析构函数的特征。p||p一个类中只能定义一个析构函数p||p析构函数名与类名不同p||p析构函数的定义只能在类体内p||p析构函数可以有一个或多个参数p||p下述静态数据成员的特性中，哪个是错误的。p||p说明静态数据成员时前边要加修饰符staticp||p静态数据成员要在类体外进行初始化p||p引用静态数据成员时，要在静态数据成员前加<类名>和作用域运算符p||p静态数据成员不是所有对象所共用的p||p已知fl(int)是类A的公有成员函数，P是指向成员函数f1()的指针，采用什么是正确的。p||pp=fl;p||pP=A::f1;p||pP=A::fl();p||pP=f1();p||p友元关系不能p||p是类是与类的关系p||p是一个类成员函数与另一个类的关系p||p继承p||p提高程序的运行效率p||p下列关于对象数组的描述中，哪个是错的p||p对象数组的下标是从0开始的p||p对象数组的数组名是一个常量指针p||p对象数组的每个元素是同一个类的对象p||p对象数组只能赋初值，而不能被赋值p||p下列说明中 const char *ptr; ptr应该是什么p||p指向字符常量的指针p||p指向字符的常量指针p||p指向字符串常量的指针p||p指向字符串的常量指针p||p已知：print()函数是一个类的常成员函数，它无返回值，下列表示中，哪个是正确的。p||pvoid print()const;p||pconst void print();p||pvoid const print();p||pvoid print(const);', 'C,D,B,A,D,B,C,D,C,A'),
	('Java', '下列的各类函数中，哪个不是类的成员函数p||p构造函数p||p析构函数p||p友元函数p||p拷贝初始化构造函数p||p作用域运算符"::"的功能是p||p标识作用域的级别的p||p指出作用域的范围的p||p给定作用域的大小的p||p标识成员是属于哪个类的p||p下列选项中，什么是不正确的p||p名空间是为了支持大规模程序的逻辑设计、排解名字冲突应运而生的p||p名空间定义的关键词为typenamep||p名空间定义的关键词为namespacep||p因为程序是跨文件的，所以名空间也是跨文件的p||p什么是析构函数的特征。p||p一个类中只能定义一个析构函数p||p析构函数名与类名不同p||p析构函数的定义只能在类体内p||p析构函数可以有一个或多个参数p||p下述静态数据成员的特性中，哪个是错误的。p||p说明静态数据成员时前边要加修饰符staticp||p静态数据成员要在类体外进行初始化p||p引用静态数据成员时，要在静态数据成员前加<类名>和作用域运算符p||p静态数据成员不是所有对象所共用的p||p已知fl(int)是类A的公有成员函数，P是指向成员函数f1()的指针，采用什么是正确的。p||pp=fl;p||pP=A::f1;p||pP=A::fl();p||pP=f1();p||p友元关系不能p||p是类是与类的关系p||p是一个类成员函数与另一个类的关系p||p继承p||p提高程序的运行效率p||p下列关于对象数组的描述中，哪个是错的p||p对象数组的下标是从0开始的p||p对象数组的数组名是一个常量指针p||p对象数组的每个元素是同一个类的对象p||p对象数组只能赋初值，而不能被赋值p||p下列说明中 const char *ptr; ptr应该是什么p||p指向字符常量的指针p||p指向字符的常量指针p||p指向字符串常量的指针p||p指向字符串的常量指针p||p已知：print()函数是一个类的常成员函数，它无返回值，下列表示中，哪个是正确的。p||pvoid print()const;p||pconst void print();p||pvoid const print();p||pvoid print(const);', 'C,D,B,A,D,B,C,D,C,A'),
	('jQuery', '下列的各类函数中，哪个不是类的成员函数p||p构造函数p||p析构函数p||p友元函数p||p拷贝初始化构造函数p||p作用域运算符"::"的功能是p||p标识作用域的级别的p||p指出作用域的范围的p||p给定作用域的大小的p||p标识成员是属于哪个类的p||p下列选项中，什么是不正确的p||p名空间是为了支持大规模程序的逻辑设计、排解名字冲突应运而生的p||p名空间定义的关键词为typenamep||p名空间定义的关键词为namespacep||p因为程序是跨文件的，所以名空间也是跨文件的p||p什么是析构函数的特征。p||p一个类中只能定义一个析构函数p||p析构函数名与类名不同p||p析构函数的定义只能在类体内p||p析构函数可以有一个或多个参数p||p下述静态数据成员的特性中，哪个是错误的。p||p说明静态数据成员时前边要加修饰符staticp||p静态数据成员要在类体外进行初始化p||p引用静态数据成员时，要在静态数据成员前加<类名>和作用域运算符p||p静态数据成员不是所有对象所共用的p||p已知fl(int)是类A的公有成员函数，P是指向成员函数f1()的指针，采用什么是正确的。p||pp=fl;p||pP=A::f1;p||pP=A::fl();p||pP=f1();p||p友元关系不能p||p是类是与类的关系p||p是一个类成员函数与另一个类的关系p||p继承p||p提高程序的运行效率p||p下列关于对象数组的描述中，哪个是错的p||p对象数组的下标是从0开始的p||p对象数组的数组名是一个常量指针p||p对象数组的每个元素是同一个类的对象p||p对象数组只能赋初值，而不能被赋值p||p下列说明中 const char *ptr; ptr应该是什么p||p指向字符常量的指针p||p指向字符的常量指针p||p指向字符串常量的指针p||p指向字符串的常量指针p||p已知：print()函数是一个类的常成员函数，它无返回值，下列表示中，哪个是正确的。p||pvoid print()const;p||pconst void print();p||pvoid const print();p||pvoid print(const);', 'C,D,B,A,D,B,C,D,C,A'),
	('Node.js', '下列的各类函数中，哪个不是类的成员函数p||p构造函数p||p析构函数p||p友元函数p||p拷贝初始化构造函数p||p作用域运算符"::"的功能是p||p标识作用域的级别的p||p指出作用域的范围的p||p给定作用域的大小的p||p标识成员是属于哪个类的p||p下列选项中，什么是不正确的p||p名空间是为了支持大规模程序的逻辑设计、排解名字冲突应运而生的p||p名空间定义的关键词为typenamep||p名空间定义的关键词为namespacep||p因为程序是跨文件的，所以名空间也是跨文件的p||p什么是析构函数的特征。p||p一个类中只能定义一个析构函数p||p析构函数名与类名不同p||p析构函数的定义只能在类体内p||p析构函数可以有一个或多个参数p||p下述静态数据成员的特性中，哪个是错误的。p||p说明静态数据成员时前边要加修饰符staticp||p静态数据成员要在类体外进行初始化p||p引用静态数据成员时，要在静态数据成员前加<类名>和作用域运算符p||p静态数据成员不是所有对象所共用的p||p已知fl(int)是类A的公有成员函数，P是指向成员函数f1()的指针，采用什么是正确的。p||pp=fl;p||pP=A::f1;p||pP=A::fl();p||pP=f1();p||p友元关系不能p||p是类是与类的关系p||p是一个类成员函数与另一个类的关系p||p继承p||p提高程序的运行效率p||p下列关于对象数组的描述中，哪个是错的p||p对象数组的下标是从0开始的p||p对象数组的数组名是一个常量指针p||p对象数组的每个元素是同一个类的对象p||p对象数组只能赋初值，而不能被赋值p||p下列说明中 const char *ptr; ptr应该是什么p||p指向字符常量的指针p||p指向字符的常量指针p||p指向字符串常量的指针p||p指向字符串的常量指针p||p已知：print()函数是一个类的常成员函数，它无返回值，下列表示中，哪个是正确的。p||pvoid print()const;p||pconst void print();p||pvoid const print();p||pvoid print(const);', 'C,D,B,A,D,B,C,D,C,A'),
	('Python', '下列的各类函数中，哪个不是类的成员函数p||p构造函数p||p析构函数p||p友元函数p||p拷贝初始化构造函数p||p作用域运算符"::"的功能是p||p标识作用域的级别的p||p指出作用域的范围的p||p给定作用域的大小的p||p标识成员是属于哪个类的p||p下列选项中，什么是不正确的p||p名空间是为了支持大规模程序的逻辑设计、排解名字冲突应运而生的p||p名空间定义的关键词为typenamep||p名空间定义的关键词为namespacep||p因为程序是跨文件的，所以名空间也是跨文件的p||p什么是析构函数的特征。p||p一个类中只能定义一个析构函数p||p析构函数名与类名不同p||p析构函数的定义只能在类体内p||p析构函数可以有一个或多个参数p||p下述静态数据成员的特性中，哪个是错误的。p||p说明静态数据成员时前边要加修饰符staticp||p静态数据成员要在类体外进行初始化p||p引用静态数据成员时，要在静态数据成员前加<类名>和作用域运算符p||p静态数据成员不是所有对象所共用的p||p已知fl(int)是类A的公有成员函数，P是指向成员函数f1()的指针，采用什么是正确的。p||pp=fl;p||pP=A::f1;p||pP=A::fl();p||pP=f1();p||p友元关系不能p||p是类是与类的关系p||p是一个类成员函数与另一个类的关系p||p继承p||p提高程序的运行效率p||p下列关于对象数组的描述中，哪个是错的p||p对象数组的下标是从0开始的p||p对象数组的数组名是一个常量指针p||p对象数组的每个元素是同一个类的对象p||p对象数组只能赋初值，而不能被赋值p||p下列说明中 const char *ptr; ptr应该是什么p||p指向字符常量的指针p||p指向字符的常量指针p||p指向字符串常量的指针p||p指向字符串的常量指针p||p已知：print()函数是一个类的常成员函数，它无返回值，下列表示中，哪个是正确的。p||pvoid print()const;p||pconst void print();p||pvoid const print();p||pvoid print(const);', 'C,D,B,A,D,B,C,D,C,A');
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;


-- 导出  表 niit.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `user_name` varchar(35) NOT NULL,
  `password` varchar(35) NOT NULL,
  `phone_number` varchar(16) DEFAULT NULL,
  `birthday` varchar(16) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `email_id` varchar(50) NOT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  niit.user 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_name`, `password`, `phone_number`, `birthday`, `country`, `email_id`) VALUES
	('aaaaaa', 'aaaaaa', '', '', 'null', 'aaaaa@qq.com'),
	('aaaaaaa', 'aaaaaa', '', '', 'null', 'aaaaa@qq.com'),
	('aaaaaaaa', 'aaaaaa', '', '', 'null', 'aaaaa@qq.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- 导出  表 niit.user_rel_course 结构
CREATE TABLE IF NOT EXISTS `user_rel_course` (
  `user_name` varchar(35) NOT NULL,
  `learned` int(11) DEFAULT '0',
  `course_name` varchar(50) NOT NULL,
  `score` double NOT NULL DEFAULT '-1',
  PRIMARY KEY (`user_name`,`course_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  niit.user_rel_course 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `user_rel_course` DISABLE KEYS */;
INSERT INTO `user_rel_course` (`user_name`, `learned`, `course_name`, `score`) VALUES
	('aaaaaa', 9, 'C#', 20),
	('aaaaaa', 9, 'C++', -1),
	('aaaaaa', 0, 'Java', -1),
	('aaaaaa', 0, 'jQuery', -1),
	('aaaaaa', 9, 'Node.js', -1),
	('aaaaaa', 0, 'Python', -1);
/*!40000 ALTER TABLE `user_rel_course` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
