/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.realDevlop.web;

import java.io.File;
import java.io.FileOutputStream;
import java.net.URLEncoder;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfGState;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.PdfWriter;

import egovframework.realDevlop.service.ProtoTypeService;

/**
 * @Class Name : EgovSampleController.java
 * @Description : EgovSample Controller Class
 * @Modification Information
 * @
 * @수정일수정자수정내용
 * @ --------- --------- -------------------------------
 * @ 2009.03.16 최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class ProtoTypeController {

	/** EgovSampleService */
	@Resource(name = "protoTypeService")
	private ProtoTypeService protoTypeService;

	/**
	 * 화면이동
	 * @param model
	 * @return "protoType/noneStyleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/protoType/noneStyleList.do")
	public String selectNoneStyleList(@ModelAttribute ModelMap model) throws Exception {
		return "protoType/noneStyleList";
	}
	
	@RequestMapping(value = "/protoType/selectProtoTypeList.ajax", method = RequestMethod.POST)
	public ModelAndView selectProtoTypeList(@RequestParam HashMap<String, Object> paramMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<?> protoTypeList = protoTypeService.selectProtoTypeList(paramMap);
		
		mv.addObject("protoTypeList", protoTypeList);
		return mv;
	} 
	
	/**
	 * 화면이동
	 * @param model
	 * @return "protoType/noneStyleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/protoType/dataGridStyleList.do")
	public String selectDataGridStyleList(@ModelAttribute ModelMap model) throws Exception {
		/*
		// 시큐리티 컨텍스트 객체를 얻습니다. 
		SecurityContext context = SecurityContextHolder.getContext(); 
		// 인증 객체를 얻습니다. 
		Authentication authentication = context.getAuthentication(); 
		// 로그인한 사용자정보를 가진 객체를 얻습니다. 
//		Principal principal = (Principal) authentication.getPrincipal(); 
		// 사용자가 가진 모든 롤 정보를 얻습니다. 
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities(); 
		Iterator<? extends GrantedAuthority> iter = authorities.iterator(); 
		
		while (iter.hasNext()) { 
			GrantedAuthority auth = iter.next(); 
			System.out.println(auth.getAuthority()); 
		}

			*/
			
			
		return "protoType/dataGridStyleList";
	}

	
	@RequestMapping(value = "/protoType/createPdf.ajax", method = RequestMethod.POST)
	public ModelAndView createPdf(@RequestParam HashMap<String, Object> paramMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("result", "성공");
				/*
		String fileName="";
		String dir="D:/www/kipes/kipes/report/report";
		fileName = "simple_table.pdf";
		
		String tempFile = dir + "/" + fileName;
		
		File directory = new File(dir);
		if(!directory.exists()) directory.mkdirs(); //파일경로 없으면 생성
		
		 Document document = new Document();
	 PdfWriter.getInstance(document, new FileOutputStream( dir+"/"+fileName ));
	
	document.open();
	PdfPTable table = new PdfPTable(4);

	for(int i = 0; i < 16; i++){
		table.addCell("cellNumber:" + i);
	}
	document.add(table);
	document.close();

*/
	/*******************************************************************************************************************/

		//1. PDF파일의 발행번호를 DB에서 채번
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd_HHmmss");
		Date time = new Date();
		String trx_dt = format1.format(time);

		//2. PDF파일이 생성될 위치 및 파일명 지정
		String rootPath = "D:/www/kipes/kipes/report/report/";
		String storePath = rootPath + trx_dt.substring(0,8);	//파일저장 경로
		String fileName = trx_dt + ".pdf";	//파일명 지정
		String tempFile = storePath + "/" + "TEMP_"+ trx_dt + ".pdf";	//텍스트만 처리된 PDF
		String fullName = storePath + "/" + fileName;									//이미지 워터마크가 완료된 PDF
		
		//2-1. 디렉토리가 없으면 생성
		File directory 	= new File(storePath);										//저장경로 체크
		if(!directory.exists()){
			directory.mkdirs();
		}
		
		//3. PDF생성
		// Document 생성
		Document document = new Document(PageSize.A4, 50, 50, 50, 50); 			// 용지 및 여백 설정
		// PdfWriter 생성
		PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(tempFile));
		writer.setInitialLeading(12.5f);
		fileName = URLEncoder.encode(fileName, "UTF-8");
		
		// Document 오픈
		document.open();
		PdfPTable table = new PdfPTable(4);
		
		for(int i = 0; i < 16; i++){
			table.addCell("cellNumber:" + i);
		}
		document.add(table);
		document.close();
		writer.close();
		
		//5. 이미지추가
		//PDF로드 및 신규생성
		PdfReader reader = new PdfReader(tempFile);//생성된 PDF
		PdfStamper stamp = new PdfStamper(reader, new FileOutputStream(fullName));//스탬프 추가할 PDF
		PdfGState gs1 = new PdfGState();
		gs1.setFillOpacity(0.75f); //이미지 농도
		
		//이미지 스탬프(도장)
		
		String resImg = rootPath + "/stamp.jpg";
		Image img = Image.getInstance(resImg); //이미지파일
		img.scalePercent(50, 50);//이미지 사이즈
		img.setAlignment(Image.ALIGN_CENTER);//정렬 
		img.setAbsolutePosition(10f, 700f); //이미지 위치(가로, 세로)
		
		//생성된 이미지를 워터마크 형식으로 하자
		PdfContentByte under = stamp.getUnderContent(1);
		under = stamp.getOverContent(1);
		under.saveState();
		under.setGState(gs1);
		under.addImage(img);
		under.restoreState();
		
		stamp.close();
		reader.close();
		
		//임시파일 제거
		File tm = new File(tempFile);
		if(tm.exists()) tm.delete();

		return mv;
	} 
}
