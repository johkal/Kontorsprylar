using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQLKAB;

namespace Kontorsprylar
{
    public partial class details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string PID = Request["PID"];
            string detailInnerHTML = SQL.GenerateDetailsInnerHTML(PID);
            detail.InnerHtml = detailInnerHTML;
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            btnAddToCart.Text = "Hej";
            Session["productID"] = Request.QueryString["PID"];//Set
            int productID = (int)Session["productID"];//Get
            //Session["productAmount"] = Convert.ToInt32(main_Antal.Value);//Set
            int productAmount = (int)Session["productAmount"];//Get 
        }
    }
}