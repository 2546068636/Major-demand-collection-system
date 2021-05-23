package com.me.bean;

public class MyData {

	public MyData() {
		// TODO Auto-generated constructor stub
	}
	private String name;
	private String value;
	@Override
	public String toString() {
		return "MyData [name=" + name + ", value=" + value + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public MyData(String name, String value) {
		super();
		this.name = name;
		this.value = value;
	}
	

}
