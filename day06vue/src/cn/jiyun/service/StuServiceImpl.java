package cn.jiyun.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jiyun.mapper.StuMapper;
import cn.jiyun.pojo.Clazz;
import cn.jiyun.pojo.Student;

@Service
public class StuServiceImpl implements StuService {

	@Autowired
	private StuMapper sm;
	public List<Student> findAll() {
		// TODO Auto-generated method stub
		List<Student> list = sm.findAll();
		return list;
	}
	//查询班级列表
	public List<Clazz> findClazz() {
		// TODO Auto-generated method stub
		List<Clazz> clist = sm.findClazz();
		return clist;
	}
	
	//添加
	public int addStu(Student stu) {
		// TODO Auto-generated method stub
		int i = sm.addStu(stu);
		return i;
	}
	public int updateStu(Student stu) {
		// TODO Auto-generated method stub
		int i = sm.updateStu(stu);
		return i;
	}
	//删除
	public int delStu(Integer[] ids) {
		// TODO Auto-generated method stub
		int i = sm.delStu(ids);
		return i;
	}

}
