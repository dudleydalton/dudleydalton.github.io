﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = "Data Source=csudalton.database.windows.net;Initial Catalog=OnlineStore;Persist Security Info=True;User ID=dudley_dalton;Password=TeamRocket55!";
        con.Open();
        string userid = TextBox1.Text;
        string password = TextBox2.Text;
        SqlCommand cmd = new SqlCommand("select name,password from Employee where name='" + TextBox1.Text + "'and password='" + TextBox2.Text + "'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Response.Redirect("ProductDisplay.aspx");
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Wrong password and username combination, try again.')", true);
        }
        con.Close();
    }
}