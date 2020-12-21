/**
 * 
 */
package com.wking.pojo;

/**
 * ������Ŀ
 * 
 * @author hb
 *
 *         2019-08-28 16:39:05
 */
public class OrderItem {
	private String id;
	private int qty;
	int pid;

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	/**
	 * ��Ʒ�۸�
	 */
	private double price;
	
	/**
	 *��ϵ����:  ��Ʒ��Ϣ
	 */
	private Goods goods;
	
	/**
	 * ��ϵ���ԣ�����
	 */
	private Order order;
	
	

	/**
	 * @return the order
	 */
	public Order getOrder() {
		return order;
	}

	/**
	 * @param order the order to set
	 */
	public void setOrder(Order order) {
		this.order = order;
	}

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

	/**
	 * @return the price
	 */
	public double getPrice() {
		return price;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(double price) {
		this.price = price;
	}

	/**
	 * @return the goods
	 */
	public Goods getGoods() {
		return goods;
	}

	/**
	 * @param goods the goods to set
	 */
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	
	
}
