package com.spaneos.shoppingcart;

public class CartBean {
	private String productName;
	private int price;
	private int quantity;

	public CartBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}



	/**
	 * @param productName the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}



	/**
	 * @return the price
	 */
	public int getPrice() {
		return price;
	}



	/**
	 * @param price the price to set
	 */
	public void setPrice(int price) {
		this.price = price;
	}



	/**
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
	}



	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + price;
		result = prime * result + ((productName == null) ? 0 : productName.hashCode());
		result = prime * result + quantity;
		return result;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (!(obj instanceof CartBean)) {
			return false;
		}
		CartBean other = (CartBean) obj;
		if (price != other.price) {
			return false;
		}
		if (productName == null) {
			if (other.productName != null) {
				return false;
			}
		} else if (!productName.equals(other.productName)) {
			return false;
		}
		if (quantity != other.quantity) {
			return false;
		}
		return true;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "CartBean [productName=" + productName + ", price=" + price + ", quantity=" + quantity + "]";
	}
	
}
