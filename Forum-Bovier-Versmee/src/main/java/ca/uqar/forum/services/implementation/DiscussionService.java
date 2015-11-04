package ca.uqar.forum.services.implementation;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ca.uqar.forum.dao.DiscussionDAO;
import ca.uqar.forum.entities.FilDiscussion;
import ca.uqar.forum.services.IDiscussionService;

@Service
@Transactional
public class DiscussionService  implements IDiscussionService
{
	/* Debug */
	private final static Logger logger = LoggerFactory.getLogger(DiscussionService.class);

	@Resource
	private DiscussionDAO discussionDAO;
	
	@PersistenceContext
	private EntityManager entityManager;
	
	/*
	###############################
	#                             #
	#        CUSTOM QUERY         #
	#                             #
	###############################
	*/
	@Override
	public List<FilDiscussion> readBySujet(Long idSujet) {
		logger.debug("Appel de la méthode readBySujetId");

		logger.debug("SELECT f FROM FilDiscussion f WHERE f.sujet_id = "+idSujet);

		@SuppressWarnings("unchecked")
		TypedQuery<FilDiscussion> query =  (TypedQuery<FilDiscussion>) entityManager.createQuery("SELECT f FROM FilDiscussion f WHERE f.sujet.id = "+idSujet);
		List<FilDiscussion> FilDiscussionList = query.getResultList();
		logger.debug("Nombre d'elements dans la liste:[{}])", FilDiscussionList.size());
		return (FilDiscussionList);
	}
}
