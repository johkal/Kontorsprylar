using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQLKAB;

namespace Kontorsprylar
{
    public partial class cart : System.Web.UI.Page
    {
        static List<Cart> productCart = new List<Cart>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Cart"] != null)
            {
                productCart = (List<Cart>)Session["Cart"];
                showCart.InnerHtml = "<ul>\n";
                int summa = 0;
                foreach (var korg in productCart)
                {
                showCart.InnerHtml += "<li>" + korg.Product.Name.ToString() + ", antal: " + korg.NumberOfProducts + " st á pris: " + korg.Product.NetPrice +  " kr, delsumma: " + Convert.ToInt32(korg.NumberOfProducts) * Convert.ToInt32(korg.Product.NetPrice) + " kr</li>\n";
                    summa = summa + (Convert.ToInt32(korg.NumberOfProducts) * Convert.ToInt32(korg.Product.NetPrice));
                }
                showCart.InnerHtml += "</ul><br>\n";
                showCart.InnerHtml += "<h3>Summa: " + summa + " kr</h3>";
            }
            else
                showCart.InnerText = "Varukorgen är tom.";
        }
    }
}