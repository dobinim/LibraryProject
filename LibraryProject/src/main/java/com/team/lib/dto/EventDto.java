package com.team.lib.dto;

public class EventDto {
	private int eId;				// id
	private String eTitle;			// 행사 이름
	private String eGroup;			// 행사 분류
	private String eContent;		// 행사 내용
	private String eWriteDate;		// 작성일
	private String ePhoto;			// 배너 사진
	private String eStartReg;		// 접수 시작
	private String eEndReg;			// 접수 마감
	private String ePlace;			// 행사 장소
	private String eHour;			// 행사 시간
	private String eStart;			// 행사 시작
	private String eEnd;			// 행사 끝
	
	// 검색용 
	private String ekeyword;	
	
	public EventDto() {
		super();
	}
	

	public EventDto(int eId, String eTitle, String eGroup, String eContent, String eWriteDate, String ePhoto,
			String eStartReg, String eEndReg, String ePlace, String eHour, String eStart, String eEnd, String ekeyword) {
		super();
		this.eId = eId;
		this.eTitle = eTitle;
		this.eGroup = eGroup;
		this.eContent = eContent;
		this.eWriteDate = eWriteDate;
		this.ePhoto = ePhoto;
		this.eStartReg = eStartReg;
		this.eEndReg = eEndReg;
		this.ePlace = ePlace;
		this.eHour = eHour;
		this.eStart = eStart;
		this.eEnd = eEnd;
		this.ekeyword = ekeyword;
	}





	public EventDto(int eId, String eTitle, String eGroup, String eContent, String eWriteDate, String ePhoto,
			String eStartReg, String eEndReg, String ePlace, String eHour, String eStart, String eEnd) {
		super();
		this.eId = eId;
		this.eTitle = eTitle;
		this.eGroup = eGroup;
		this.eContent = eContent;
		this.eWriteDate = eWriteDate;
		this.ePhoto = ePhoto;
		this.eStartReg = eStartReg;
		this.eEndReg = eEndReg;
		this.ePlace = ePlace;
		this.eHour = eHour;
		this.eStart = eStart;
		this.eEnd = eEnd;
	}
	
	
	// 행사 등록을 위한 생성자 (File 등록)
	public EventDto(int eId, String eTitle, String eGroup, String eContent, String eWriteDate, String eStartReg,
			String eEndReg, String ePlace, String eHour, String eStart, String eEnd) {
		super();
		this.eId = eId;
		this.eTitle = eTitle;
		this.eGroup = eGroup;
		this.eContent = eContent;
		this.eWriteDate = eWriteDate;
		this.eStartReg = eStartReg;
		this.eEndReg = eEndReg;
		this.ePlace = ePlace;
		this.eHour = eHour;
		this.eStart = eStart;
		this.eEnd = eEnd;
	}
	

	// getter, setter 
	public int geteId() {
		return eId;
	}


	public void seteId(int eId) {
		this.eId = eId;
	}


	public String geteTitle() {
		return eTitle;
	}


	public void seteTitle(String eTitle) {
		this.eTitle = eTitle;
	}


	public String geteGroup() {
		return eGroup;
	}


	public void seteGroup(String eGroup) {
		this.eGroup = eGroup;
	}


	public String geteContent() {
		return eContent;
	}


	public void seteContent(String eContent) {
		this.eContent = eContent;
	}


	public String geteWriteDate() {
		return eWriteDate;
	}


	public void seteWriteDate(String eWriteDate) {
		this.eWriteDate = eWriteDate;
	}


	public String getePhoto() {
		return ePhoto;
	}


	public void setePhoto(String ePhoto) {
		this.ePhoto = ePhoto;
	}


	public String geteStartReg() {
		return eStartReg;
	}


	public void seteStartReg(String eStartReg) {
		this.eStartReg = eStartReg;
	}


	public String geteEndReg() {
		return eEndReg;
	}


	public void seteEndReg(String eEndReg) {
		this.eEndReg = eEndReg;
	}


	public String getePlace() {
		return ePlace;
	}


	public void setePlace(String ePlace) {
		this.ePlace = ePlace;
	}


	public String geteHour() {
		return eHour;
	}


	public void seteHour(String eHour) {
		this.eHour = eHour;
	}


	public String geteStart() {
		return eStart;
	}


	public void seteStart(String eStart) {
		this.eStart = eStart;
	}


	public String geteEnd() {
		return eEnd;
	}


	public void seteEnd(String eEnd) {
		this.eEnd = eEnd;
	}

	// 검색을 위한 keyword
	public String geteKeyword() {
		return ekeyword;
	}


	public void seteKeyword(String ekeyword) {
		this.ekeyword = ekeyword;
	}

	

}