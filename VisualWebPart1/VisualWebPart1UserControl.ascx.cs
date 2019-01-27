using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace DataSheetView.VisualWebPart1
{
    public partial class VisualWebPart1UserControl : UserControl
    {
        private SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection("Data Source=SP2016;Initial Catalog=CompanyDB;Integrated Security=True;");
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        protected void gridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridView.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridView.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void gridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridView.EditIndex = -1;
            BindGrid();
        }

        private void UpdateGrid(int sid, string name, string address)
        {
            try
            {
                string query = "UPDATE gridview SET address = @address, name = @name  WHERE sid = @sid";

                SqlCommand com = new SqlCommand(query, con);

                com.Parameters.Add("@sid", SqlDbType.Int).Value = sid;
                com.Parameters.Add("@address", SqlDbType.VarChar).Value = address;
                com.Parameters.Add("@name", SqlDbType.VarChar).Value = name;

                con.Open();
                com.ExecuteNonQuery();
                con.Close();

                gridView.EditIndex = -1;
                BindGrid();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void BindGrid()
        {
            gridView.PagerTemplate = null;
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from gridview", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            gridView.DataSource = ds;
            gridView.DataBind();
            con.Close();
        }

        protected void gridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow ro = (GridViewRow)gridView.Rows[e.RowIndex];
            Label id = (Label)ro.FindControl("lblsid");
            TextBox name = (TextBox)ro.FindControl("txtName");
            TextBox address = (TextBox)ro.FindControl("txtAddress");
            UpdateGrid(Convert.ToInt32(id.Text), name.Text, address.Text);
        }

        protected void imgDelete_Click(object sender, ImageClickEventArgs e)
        {
            int i = 0;
            ImageButton imgdetails = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)imgdetails.NamingContainer;
            Label id = (Label)gvrow.FindControl("lblsid");
            SqlCommand cmd = new SqlCommand("delete from  gridview where sid=@sid", con);
            cmd.Parameters.AddWithValue("@sid", id.Text);
            con.Open();
            i = cmd.ExecuteNonQuery();
            con.Close();
            BindGrid();
        }
    }
}
