package net.antra.deptemp.service;

import java.util.List;

import net.antra.deptemp.pojo.EmployeeVO;
import net.antra.deptemp.utility.DomainVOConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.antra.deptemp.dao.EmployeeDAO;
import net.antra.deptemp.entity.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	EmployeeDAO empDAO;

	@Override
	public List<Employee> loadEmpBasicInfo() {
		return empDAO.getEmployeeList();
	}

	@Override
	public Employee getEmpById(int id) {
		return empDAO.findOne(id);
	}

	@Override
	public void saveEmployee(EmployeeVO empVO) {
		//那么为什么要在中间加VO呢？ 为了进行validate 判定？
		Employee emp = DomainVOConverter.convertEmpVOtoEmp(empVO);
		empDAO.save(emp);
	}

}
