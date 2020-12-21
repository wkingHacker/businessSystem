package com.wking.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.wking.mapper.lovesMapper;
import com.wking.mapper.orderItemMapper;
import com.wking.mapper.orderMapper;
import com.wking.mapper.productMapper;
import com.wking.pojo.*;
import com.wking.util.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

/**
 * @author Wking
 * @create 2020-12-14 16:48
 */
@Controller
@RequestMapping("/")
public class productController {
    double t;
    List<Goods> goods=new ArrayList<>();
    @Autowired
    productMapper productMapper;
    @RequestMapping("/index")
    public String getproducts(Model model,HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        if(session.getAttribute("user")==null)
        {
            return "login";
        }
        List<Goods> p = productMapper.findall();
        model.addAttribute("products",p);
        return "list";
    }
    @RequestMapping("/productDetails")
    public String getDetails(int pid,Model model,HttpServletRequest request){
        HttpSession session = request.getSession();
        Goods good = productMapper.getGoodsById(pid);
        List<Goods> g=new ArrayList<>();
        g.add(good);
        model.addAttribute("detail",g);
        User u=(User)session.getAttribute("user");
        model.addAttribute("user",u);
        return "productDetails";
    }
    @Autowired
    lovesMapper lovesMapper;
    @RequestMapping(value = "/sendCar" )
    public String send(int pid, Model model, int count, HttpServletRequest request)
    {
        Goods g = productMapper.getGoodsById(pid);
        HttpSession session = request.getSession();
         Car car = (Car)session.getAttribute("car");
         User u=(User)session.getAttribute("user");
        if(car==null)
        {
            car =new Car();

            session.setAttribute("car", car);
        }
        car.add(g, count);
        t+=g.getShop_price()*count;
        car.setTotal(t);
        g.setQty(count);
        goods.add(g);
        lovesMapper.insert(g.getCid(),u.getUid());
        model.addAttribute("caritem",goods);
        model.addAttribute("total",t);
        model.addAttribute("qty",count);
        return "car";
    }
    @RequestMapping("/loadcar")
    public String load(HttpServletRequest request,Model model)  {
        HttpSession session = request.getSession();

        Car car =(Car) session.getAttribute("car");
        if(car==null) {

            return "";
        }

        List<CarItem> items = car.getItems();

        System.out.println(items);
        int s=goods.size();
        int flag = (int)session.getAttribute("flag");
        if(flag==1) {
            for(int j=0;j<s;j++){

                goods.remove(0);

            }
            System.out.println("items.size"+items.size());
            for (int i = 0; i < items.size(); i++) {
                Goods good = items.get(i).getGoods();
                System.out.println(good);
                goods.add(good);
            }
            System.out.println("goods集合数据条数："+goods.size());
            t=car.getTotal();
            model.addAttribute("caritem",goods);
            model.addAttribute("total",t);

            return "car";
        }
        model.addAttribute("caritem",goods);
        model.addAttribute("total",t);

        return "car";
    }
    @RequestMapping("/deleteCar")
    public String delete(int pid,HttpServletRequest request,Model model){
        HttpSession session  = request.getSession();
        Car car =(Car) session.getAttribute("car");
        if(car==null) {

            return "没有任何数据";
        }
        car.delete(pid);
        System.out.println("删除后的car是："+car);
        session.setAttribute("flag",1);
        session.setAttribute("car",car);
        return load(request,model);
    }
    @RequestMapping("/modifyCar")
    @ResponseBody
    public String modify(int pid,int qty,HttpServletRequest request,Model model){
        HttpSession session  = request.getSession();
        Car car =(Car) session.getAttribute("car");
        if(car==null) {

            return "没有任何数据";
        }
            car.modify(pid, qty);

            session.setAttribute("car",car);
        String s = JsonUtils.objectToJson(car);
        return s;


    }
    @Autowired
    orderMapper orderMapper;
    @Autowired
    orderItemMapper orderItemMapper;
    @RequestMapping("/saveOrder")
    public String save(HttpServletRequest request,Model model){
        HttpSession session = request.getSession();
        Car car =(Car) session.getAttribute("car");
        Order order = new Order();
        order.setTotal(car.getTotal());
        order.setQty(car.getItems().size());
        String oid = UUID.randomUUID().toString().substring(0,16);
        order.setId(oid);
       User user =(User) session.getAttribute("user");
        order.setUid(user.getUid());
        List<OrderItem> orderItems = new ArrayList<>();
        List<CarItem> carItems=new ArrayList<CarItem>();
        carItems = car.getItems();
        for (int i = 0; i <carItems.size(); i++) {
            CarItem carItem = carItems.get(i);
            OrderItem orderItem = new OrderItem();
            orderItem.setGoods(carItem.getGoods());
            orderItem.setPid(carItem.getGoods().getPid());
            orderItem.setQty(carItem.getQty());
            orderItem.setPrice(carItem.getGoods().getShop_price());
            orderItem.setId(UUID.randomUUID().toString().substring(0,8));
            orderItems.add(orderItem);
        }
        orderMapper.insertOrder(order);
        for (int i = 0; i < orderItems.size(); i++) {
            OrderItem item = orderItems.get(i);

            System.out.println(item.getPid());
            orderItemMapper.add(oid,item);

        }
        List<String> oids = orderMapper.selectOidByUid(user.getUid());
        session.setAttribute("oids",oids);
        session.removeAttribute("car");
        t=0;
        int s=goods.size();
        for(int i=0;i<s;i++)
        {
            goods.remove(0);
        }

        model.addAttribute("oid",oid);
        return getproducts(model,request);
    }
   
    @RequestMapping("/loadOrder")
    public String loadorder(Model model,HttpServletRequest request)
    {HttpSession session = request.getSession();
        List<String> oid = (List<String>) session.getAttribute("oids");
        System.out.println(oid.get(0));
        List<Goods> g=new ArrayList<>();
        Order order = orderMapper.selectByoid(oid.get(0));
        List<OrderItem> orderItems = orderItemMapper.selectpidByoid(oid.get(0));
        for(int i=0;i<orderItems.size();i++)
        {
            Goods good = productMapper.getGoodsById(orderItems.get(i).getPid());
            good.setQty(orderItems.get(i).getQty());
            System.out.println(good);
            g.add(good);
        }
        int size = oid.size();
        model.addAttribute("size",size);
        model.addAttribute("order",order);
        model.addAttribute("orderLists",g);

        return "orderresult";
    }
    @RequestMapping("/loadOrderByindex")
    public String loadIndexOrder(Model model,int index,HttpServletRequest request){
        HttpSession session = request.getSession();
        List<String> oidlist =(List<String>) session.getAttribute("oids");
        System.out.println(oidlist.get(0));
        List<Goods> g=new ArrayList<>();
        Order order = orderMapper.selectByoid(oidlist.get(index));
        List<OrderItem> orderItems = orderItemMapper.selectpidByoid(oidlist.get(index));
        for(int i=0;i<orderItems.size();i++)
        {
            Goods good = productMapper.getGoodsById(orderItems.get(i).getPid());
            good.setQty(orderItems.get(i).getQty());
            System.out.println(good);
            g.add(good);
        }
        model.addAttribute("order",order);
        model.addAttribute("orderLists",g);
        int size = oidlist .size();
        model.addAttribute("size",size);
        return "orderresult";
    }

}
