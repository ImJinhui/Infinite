package com.ideaall.infinite.write;

import java.util.HashMap;
import java.util.List;

public interface WriteDAO {
	// �Խù� �ۼ�
	public void insertPost(HashMap<String, String> info); //insertPost�� query.xml�� ������ id ��
	
	// �Խù� ���  ǥ��
	public List<WriteInfo> writeInfoList() throws Exception;
	
	// �Խù� ��� ǥ��(����¡)
	public List<WriteInfo> writeList(int offset, int noOfRecords) throws Exception; 
	
	// �Խù� ���ڵ� �� ��ȸ
	public int writeGetCount() throws Exception; 

}
