using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class viewroute : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ArrayList b = new ArrayList();

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbString"].ConnectionString);
        //Open the connection
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from route", conn);
        int result = cmd.ExecuteNonQuery();

        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            string a;
            a = reader["name"].ToString();
            a = a + '^';
            a = a + reader["description"].ToString();
            a = a + '^';
            a = a + reader["image"].ToString();
            a = a + '^';
            a = a + reader["map"].ToString();
            a = a + '^';
            a = a + reader["id"].ToString();
            b.Add(a);
        }
        cmd.Dispose();
        conn.Close();
        string[,] data = new string[100, 7];
        int iterator = 0;
        foreach (string c in b)
        {
            string[] row = c.Split('^');
            data[iterator, 0] = row[0];
            data[iterator, 1] = row[1];
            data[iterator, 2] = row[2];
            data[iterator, 3] = row[3];
            data[iterator, 4] = row[4];
            iterator++;
        }

        DataTable newsDataTable = new DataTable();

        // add some columns to our datatable
        newsDataTable.Columns.Add("name");
        newsDataTable.Columns.Add("description");
        newsDataTable.Columns.Add("image");
        newsDataTable.Columns.Add("map");
        newsDataTable.Columns.Add("id");

        // adding new rows
        for (int i = 0; i < iterator; i++)
        {
            DataRow newsDataRow = newsDataTable.NewRow();
            newsDataRow["name"] = data[i, 0];
            newsDataRow["description"] = data[i, 1];
            newsDataRow["image"] = data[i, 2];
            newsDataRow["map"] = data[i, 3];
            newsDataRow["id"] = data[i, 4];


            newsDataTable.Rows.Add(newsDataRow);
        }

        // bind our datatable to our repeater
        venmenu.DataSource = newsDataTable;
        venmenu.DataBind();

    }

    
}