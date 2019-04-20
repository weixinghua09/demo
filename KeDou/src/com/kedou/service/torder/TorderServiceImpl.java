package com.kedou.service.torder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kedou.dao.torder.TorderDaoImpl;
import com.kedou.entity.Course;
import com.kedou.entity.Torder;
import com.kedou.entity.User;
import com.kedou.superentity.SuperTorder;


@Service
@Transactional(readOnly=false)
public class TorderServiceImpl {
	@Resource
	private TorderDaoImpl torderDaoImpl;
	
	
	/**
	 * 创建 SuperTorder 列表(课程 用户 订单)
	 * @param courselist
	 * @param userlist
	 * @param torderlist
	 * @return
	 */
	public List<SuperTorder> createSuperTorder(Map<Integer,Course> coursemap,Map<Integer,User> usermap,List<Torder> torderlist) {
			List<SuperTorder> supertorderlist = new ArrayList<SuperTorder>();
			
			for(int i=0;i<torderlist.size();i++) {
				supertorderlist.add(new SuperTorder(torderlist.get(i), usermap.get(torderlist.get(i).getUserId()), coursemap.get(torderlist.get(i).getCourseId())));
			}
			return supertorderlist;
	}
	/**
	 * 创建 SuperTorder 列表(课程  订单)
	 * @param courselist
	 * @param userlist
	 * @param torderlist
	 * @return
	 */
	public List<SuperTorder> createSuperTorder(Map<Integer,Course> coursemap,List<Torder> torderlist) {
			List<SuperTorder> supertorderlist = new ArrayList<SuperTorder>();
			
			for(int i=0;i<torderlist.size();i++) {
				supertorderlist.add(new SuperTorder(torderlist.get(i),coursemap.get(torderlist.get(i).getCourseId())));
			}
			return supertorderlist;
	}
	/**
	 * 保存订单
	 * @param order
	 * @throws Exception 
	 */
	public void SaveTorder(Torder order) throws Exception {
		this.torderDaoImpl.save(order);
	}
	/**
	 * 根据订单Id获取订单实体
	 * @param orderId
	 * @return
	 * @throws Exception
	 */
	public Torder getTorder(int orderId) throws Exception {
		return this.torderDaoImpl.get(orderId);
	}
	/**
	 * 更改订单状态
	 * @throws Exception 
	 */
	public void updateState(int state,Date processTime,int orderId) throws Exception {
		this.torderDaoImpl.updateState(new Object[] {state,processTime,orderId});
	}
	/**
	 * 查看商家未处理预约列表 （分页）
	 * @param pageNum
	 * @param pageSize
	 * @param busid
	 * @param orderState
	 * @return
	 * @throws Exception
	 */
	public List<Torder> findOrderByBusIdPage(int pageNum,int pageSize,int busid,int orderState) throws Exception {
		return this.torderDaoImpl.findOrderByUserId(busid, pageSize, pageNum,orderState);
	}
	/**
	 * 
	 * @desc 根据商家id查询其预约订单的总数
	 * @author 陈
	 * @param orderState
	 * @param busid
	 * @createDate 
	 * @return count
	 */
	public long findOrderCountByBusId(int busid,int orderState)throws Exception{
		return this.torderDaoImpl.findOrderCountByBusId(busid,orderState);
	}
	/**
	 * 
	 * @desc 根据商家id 和 日期 查询其预约订单的总数
	 * @author 陈
	 * @param orderState
	 * @param busid
	 * @createDate 
	 * @return count
	 */
	public long findOrderCountByDate(int busid,int orderState,Date date)throws Exception{
		return this.torderDaoImpl.findOrderCountByDate(busid, orderState, date);
	}
	/**
	 * @desc 通过用户ID查找预约课程
	 * @author 陈
	 * @createDate 
	 * @return 
	 */
	public List<Torder> findByUserId(int userid)throws Exception  {
		
			return this.torderDaoImpl.findByUserId(userid);
		
	}
	/**
	 * @desc 通过用户ID和课程ID删除预约课程
	 * @author 陈
	 * @createDate 
	 * @return User
	 */
	public void deleteByCourseIdUserId(int courseid,int userid)throws Exception  {
		
			this.torderDaoImpl.deleteByCourseId(courseid,userid);
		
	}
	/**
	 * @desc 通过用户ID查找分页预约课程
	 * @author 陈
	 * @createDate 
	 * @return User
	 */
	public List<Torder> findByUserIdPage(int pageNum, int pageSize,int userid)throws Exception  {
			Integer []params = {userid};
			return this.torderDaoImpl.findByPage(pageNum,pageSize,params);
		
	}
	/**
	 * 
	 * @desc 根据用户id查询其预约课程的总数
	 * @author 陈
	 * @createDate 
	 * @return count
	 */
	public long findCountByUserId(int userid)throws Exception{
		return this.torderDaoImpl.findCountByUserId(userid);
	}
}
