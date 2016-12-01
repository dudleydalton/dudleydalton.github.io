using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //Create the connection to azure database
        SqlConnection con = new SqlConnection();
        con.ConnectionString = "Data Source=csudalton.database.windows.net;Initial Catalog=OnlineStore;Persist Security Info=True;User ID=dudley_dalton;Password=TeamRocket55!";
        con.Open();
        string username = TextBox1.Text;
        string userpassword = TextBox2.Text;
        SqlCommand cmd = new SqlCommand("INSERT INTO Employee(name, password) Values('" + username + "','" + userpassword  + "')", con);

        //check if anything was inserted
        int i = cmd.ExecuteNonQuery();
        if (i < 1)
        {
            ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Not successful.')", true);

        }
        else
        {
            Response.Redirect("Login.aspx");
        }
        con.Close();
    }
}