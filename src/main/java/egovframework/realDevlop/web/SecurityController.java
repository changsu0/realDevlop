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

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.realDevlop.service.ProtoTypeService;

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
public class SecurityController {

	/** EgovSampleService */
	@Resource(name = "protoTypeService")
	private ProtoTypeService protoTypeService;

	/**
	 * 화면이동
	 * @param model
	 * @return "protoType/accessDenied"
	 * @exception Exception
	 */
	@RequestMapping(value = "/login/accessDenied.do")
	public String accessDenied(@ModelAttribute ModelMap model) throws Exception {
		return "login/accessDenied";
	}
	
	
	/**
	 * 화면이동
	 * @param model
	 * @return "protoType/loginForm"
	 * @exception Exception
	 */
	@RequestMapping(value = "/login/loginForm.do")
	public String loginForm(@ModelAttribute ModelMap model) throws Exception {
		return "login/loginForm";
	}
	
	/**
	 * 화면이동
	 * @param model
	 * @return "protoType/home"
	 * @exception Exception
	 */
	@RequestMapping(value = "/home.do")
	public String home(@ModelAttribute ModelMap model) throws Exception {
		return "home";
	}

}
