/**
 * 
 */
package com.wking.pojo;

import java.util.ArrayList;
import java.util.List;



/**
 * ���ﳵ
 * 
 * @author hb
 *
 *         2019-08-29 11:39:48
 */
public class Car {
	 double total=0;
	private Integer qty;
	private Goods goods;
	/**
	 * ���ﳵ��Ŀ
	 */
	private List<CarItem> items=new ArrayList<CarItem>();
	

	/**
	 * ��չ��ﳵ
	 */
	public void clear() {

	}

	/**
	 * ���ﳵ�������Ʒ
	 * 
	 * @param goods
	 */
	public void add(Goods goods, int qty) {

		for (int i = 0; i < items.size(); i++) {
			
			CarItem item = items.get(i);
			if (item.getGoods().getPid() == goods.getPid()) {
				this.total+=goods.getShop_price();
				this.qty=item.getQty();
				item.setQty(item.getQty() + qty);
				return;
			}

		}
		CarItem item = new CarItem();
		item.setGoods(goods);
		item.setQty(qty);
		items.add(item);
		this.qty=item.getQty();
		this.total+=item.getGoods().getShop_price()*qty;
	}

	public Car() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Car(double total, Integer qty, Goods goods, List<CarItem> items) {
		super();
		this.total = total;
		this.qty = qty;
		this.goods = goods;
		this.items = items;
	}

	public Integer getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public void setItems(List<CarItem> items) {
		this.items = items;
	}

	/**
	 * ������Ʒ�ı���޸���Ʒ����
	 * 
	 * @param pid
	 * @param qty
	 */
	public void modify(int pid, int qty) {

for (int i = 0; i < items.size(); i++) {
			
			CarItem item = items.get(i);
			if (item.getGoods().getPid() == pid) {
				int eqty=item.getQty();
				item.setQty(qty);
				this.total+=item.getGoods().getShop_price()*item.getQty();
				this.total-=item.getGoods().getShop_price()*eqty;
				return;
			}

		}
		
		
		
	}

	@Override
	public String toString() {
		return "Car{" +
				"total=" + total +
				", qty=" + qty +
				", goods=" + goods +
				", items=" + items +
				'}';
	}

	/**
	 * ������Ʒ�ı���Ƴ���Ʒ
	 * 
	 * @param pid
	 */
	public void delete(int pid) {
for (int i = 0; i < items.size(); i++) {
			
			CarItem item = items.get(i);
			if (item.getGoods().getPid() == pid) {
				this.total-=item.getGoods().getShop_price()*item.getQty();
				items.remove(i);
				return;
			}

		}
	}

	/**
	 * @return the total
	 */
	public double getTotal() {
		return total;
	}

	/**
	 * @return the items
	 */
	public List<CarItem> getItems() {
		return items;
	}

}
