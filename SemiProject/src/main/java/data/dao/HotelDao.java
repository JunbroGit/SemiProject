package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.HotelDto;

import mysql.db.DbConnect;

public class HotelDao {
	DbConnect db = new DbConnect();
	
	   //insert
		public void insertHotel(HotelDto dto) {

			Connection conn  = db.getConnection();
			PreparedStatement pstmt =null;

			String sql ="insert into hotel values(null,?,?,?,?,?,?,now())";


			try {
				pstmt = conn.prepareStatement(sql);


				pstmt.setString(1, dto.getH_subject());
				pstmt.setString(2, dto.getH_content());
				pstmt.setString(3, dto.getH_image());
				pstmt.setString(4, dto.getH_location());
				pstmt.setString(5, dto.getH_category());
				pstmt.setString(6, dto.getH_googlemap());

				pstmt.execute();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}


		}
		
		
		//list 나열
		public List<HotelDto> getAllHotels()
		{
			List<HotelDto> list=new ArrayList<HotelDto>();

			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;

			String sql="select * from hotel order by h_num desc";

			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();

				while(rs.next())
				{
					HotelDto dto=new HotelDto();

					dto.setH_num(rs.getString("h_num"));
					dto.setH_subject(rs.getString("h_subject"));
					dto.setH_content(rs.getString("h_content"));
					dto.setH_image(rs.getString("h_image"));
					dto.setH_location(rs.getString("h_location"));
					dto.setH_link(rs.getString("h_link"));
					dto.setH_category(rs.getString("h_category"));
					dto.setH_writeday(rs.getTimestamp("h_writeday"));
					dto.setH_googlemap(rs.getString("h_googlemap"));
					

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

		
	   //데이터 받기
		public HotelDto getHotel(String h_num)
		{

			HotelDto dto = new HotelDto();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from hotel where h_num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, h_num);
				rs=pstmt.executeQuery();
				
				if(rs.next())
				{
					dto.setH_num(rs.getString("h_num"));
					dto.setH_subject(rs.getString("h_subject"));
					dto.setH_content(rs.getString("h_content"));
					dto.setH_image(rs.getString("h_image"));
					dto.setH_location(rs.getString("h_location"));
					dto.setH_link(rs.getString("h_link"));
					dto.setH_category(rs.getString("h_category"));
					dto.setH_writeday(rs.getTimestamp("h_writeday"));
					dto.setH_googlemap(rs.getString("h_googlemap"));
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			
			return dto;
		}
		

}
