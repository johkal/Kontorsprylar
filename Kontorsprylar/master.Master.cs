using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
        }
    }
}