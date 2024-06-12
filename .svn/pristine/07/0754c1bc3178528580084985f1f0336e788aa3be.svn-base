package com.greencycle.my.commons.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.greencycle.my.commons.dao.ICodeDAO;
import com.greencycle.my.commons.vo.CodeVO;

@Service
public class CodeService {
	@Autowired
	ICodeDAO codeDao;
	
	public List<CodeVO> getCodeList(String commParent){
		 return codeDao.getCodeList(commParent);
	}
}
