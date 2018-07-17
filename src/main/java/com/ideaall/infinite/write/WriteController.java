package com.ideaall.infinite.write;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ideaall.infinite.utill.Paging;




@Controller
public class WriteController {
	
	@Resource(name="writeService")
	WriteService writeService;
	Paging pagemaker;	//����¡�� ����ϱ� ���� ��.

	//�Խñ� �ۼ� ������ �̵� ��Ʈ�ѷ�
	@RequestMapping(value = "/Write")
	public String writeNotice(HttpSession session) throws Exception{
		String page = "";
		String user = (String) session.getAttribute("id");

		if(user != null && user.equals("elvis")){
			page = "/Write";
		}else if(user == null){
			page = "redirect:/";
		}
		return page;
	}
	
	//�Խñ� �ۼ� ��Ʈ�ѷ�
	@RequestMapping(value = "/Insert")
	public String Write(HttpSession session, @RequestParam String title, @RequestParam String content, HttpServletRequest req) throws Exception {
		String page = "";																			 //(= @RequestParam String info
		String user = (String) session.getAttribute("id");
		
		if(user != null){
			HashMap<String, String> insertValue = new HashMap<String, String>();
			insertValue.put("title", title);	//�� ���� 
			insertValue.put("content", content.replaceAll("\r\n", "<br>"));//.replaceAll("\r\n", "<br>")
			insertValue.put("name", user);		//�ۼ���
			insertValue.put("info", req.getParameter("info").toString());
			writeService.insertPost(insertValue);	//insert.Service�� InsertService.impl�� ������ @Service(insertService)�̰�, insertPost�� query.xml�� ������ insert ������ id��.
			page ="redirect:/";
		}else if (user== null) {
			page ="redirect:/";
		}
		return page;
	}
	/*
	   �Խù� �ۼ� ��Ʈ�ѷ�����, title�� content�� @RequestParam String���� ������ �Ǿ��ְ�, info�� HttpServletRequest req�� ������ �Ǿ��ִ�.
	   ������� �ᵵ ����� ������, ���� @RequestParam String���� ������ �ϸ� insertValueó�� �ۼ��ϰ�,
	  HttpServletRequest req�� �Ѵٸ� req.getParameter("").toString() ���� ����Ѵ�.
	*/ 
	
	// �Խù� ��� �����ֱ�
	@RequestMapping(value = "/")
	public String list(Model model, HttpServletRequest req) throws Exception{
		int currentPageNo = 1; // /(localhost:8080)�������� ���� ó���� ǥ���� ������ (1 = ù��° ������)
		int maxPost = 10;	// �������� ǥ�õ� �Խù�  �ִ� ����
		
		if(req.getParameter("pages") != null)								//�Խù��� 1����������(=�������� ������ �ȵǾ�����)�� �ƴ϶�� == ����¡�� �����Ǿ��ٸ�							 
			currentPageNo = Integer.parseInt(req.getParameter("pages")); 	//pages���ִ� string Ÿ�� ������ int������ �ٲپ currentPageNo�� ��´�.
		
		Paging paging = new Paging(currentPageNo, maxPost); //Paging.java���ִ� currentPAgeNo, maxPost�� paging������ ��´�.
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost(); // query.xml���� select�� �Ҷ� ����ϱ����� offset ������ ����. 
		// ���� 3������ �̰�, �� �������� �Խù��� 10���� �ִٸ� offset���� (3-1) * 10 = 20�� �ȴ�. 
		
/* �߿���������� ����ϱ� ���� ��
		ArrayList<WriteInfo> infolist = new ArrayList<WriteInfo>();     	
		infolist = (ArrayList<WriteInfo>) writeService.writeInfoList(); 
*/
		
		ArrayList<WriteInfo> page = new ArrayList<WriteInfo>(); // WriteInfo�� �ִ� �������� ArrayList Ÿ���� �迭�� �� ���� �̸� page��� ������ ��´�.
		page = (ArrayList<WriteInfo>) writeService.writeList(offset, paging.getMaxPost()); 
		//writeService.java�� �ִ� writeList �Լ��� �̿��Ͽ� offset���� maxPost���� ArrayList Ÿ���� �迭�� ���, �� �迭 ��ü�� page ������ ��´�.																							
		
		paging.setNumberOfRecords(writeService.writeGetCount()); // �������� ǥ���ϱ� ���� ��ü �Խù� ���� �ľ��ϱ� ���Ѱ�
		
		paging.makePaging(); //
		
	//	model.addAttribute("infolist", infolist); �߿� ���������� ����ϱ� ���� ��.
		model.addAttribute("page", page);
		model.addAttribute("paging", paging);
		
		return "/index";
	}

	/* HttpServletRequest ��ü
	   => ����� ��û�� ���õ� ������ �����Ѵ�.
	   => HTML �� �Է°��� �����´�.
	   => ��Ű �� ���������� ������ �� �ִ�.
	   => Ŭ���̾�Ʈ�� IP�ּҸ� �� �� �ִ�.
	*/
}