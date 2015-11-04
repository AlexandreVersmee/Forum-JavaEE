package ca.uqar.forum.services;

import java.util.List;

import ca.uqar.forum.entities.FilDiscussion;

public interface IDiscussionService
{
	public void saveDiscussion(FilDiscussion newDiscussion);	
	
	/*
	###############################
	#                             #
	#        CUSTOM QUERY         #
	#                             #
	###############################
	*/
	public List<FilDiscussion> readBySujet(Long idSujet);
}
