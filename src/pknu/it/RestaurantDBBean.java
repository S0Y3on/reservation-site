package pknu.it;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RestaurantDBBean {
	 public Connection getConnection() throws Exception{
	  Connection con=null;
	  String url="jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe";
	  String user="db201712028";
	  String passwd="201712028";
	  Class.forName("oracle.jdbc.OracleDriver");
	  con=DriverManager.getConnection(url,user,passwd);
	  return con;
	 }
	 //회원가입
	 public void insertRestaurant(RestaurantDataBean restaurant){
	  Connection con=null;
	  PreparedStatement pstmt1=null;
	  PreparedStatement pstmt2=null;
	  PreparedStatement pstmt3=null;
	  ResultSet rs = null;
	  try {
	   //1,2단계 메서드 호출
	   con=getConnection();
	   System.out.println(restaurant.getId());
	   System.out.println(restaurant.getPwd());
	   String insertMemberSql="insert into member values(?,?,?)";
	   pstmt1=con.prepareStatement(insertMemberSql);
	   pstmt1.setString(1, restaurant.getId());
	   pstmt1.setString(2, restaurant.getPwd());
	   pstmt1.setString(3, "restaurant");
	   pstmt1.executeUpdate();
	   System.out.println(insertMemberSql);
	   
	   String searchSql = "select max(restaurant_no) from restaurant";
	   pstmt2 = con.prepareStatement(searchSql);
       rs = pstmt2.executeQuery();
             
       String r_noStr = null;
       
       while(rs.next()){
    	   r_noStr = rs.getString("max(restaurant_no)");
       }
       int r_noInt = Integer.parseInt(r_noStr);
       r_noInt+=1;
	   
	   String insertRestaurantSql="insert into restaurant values(?,?,?,?,?,?,?)";
	   pstmt3=con.prepareStatement(insertRestaurantSql);
	   pstmt3.setInt(1, r_noInt);
	   pstmt3.setString(2, restaurant.getId());
	   pstmt3.setString(3, restaurant.getName());
	   pstmt3.setString(4, restaurant.getAddress());
	   pstmt3.setString(5, restaurant.getTel());
	   pstmt3.setString(6, restaurant.getRclass());
	   pstmt3.setInt(7, restaurant.getTable());
	   pstmt3.executeUpdate();
	  } catch (Exception e) {
	   e.printStackTrace();
	  }finally{
	   if(rs!=null)try {rs.close();}catch(SQLException ex){}
	   if(pstmt1!=null && pstmt2!=null && pstmt3!=null)try{pstmt1.close(); pstmt2.close(); pstmt3.close();}catch(SQLException ex){}
	   if(con!=null)try{con.close();}catch(SQLException ex){}
	  }
	 }
//	 //회원삭제
//	 public int deleteCustomer(String id, String passwd){
//	  int check=0;
//	  Connection con=null;
//	  PreparedStatement pstmt=null;
//	  String sql="";
//	  ResultSet rs=null;
//	  try{
//	   //1,2단계 메서드 호출
//	   con=getConnection();
//	   // 3단계 : id에 해당하는 passwd를 가져오는 sql(sql 생성)
//	   sql = "select pwd from customer where id=?";
//	   pstmt = con.prepareStatement(sql);
//	   pstmt.setString(1, id);
//	   // 4단계 실행 => rs저장
//	   rs = pstmt.executeQuery();
//	   // 5단계 rs 데이터있으면 id있음
//	   //   폼비밀번호 rs비밀번호 비교 맞으면 => 수정
//	   //                     틀리면 => 비밀번호틀림
//	   //            없으면 id없음
//	   if(rs.next()){
//	    //id있음
//	    String dbPass=rs.getString("pwd");
//	    if(passwd.equals(dbPass)){
//	     //비밀번호 맞음 수정
//	     sql = "delete from member where id=?";
//	     pstmt=con.prepareStatement(sql);
//	     pstmt.setString(1, id);
//	     
//	     // 4단계 실행
//	     pstmt.executeUpdate(); //insert,update,delete
//	     
//	     sql="delete from customer where id=?";
//	     pstmt=con.prepareStatement(sql);
//	     pstmt.setString(1, id);
//	     pstmt.executeUpdate();
//	     check=1;
//	    }else{
//	     check=0;
//	    }
//	   }   
//	  }catch (Exception e) {
//	   e.printStackTrace();
//	  }finally{
//	   if(rs!=null)try{rs.close();}catch(SQLException ex){}
//	   if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
//	   if(con!=null)try{con.close();}catch(SQLException ex){}
//	  }
//	  return check;
//	 }
	 public int roleCheck(String id) {
		int check = -1;
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try 
		{
			con = getConnection();
			String sql = "select role from member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			String role = null;
			if(rs.next()) {
				role = rs.getString("role");
			}
			if(role.equals("customer")) {
				check = 1;
			} else {
				check = 0;
			}
		} catch (Exception e) {
			   e.printStackTrace();
		  }finally{
		   if(rs!=null)try{rs.close();}catch(SQLException ex){}
		   if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		   if(con!=null)try{con.close();}catch(SQLException ex){}
		  }
		  return check;
	 }
	 
	 public int userCheck(String id,String passwd){
	  int check=-1;
	  Connection con=null;
	  PreparedStatement pstmt=null;
	  String sql="";
	  ResultSet rs=null;
	  try {
	   con=getConnection();
	   sql="select pwd from member where id=?";
	   pstmt=con.prepareStatement(sql);
	   pstmt.setString(1, id);
	   rs=pstmt.executeQuery();

	   if(rs.next()){
	    String dbPass=rs.getString("pwd");
	    if(passwd.equals(dbPass)){
	     check=1;//비밀번호맞음
	    }else{
	     check=0;//비밀번호틀림
	    }
	   }else{
	    check=-1;//아이디없음
	   }
	  } catch (Exception e) {
	   e.printStackTrace();
	  }finally{
	   if(rs!=null)try{rs.close();}catch(SQLException ex){}
	   if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	   if(con!=null)try{con.close();}catch(SQLException ex){}
	  }
	  return check;
	 }
	 //회원정보가져오기
	 public RestaurantDataBean getRestaurant(String id){
	  Connection con=null;
	  PreparedStatement pstmt=null;
	  ResultSet rs=null;
	  String sql="";
	  RestaurantDataBean restaurant=null;
	  try {
	   con=getConnection();

	   sql="select * from restaurant where id=?";
	   pstmt=con.prepareStatement(sql);
	   pstmt.setString(1, id);

	   rs=pstmt.executeQuery();

	   if(rs.next()){
		   restaurant=new RestaurantDataBean();
		   restaurant.setId(rs.getString("id"));
		   restaurant.setName(rs.getString("restaurant_name"));
		   restaurant.setTel(rs.getString("restaurant_tel_no"));
		   restaurant.setAddress(rs.getString("restaurant_addr"));
		   restaurant.setRclass(rs.getString("restaurant_class"));
		   restaurant.setTable(rs.getInt("restaurant_table_no"));
		   
	   }
	  } catch (Exception e) {
	   e.printStackTrace();
	  }finally{
	   if(rs!=null)try{rs.close();}catch(SQLException ex){}
	   if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	   if(con!=null)try{con.close();}catch(SQLException ex){}
	  }
	  return restaurant;
	 }

	//회원수정하기
	 public int updateRestaurant(RestaurantDataBean restaurant){
	  Connection con=null;
	  PreparedStatement pstmt=null;
	  ResultSet rs=null;
	  String sql="";
	  int check=-1;
	  try {
	   //1,2단계 연결메서드 호출
	   con=getConnection();
	   //3단계 id에 해당하는 passwd가져오기
	   sql="select pwd from member where id=?";
	   pstmt=con.prepareStatement(sql);
	   pstmt.setString(1, restaurant.getId());
	   //4단계 rs저장
	   rs=pstmt.executeQuery();
	   //5단계 rs데이터가 있으면
	   //  비밀번호비교 맞으면 check=1
	   //      //3단계 update //4단계 실행
	   //   틀리면 check=0
	   System.out.println("restaurant");
	   System.out.println(restaurant.getPwd());
	   if(rs.next()){
	    String dbPass=rs.getString("pwd");
	    if(restaurant.getPwd().equals(dbPass)){
	     check=1;
	     //3단계
	     sql="update restaurant set restaurant_name=?, restaurant_tel_no=?, restaurant_addr=?, restaurant_class=?, restaurant_table_no=? where id=?";
	     pstmt=con.prepareStatement(sql);
	     pstmt.setString(1, restaurant.getName());
	     pstmt.setString(2, restaurant.getTel());
	     pstmt.setString(3, restaurant.getAddress());
	     pstmt.setString(4, restaurant.getRclass());
	     pstmt.setInt(5, restaurant.getTable());
	     pstmt.setString(6, restaurant.getId());
	     //4단계
	     pstmt.executeUpdate();
	     System.out.println(sql);
	    }else{
	     check=0;
	    }
	   }
	  } catch (Exception e) {
	   e.printStackTrace();
	  }finally{
	   if(rs!=null)try{rs.close();}catch(SQLException ex){}
	   if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	   if(con!=null)try{con.close();}catch(SQLException ex){}
	  }
	  return check;
	 }
//	 //회원리스트
//	 public List getMemberList(){
//	  List memberList = new ArrayList<>();
//	  
//	  Connection con = null;
//	  String sql="";
//	  PreparedStatement pstmt=null; //sql문장을 먼저 미리 쓰겠다
//	  ResultSet rs = null;
//	  try {
//	   //1,2단계 디비연결 메서드 호출
//	   con = getConnection();
//	   //3단계 sql
//	   sql="select * from member";
//	   pstmt = con.prepareStatement(sql);
//	   //4단계 rs저장
//	   rs=pstmt.executeQuery();
//	   //5단계 데이터 있는 경우
//	   //  자바빈객체생성
//	   //  rs => 자바빈저장
//	   while(rs.next()){ //첫번째행
//	    MemberDataBean member = new MemberDataBean(); //한사람꺼에대한 기억장소를 생성
//	    member.setId(rs.getString("id"));
//	    member.setPasswd(rs.getString("passwd"));
//	    member.setName(rs.getString("name"));
//
//
//	    
//	    // 자바빈 => memberList한칸 저장
//	    memberList.add(member);
//	  
//	   }
//	  } catch (Exception e) {
//	   e.printStackTrace();
//	  }finally{
//	   
//	  }
//	  return memberList;
//	 }
	 public int getRestaurantNo(RestaurantDataBean restaurant) {
		 Connection con=null;
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 String sql="";
		 int no = -1;
		 
		 try {
			 con=getConnection();
			 sql="select restaurant_name from restaurant where id=?";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, restaurant.getId());
			 rs=pstmt.executeQuery();
			 
			 if(rs.next()) {
				 no=rs.getInt("restaurant_no");
			 }
		 } catch (Exception e) {
			   e.printStackTrace();
		  }finally{
		   if(rs!=null)try{rs.close();}catch(SQLException ex){}
		   if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		   if(con!=null)try{con.close();}catch(SQLException ex){}
		  }
		  return no;
	}
	 public int idCheck(String id) {
		 int check=-1;
		  Connection con=null;
		  PreparedStatement pstmt=null;
		  String sql="";
		  ResultSet rs=null;
		  try {
			  con=getConnection();
			   sql="select * from member";
			   pstmt=con.prepareStatement(sql);
			   rs=pstmt.executeQuery();
			   System.out.println("ㅋㅋ");
			   while(rs.next()) {
				   System.out.println("ㅋㅋㅋ");
				   String dbId=rs.getString("id");
				    if(id.equals(dbId)){
				    	check=0;
				    	return check;
				    } else {
				    	check=1;
				    }
			   }
		  }catch (Exception e) {
			  e.printStackTrace();
		  }finally{
			   if(rs!=null)try{rs.close();}catch(SQLException ex){}
			   if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			   if(con!=null)try{con.close();}catch(SQLException ex){}
			  }
		 return check;
	 }
}