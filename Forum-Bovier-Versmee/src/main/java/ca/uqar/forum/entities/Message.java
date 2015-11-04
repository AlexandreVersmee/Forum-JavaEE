package ca.uqar.forum.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="message")
public class Message {	
	/*
	###############################
	#                             #
	# Constructeur / Destructeur  #
	#                             #
	###############################
	*/
	/*
	###############################
	#                             #
	#         Attribut            #
	#                             #
	###############################
	*/
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long	id;
		
	@Column(name = "date_creation", nullable = false)
	private Date	dateCreation;
	
	@Column(name = "date_derniere_modification", nullable = false)
	private Date	dateDerniereModification;
	
	@Column(name = "contenue", nullable = false, columnDefinition="TEXT")
	private String	texte;
	
	@Column(name = "parent_id", nullable = false)
	private Long	parentId;
	
	/*
	###############################
	#                             #
	#         Relation            #
	#                             #
	###############################
	*/
	@OneToOne
	private Membre membre;
	
	@OneToOne
	private FilDiscussion fildiscussion;
	/*
	###############################
	#                             #
	#         Getter              #
	#                             #
	###############################
	*/
	public long getId() {
		return id;
	}
	public Date getDateCreation() {
		return dateCreation;
	}
	public Date getDateDerniereModification() {
		return dateDerniereModification;
	}
	public String getTexte() {
		return texte;
	}
	public Long getParentId() {
		return parentId;
	}
	public Membre getMembre() {
		return membre;
	}
	public FilDiscussion getFildiscussion() {
		return fildiscussion;
	}
	/*
	###############################
	#                             #
	#         Setter              #
	#                             #
	###############################
	*/
	public void setId(long id) {
		this.id = id;
	}
	public void setDateCreation(Date dateCreation) {
		this.dateCreation = dateCreation;
	}
	public void setDateDerniereModification(Date dateDerniereModification) {
		this.dateDerniereModification = dateDerniereModification;
	}
	public void setTexte(String texte) {
		this.texte = texte;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	public void setMembre(Membre membre) {
		this.membre = membre;
	}
	public void setFildiscussion(FilDiscussion fildiscussion) {
		this.fildiscussion = fildiscussion;
	}
	/*
	###############################
	#                             #
	#           Methods           #
	#                             #
	###############################
	*/
}
