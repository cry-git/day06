package cn.jiyun.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.jiyun.pojo.Clazz;
import cn.jiyun.pojo.Student;

public interface StuMapper {

	List<Student> findAll();

	List<Clazz> findClazz();

	int addStu(Student stu);

	int updateStu(Student stu);

	int delStu(@Param("ids")Integer[] ids);

}
