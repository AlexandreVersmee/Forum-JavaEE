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
		
	@Column(name = "createur", nullable = false)
	private long	user_id;
	
	@Column(name = "parent", nullable = false)
	private long	parent_id;
	
	@Column(name = "date_creation", nullable = false)
	private Date	dateCreation;
	
	@Column(name = "date_derniere_modification", nullable = false)
	private Date	dateDerniereModification;
	
	@Column(name = "contenue", nullable = false, columnDefinition="TEXT")
	private String	texte;
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
	private FilDiscution fildiscution;
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
	public long getUser_id() {
		return user_id;
	}
	public long getParent_id() {
		return parent_id;
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
	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}
	public void setParent_id(long parent_id) {
		this.parent_id = parent_id;
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
	/*
	###############################
	#                             #
	#           Methods           #
	#                             #
	###############################
	*/
}
