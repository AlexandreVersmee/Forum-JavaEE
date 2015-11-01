package ca.uqar.forum.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import ca.uqar.forum.entities.Sujet;


public interface SujetDAO extends JpaRepository<Sujet, Long>
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
}
