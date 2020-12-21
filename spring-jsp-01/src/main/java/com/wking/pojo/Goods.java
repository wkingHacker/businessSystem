/**
 * 
 */
package com.wking.pojo;

import java.time.LocalDate;

/**
 * ��Ʒ
 * 
 * @author hb
 *
 *         2019-08-28 16:40:15
 */
public class Goods {
	private Integer pid;
	private String pname;
	private double market_price;
	private String pdesc;
	private double shop_price;
	private String pdate;
	private String ishot;
	private String pimage;
	int qty;
	int cid;

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public Goods() {
	}

	public Goods(Integer pid, String pname, double market_price, String pdesc, double shop_price, String pdate, String ishot, String pimage) {
		this.pid = pid;
		this.pname = pname;
		this.market_price = market_price;
		this.pdesc = pdesc;
		this.shop_price = shop_price;
		this.pdate = pdate;
		this.ishot = ishot;
		this.pimage = pimage;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public double getMarket_price() {
		return market_price;
	}

	public void setMarket_price(double market_price) {
		this.market_price = market_price;
	}

	public String getPdesc() {
		return pdesc;
	}

	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}

	public double getShop_price() {
		return shop_price;
	}

	public void setShop_price(double shop_price) {
		this.shop_price = shop_price;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public String getIshot() {
		return ishot;
	}

	public void setIshot(String ishot) {
		this.ishot = ishot;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	@Override
	public String toString() {
		return "Goods{" +
				"pid=" + pid +
				", pname='" + pname + '\'' +
				", market_price=" + market_price +
				", pdesc='" + pdesc + '\'' +
				", shop_price=" + shop_price +
				", pdate='" + pdate + '\'' +
				", ishot='" + ishot + '\'' +
				", pimage='" + pimage + '\'' +
				'}';
	}
}
