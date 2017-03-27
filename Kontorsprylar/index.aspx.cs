using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQLKAB;

namespace Kontorsprylar
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Category> categories = SQL.GenerateProductMenu();
            string indexPageinnerHTML = SQL.GenerateIndexCarousel(categories);
            indexPage.InnerHtml = indexPageinnerHTML;
            
        }
    }
}