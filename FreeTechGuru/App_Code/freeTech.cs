using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for freeTech
/// </summary>
public class freeTech
{
	List<ListItem> list = new List<ListItem>();
	SqlDataAdapter sqlda;
	SqlCommand cm;
   public SqlConnection db;
   string cn = "", RETVAL = "";
	DataSet ds = new DataSet();
	SqlDataReader dr;
	int x;
	public  freeTech()
	{
		try
		{
			db = new SqlConnection(@"Data Source=sukhi-pc;Initial Catalog=FreeTechGuru;Integrated Security=True");
			if (db.State == ConnectionState.Open)
			{
				db.Close();
			}
			db.Open();
		}
		catch (Exception) { }
	}
	public int readmax(string st)
	{ 
		try{
		cm = new SqlCommand(st, db);
		x = (int)cm.ExecuteScalar();
	 }catch(Exception){}
	return x;
  
	}
	public string readvalue(string st)
	{
		try
		{
			cm = new SqlCommand(st, db);
			dr = cm.ExecuteReader();
			if (dr.Read())
				RETVAL = dr[0].ToString();
		}
		catch (Exception) { }
		dr.Dispose();
		return RETVAL;
		
	}
	public void fill_grid(string st, GridView g1)
	{
		try{
		cm = new SqlCommand(st, db);
		sqlda = new SqlDataAdapter(cm);
		ds = new DataSet();
		ds.Clear();
		g1.DataSource = null;
		g1.DataBind();
		sqlda.Fill(ds, "tbl1");
		g1.DataSource = ds.Tables["tbl1"];
		g1.DataBind();
	   
		}catch(Exception){}
		}
	public SqlDataAdapter fill_grid_ret_sqlda(string st, GridView g1)
	{
		try
		{
			cm = new SqlCommand(st, db);
			sqlda = new SqlDataAdapter(cm);
			ds = new DataSet();
			ds.Clear();
			g1.DataSource = null;
			g1.DataBind();
			sqlda.Fill(ds, "tbl");
			g1.DataSource = ds.Tables["tbl"];
			g1.DataBind();
		   
		}
		catch (Exception) { }
		return sqlda;
	}
	public int filldl(string st, DataList d1)
	{
		try{
		cm = new SqlCommand(st, db);
		sqlda = new SqlDataAdapter(cm);
		ds = new DataSet();
		ds.Clear();
		d1.DataSource = null;
		d1.DataBind();
		sqlda.Fill(ds, "tbl");
		d1.DataSource = ds.Tables["tbl"];
		d1.DataBind();
	}catch(Exception){}
	return 1;
   
	}
	public int ExeQuery(string st)
	{
		try{
		cm = new SqlCommand(st, db);
		x = cm.ExecuteNonQuery();
	}catch(Exception){}
	return x;
   
	}
	
	public SqlDataReader fill_dropdown(string st,DropDownList drop)
	{
		try{
			if (db.State == ConnectionState.Closed)
			{
				db.Open();
			}
	   cm = new SqlCommand(st, db);
	   dr = cm.ExecuteReader();
	   if (dr.HasRows == true)
	   {
		   while (dr.Read() == true)
		   {
			   if (dr[0].ToString().Trim() != "" || dr[0].ToString().Trim().Length!=0)
			   {
				   drop.Items.Add(dr[0].ToString().Trim());
			   }
		  }

	   }
	  dr.Dispose();
	 }catch(Exception){}
	 return dr;
	
	}
	public SqlDataReader sqldr(string st)
	{
		try{
	  if (db.State == ConnectionState.Closed)
		{ db.Open(); }
	  cm = new SqlCommand(st, db);
	  dr = cm.ExecuteReader();
	}catch(Exception){}
	  return dr;
	 
	}
  
	public SqlDataReader readall(string st)
	{
		try
		{
			if (db.State == ConnectionState.Closed)
			{ db.Open(); }
		  cm = new SqlCommand(st, db);
		  dr = cm.ExecuteReader();
		}catch(Exception){}
		return dr;
	 
	}
	public SqlDataAdapter fill_rptr_ret_sqlda(string st, Repeater r1)
	{
		try
		{
			cm = new SqlCommand(st, db);
			sqlda = new SqlDataAdapter(cm);
			ds = new DataSet();
			ds.Clear();
			sqlda.Fill(ds, "tbl");
			r1.DataSource = null;
			r1.DataBind();
			r1.DataSource = ds.Tables["tbl"];
			r1.DataBind();
		   
		  
		}
		catch (Exception) { }
		return sqlda;
	}
	public SqlDataAdapter fill_ds_ret_sqlda(string st)
	{
		try
		{
			cm = new SqlCommand(st, db);
			sqlda = new SqlDataAdapter(cm);
			ds = new DataSet();
			ds.Clear();
			sqlda.Fill(ds, "tbl4");
		  

		}
		catch (Exception) { }
		return sqlda;
	}
	public string ToSQL(string Param)
	{
		if (Param == null || Param.Length == 0)
		{
			return "Null";
		}
		else
		{
			return  Param;
		}
	}

	public string Quote(string Param)
	{
		if (Param == null || Param.Length == 0)
		{
			return "";
		}
		else
		{
			return Param.Replace("'", "''");
		}
	}
	public void fill_drop_with_id(string st, DropDownList drop)
	{
		try
		{
			if (db.State == ConnectionState.Closed)
			{ db.Open(); }
			cm = new SqlCommand(st, db);
			dr = cm.ExecuteReader();
			//try
			//{
			list.Clear();
			drop.Items.Clear();
			//}
			//catch (Exception ex) { } 
			while (dr.Read() == true)
			{
				if (dr[1].ToString() != "" || dr[1].ToString().Length != 0)
				{
					list.Add(new ListItem(dr[1].ToString(), dr[0].ToString()));
				}
			}
			drop.DataSource = list;
			drop.DataTextField = "Text";
			drop.DataValueField = "Value";
			drop.DataBind();
			drop.Items.Insert(0, "Select");
			dr.Dispose();

		}
		catch (Exception) { }
	   
	}
	public void fill_listbox_with_id(string st, ListBox drop)
	{
		try
		{
			if (db.State == ConnectionState.Closed)
			{ db.Open(); }
			cm = new SqlCommand(st, db);
			dr = cm.ExecuteReader();
			list.Clear();
			drop.Items.Clear();
			while (dr.Read() == true)
			{
				if (dr[1].ToString() != "" || dr[1].ToString().Length != 0)
				{
					list.Add(new ListItem(dr[1].ToString(), dr[0].ToString()));
				}
			}
			drop.DataSource = list;
			drop.DataTextField = "Text";
			drop.DataValueField = "Value";
			drop.DataBind();

			dr.Dispose();
		   
		}
		catch (Exception) { }
	}
}