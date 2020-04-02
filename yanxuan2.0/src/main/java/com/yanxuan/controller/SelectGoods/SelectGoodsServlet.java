package com.yanxuan.controller.SelectGoods;

import com.google.gson.Gson;
import com.yanxuan.dao.HotGoodDao;
import com.yanxuan.dto.GoodSpec;
import com.yanxuan.dto.vo.GoodSimpleItem;
import com.yanxuan.entity.Footprint;
import com.yanxuan.entity.GoodInfo;
import com.yanxuan.entity.GoodTypeInfo;
import com.yanxuan.entity.UserInfo;
import com.yanxuan.mapper.GoodInfoMapper;
import com.yanxuan.service.FootprintService;
import com.yanxuan.service.SelectGoodService;
import com.yanxuan.service.SelectGoodTypeService;
import com.yanxuan.service.picLis;
import com.yanxuan.utils.SpringUtils;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class SelectGoodsServlet extends HttpServlet {

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HotGoodDao hotGoodDao=new HotGoodDao();
        int goodId = Integer.valueOf(request.getParameter("goodId"));
        GoodInfo goodInfo = new GoodInfo();
        goodInfo.setGoodId(goodId);

        List<GoodInfo> goodInfos = SelectGoodService.selectGoods(goodInfo);
        List<GoodTypeInfo> GoodTypeInfo = SelectGoodTypeService.selectGoodTypeByID(goodInfo);
        if ( goodInfos.isEmpty() ) {
            //System.out.println("失败");
            //response.sendRedirect("");
        } else {
            //System.out.println("成功");
            request.setAttribute("GoodInfo", goodInfos);
            request.setAttribute("GoodTypeInfo", GoodTypeInfo);
            String goodPic = goodInfos.get(0).getGoodPic();

            //weiwu添加了商品规格的处理
            ClassPathXmlApplicationContext appContext = SpringUtils.getAppContext();
            GoodInfoMapper goodInfoMapper = appContext.getBean(GoodInfoMapper.class);
            GoodInfo goodInfoTem = goodInfoMapper.selectById(goodId);
            Gson gson = new Gson();
            GoodSpec goodSpec = gson.fromJson(goodInfoTem.getGoodSpec(), GoodSpec.class);

            //weiwu添加了：如果当前存在用户登录的话，将访问的商品加入到历史足迹中
            Object userObj = request.getSession().getAttribute("user");

            if ( userObj != null ) {
                //只要用户存在的时候，才会将浏览的商品加入到自己的历史足迹中
                UserInfo user = (UserInfo)userObj;

                FootprintService fService = new FootprintService();
                Footprint footprint = new Footprint();
                footprint.setUserId(user.getUserId());
                footprint.setGoodId(goodId);
                fService.addFootpring(footprint);
                //只要用户存在的时候，才会显示足迹
                List<GoodSimpleItem> detailFootprintList=hotGoodDao.getDetailFootprint(user.getUserId());
                request.setAttribute("detailFootprintList", detailFootprintList);
            }else {
            	//否则显示火爆
            	List<GoodSimpleItem>hotGootList=hotGoodDao.getHotGood();
            	request.setAttribute("hotGootList", hotGootList);
			}
            //显示随机商品
            List<GoodSimpleItem> randomGoodList=hotGoodDao.getRandom();
        	request.setAttribute("randomGoodList", randomGoodList);
            
            request.setAttribute("goodSpec", goodSpec);
            System.out.println(goodSpec);
            //System.out.println(goodPic);
            //GSON直接解析成对象
            picLis picLis = new Gson().fromJson(goodPic, picLis.class);
            request.setAttribute("picLis", picLis);
            request.getRequestDispatcher("/pages/item/detail.jsp").forward(request, response);
        }

    }

    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        doGet(request, response);
    }
}