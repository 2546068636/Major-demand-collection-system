package com.me.bean;

public class IPBean {

	public IPBean() {
		// TODO Auto-generated constructor stub
	}
	private String ip;//ip
	private String sum;//总数
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getSum() {
		return sum;
	}
	public void setSum(String sum) {
		this.sum = sum;
	}
	//tostring方法
	@Override
	public String toString() {
		return "IPBean [ip=" + ip + ", sum=" + sum + "]";
	}
	public IPBean(String ip, String sum) {
		super();
		this.ip = ip;
		this.sum = sum;
	}

	

}
