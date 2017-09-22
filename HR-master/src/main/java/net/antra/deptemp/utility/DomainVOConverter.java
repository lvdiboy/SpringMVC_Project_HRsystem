package net.antra.deptemp.utility;

import net.antra.deptemp.dao.DepartmentDAO;
import net.antra.deptemp.entity.Department;
import net.antra.deptemp.entity.DeptEmpCode;
import net.antra.deptemp.entity.Employee;
import net.antra.deptemp.pojo.DepartmentVO;
import net.antra.deptemp.pojo.EmployeeVO;

public class DomainVOConverter {
    public static Employee convertEmpVOtoEmp(EmployeeVO empVO) {
        Employee employee = new Employee();
        employee.setAddress(empVO.getAddress());
        employee.setContact(empVO.getEmail());
        employee.setFirstName(empVO.getFirstName());
        employee.setEmail(empVO.getEmail());
        employee.setLastName(empVO.getLastName());
        employee.setStatus(new DeptEmpCode(empVO.getStatusId()));
        employee.setDepartment(new Department(empVO.getDeptId()));
        return employee;
    }

    public static Department convertDeptVOtoDomain(DepartmentVO vo) {
        Department dept = new Department();
        dept.setName(vo.getName());
        dept.setEmail(vo.getEmail());
        dept.setContact(vo.getPhone());
        dept.setDesc(vo.getDesc());
        dept.setStatus(new DeptEmpCode(vo.getStatusId()));
        return dept;
    }
}
