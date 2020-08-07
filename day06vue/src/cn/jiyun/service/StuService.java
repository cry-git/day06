package cn.jiyun.service;

import java.util.List;

import cn.jiyun.pojo.Clazz;
import cn.jiyun.pojo.Student;

public interface StuService {

	List<Student> findAll();

	List<Clazz> findClazz();

	int addStu(Student stu);

	int updateStu(Student stu);

	int delStu(Integer[] ids);

}
