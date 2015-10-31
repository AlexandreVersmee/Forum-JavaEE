package ca.uqar.forum.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ca.uqar.forum.entities.Membre;
import ca.uqar.forum.services.IMembreService;

@Controller
@RequestMapping(value="/connexion")
public class ConnexionController {
	/* Debug */
	private final static Logger logger = LoggerFactory.getLogger(ConnexionController.class);
	
	@Resource
	IMembreService 			membreService;
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
		model.addAttribute("membre", new Membre());
		return "connexion";
	}
	/*
	###############################
	#                             #
	#           POST              #
	#                             #
	###############################
	*/
	public void validate(Object target, Errors errors) {
 		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pseudo",
 				"error.pseudo", "Ce champ ne peut pas Ãªtre vide.");
     }
     
    @RequestMapping(method = RequestMethod.POST)
	public String logMembre(@ModelAttribute(value = "membre") Membre membreTemp,
			BindingResult result, ModelMap model, HttpSession session, final RedirectAttributes redirectAttributes)
	{
    	/* Seek membre on database */
//		validate(membreTemp, result);
		
    	logger.debug("form = "+membreTemp.getPseudo()+" et "+membreTemp.getPassword());
    	
		if (result.hasErrors())
    	{
    		model.addAttribute("ERROR_MESSAGE","Le couple pseudo et mot de passe est incorrect.");
    		return("connexion");
    	}
    	Membre membreTocheck = membreService.findByPseudo(membreTemp.getPseudo());
    	if (membreTocheck == null)
    	{
    		model.addAttribute("ERROR_MESSAGE","Le couple pseudo et mot de passe est incorrect.");
    		return("connexion");
    	}
    	
    	logger.debug("Membre trying to connect with this information : [{}, {}])",membreTemp.getPseudo(),membreTemp.getPassword());
    	
    	logger.debug("Membre trying to connect with this information : [{}, {}])",membreTocheck.getPseudo(),membreTocheck.getPassword());
    	
    	/* check if pseudo and Password are correct */
    	if (membreTemp.getPseudo().equals(membreTocheck.getPseudo()) && membreTemp.getPassword().equals(membreTocheck.getPassword()))
    	{
    		redirectAttributes.addFlashAttribute("INFORMATION_MESSAGE","Connexion rÃ©ussi, Bonjour "+membreTocheck.getPseudo());
    		
    		logger.debug("Ajout de l'utilisateur en Session");
    		session.setAttribute("membreSession", membreTocheck);
    		
    		/* Delete error in session */
    		session.removeAttribute("ERROR_MESSAGE");
    		return ("redirect:/");
    	}
    	else
    	{
    		model.addAttribute("ERROR_MESSAGE","Le couple pseudo et mot de passe est incorrect.");
    		return ("connexion");
    	}
	}
}
