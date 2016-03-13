package com.peak.house;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.peak.house.po.*;
import com.peak.house.service.*;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = 
{"classpath:spring/applicationContext-db.xml",
		"classpath:spring/applicationContext-transaction.xml",
"classpath:spring/springmvc.xml"})  
public class EnvTest {

	private static Logger logger = Logger.getLogger(EnvTest.class);

	@Resource
	private UserService userService ;
	@Resource
	private AgentService agentService ;
	@Resource
	private HouseService houseService ;
	@Resource
	private SellService sellService ;
	@Resource
	private OrderService orderService ;
	@Resource
	private AttentionService attentionService ;
	

	@Test
	public void test_mybatis(){
		Users user = userService.findById(113);  
		logger.debug(user);  
	}
	@Test
	public void test_user_finduserlist(){
		Users user = new Users();
		//		user.setGender("male");
		user.setNickname("user");
		List<Users> list = userService.findUsers(user).getList();
		logger.debug("***"+list);  
	}


	@Test
	public void test_house_findlist(){
		House house = new House();
		house.setPrice(new Double("100"));
		house.setAcreage(new Double(101));
		house.setAge(new Integer(1));
		List<House> list = houseService.findHouses(house).getList();
		logger.debug("***"+list);
	}
	@Test
	public void test_sell_findlist(){
		Sell sell = new Sell();

		List<Sell> list = sellService.findSell(sell).getList();
		logger.debug("***"+list);
	}
	
	@Test
	public void test_order_findlist(){
		Order order = new Order();

		List<Order> list = orderService.findOrder(order).getList();
		logger.debug("***"+list);
	}
	
	@Test
	public void test_attention_find(){
		Attention attention = new Attention();
		attention.setUid(407L);
		
		List<House> list = attentionService.findAttentions(attention).getList();
		logger.debug("***"+list);
	}



	//@Test
	public void test_insert_user() throws Exception{
		Users user = new Users();
		for(int i=0;i<100;i++){
			user.setPhone("139"+(10000000+i));
			user.setPassword("pwd"+123);
			user.setNickname("user"+i);
			if(i%2==0){
				user.setGender("male");
				user.setAddress("北京");
			}else{
				user.setGender("fmale");
				user.setAddress("天津");
			}
			userService.add(user);
		}
	}

	//@Test
	public void test_insert_agent() throws Exception{
		Agent agent = new Agent();
		for(int i=0;i<100;i++){
			agent.setPhone("139"+(10000000+i));
			agent.setNickname("agent"+i);
			if(i%2==0){
				agent.setGender("male");
			}else{
				agent.setGender("fmale");
			}
			agentService.add(agent);
		}
	}

	//@Test
	public void test_insert_house() throws Exception{
		House house = new House();
		for(int i=0;i<20;i++){
			if(i%3==0){
				house.setVillage("西二旗");
				house.setPrice(new Double(180));
				house.setUnitprice(new Double(2));
				house.setAcreage(new Double(90));
				house.setHand(new Integer(2));
				house.setType(new Integer(3));
				house.setOrientation("东");
				house.setAge(new Integer(4));
				house.setFloor(new Integer(8));
				house.setDownpay(new Double(20));
				house.setMonth(new Integer(20));
				house.setMonthpay(new Double(1.2));
				house.setAreaid("10");

			}else if(i%2==0){
				house.setVillage("上地");
				house.setPrice(new Double(220));
				house.setUnitprice(new Double(2));
				house.setAcreage(new Double(110));
				house.setHand(new Integer(2));
				house.setType(new Integer(4));
				house.setOrientation("西");
				house.setAge(new Integer(5));
				house.setFloor(new Integer(12));
				house.setDownpay(new Double(25));
				house.setMonth(new Integer(20));
				house.setMonthpay(new Double(1.5));
				house.setAreaid("10");

			}else{
				house.setVillage("立水桥");
				house.setPrice(new Double(190));
				house.setUnitprice(new Double(2));
				house.setAcreage(new Double(95));
				house.setHand(new Integer(1));
				house.setType(new Integer(3));
				house.setOrientation("南北");
				house.setAge(new Integer(6));
				house.setFloor(new Integer(20));
				house.setDownpay(new Double(22));
				house.setMonth(new Integer(20));
				house.setMonthpay(new Double(1.3));
				house.setAreaid("1");
			}
			houseService.add(house);

		}
	}


	//@Test
	public void test_insert_sell() throws Exception{
		Sell sell = new Sell();
		long tem1 = 210L;
		long tem2 = 10L;
		for(int i=0;i<50;i++){
			sell.setTitle("首付110万无税地铁学区房随时可看双阳台"+i);
			sell.setContent("房子介绍"+i+"    1，房屋特点：此房三室全明，双南一北，厨卫朝北），黄金楼层  2，价格优势：此房满五年无税，此价净得（各自付税），房东诚意出售亲自委托钥匙，随时看房，此单价与本小区房屋相比已是最低的  3，环境优势：此房位于小区中心位置，景观好，周边生活便利，步行地铁（一号线新街口站）只要10分钟。（未来地铁出口！升值空间巨大）  4，自我介绍：我最大的优点是真实、诚信！对于房子的优缺点，绝不隐瞒，房源信息100%真实，给您一个干净真实的房产世界。客户为尊，诚信为本！因为专业，所以值得信赖！选择我，选择专业，选择中广置业！  要想了解更多房源，您可以点击左上角我的头像进入我的网上店铺，欢迎您随时关注，来电咨询！中广置业刘家兴电话：18795912667");
			sell.setAid(tem1++);
			sell.setHid(tem2++);
			sell.setAddtime(new Date());
			sellService.add(sell);
		}
	}

	//@Test
	public void test_insert_order() throws Exception{
		Order order = new Order();
		long aid = 210L;
		long hid = 10L;
		long uid = 310L;
		for(int i=0;i<20;i++){
			//if(i%2==0){
				order.setAid(aid++);
				order.setHid(hid++);
				order.setUid(uid++);
				order.setAddtime(new Date());
				order.setRealprice(new Double(200));
				orderService.add(order);
			//}
		}
	}
}
