package net.antra.deptemp.controller;

import net.antra.deptemp.pojo.EmployeeVO;
import net.antra.deptemp.pojo.validator.EmpvoValidator;
import net.antra.deptemp.service.CodeService;
import net.antra.deptemp.service.DepartmentService;
import net.antra.deptemp.utility.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import net.antra.deptemp.service.EmployeeService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class EmpController {
	
	@Autowired
	private EmployeeService ems;

	@Autowired
	private EmpvoValidator validator;

	@Autowired
	private DepartmentService deptService;

	@Autowired
	CodeService codeService;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
		binder.registerCustomEditor( Date.class, new CustomDateEditor( new SimpleDateFormat( "MM/dd/yyyy"), true ));
		binder.registerCustomEditor( String.class, new StringTrimmerEditor( true ));
	}

	@RequestMapping("/manageEmp")
	public String manageEmp(ModelMap model) {
		model.addAttribute("active_tab","manage_emp");
		model.addAttribute("employeeList", ems.loadEmpBasicInfo());
		return "manage_emp";
	}

	@GetMapping("/createEmp")          //这里似乎自动生成一个emp bean 用来对应表中的数据以及post之后的entity
	public String showCreateEmp(ModelMap model, @ModelAttribute("emp") EmployeeVO emp) {  //这里最初是用EmployeeVO来作为数据载体的emp 是开发者给的名字
		model.addAttribute("active_tab","new_emp");
//		                                                                           类型是在code表里面的，下面那个参数是TYPE
		model.addAttribute("statusCodeList", codeService.getCodeByType(Constants.EMP_STATUS));
		model.addAttribute("deptList", deptService.loadDeptBasicInfo());
	emp.setFirstName("HELLO"); //emp.setFirstName 是调用了类EmployeeVO内部的函数
		return "createEmp";
	}

	@PostMapping("/createEmp")                                                              //这里新生成的两个东西干什么用？
	public String createDept(ModelMap model, @ModelAttribute("emp") @Valid EmployeeVO emp, BindingResult br, RedirectAttributes rediAtrb) {
		if(!br.hasErrors()) {//可能是对输入的VO 是否符合标准进行自动判定，如果符合 那就存进去。
			ems.saveEmployee(emp);  //这里把EmployeeVO 往service 里放 然后在service里再把VO转化成真的Entity.
			rediAtrb.addFlashAttribute("successMsg", "The Employee is Created Successfully!");//这里只是加成功注释。并返回main
			return "redirect:/main";
		}else {//如果不符合，依然保留emp状态，但是就不存进去了。
			model.addAttribute("statusCodeList", codeService.getCodeByType(Constants.EMP_STATUS));
			return "createEmp";
		}
	}
}
