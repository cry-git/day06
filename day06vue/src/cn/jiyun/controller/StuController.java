package cn.jiyun.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jiyun.pojo.Clazz;
import cn.jiyun.pojo.Student;
import cn.jiyun.service.StuService;

@Controller
public class StuController {
	
	@Autowired
	private StuService ss;
	
	@RequestMapping("toShow")
	public String toShow(){
		return "show";
	}
	
	@RequestMapping("findAll")
	@ResponseBody
	public List<Student> findAll(){
		List<Student> list  = ss.findAll();
		System.out.println(list);
		return list;
	}
	
	//跳转添加页面
	@RequestMapping("toAdd")
	public String toAdd(){
		return "add";
	}
	//查询班级列表findClazz
	
	@ResponseBody
	@RequestMapping("findClazz")
	public List<Clazz> findClazz(){
		List<Clazz> cList = ss.findClazz();
		return cList;
	}
	//添加
	@ResponseBody
	@RequestMapping("addStu")
	public int addStu(@RequestBody Student stu){
		int i = ss.addStu(stu);
		System.out.println(i);
		return i;
	}
	
	//修改
	@ResponseBody
	@RequestMapping("updateStu")
	public int updateStu(@RequestBody Student stu){
		int i = ss.updateStu(stu);
		return i;
	}
	
	
	//删除
	@ResponseBody
	@RequestMapping("delStu")
	public int delStu(@RequestBody Integer[] ids){
		int i = ss.delStu(ids);
		return i;
	}


}
