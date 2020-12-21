package com.wking.util;



import java.util.*;

/**
 * @author Wking
 * @create 2020-12-17 14:20
 */

public class userAnalysis {
    public static int analysis(List<Integer> cids){
        Map <Integer,Integer>countMap=new HashMap();
        //获得用户添加购物车次数最多的类别
        for(int i=0;i<cids.size();i++)
        {
            int s = cids.get(i);
            if(!countMap.containsKey(s))
            {
                countMap.put(s,1);

            }
            int temp=countMap.get(s);
          countMap.put(s,temp+1);

        }
        Collection<Integer> count = countMap.values();
        System.out.println(count);
        if(count.size()!=0) {
            int maxCount = Collections.max(count);
            int maxnum = 0;
            for (Map.Entry<Integer, Integer> entry : countMap.entrySet()) {
                if (maxCount == entry.getValue()) {
                    maxnum = entry.getKey();
                }

            }
            System.out.println("出现次数最多的元素是："+maxnum);
            return maxnum;
        }



       return 0;
    }
}
