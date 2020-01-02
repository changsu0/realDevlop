/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.realDevlop.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.realDevlop.service.ProtoTypeService;
import egovframework.realDevlop.service.SampleDefaultVO;

/**
 * @Class Name : EgovSampleController.java
 * @Description : EgovSample Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
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
	@RequestMapping(value = "/noneStyleList.do")
	public String selectSampleList(@ModelAttribute ModelMap model) throws Exception {
		return "protoType/noneStyleList";
	}
	
	@RequestMapping(value = "/selectProtoTypeList.ajax", method = RequestMethod.POST)
	public ModelAndView selectProtoTypeList(@ModelAttribute ModelMap model) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<?> protoTypeList = protoTypeService.selectProtoTypeList();
		
		mv.addObject("protoTypeList", protoTypeList);
		return mv;
	} 

}
