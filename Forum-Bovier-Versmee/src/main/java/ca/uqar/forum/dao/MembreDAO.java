package ca.uqar.forum.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import ca.uqar.forum.entities.Membre;

public interface MembreDAO extends JpaRepository<Membre, Long>{
	   /*
    ###############################
    #                             #
    #       Default method        #
    #    (delete, save, FindAll,  #
    #      getOne, flush, ...)    #
    #                             #
    ###############################
    */
	public Membre findByPseudo(String membrePseudo);
}
