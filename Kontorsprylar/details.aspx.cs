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

            if (Request["PID"] != null && Request["PID"].Length > 0)
            {
                string PID = Request["PID"];
                string detailInnerHTML = SQL.GenerateDetailsInnerHTML(PID);
                detail.InnerHtml = detailInnerHTML;
                Session["PID"] = PID;//set
                //int productID = (int)Session["PID"];//get

                //Lägg in en lista i Session:
                //    //(skapa listan varukorg)
                //    //Session["varukorg"] = myVarukorg;

                //    ////You should cast it back to the original type for use:
                //    //var list = (List<int>)Session["varukorg"];
                //    //// list.AddProduct(productID, productAmount);
            }

            if (Request.Form["action"] != null && Request.Form["action"].Equals("addProductToCart"))
            {
                //TODO add to cart
                string antal = Request.Form["antal"];
                List<Cart> productCart = new List<Cart>();
                productCart.Add( , antal)

                Session["antalProds"] = antal;//set
            }
        }
        
    }
}