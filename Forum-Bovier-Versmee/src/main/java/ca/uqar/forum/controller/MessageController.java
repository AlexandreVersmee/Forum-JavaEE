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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ca.uqar.forum.entities.FilDiscussion;
import ca.uqar.forum.entities.Membre;
import ca.uqar.forum.entities.Message;
import ca.uqar.forum.entities.Sujet;
import ca.uqar.forum.services.IDiscussionService;
import ca.uqar.forum.services.IMessageService;

@Controller
@RequestMapping(value="/discussion")
public class MessageController
{
	@Resource
	IMessageService			messageService;
	
	@Resource
	IDiscussionService		discussionService;
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
	public String displayMessageOfDiscussion(@PathVariable("id") String idDiscussion,ModelMap model, HttpSession session, HttpServletRequest request)
	{
		List<Message> messageListe =	messageService.readByFilDiscussion(Long.parseLong(idDiscussion));
		FilDiscussion discussion = 		discussionService.findById(Long.parseLong(idDiscussion));
		
		model.addAttribute("messageListe", messageListe);
		model.addAttribute("discussion", discussion);
		return "discussion";
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
	@RequestMapping(value = "/add/{id}", method = RequestMethod.POST)
	public String addNewDiscussion(@PathVariable("id") String idSubjectParent, @Valid @ModelAttribute(value = "addFilDiscussion") FilDiscussion discussionToAdd, ModelMap model, HttpSession session, final RedirectAttributes redirectAttributes)
	{
		/* Define writter */
		Membre createur = (Membre) session.getAttribute("membreSession");
		if (createur == null)
		{
			redirectAttributes.addFlashAttribute("INFORMATION_MESSAGE","Vous devez être connecté pour effectuer cette action.");
			return ("redirect:/connexion");
		}
		else
		{
			discussionToAdd.setMembre(createur);
		}
		
		/* Seek subject parent of disussion*/
		Sujet subjectParent =  sujetService.findById(Long.parseLong(idSubjectParent));
		discussionToAdd.setSujet(subjectParent);
		
		/* Save sujet in database */
		try {
			discussuionService.saveDiscussion(discussionToAdd);
		} catch (DataIntegrityViolationException e) {
			model.addAttribute("ERROR_MESSAGE","Une discussion possède déjà ce nom !");
		}
		return ("redirect:/sujet/"+idSubjectParent);
	}

}
