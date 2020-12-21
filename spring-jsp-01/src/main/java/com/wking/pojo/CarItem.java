/**
 * 
 */
package com.wking.pojo;

/**
 * ���ﳵ��Ŀ
 * 
 * @author hb
 *
 *         2019-08-29 11:39:16
 */
public class CarItem {
	private Goods goods;
	private int qty;

	/**
	 * @return the goods
	 */
	public Goods getGoods() {
		return goods;
	}

	@Override
	public String toString() {
		return "CarItem{" +
				"goods=" + goods +
				", qty=" + qty +
				'}';
	}

	/**
	 * @param goods the goods to set
	 */
	public void setGoods(Goods goods) {
		this.goods = goods;
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

}
