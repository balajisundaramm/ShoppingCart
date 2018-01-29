package com.spaneos.shoppingcart;


public class AdminLoginBean {
	private String adminUserName;
	private String adminPassword;
	
	/**
	 * @return the aminUserName
	 */
	public String getAdminUserName() {
		return adminUserName;
	}
	/**
	 * @param aminUserName the aminUserName to set
	 */
	public void setAdminUserName(String aminUserName) {
		this.adminUserName = aminUserName;
	}
	/**
	 * @return the adminPassword
	 */
	public String getAdminPassword() {
		return adminPassword;
	}
	/**
	 * @param adminPassword the adminPassword to set
	 */
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((adminPassword == null) ? 0 : adminPassword.hashCode());
		result = prime * result + ((adminUserName == null) ? 0 : adminUserName.hashCode());
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
		if (!(obj instanceof AdminLoginBean)) {
			return false;
		}
		AdminLoginBean other = (AdminLoginBean) obj;
		if (adminPassword == null) {
			if (other.adminPassword != null) {
				return false;
			}
		} else if (!adminPassword.equals(other.adminPassword)) {
			return false;
		}
		if (adminUserName == null) {
			if (other.adminUserName != null) {
				return false;
			}
		} else if (!adminUserName.equals(other.adminUserName)) {
			return false;
		}
		return true;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "AdminLoginBean [adminUserName=" + adminUserName + ", adminPassword=" + adminPassword + "]";
	}
	
}