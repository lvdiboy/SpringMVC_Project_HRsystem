package net.antra.deptemp.service;

import java.util.List;

import net.antra.deptemp.entity.Employee;
import net.antra.deptemp.pojo.EmployeeVO;

public interface EmployeeService {

	public List<Employee> loadEmpBasicInfo();

	public Employee getEmpById(int i);

    void saveEmployee(EmployeeVO emp);
}
