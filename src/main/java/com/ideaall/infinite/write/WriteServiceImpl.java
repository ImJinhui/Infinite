package com.ideaall.infinite.write;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("writeService")
public class WriteServiceImpl implements WriteService {
	@Autowired
	private WriteDAO writeDAO;
	
	//�Խù� �ۼ�
	@Override
	public void insertPost(HashMap<String, String> info){
		writeDAO.insertPost(info);
	}
		
	// �Խù� ��� ǥ��
	@Override
	public List<WriteInfo> writeInfoList() throws Exception {
		return writeDAO.writeInfoList();
	}
	
	// �Խù� ��� ǥ��(����¡)
	@Override
	public List<WriteInfo> writeList(int offset, int noOfRecords) throws Exception {
		return writeDAO.writeList(offset, noOfRecords);
	}
	
	// ��ü �Խù� �� ��ȸ
	@Override
	public int writeGetCount() throws Exception {
		return writeDAO.writeGetCount();
	}
}