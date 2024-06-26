package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.FoodDto;
import data.dto.TourDto;
import mysql.db.DbConnect;

public class FoodDao {
   DbConnect db=new DbConnect();

   //insert
   public void insertFood(FoodDto dto) {

      Connection conn  = db.getConnection();
      PreparedStatement pstmt =null;

      String sql ="insert into food values(null,?,?,?,?,?,?,?,?,?,?,now())";


      try {
         pstmt = conn.prepareStatement(sql);

         pstmt.setString(1, dto.getF_subject());
         pstmt.setString(2, dto.getF_subject_k());
         pstmt.setString(3, dto.getF_content());
         pstmt.setString(4, dto.getF_image());
         pstmt.setString(5, dto.getF_location());
         pstmt.setString(6, dto.getF_link());
         pstmt.setString(7, dto.getF_time());
         pstmt.setString(8, dto.getF_holiday());
         pstmt.setString(9, dto.getF_menu());
         pstmt.setString(10, dto.getF_googlemap());

         pstmt.execute();

      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }


   }

   //전체 목록
   public List<FoodDto> getAllFoods()
   {
      List<FoodDto> list=new ArrayList<FoodDto>();


      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;

      String sql="select * from food order by f_num desc";

      try {
         pstmt=conn.prepareStatement(sql);
         rs=pstmt.executeQuery();

         while(rs.next())
         {
            FoodDto dto=new FoodDto();

            dto.setF_num(rs.getString("f_num"));
            dto.setF_subject(rs.getString("f_subject"));
            dto.setF_subject_k(rs.getString("f_subject_k"));
            dto.setF_content(rs.getString("f_content"));
            dto.setF_image(rs.getString("f_image"));
            dto.setF_location(rs.getString("f_location"));
            dto.setF_link(rs.getString("f_link"));
            dto.setF_time(rs.getString("f_time"));            
            dto.setF_holiday(rs.getString("f_holiday"));
            dto.setF_menu(rs.getString("f_menu"));
            dto.setF_googlemap(rs.getString("f_googlemap"));
            dto.setF_writeday(rs.getTimestamp("f_writeday"));

            list.add(dto);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(rs, pstmt, conn);
      }

      return list;
   }

   //get data
   public FoodDto getFood(String f_num)
   {
      FoodDto dto=new FoodDto();

      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;

      String sql="select * from food where f_num=?";

      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, f_num);
         rs=pstmt.executeQuery();

         if(rs.next())
         {
            dto.setF_num(rs.getString("f_num"));
            dto.setF_subject(rs.getString("f_subject"));
            dto.setF_subject_k(rs.getString("f_subject_k"));
            dto.setF_content(rs.getString("f_content"));
            dto.setF_image(rs.getString("f_image"));
            dto.setF_location(rs.getString("f_location"));
            dto.setF_link(rs.getString("f_link"));
            dto.setF_time(rs.getString("f_time"));            
            dto.setF_holiday(rs.getString("f_holiday"));
            dto.setF_menu(rs.getString("f_menu"));
            dto.setF_googlemap(rs.getString("f_googlemap"));
            dto.setF_writeday(rs.getTimestamp("f_writeday"));
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(rs, pstmt, conn);
      }

      return dto;
   }
   
   
   
   
   //수정..
   public void updateFood(FoodDto dto)
   {
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="update food set f_subject_k=?, f_subject=?,f_image=?, f_content=?,f_location=?,f_link=?,f_time=?,f_holiday=?,f_menu=?,f_googlemap=? where f_num=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         
         pstmt.setString(1, dto.getF_subject_k());
         pstmt.setString(2, dto.getF_subject());
         pstmt.setString(3, dto.getF_image());
         pstmt.setString(4, dto.getF_content());
         pstmt.setString(5, dto.getF_location());
         pstmt.setString(6, dto.getF_link());
         pstmt.setString(7, dto.getF_time());
         pstmt.setString(8, dto.getF_holiday());
         pstmt.setString(9, dto.getF_menu());
         pstmt.setString(10, dto.getF_googlemap());
         
         pstmt.setString(11, dto.getF_num());
         
         pstmt.execute();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }
      
   }
   
   //삭제
   public void deleteFood(String f_num)
   {
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="delete from food where f_num=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, f_num);
         pstmt.execute();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }
      
   }
   
 //검색
   public List<FoodDto> searchFoods(String keyword, String category){
	   List<FoodDto> list=new ArrayList<FoodDto>();
	   
	   Connection conn=db.getConnection();
	   PreparedStatement pstmt=null;
	   ResultSet rs=null;
	   
	   String sql = "";
	    if (keyword != null && !keyword.trim().isEmpty()) {
	        // 키워드가 있는 경우
	        sql = "SELECT * FROM food WHERE (f_subject LIKE ? OR f_subject_k LIKE ? OR f_content LIKE ?) AND f_category = ? ORDER BY f_num DESC";
	    } else {
	        // 키워드가 없는 경우
	        sql = "SELECT * FROM food WHERE f_category = ? ORDER BY f_num DESC";
	    }
	   
	   try {
		pstmt=conn.prepareStatement(sql);
		if (keyword != null && !keyword.trim().isEmpty()) {
            pstmt.setString(1, "%" + keyword + "%");
            pstmt.setString(2, "%" + keyword + "%");
            pstmt.setString(3, "%" + keyword + "%");
            pstmt.setString(4, category);
        } else {
            pstmt.setString(1, category);
        }
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			FoodDto dto=new FoodDto();
            dto.setF_num(rs.getString("f_num"));
            dto.setF_subject(rs.getString("f_subject"));
            dto.setF_subject_k(rs.getString("f_subject_k"));
            dto.setF_content(rs.getString("f_content"));
            dto.setF_image(rs.getString("f_image"));
            dto.setF_location(rs.getString("f_location"));
            dto.setF_link(rs.getString("f_link"));
            dto.setF_time(rs.getString("f_time"));            
            dto.setF_holiday(rs.getString("f_holiday"));
            dto.setF_menu(rs.getString("f_menu"));
            dto.setF_googlemap(rs.getString("f_googlemap"));
            dto.setF_writeday(rs.getTimestamp("f_writeday"));
            dto.setF_category(rs.getString("f_category"));
			
			list.add(dto);
		}
	   } catch (SQLException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
	   }finally {
		   db.dbClose(rs, pstmt, conn);
	   }
	   return list;
   }
}