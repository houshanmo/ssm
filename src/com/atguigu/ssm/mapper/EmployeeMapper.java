package com.atguigu.ssm.mapper;

import java.util.List;

import com.atguigu.ssm.beans.Employee;

public interface EmployeeMapper {
	
	//查询所有员工信息
	public  List<Employee> selectAllEmps();
}
