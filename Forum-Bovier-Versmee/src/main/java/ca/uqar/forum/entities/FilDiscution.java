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
@Table(name="fildiscution")
public class FilDiscution {
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
	
	@Column(name = "titre", nullable = false, unique = true)
	private String	title;
	
	@Column(name = "createur", nullable = false)
	private long	user_id;
	
	@Column(name = "sujet", nullable = false)
	private long	sujet_id;
	
	@Column(name = "date_creation", nullable = false)
	private Date	dateCreation;
	
	@Column(name = "date_derniere_modification", nullable = false)
	private Date	dateDerniereModification;
	/*
	###############################
	#                             #
	#         Relation            #
	#                             #
	###############################
	*/
	@OneToOne
	private Sujet sujet;
	
	@OneToOne
	private Membre membre;
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
	public String getTitle() {
		return title;
	}
	public long getUser_id() {
		return user_id;
	}
	public long getSujet_id() {
		return sujet_id;
	}
	public Date getDateCreation() {
		return dateCreation;
	}
	public Date getDateDerniereModification() {
		return dateDerniereModification;
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
	public void setTitle(String title) {
		this.title = title;
	}
	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}
	public void setSujet_id(long sujet_id) {
		this.sujet_id = sujet_id;
	}
	public void setDateCreation(Date dateCreation) {
		this.dateCreation = dateCreation;
	}
	public void setDateDerniereModification(Date dateDerniereModification) {
		this.dateDerniereModification = dateDerniereModification;
	}
	/*
	###############################
	#                             #
	#           Methods           #
	#                             #
	###############################
	*/	
}
