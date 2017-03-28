using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using SQLKAB;

namespace Kontorsprylar
{
    public partial class master : System.Web.UI.MasterPage
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Category> categories = SQL.GenerateProductMenu();
            string leftMenuInnerHtml = SQL.GenerateLeftMenu(categories);
            leftMenu.InnerHtml = leftMenuInnerHtml;
            if (Session["IsLoggedIn"] != null)
            {
                if (Session["IsLoggedIn"].ToString() == "true")
                {
                    string myMessage = $"Du är inloggad.";
                    ClientScriptManager cs = Page.ClientScript;
                    cs.RegisterStartupScript(this.GetType(), "myalert", "alert('" + myMessage + "');", true);
                }
            }
        }

        protected void ButtonMySearch_Click(object sender, EventArgs e)
        {
            Response.Redirect($"searchResult.aspx?searchString={TextBoxMyQuery.Text}");
        }
    }
}