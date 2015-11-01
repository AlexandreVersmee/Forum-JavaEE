package ca.uqar.forum.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ca.uqar.forum.entities.Membre;
import ca.uqar.forum.entities.Sujet;
import ca.uqar.forum.services.ISujetService;

@Controller
@RequestMapping(value="/sujets")
public class SujetController {
	
	@Resource
	ISujetService			sujetService;
	
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
		List<Sujet> sujetListe	= sujetService.findAll();
		
		model.addAttribute("addSubject", new Sujet());
		model.addAttribute("sujetListe", sujetListe);
		
		return "sujet";
	}
	/*
	###############################
	#                             #
	#           POST              #
	#                             #
	###############################
	*/
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String updateRowByPage(@Valid @ModelAttribute(value = "addSubject") Sujet subjectToAdd, ModelMap model, HttpSession session, final RedirectAttributes redirectAttributes)
	{
		/* Define writter */
		Membre createur = (Membre) session.getAttribute("membreSession");
		subjectToAdd.setMembre(createur);
				
		/* Save sujet in database */
		try {
			sujetService.saveSujet(subjectToAdd);
		} catch (DataIntegrityViolationException e) {
			model.addAttribute("ERROR_MESSAGE","Un sujet possède déjà ce nom !");
		}
		return ("redirect:/sujets");
	}
}
