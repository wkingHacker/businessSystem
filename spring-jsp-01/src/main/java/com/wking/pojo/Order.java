/**
 * 
 */
package com.wking.pojo;

import java.time.LocalDateTime;

/**
 * ������Ϣ
 * 
 * @author hb
 *
 *         2019-08-28 16:37:33
 */
public class Order {
	private String id;
	private double total;
	private LocalDateTime createTime;
	private int qty;
	int uid;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	/**
	 * @return the qty
	 */
	public int getQty() {
		return qty;
	}

	/**
	 * @param qty the qty to set
	 */
	public void setQty(int qty) {
		this.qty = qty;
	}

	// ����״̬
	private String status;

	/**
	 * ��ϵ���ԣ�һ��������Ӧһ���û�
	 * 
	 * ��ϵ���ԣ���java����������֮��Ĺ�����ϵ
	 */


	/**
	 * @return the address
	 */


	/**
	 * @param address the address to set
	 */


	/**
	 * @return the user
	 */


	/**
	 * @param user the user to set
	 */


	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the total
	 */
	public double getTotal() {
		return total;
	}

	/**
	 * @param total the total to set
	 */
	public void setTotal(double total) {
		this.total = total;
	}

	/**
	 * @return the createTime
	 */
	public LocalDateTime getCreateTime() {
		return createTime;
	}

	/**
	 * @param createTime the createTime to set
	 */
	public void setCreateTime(LocalDateTime createTime) {
		this.createTime = createTime;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

}
