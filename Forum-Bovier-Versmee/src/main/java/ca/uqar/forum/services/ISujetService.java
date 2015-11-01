package ca.uqar.forum.services;

import java.util.List;

import ca.uqar.forum.entities.Sujet;

public interface ISujetService {
	
	public List<Sujet> findAll();
	
	public void saveSujet(Sujet newSujet);
}
