package com.ideaall.infinite.utill;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class CommonUtil {
	/**
	 * Unique sequence Key 생성 
	 * @param 
	 * @return String 
	 */
    public String getUniqueSequence() {
		UUID uuid = UUID.randomUUID();
		return uuid.toString().replaceAll("-", "");
//    	String longTime = new Long((new Date().getTime())).toString();
//        return longTime;
    }
    
	/**
	 * DB sequence Key List 생성 
	 * @param int cnt
	 * @return List 
	 */
	public List<String> getSequenceList(int cnt) {
		
		List<String> result = new ArrayList<String>();
		UUID uuid;
		for(int i=0; i<= cnt; i++){
			uuid = UUID.randomUUID();
			result.add(uuid.toString().replaceAll("-", "")+i);
		}
		
		return result ;
	}
	
//FileUtil
	public String workingPhysicalDirectory(MultipartHttpServletRequest multipartRequest) {
//		System.getProperty( "catalina.base" ) 	//C:\sts-bundle\pivotal-tc-server-developer-3.2.9.RELEASE\base-instance

    	//    	String fullPath = this.getClass().getClassLoader().getResource("").getPath();
//		String fullPath = URLDecoder.decode(path, "UTF-8");
//		String pathArr[] = fullPath.split("/WEB-INF/classes/");
//    	String physicalDirectory = pathArr[0] + "";

    	String addRealPath = "/src/main/webapp/resources/uploads/";
    	String physicalDirectory = multipartRequest.getSession().getServletContext().getRealPath(addRealPath);
		
//    	String physicalDirectory = "C:\\Users\\student\\git\\Lecture_SpringFramework\\src\\main\\webapp\\resources\\uploads\\";
		return physicalDirectory;
    }
}
