package com.wking.controller;

import com.aliyuncs.*;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.facebody.model.v20191230.GetFaceEntityResponse;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.wking.mapper.lovesMapper;
import com.wking.mapper.orderMapper;
import com.wking.mapper.productMapper;
import com.wking.mapper.userMapper;
import com.wking.pojo.Goods;
import com.wking.pojo.User;
import com.wking.util.JsonUtils;
import com.wking.util.userAnalysis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author Wking
 * @create 2020-12-15 15:56
 */
@Controller

@RequestMapping("/")

public class userController {
    userAnalysis analysis=new userAnalysis();
    @Autowired
   userMapper userMapper;
    @RequestMapping("/signup")
    public String signup()
    {
        return "register";
    }
    @RequestMapping("/face")
    public String checkFace()
    {   //建立与阿里云的连接
        DefaultProfile profile = DefaultProfile.getProfile("cn-shanghai","LTAI4GEH2M1ong5MhRTBt6Xh","1Y5ZiC8YrNWFxQgjmKYGQKSyhmvLt0");
        IAcsClient client = new DefaultAcsClient(profile);

        return "";
    }
    @RequestMapping("/checkcode")
    @ResponseBody
    public String check(String phone)
    {
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyyMMdd");
        String SendDate=(dateFormat.format(date)).toString();
        String PhoneNumber=phone;
        Long PageSize=1L;
        Long CurrentPage=1L;
        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "<accessKeyId>", "<accessSecret>");
        IAcsClient client = new DefaultAcsClient(profile);
        CommonRequest request = new CommonRequest();
        request.setSysMethod(MethodType.POST);
        request.setSysDomain("dysmsapi.aliyuncs.com");
        request.setSysVersion("2017-05-25");
        request.setSysAction("QuerySendDetails");
        request.putQueryParameter("RegionId", "cn-hangzhou");
        request.putQueryParameter("PhoneNumber", "15802665289");
        request.putQueryParameter("SendDate", "20201218");
        request.putQueryParameter("PageSize", "1");
        request.putQueryParameter("CurrentPage", "1");
        try {
            CommonResponse response = client.getCommonResponse(request);
        return  JsonUtils.objectToJson(response);

        } catch (ServerException e) {
            e.printStackTrace();
        } catch (ClientException e) {
            e.printStackTrace();
        }
        return "";
    }
    @RequestMapping("/register")

    public String register(User u) throws IOException {



        int i = userMapper.register(u);
        if(i!=0)
        {
            return "login";}

        return "register";
    }

    @Autowired
    productMapper productMapper;
    @RequestMapping("/getindex")
    public String getproducts(Model model,HttpServletRequest request) throws IOException {

        HttpSession session = request.getSession();
        Integer cid =(Integer) session.getAttribute("cid");
        System.out.println("用户喜好id是："+cid);
        if(session.getAttribute("user")==null)
        {
            return "login";
        }

        if(cid!=0)
        {
            List<Goods> cidgoods = productMapper.findByCid(cid);
            model.addAttribute("products",cidgoods);
            return "list";
        }
        List<Goods> p = productMapper.findall();
        model.addAttribute("products",p);
        return "list";
    }
    @Autowired
    orderMapper orderMapper;
    @Autowired
    lovesMapper lovesMapper;

    @RequestMapping("/login")
    public String login(User u, HttpServletRequest request,Model model) throws IOException {

        User user = userMapper.login(u);

        System.out.println(user);
        if(user!=null)
        {
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            model.addAttribute("u",user);
            List<String> oid = orderMapper.selectOidByUid(user.getUid());

            session.setAttribute("oids",oid);
            if(oid.size()!=0)
            model.addAttribute("oid",oid.get(0));
            else {
                model.addAttribute("oid",0);
            }
            List<Integer> cid = lovesMapper.select(user.getUid());

            int usercid = this.analysis.analysis(cid);
           session.setAttribute("cid",usercid);
           session.setAttribute("flag",0);
            return getproducts(model,request);
        }
        else{

            return "login";}

    }
    @RequestMapping("/signout")
    public String loginOut(HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        return "login";
    }
}
