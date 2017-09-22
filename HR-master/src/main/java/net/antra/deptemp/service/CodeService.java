package net.antra.deptemp.service;

import net.antra.deptemp.entity.DeptEmpCode;

import java.util.List;

public interface CodeService {
    public List<DeptEmpCode> getCodeByType(String type);

    public DeptEmpCode getCodeById(int id);
}
