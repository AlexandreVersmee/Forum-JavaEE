package ca.uqar.forum.services;

import ca.uqar.forum.entities.Membre;

public interface IMembreService {

	public Membre findByPseudo(String membrePseudo);

	public void saveMembre(Membre membre);

	public void supprMembre(Membre membre);
	
}