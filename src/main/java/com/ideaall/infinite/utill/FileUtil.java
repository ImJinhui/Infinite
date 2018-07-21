package com.ideaall.infinite.utill;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUtil {
   @Autowired
   CommonUtil commonUtil;

   public List<Object> setMultipartList(MultipartHttpServletRequest multipartRequest) {

      List<Object> fileList = new ArrayList<Object>();

      Iterator<String> multiFileList = multipartRequest.getFileNames();

      while (multiFileList.hasNext()) {
         Map<Object, Object> fileMap = new HashMap<Object, Object>();
         String fileName = multiFileList.next();
         MultipartFile multiFile = multipartRequest.getFile(fileName);
         String multiFileName = FileUtil.getNewFileName(multiFile.getOriginalFilename());
         /*String attachFileName = "C:\\sts-bundle\\workspace-sts\\Infinite\\src\\main\\webapp\\resources\\uploads\\" + multiFileName;*/
         String addRealPath = "//resources//uploads//";
         String physicalDirectory = multipartRequest.getSession().getServletContext().getRealPath(addRealPath)+ multiFileName;
         String attachFileName = physicalDirectory;
         String fileSize = multiFile.getSize() + "";// 1KByte -> 1048)
         String fileContentType = multiFile.getContentType(); // jpg ->images/JPEG
         if (multiFileName == null)
            continue;
         try {// DB information
            multiFile.transferTo(new File(attachFileName));
            fileMap.put("ATTACHFILE_SEQ", commonUtil.getUniqueSequence()); // 첨부파일 일련번호
            /*fileMap.put("SOURCE_UNIQUE_SEQ", multiFileName);*/ // 장비시퀀스레코드 UNIQUE SEQ
            fileMap.put("ATTACHFILE_TYPE", fileContentType); // 첨부파일 유형
            fileMap.put("ORGINALFILE_NAME", multiFile.getOriginalFilename()); // 원본 파일명
            fileMap.put("PHYSICALFILE_NAME", multiFileName); // 첨부 파일명
            fileMap.put("ATTACHFILE_PATH", attachFileName);// 첨부파일 저장경로
            fileMap.put("ATTACHFILE_SIZE", fileSize); // 첨부파일 크기
//             fileMap.put("THUMBNAIL_NAME", value); // 썸네일 첨부파일명
            //fileMap.put("REGISTER_SEQ", value); //등록자SEQ
            // fileMap.put("ATTACHFILE_HEIGHT", height); // 파일 높이
            // fileMap.put("ATTACHFILE_WIDTH", value);
            // 파일 폭
            /*
             * fileMap.put("REGISTER_SEQ", value); //등록자SEQ 
             * fileMap.put("REGISTRY_DATE",value); //등록일자
             * fileMap.put("MODIFIER_SEQ", value); //수정자_SEQ
             * fileMap.put("MODIFIER_DATE", value); //수정일자
             */ fileList.add(fileMap);
         } catch (Exception e) {
            File file = new File(attachFileName);
            file.delete();
            e.printStackTrace();
         }
      }
      return fileList;
   }

   private static String getNewFileName(String originalFilename) {

      if (originalFilename.equals("")) {
         return null;
      }

      Calendar c = Calendar.getInstance();
      String changeFile = "" + c.get(c.YEAR) + (c.get(c.MONTH) + 1) + c.get(c.DATE) + c.get(c.HOUR) + c.get(c.MINUTE)
            + c.get(c.SECOND) + "_" + originalFilename;

      return changeFile;
   }
}