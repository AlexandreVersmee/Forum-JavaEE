package ca.uqar.forum.services;

import java.util.List;

import ca.uqar.forum.entities.FilDiscussion;
import ca.uqar.forum.entities.Sujet;

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
