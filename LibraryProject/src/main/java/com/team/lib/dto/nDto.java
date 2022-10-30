package com.team.lib.dto;

import java.sql.Date;

public class nDto {
	private int nId;
	private String nTitle;
	private String nWriter;
	private String nContent;
	private Date nDate;
	private String nFile;
	private int nIndent;
	private int nGroup;
	private int nStep;
	
	public nDto() {
		super();
	}

	public nDto(int nId, String nTitle, String nWriter, String nContent, Date nDate, String nFile, int nIndent, int nGroup, int nStep) {
		super();
		this.nId = nId;
		this.nTitle = nTitle;
		this.nWriter = nWriter;
		this.nContent = nContent;
		this.nDate = nDate;
		this.nFile = nFile;
		this.nIndent = nIndent;
		this.nGroup = nGroup;
		this.nStep = nStep;
	}
	
	

	public nDto(int nId, String nTitle, String nWriter, String nContent, String nFile, int nIndent) {
		super();
		this.nId = nId;
		this.nTitle = nTitle;
		this.nWriter = nWriter;
		this.nContent = nContent;
		this.nFile = nFile;
		this.nIndent = nIndent;
	}
	
	// modifyN()
	public nDto(int nId, String nTitle, String nContent) {
		super();
		this.nId = nId;
		this.nTitle = nTitle;
		this.nContent = nContent;
	}



	public int getnId() {
		return nId;
	}

	public void setnId(int nId) {
		this.nId = nId;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnWriter() {
		return nWriter;
	}

	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public Date getnDate() {
		return nDate;
	}

	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}

	public String getnFile() {
		return nFile;
	}

	public void setnFile(String nFile) {
		this.nFile = nFile;
	}
	
	public int getnIndent() {
		return nIndent;
	}

	public void setnIndent(int nIndent) {
		this.nIndent = nIndent;
	}
	
}
