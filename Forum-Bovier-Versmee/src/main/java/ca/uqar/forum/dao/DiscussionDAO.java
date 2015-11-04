package ca.uqar.forum.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import ca.uqar.forum.entities.FilDiscussion;

public interface DiscussionDAO extends JpaRepository<FilDiscussion, Long>
{
	   /*
 ###############################
 #                             #
 #       Default method        #
 #    (delete, save, FindAll,  #
 #      getOne, flush, ...)    #
 #                             #
 ###############################
 */
	
	public List<FilDiscussion> findBySujet(Long subjectParent);
	/*
	###############################
	#                             #
	#        CUSTOM QUERY         #
	#                             #
	###############################
	*/
	public List<String[]> readBySujet(Long idSujet);
}
