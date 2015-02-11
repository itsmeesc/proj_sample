package proj.controller;

import java.io.File;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class AjaxController {
	private static Logger logger = null;

	static {
		logger = LoggerFactory.getLogger(AjaxController.class);
	}

	@RequestMapping(value = "/ajax", method = RequestMethod.GET)
	public String ajaxPostRes(Model model) {

		return "helloajax";
	}

	@RequestMapping(value = "/ajax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String returnResult(@RequestParam String message) {
		return "서버에서 보냄 : " + message;
	}

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String showUploadForm() {
		return "upload";
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public @ResponseBody String showUploadForm(@RequestParam String id, @RequestPart MultipartFile file, Model model) throws Exception {
		File lfile = new File("d:\\images\\" + file.getOriginalFilename());
		logger.trace("아이디 : "+id);
		file.transferTo(lfile);
		return "/upload/"+file.getOriginalFilename();
	}
	
	@RequestMapping(value = "/json", method = RequestMethod.GET)
	public String showJsonForm() {
		return "json";
	}

	@RequestMapping(value = "/json", method = RequestMethod.POST)
	public @ResponseBody String showJsonResult(Model model) throws Exception {
		
		return "json";
	}
	
}
