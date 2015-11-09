package ca.uqar.forum.entities;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="fildiscution")
public class FilDiscussion {
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
	@ManyToOne(fetch=FetchType.LAZY,cascade =CascadeType.ALL)
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
	public Sujet getSujet() {
		return sujet;
	}
	public Membre getMembre() {
		return membre;
	}
	public Date getDateCreation() {
		return dateCreation;
	}
	public Date getDateDerniereModification() {
		return dateDerniereModification;
	}
	public String getTitle() {
		return title;
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
	public void setSujet(Sujet sujet) {
		this.sujet = sujet;
	}
	public void setMembre(Membre membre) {
		this.membre = membre;
	}
	public void setTitle(String title) {
		this.title = title;
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
