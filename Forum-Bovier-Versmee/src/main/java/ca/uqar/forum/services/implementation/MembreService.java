package ca.uqar.forum.services.implementation;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ca.uqar.forum.dao.MembreDAO;
import ca.uqar.forum.entities.Membre;
import ca.uqar.forum.services.IMembreService;

@Service
@Transactional
public class MembreService implements IMembreService
{
	/* Debug */
	private final static Logger logger = LoggerFactory.getLogger(MembreService.class);

	@Resource
	private MembreDAO	membreDAO;
	
	public Membre findByPseudo(String membrePseudo) {
		logger.debug("Appel de la mÃ©thode findByPseudo sur "+ membrePseudo);
		Membre membreFind = membreDAO.findByPseudo(membrePseudo);
		logger.debug("retour de FindByPseudo  = "+ membreFind.getPseudo());
		return membreFind;
	}
}
