package com.team.lib.dto;

public class ClassDto {
	private int cId;
	private String cName;
	private String cStartReg; // Date가 아닌 String 객체로 받고, xml에서 함수로 문자형 전환해 줄 예정
	private String cEndReg;
	private String cTitle;
	private String cContent;
	private String cStart;
	private String cEnd;
	private int cNumber;
	private String cPlace;
	private String cPrice;
	private String cPhoto;
	private String cHour;
	private String cGroup;

	private String keyword;
	
	public ClassDto() {
		super();
		
	}

	
	public ClassDto(int cId, String cName, String cStartReg, String cEndReg, String cTitle, String cContent,
			String cStart, String cEnd, int cNumber, String cPlace, String cPrice, String cPhoto, String cHour,
			String cGroup, String keyword) {
		super();
		this.cId = cId;
		this.cName = cName;
		this.cStartReg = cStartReg;
		this.cEndReg = cEndReg;
		this.cTitle = cTitle;
		this.cContent = cContent;
		this.cStart = cStart;
		this.cEnd = cEnd;
		this.cNumber = cNumber;
		this.cPlace = cPlace;
		this.cPrice = cPrice;
		this.cPhoto = cPhoto;
		this.cHour = cHour;
		this.cGroup = cGroup;
		this.keyword = keyword;
	}


	public ClassDto(int cId, String cName, String cStartReg, String cEndReg, String cTitle, String cContent,
			String cStart, String cEnd, int cNumber, String cPlace, String cPrice, String cPhoto, String cHour,
			String cGroup) {
		super();
		this.cId = cId;
		this.cName = cName;
		this.cStartReg = cStartReg;
		this.cEndReg = cEndReg;
		this.cTitle = cTitle;
		this.cContent = cContent;
		this.cStart = cStart;
		this.cEnd = cEnd;
		this.cNumber = cNumber;
		this.cPlace = cPlace;
		this.cPrice = cPrice;
		this.cPhoto = cPhoto;
		this.cHour = cHour;
		this.cGroup = cGroup;
	}

	
	// 게시물 수정을 위한 생성자
	public ClassDto(int cId, String cName, String cStartReg, String cEndReg, String cTitle, String cContent,
			String cStart, String cEnd, int cNumber, String cPlace, String cPrice, String cHour, String cGroup) {
		super();
		this.cId = cId;
		this.cName = cName;
		this.cStartReg = cStartReg;
		this.cEndReg = cEndReg;
		this.cTitle = cTitle;
		this.cContent = cContent;
		this.cStart = cStart;
		this.cEnd = cEnd;
		this.cNumber = cNumber;
		this.cPlace = cPlace;
		this.cPrice = cPrice;
		this.cHour = cHour;
		this.cGroup = cGroup;
	}
	
	
	// getter, setter
	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getcStartReg() {
		return cStartReg;
	}

	public void setcStartReg(String cStartReg) {
		this.cStartReg = cStartReg;
	}

	public String getcEndReg() {
		return cEndReg;
	}

	public void setcEndReg(String cEndReg) {
		this.cEndReg = cEndReg;
	}

	public String getcTitle() {
		return cTitle;
	}

	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public String getcStart() {
		return cStart;
	}

	public void setcStart(String cStart) {
		this.cStart = cStart;
	}

	public String getcEnd() {
		return cEnd;
	}

	public void setcEnd(String cEnd) {
		this.cEnd = cEnd;
	}

	public int getcNumber() {
		return cNumber;
	}

	public void setcNumber(int cNumber) {
		this.cNumber = cNumber;
	}

	public String getcPlace() {
		return cPlace;
	}

	public void setcPlace(String cPlace) {
		this.cPlace = cPlace;
	}

	public String getcPrice() {
		return cPrice;
	}

	public void setcPrice(String cPrice) {
		this.cPrice = cPrice;
	}

	public String getcPhoto() {
		return cPhoto;
	}

	public void setcPhoto(String cPhoto) {
		this.cPhoto = cPhoto;
	}

	public String getcHour() {
		return cHour;
	}

	public void setcHour(String cHour) {
		this.cHour = cHour;
	}

	public String getcGroup() {
		return cGroup;
	}

	public void setcGroup(String cGroup) {
		this.cGroup = cGroup;
	}

	// 검색
	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}



}