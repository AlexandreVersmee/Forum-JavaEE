package ca.uqar.forum.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ca.uqar.forum.entities.FilDiscussion;
import ca.uqar.forum.entities.Sujet;
import ca.uqar.forum.services.IDiscussionService;

@Controller
@RequestMapping(value="/sujet")
public class DiscussionListingController {

	@Resource
	IDiscussionService			discussuionService;
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
	/*
	|------------------------------|
	|     Get all Discussion       |    
	|------------------------------|
	*/
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String updateRowByPage(@PathVariable("id") String idSubject, ModelMap model, HttpSession session, final RedirectAttributes redirectAttributes)
	{
		List<FilDiscussion> listeFil = discussuionService.readBySujet(Long.parseLong(idSubject));
		
		model.addAttribute("addFilDiscussion", new FilDiscussion());
		model.addAttribute("listeFilDiscussion", listeFil);
		
		return "discussionListing";
	}	
	/*
	###############################
	#                             #
	#           POST              #
	#                             #
	###############################
	*/
	/*
	|------------------------------|
	| POST When you add Discussion |    
	|------------------------------|
	*/
//	@RequestMapping(value = "/add", method = RequestMethod.POST)
//	public String updateRowByPage(@Valid @ModelAttribute(value = "addSubject") Sujet subjectToAdd, ModelMap model, HttpSession session, final RedirectAttributes redirectAttributes)
//	{
//		/* Define writter */
////		Membre createur = (Membre) session.getAttribute("membreSession");
////		subjectToAdd.setMembre(createur);
//				
////		/* Save sujet in database */
////		try {
////			sujetService.saveSujet(subjectToAdd);
////		} catch (DataIntegrityViolationException e) {
////			model.addAttribute("ERROR_MESSAGE","Un sujet possède déjà ce nom !");
////		}
//		return ("redirect:/sujets");
//	}
}
