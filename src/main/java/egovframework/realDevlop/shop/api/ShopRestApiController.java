package egovframework.realDevlop.shop.api;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import egovframework.realDevlop.shop.service.ShopService;

@RestController
public class ShopRestApiController {

	/** EgovSampleService */
	@Resource(name = "shopService")
	private ShopService shopService;

    @RequestMapping(value = "/api/getBusinessNo", method = RequestMethod.GET)
    public ModelAndView getBusinessNo(@RequestParam(value = "businessNo") String businessNo) throws Exception {

    	HashMap<String, Object> paramMap = new HashMap<>();
    	paramMap.put("businessNo", businessNo);
		List<?> shopUserList = shopService.selectShopUserList(paramMap);

    	ModelAndView jsonView = new ModelAndView("jsonView");
    	jsonView.addObject("shopUserVO", shopUserList);
    	return jsonView;
    }
}
