package com.qaii.service;

import java.util.List;

import com.qaii.domain.PatProcess;

public interface ProcessService {
	int addProcessInfo(PatProcess patprocess);
	
	List<PatProcess> findProcessList(Integer pid);
}