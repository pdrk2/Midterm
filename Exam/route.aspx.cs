using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections;
using System.Data;
using System.IO;


public partial class route : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    protected void route_click(object sender, EventArgs e)
    {
        string name1 = name.Text;

        string description1 = description.Text;
        string image1 = image.Text;
        string map1 = map.Text;
        string price1 = price.Text;
        
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbString"].ConnectionString);
        //Open the connection
        conn.Open();
        SqlCommand cmd = new SqlCommand("insert into route (name,description,image,map,price) values('" + name1 + "','" + description1 + "','" + image1 + "','" + map1 + "','" + price1 + "')", conn);
        int result = cmd.ExecuteNonQuery();
        Label3.Visible = true;
        if (result != 0)
        {
            Label3.Text = "Route Created successfully";
            // Response.Redirect("login.aspx");
        }
        else
        {
            Label3.Text = "Error occured while creating route. Please check !!";
        }
            
        cmd.Dispose();
        conn.Close();
    }

    protected void checkin_click(object sender, EventArgs e)
    {
        string title1 = title.Text;

        string description2 = cdescription.Text;
        string latitude1 = latitude.Text;
        string longitude1 = longitude.Text;
        string rname1 = rname.Text;

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbString"].ConnectionString);
        //Open the connection
        conn.Open();
        SqlCommand cmd = new SqlCommand("insert into checkin (title,description,latitude,longitude,routename) values('" + title1 + "','" + description2 + "','" + latitude1 + "','" + longitude1 + "','" + rname1 + "')", conn);
        int result = cmd.ExecuteNonQuery();
        Label7.Visible = true;
        if (result != 0)
        {
            Label7.Text = "Check in Added successfully to Route : " + rname1;
            // Response.Redirect("login.aspx");
        }
        else
        {
            Label7.Text = "Error occured while adding check in to route. Please check !!";
        }

        cmd.Dispose();
        conn.Close();
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.PostedFile != null)
        {
            string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);

            //Save files to disk
            FileUpload1.SaveAs(Server.MapPath("~/images/" + FileName));

            //Add Entry to DataBase
            String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["dbString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            
            string strQuery = "insert into image (FileName, FilePath) values(@FileName, @FilePath)";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.AddWithValue("@FileName", FileName);
            cmd.Parameters.AddWithValue("@FilePath", "~/images/" + FileName);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();
            con.Close();
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
                con.Dispose();
            }

          
        }
    }

}