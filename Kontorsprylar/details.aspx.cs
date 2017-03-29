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
            //När sidan laddas första gången och inte har lagt något i varukorgen ännu, skapas en ny
            if (!IsPostBack && Session["Cart"] == null)
            {
                List<Cart> productCart = new List<Cart>();
            }
                       
            //Ifall det ligger något i varukorgen
            if (Session["Cart"] != null)
            {
                //Castar varukorgslistan från sessionen så att vi kan använda den.
                List<Cart> productCart = (List<Cart>)Session["Cart"];
            }

            string PID = "";

            //Ifall vi har ett produktid i querystringen
            if (Request["PID"] != null && Request["PID"].Length > 0)
            {
                PID = Request["PID"];
                string detailInnerHTML = SQL.GenerateDetailsInnerHTML(PID);
                detail.InnerHtml = detailInnerHTML;
                Session["PID"] = PID;//set
                //int productID = (int)Session["PID"];//get

            }

            //Om vi tar emot forumläret (från samma sida)
            if (Request.Form["action"] != null && Request.Form["action"].Equals("addProductToCart"))
            {
                int antal = Convert.ToInt32(Request.Form["antal"]);
                Product myProd = SQL.FindProduct(PID.ToString());
                productCart.Add(new Cart(myProd, antal));

                //Lägg in en lista i Session:
                //(skapa listan varukorg)
                Session["Cart"] = productCart;
            }
        }
        
    }
}