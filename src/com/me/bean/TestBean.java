/**
 * 
 */
package com.me.bean;

/**
 * @author lenovo
 *
 */
public class TestBean {
private String a;
private String b;
private String c;
public String getA() {
	return a;
}
public void setA(String a) {
	this.a = a;
}
public String getB() {
	return b;
}
public void setB(String b) {
	this.b = b;
}
public String getC() {
	return c;
}
public void setC(String c) {
	this.c = c;
}
//@Override
//public String toString() {
//	return "TestBean [a=" + a + ", b=" + b + ", c=" + c + "]";
//}
public static void main(String[] args) {
	TestBean t= new TestBean();
	t.setA("aa");
	t.setB("ss");
	System.out.println(t);
}

}
