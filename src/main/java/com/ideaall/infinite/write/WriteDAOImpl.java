package com.ideaall.infinite.write;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("writeDAO")
public class WriteDAOImpl implements WriteDAO {
	@Autowired
	private SqlSession sql;
	int noOfRecords; // ����¡�� ���� ������ WriteController.java�� maxPost ������ ���� ����. 
	
	//�Խù� �ۼ�
	@Override
	public void insertPost(HashMap<String, String> info) {
		sql.insert("insertPost", info);
	}
		
	// �Խù� ��� ǥ��
	@Override
	public List<WriteInfo> writeInfoList() throws Exception{ //
		return sql.selectList("writeInfoList");
	}
	
		//�Խù� ��� ǥ��(����¡)
		@Override
		public List<WriteInfo> writeList(int offset, int noOfRecords) throws Exception{
		List<WriteInfo> writeList = new ArrayList<WriteInfo>(); 
				
				HashMap<String, Object> params = new HashMap<String, Object>(); 
				
				params.put("offset", offset); 
				params.put("noOfRecords", noOfRecords); 
				
				writeList = sql.selectList("writeList", params); 
				this.noOfRecords = sql.selectOne("writeGetCount");
				
				return writeList;
			}
		
		// ����¡
		@Override
		public int writeGetCount() throws Exception {
			return sql.selectOne("writeGetCount");
		}
}