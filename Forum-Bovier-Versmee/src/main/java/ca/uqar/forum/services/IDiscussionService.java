package ca.uqar.forum.services;

import java.util.List;

import ca.uqar.forum.entities.FilDiscussion;

public interface IDiscussionService {

	/*
	###############################
	#                             #
	#        CUSTOM QUERY         #
	#                             #
	###############################
	*/
	public List<FilDiscussion> readBySujet(Long idSujet);
}
