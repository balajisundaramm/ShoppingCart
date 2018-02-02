package com.spaneos.shoppingcart;

public class CartBean {
	private String product_1;
	private String product_2;
	private String product_3;
	private int number_1;
	private int number_2;
	private int number_3;
	public CartBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getProduct_1() {
		return product_1;
	}
	public void setProduct_1(String product_1) {
		this.product_1 = product_1;
	}
	public String getProduct_2() {
		return product_2;
	}
	public void setProduct_2(String product_2) {
		this.product_2 = product_2;
	}
	public String getProduct_3() {
		return product_3;
	}
	public void setProduct_3(String product_3) {
		this.product_3 = product_3;
	}
	public int getNumber_1() {
		return number_1;
	}
	public void setNumber_1(int number_1) {
		this.number_1 = number_1;
	}
	public int getNumber_2() {
		return number_2;
	}
	public void setNumber_2(int number_2) {
		this.number_2 = number_2;
	}
	public int getNumber_3() {
		return number_3;
	}
	public void setNumber_3(int number_3) {
		this.number_3 = number_3;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + number_1;
		result = prime * result + number_2;
		result = prime * result + number_3;
		result = prime * result + ((product_1 == null) ? 0 : product_1.hashCode());
		result = prime * result + ((product_2 == null) ? 0 : product_2.hashCode());
		result = prime * result + ((product_3 == null) ? 0 : product_3.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CartBean other = (CartBean) obj;
		if (number_1 != other.number_1)
			return false;
		if (number_2 != other.number_2)
			return false;
		if (number_3 != other.number_3)
			return false;
		if (product_1 == null) {
			if (other.product_1 != null)
				return false;
		} else if (!product_1.equals(other.product_1))
			return false;
		if (product_2 == null) {
			if (other.product_2 != null)
				return false;
		} else if (!product_2.equals(other.product_2))
			return false;
		if (product_3 == null) {
			if (other.product_3 != null)
				return false;
		} else if (!product_3.equals(other.product_3))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "CartBean [product_1=" + product_1 + ", product_2=" + product_2 + ", product_3=" + product_3
				+ ", number_1=" + number_1 + ", number_2=" + number_2 + ", number_3=" + number_3 + "]";
	}
	
	


}
