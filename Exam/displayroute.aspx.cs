using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
public partial class displayroute : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbString"].ConnectionString);
            //Open the connection
            conn.Open();
            string[] b = new string[10];
            string rname = Request.QueryString["name"];
            Session["okok"] = rname;
            SqlCommand cmd = new SqlCommand("select * from route where name='" + rname + "' ", conn);
            SqlDataReader r = cmd.ExecuteReader();

       
        while (r.Read())
        {
            name.Text = r["name"].ToString();
            description.Text = r["description"].ToString();
            mapurl.Text = r["map"].ToString();
            price.Text = r["price"].ToString();
            image.Text = r["image"].ToString();
                 
      
        }
        Session["image"] = image.Text;
        gimg.Text = "<a class='details' data-fancybox-type='iframe' href='" + mapurl.Text + "'><img src='images/google-map.png'></a>";
      //  string image = "http://themes.themegoods.com/pluto_wp/wp-content/themes/Pluto/timthumb.php?src=http://themes.themegoods.com/pluto_wp/wp-content/uploads/2011/09/Razzle-Dazzle-Berry-Cheesecake.jpg&amp;h=240&amp;w=490&amp;zc=1";
        cmd.Dispose();
        conn.Close();
    }
    protected void start_click(object sender, EventArgs e)
    {
        Response.Redirect("checkin.aspx");
    }
}