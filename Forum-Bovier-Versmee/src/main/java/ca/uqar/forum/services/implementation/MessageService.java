package ca.uqar.forum.services.implementation;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ca.uqar.forum.dao.DiscussionDAO;
import ca.uqar.forum.dao.MessageDAO;
import ca.uqar.forum.entities.FilDiscussion;
import ca.uqar.forum.entities.Message;
import ca.uqar.forum.services.IMessageService;

public class MessageService implements IMessageService
{
	/* Debug */
	private final static Logger logger = LoggerFactory.getLogger(MessageService.class);

	@Resource
	private MessageDAO		messageDAO;
	
	@PersistenceContext
	private EntityManager	entityManager;
	/*
	###############################
	#                             #
	#        CUSTOM QUERY JPQL    #
	#                             #
	###############################
	*/
	@Override
	public List<Message> readByMessage(Long idDiscussion)
	{
		logger.debug("Appel de la méthode readBySujetId");

		logger.debug("SELECT f FROM Message f WHERE f.fildiscussion_id = "+idDiscussion+" ORDER BY parent_id, date_creation" );

		@SuppressWarnings("unchecked")
		TypedQuery<Message> query =  (TypedQuery<Message>) entityManager.createQuery("SELECT f FROM Message f WHERE f.fildiscussion_id = "+idDiscussion+" ORDER BY parent_id, date_creation");
		
		List<Message> messageListe = query.getResultList();
		
		logger.debug("Nombre d'elements dans la liste:[{}])", messageListe.size());
		
		return (messageListe);
	}
}
