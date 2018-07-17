package com.ideaall.infinite.write;

import java.util.HashMap;
import java.util.List;

public interface WriteService {
	// �Խù� �ۼ�
	public void insertPost(HashMap<String, String> info);
	// ���⼭�� info�� Controller�� �ִ� info�� �ƴ϶�, title, content, name, info�� �ǹ��ϸ� �ٸ� �̸����� �ٲ㵵 �ȴ�. 
		
	// �Խù� ��� ǥ�� 
	public List<WriteInfo> writeInfoList() throws Exception;
	
	// �Խù� ��� ǥ��(����¡)
	public List<WriteInfo> writeList(int offset, int noOfRecords) throws Exception;
	
	// ��ü �Խù� �� ��ȸ
	public int writeGetCount() throws Exception;
	
}
