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
package egovframework.realDevlop.shop.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.realDevlop.service.SampleDefaultVO;
import egovframework.realDevlop.shop.service.ShopService;

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
public class ShopController {

	/** EgovSampleService */
	@Resource(name = "shopService")
	private ShopService shopService;

	/**
	 * 화면이동
	 * @param model
	 * @return "shop/noneStyleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/shop/shopUserMgmt.do")
	public String shopUserMgmt(@ModelAttribute ModelMap model) throws Exception {
		return "shop/shopUserMgmt";
	}

	@RequestMapping(value = "/shop/selectShopUserList.ajax", method = RequestMethod.POST)
	public ModelAndView selectShopUserList(@RequestParam HashMap<String, Object> paramMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");

		List<?> shopUserList = shopService.selectShopUserList(paramMap);

		mv.addObject("shopUserList", shopUserList);
		return mv;
	}

	@RequestMapping(value = "/shop/insertShopUser.ajax", method = RequestMethod.POST)
	public ModelAndView insertShopUser(@RequestParam HashMap<String, Object> paramMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");

		int insertShopUser = shopService.insertShopUser(paramMap);

		mv.addObject("insertShopUser", insertShopUser);
		return mv;
	}



	/**
	 * 화면이동
	 * @param model
	 * @return "shop/noneStyleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/shop/shopCustMgmt.do")
	public String shopCustMgmt(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) throws Exception {
		List<?> shopUserList = shopService.selectShopUserList(null);
		model.addAttribute("businessList", shopUserList);

		return "shop/shopCustMgmt";
	}

	@RequestMapping(value = "/shop/selectShopCustList.ajax", method = RequestMethod.POST)
	public ModelAndView selectShopCustList(@RequestParam HashMap<String, Object> paramMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");

		List<?> shopCustList = shopService.selectShopCustList(paramMap);

		mv.addObject("shopCustList", shopCustList);
		return mv;
	}

	@RequestMapping(value = "/shop/insertShopCust.ajax", method = RequestMethod.POST)
	public ModelAndView insertShopCust(@RequestParam HashMap<String, Object> paramMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");

		int insertShopCust = shopService.insertShopCust(paramMap);

		mv.addObject("insertShopCust", insertShopCust);
		return mv;
	}

}
