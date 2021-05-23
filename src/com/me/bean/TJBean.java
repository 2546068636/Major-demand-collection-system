package com.me.bean;

public class TJBean {
	String tjzdz;
	int num;
	String attribute;
	String type;
	String solution;
	String manageDept;
	String e_address;
	String classify;
	String hangye;
	String glcs;

	public String getTjzdz() {
		return tjzdz;
	}

	public void setTjzdz(String tjzdz) {
		this.tjzdz = tjzdz;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getAttribute() {
		return attribute;
	}

	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSolution() {
		return solution;
	}

	public void setSolution(String solution) {
		this.solution = solution;
	}

	public String getManageDept() {
		return manageDept;
	}

	public void setManageDept(String manageDept) {
		this.manageDept = manageDept;
	}

	public String getE_address() {
		return e_address;
	}

	public void setE_address(String e_address) {
		this.e_address = e_address;
	}

	public String getClassify() {
		return classify;
	}

	public void setClassify(String classify) {
		this.classify = classify;
	}

	public String getHangye() {
		return hangye;
	}

	public void setHangye(String hangye) {
		this.hangye = hangye;
	}

	public String getGlcs() {
		return glcs;
	}

	public void setGlcs(String glcs) {
		this.glcs = glcs;
	}

	@Override
	public String toString() {
		return "TJBean [tjzdz=" + tjzdz + ", num=" + num + ", attribute=" + attribute + ", type=" + type + ", solution="
				+ solution + ", manageDept=" + manageDept + ", e_address=" + e_address + ", classify=" + classify
				+ ", hangye=" + hangye + ", glcs=" + glcs + "]";
	}

	public TJBean(String tjzdz, int num, String attribute, String type, String solution, String manageDept,
			String e_address, String classify, String hangye, String glcs) {
		super();
		this.tjzdz = tjzdz;
		this.num = num;
		this.attribute = attribute;
		this.type = type;
		this.solution = solution;
		this.manageDept = manageDept;
		this.e_address = e_address;
		this.classify = classify;
		this.hangye = hangye;
		this.glcs = glcs;
	}

	public TJBean() {

	}

}
