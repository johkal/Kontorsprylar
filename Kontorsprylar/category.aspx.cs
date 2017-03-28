using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using SQLKAB;

namespace Kontorsprylar
{
    public partial class category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int catID = Convert.ToInt32(Request.QueryString["Id"]);
                categoryID.InnerHtml = "<h1>" + SQL.FindCategory(catID.ToString()).Name + "</h1>\n";
                
                List<Product> produktlista = SQL.GetProductsInCategory(catID);
                foreach (var prod in produktlista)
                {
                    categoriesDiv.InnerHtml += "<h2>" + prod.Name.ToString() + "</h2>\n";
                }
                
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            
        }
    }
}