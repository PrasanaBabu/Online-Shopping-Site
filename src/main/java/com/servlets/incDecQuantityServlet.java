package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.UserDao;


@WebServlet("/incDecQuantityServlet")
public class incDecQuantityServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		HttpSession session = request.getSession();
		
		String email=session.getAttribute("email").toString();
		
		String product_id = request.getParameter("id");
		
		String incDec = request.getParameter("quantity");
	
		//System.out.println(incDec);
		
		int quantity = 0;
		int productPrice = 0;
		int productTotal = 0;
		//int cartTotal = 0;
		
		try
		{
			String selectCartQuery = "select * from cart where product_id = '"+product_id+"'and email= '"+email+"' and address is NULL ;";
			Connection con = UserDao.getConn();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectCartQuery);
			
			while(rs.next())
			{
				
				productPrice=rs.getInt("price");
				quantity = rs.getInt("quantity");
				productTotal = rs.getInt("total");
			}
			
			if(quantity==1 && "dec".equals(incDec))
			{
				response.sendRedirect("myCart.jsp?msg=minQuantity");
			}
			
			else if(quantity!=1 && incDec.equals("dec"))
			{
				productTotal= productTotal - productPrice;
				quantity = quantity -1;
				
				String decQuery = "update cart set total = '"+productTotal+"' ,quantity = '"+quantity+"' where email = '"+email+"' and product_id = '"+product_id+"' and address is NULL ;";

				st.executeUpdate(decQuery);
				response.sendRedirect("myCart.jsp?msg=doneDec");
			}
			else
			{
				productTotal+=productPrice;
				quantity += 1;
				
				String incQuery = "update cart set total = '"+productTotal+"' ,quantity = '"+quantity+"' where email = '"+email+"' and product_id = '"+product_id+"' and address is NULL ;";

				st.executeUpdate(incQuery);
				response.sendRedirect("myCart.jsp?msg=doneInc");
			}
		}
		catch(Exception e)
		{
			response.sendRedirect("myCart.jsp?msg=doneInc");
			System.out.println(e);
		}
	
	
		
		
	}

	
}
