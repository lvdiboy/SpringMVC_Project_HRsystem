package test;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import net.antra.deptemp.entity.Employee;
import net.antra.deptemp.service.EmployeeService;

@SpringBootTest
public class TestEmp {
	@Autowired
	EmployeeService empService;
	
	
	@Test
	public void testEmpService(){
		Employee emp = empService.getEmpById(1);
		System.out.println(emp.getFirstName());
		System.out.println(emp.getAge());
		assertTrue(emp != null);
	}
}
