package ca.uqar.forum.services;

import java.util.List;

import ca.uqar.forum.entities.Message;

public interface IMessageService
{
	/*
	###############################
	#                             #
	#        CUSTOM QUERY         #
	#                             #
	###############################
	*/
	public List<Message> readByMessage(Long idDiscussion);
}
