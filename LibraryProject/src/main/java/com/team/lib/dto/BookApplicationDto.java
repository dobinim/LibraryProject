package com.team.lib.dto;

import java.sql.Timestamp;

public class BookApplicationDto {

	private int appNo;
	private String appUser;
	private String appBookTitle;
	private String appBookWriter;
	private String appBookPub;
	private String appBookGenre;
	private String appState;
	private Timestamp appDate;
	
	private String user_id;
	
	public BookApplicationDto() {
		super();
	}

	public BookApplicationDto(int appNo, String appUser, String appBookTitle, String appBookWriter, String appBookPub,
			String appBookGenre, String appState, Timestamp appDate) {
		super();
		this.appNo = appNo;
		this.appUser = appUser;
		this.appBookTitle = appBookTitle;
		this.appBookWriter = appBookWriter;
		this.appBookPub = appBookPub;
		this.appBookGenre = appBookGenre;
		this.appState = appState;
		this.appDate = appDate;
	}

	public int getAppNo() {
		return appNo;
	}

	public void setAppNo(int appNo) {
		this.appNo = appNo;
	}

	public String getAppUser() {
		return appUser;
	}

	public void setAppUser(String appUser) {
		this.appUser = appUser;
	}

	public String getAppBookTitle() {
		return appBookTitle;
	}

	public void setAppBookTitle(String appBookTitle) {
		this.appBookTitle = appBookTitle;
	}

	public String getAppBookWriter() {
		return appBookWriter;
	}

	public void setAppBookWriter(String appBookWriter) {
		this.appBookWriter = appBookWriter;
	}

	public String getAppBookPub() {
		return appBookPub;
	}

	public void setAppBookPub(String appBookPub) {
		this.appBookPub = appBookPub;
	}

	public String getAppBookGenre() {
		return appBookGenre;
	}

	public void setAppBookGenre(String appBookGenre) {
		this.appBookGenre = appBookGenre;
	}

	public String getAppState() {
		return appState;
	}

	public void setAppState(String appState) {
		this.appState = appState;
	}

	public Timestamp getAppDate() {
		return appDate;
	}

	public void setAppDate(Timestamp appDate) {
		this.appDate = appDate;
	}

	public BookApplicationDto(int appNo, String appState) {
		super();
		this.appNo = appNo;
		this.appState = appState;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}
