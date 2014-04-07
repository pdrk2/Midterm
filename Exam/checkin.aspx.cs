using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data.SqlClient;

public partial class checkin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbString"].ConnectionString);
        //Open the connection
        conn.Open();
        
        string[] b = new string[10];
        string rname = Session["okok"].ToString();
        string image1 = Session["image"].ToString();
       // SqlCommand cmd = new SqlCommand("select count(*) from checkin where routename='" + rname + "' ", conn);
       // string CurrentName;
       // CurrentName = (string)cmd.ExecuteScalar();
       //int i = Convert.ToInt32(cmd.ExecuteScalar());
       //int j = (i - (i - 1));

       //gimg.Text = "<a class='details' data-fancybox-type='iframe' href='#'><img src='images/google-map.png'></a>";
      
           SqlCommand cmd1 = new SqlCommand("select TOP 1 * from checkin where routename='" + rname + "' ", conn);
           SqlDataReader r = cmd1.ExecuteReader();


           while (r.Read())
           {
               name.Text = r["title"].ToString();
               description.Text = r["description"].ToString();
               latitude.Text = r["latitude"].ToString();
               longitude.Text = r["longitude"].ToString();

           }
          address.Text = name.Text + "," + latitude.Text + "," + longitude.Text;

          gimg.Text = "<a class='details' data-fancybox-type='iframe' href='http://maps.google.com/?q=" + name.Text + "," + latitude.Text + "," + longitude.Text + "'><img src='images/google-map.png'></a>";
           facebook.Text = "<a class='details' data-fancybox-type='iframe' href='http://www.facebook.com/sharer.php?u=" + image1 + "'><img src='images/facebook.png'></a>";
           twitter.Text = "<a class='details' data-fancybox-type='iframe' href='http://twitter.com/home?status=Im on Tour%20-%20" + image1 + "'><img src='images/twitter.png'></a>";
           cmd1.Dispose();
           
            conn.Close();
       //cmd.Dispose();
    }
    protected void check_click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbString"].ConnectionString);
        //Open the connection
        conn.Open();

        //string[] b = new string[10];
        string rname = Session["okok"].ToString();

        SqlCommand cmd1 = new SqlCommand("delete TOP(1) from checkin where routename='" + rname + "' ", conn);
       // SqlDataReader r = cmd1.ExecuteReader();

        int result = cmd1.ExecuteNonQuery();
        
        if (result != 0)
        {

            SqlCommand cmd2 = new SqlCommand("select TOP 1 * from checkin where routename='" + rname + "' ", conn);
            SqlDataReader r = cmd2.ExecuteReader();


            while (r.Read())
            {
                name.Text = r["title"].ToString();
                description.Text = r["description"].ToString();
                latitude.Text = r["latitude"].ToString();
                longitude.Text = r["longitude"].ToString();

            }

            address.Text = name.Text + "," + latitude.Text + "," + longitude.Text;
            gimg.Text = "<a class='details' data-fancybox-type='iframe' href='http://maps.google.com/?output=embed&amp;f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=" + name.Text + "," + latitude.Text + "," + longitude.Text + "'><img src='images/google-map.png'></a>";
            cmd2.Dispose();

            //conn.Close();
        }
        else
        {
            Label3.Visible = true;
            Label3.Text = "You have reached the destination point. No more check points ahead. Thank you !!";
        }
        cmd1.Dispose();

        conn.Close();

    }
}