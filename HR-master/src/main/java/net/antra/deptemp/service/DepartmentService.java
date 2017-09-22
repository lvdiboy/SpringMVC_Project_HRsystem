package net.antra.deptemp.service;

import java.util.List;

import net.antra.deptemp.entity.Department;
import net.antra.deptemp.pojo.DepartmentVO;

public interface DepartmentService {
	public void saveDept(DepartmentVO dept);

	public List<Department> loadDeptDetails();

	public List<Department> loadDeptBasicInfo();

}
