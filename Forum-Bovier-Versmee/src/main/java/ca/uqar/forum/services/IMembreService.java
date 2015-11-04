package ca.uqar.forum.services;

import java.util.List;

import ca.uqar.forum.entities.Membre;

public interface IMembreService {

	public Membre findByPseudo(String membrePseudo);

	public void saveMembre(Membre membre);

	public void supprMembre(Membre membre);

	public List<Membre> findByValideIs(boolean valid);
	
	public Membre findById(long parseLong);

	public List<Membre> findByValideAndDeleted(boolean b, Object object);
}
