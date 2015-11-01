package ca.uqar.forum.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ca.uqar.forum.entities.Membre;

import com.orange.OSAC.controller.AdministrationOrigineController;
import com.orange.OSAC.controller.AdministrationOrigineController.Action;
import com.orange.OSAC.entities.Origine;
import com.orange.OSAC.entities.User;

@Controller
@RequestMapping(value="/administration-inscriptions")
public class AdministrationInscription {
	/* Debug */
	private final static Logger logger = LoggerFactory.getLogger(AdministrationInscription.class);

	/*
	###############################
	#                             #
	#       General Methods       #
	#                             #
	###############################
	*/
	/*
	###############################
	#                             #
	#            GET              #
	#                             #
	###############################
	*/
	@RequestMapping(method = RequestMethod.GET)
	public String home(ModelMap model, HttpSession session, HttpServletRequest request)
	{
		return "administrationInscription";
	}
	/*
	###############################
	#                             #
	#           POST              #
	#                             #
	###############################
	*/
	@RequestMapping(value = "/{id}", method = RequestMethod.POST)
	public String deleteOriginForm(@Valid @ModelAttribute(value="originToDelete") Origine originTemp,
			BindingResult result, ModelMap model, HttpSession session,final RedirectAttributes redirectAttributes)
	{
		logger.debug("Delete NEW ORIGIN POST");
		Membre userPref		= (Membre) session.getAttribute("userSession");
		
		/* Default Methods */
		setDefaultViewVariables(pageable, model, null, Action.DELETE, userPref.getPreference());
					
		if (result.hasErrors()){
			logger.debug("ERROR ON SUBMIT - UpdateOrigin (Number error :{}), {}",result.getErrorCount(), result.getAllErrors().get(0).getDefaultMessage());
			model.addAttribute("ERROR_MESSAGE","L'origine "+originTemp.getName()+" n'a pas Ã©tÃ© ajoutÃ© en base de donnÃ©e, une erreur est survenue.");
			return ("administrationOrigin");
		}
		
		origineService.deleteOrigin(originTemp);	
		
		redirectAttributes.addFlashAttribute("SUCCESS_MESSAGE","L'origine "+originTemp.getName()+" a bien Ã©tÃ© supprimÃ© en base de donnÃ©e.");
		return ("redirect:/administration/origines");		
	}
}
