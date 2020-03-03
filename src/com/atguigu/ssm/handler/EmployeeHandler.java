package com.atguigu.ssm.handler;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.atguigu.ssm.beans.Employee;
import com.atguigu.ssm.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class EmployeeHandler {
	
	@Autowired
	private EmployeeService employeeService; 
	
	/**
	 * 查询所有的员工信息
	 */
	@RequestMapping(value="/emps/{pageNum}",method=RequestMethod.GET)
	public String  selectEmps(@PathVariable("pageNum")Integer pageNum,Map<String,Object> map ) {
		
		//设置分页信息
		PageHelper.startPage(pageNum,1);
		//查询所有的员工信息
		List<Employee> emps = employeeService.selectAllEmps();
		
		//获取PageInfo对象
		PageInfo<Employee> info  = new PageInfo<Employee>(emps,5);
		
		map.put("emps", emps);
		
		map.put("info", info);
		
		return "list";
	}
}
