package ca.uqar.forum.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ca.uqar.forum.entities.Message;
import ca.uqar.forum.services.IMessageService;

@Controller
@RequestMapping(value="/discussion")
public class DiscussionController
{
	@Resource
	IMessageService			messageService;
		
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
		List<Message> messageListe = messageService.readByMessage(Long.parseLong(idDiscussion));
			
		model.addAttribute("messageListe", messageListe);		
		return "discussion";
	}
	/*
	###############################
	#                             #
	#           POST              #
	#                             #
	###############################
	*/
}
