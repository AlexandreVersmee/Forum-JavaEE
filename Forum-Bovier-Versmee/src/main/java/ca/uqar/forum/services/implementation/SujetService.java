package ca.uqar.forum.services.implementation;

import java.util.Date;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ca.uqar.forum.dao.SujetDAO;
import ca.uqar.forum.entities.Sujet;
import ca.uqar.forum.services.ISujetService;

@Service
@Transactional
public class SujetService implements ISujetService{
	/* Debug */
	private final static Logger logger = LoggerFactory.getLogger(SujetService.class);

	@Resource
	private SujetDAO	sujetDAO;

	public void saveSujet(Sujet newSujet)
	{
		Date today = new Date();
		
		newSujet.setDateCreation(today);
		logger.debug("Appel de la methode saveSujet");
		logger.debug("Save du Sujet : ["+newSujet.toString()+"]");
		sujetDAO.save(newSujet);
	}
}
