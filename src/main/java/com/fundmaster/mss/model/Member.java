package com.fundmaster.mss.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_members")
public class Member extends GenericModel<Member>  implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	@Column(name="name", nullable=false)
	String firstname;
	String lastname;
	String othernames;
	Gender gender;
	MaritalStatus maritalStatus;
	@Column (name = "dateOfBirth", nullable = false)
	Date dateOfBirth;
	@Column(name="idNumber", nullable=false)
	String idNumber;
	@Column(name="emailAddress", nullable=false)
	String emailAddress;
	@Column(name="phoneNumber", nullable=false)
	String phoneNumber;
	@Column(name="residentialAddress", nullable=false)
	String residentialAddress;
	@Column(name="city", nullable=false)
	String city;
	Country country;
	@Column (name = "scheme", nullable = false)
	String scheme;
	boolean posted;
	String agentId;
	public String getAgentId() {
		return agentId;
	}
	public void setAgentId(String agentId) {
		this.agentId = agentId;
	}
	public boolean isPosted() {
		return posted;
	}
	public void setPosted(boolean posted) {
		this.posted = posted;
	}
	public Long getId() {
		return id;
	}
	public String getScheme() {
		return scheme;
	}
	public void setScheme(String scheme) {
		this.scheme = scheme;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return firstname;
	}
	public void setName(String name) {
		this.firstname = name;
	}
	public Gender getGender() {
		return gender;
	}
	public void setGender(Gender gender) {
		this.gender = gender;
	}
	public MaritalStatus getMaritalStatus() {
		return maritalStatus;
	}
	public void setMaritalStatus(MaritalStatus maritalStatus) {
		this.maritalStatus = maritalStatus;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getResidentialAddress() {
		return residentialAddress;
	}
	public void setResidentialAddress(String residentialAddress) {
		this.residentialAddress = residentialAddress;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Country getCountry() {
		return country;
	}
	public void setCountry(Country country) {
		this.country = country;
	}
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Member(Long id, String firstname, String lastname,
			String othernames, Gender gender, MaritalStatus maritalStatus,
			Date dateOfBirth, String idNumber, String emailAddress,
			String phoneNumber, String residentialAddress, String city,
			Country country, String scheme) {
		super();
		this.id = id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.othernames = othernames;
		this.gender = gender;
		this.maritalStatus = maritalStatus;
		this.dateOfBirth = dateOfBirth;
		this.idNumber = idNumber;
		this.emailAddress = emailAddress;
		this.phoneNumber = phoneNumber;
		this.residentialAddress = residentialAddress;
		this.city = city;
		this.country = country;
		this.scheme = scheme;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getOthernames() {
		return othernames;
	}
	public void setOthernames(String othernames) {
		this.othernames = othernames;
	}
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
