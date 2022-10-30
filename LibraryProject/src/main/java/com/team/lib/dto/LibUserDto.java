package com.team.lib.dto;

import java.sql.Timestamp;

public class LibUserDto {

	private String pname;
	private String pid;
	private String ppw;
	private String ppwcheck;
	private String pmail1;
	private String pmail2;
	private Timestamp pdate;
	private String auth;
	private String birth1;
	private String birth2;
	private String birth3;
	private String ppn1;
	private String ppn2;
	private String ppn3;
	private String postcode;
	private String address;
	private String detailaddress;
	private String extraaddress;
	
	private String type;
	private String keyword;
	
	public LibUserDto() {
		super();
	}

	public LibUserDto(String pname, String pid, String ppw, String ppwcheck, String pmail1, String pmail2,
			Timestamp pdate, String auth, String birth1, String birth2, String birth3, String ppn1, String ppn2,
			String ppn3, String postcode, String address, String detailaddress, String extraaddress) {
		super();
		this.pname = pname;
		this.pid = pid;
		this.ppw = ppw;
		this.ppwcheck = ppwcheck;
		this.pmail1 = pmail1;
		this.pmail2 = pmail2;
		this.pdate = pdate;
		this.auth = auth;
		this.birth1 = birth1;
		this.birth2 = birth2;
		this.birth3 = birth3;
		this.ppn1 = ppn1;
		this.ppn2 = ppn2;
		this.ppn3 = ppn3;
		this.postcode = postcode;
		this.address = address;
		this.detailaddress = detailaddress;
		this.extraaddress = extraaddress;
	}
	
	public LibUserDto(String pid) {
		super();
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPpw() {
		return ppw;
	}

	public void setPpw(String ppw) {
		this.ppw = ppw;
	}

	public String getPpwcheck() {
		return ppwcheck;
	}

	public void setPpwcheck(String ppwcheck) {
		this.ppwcheck = ppwcheck;
	}

	public String getPmail1() {
		return pmail1;
	}

	public void setPmail1(String pmail1) {
		this.pmail1 = pmail1;
	}

	public String getPmail2() {
		return pmail2;
	}

	public void setPmail2(String pmail2) {
		this.pmail2 = pmail2;
	}

	public Timestamp getPdate() {
		return pdate;
	}

	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public String getBirth1() {
		return birth1;
	}

	public void setBirth1(String birth1) {
		this.birth1 = birth1;
	}

	public String getBirth2() {
		return birth2;
	}

	public void setBirth2(String birth2) {
		this.birth2 = birth2;
	}

	public String getBirth3() {
		return birth3;
	}

	public void setBirth3(String birth3) {
		this.birth3 = birth3;
	}

	public String getPpn1() {
		return ppn1;
	}

	public void setPpn1(String ppn1) {
		this.ppn1 = ppn1;
	}

	public String getPpn2() {
		return ppn2;
	}

	public void setPpn2(String ppn2) {
		this.ppn2 = ppn2;
	}

	public String getPpn3() {
		return ppn3;
	}

	public void setPpn3(String ppn3) {
		this.ppn3 = ppn3;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailaddress() {
		return detailaddress;
	}

	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}

	public String getExtraaddress() {
		return extraaddress;
	}

	public void setExtraaddress(String extraaddress) {
		this.extraaddress = extraaddress;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}
