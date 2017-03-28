using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kontorsprylar
{
    public partial class searchResult : System.Web.UI.Page
    {
        public NameValueCollection QueryString { get; }

        protected void page_load(object sender, EventArgs E)
        {
            List<SQLKAB.Product> allProducts = SQLKAB.SQL.GetAllProducts();
            List<SQLKAB.Product> matchingProducts = new List<SQLKAB.Product>();
            List<SQLKAB.Category> allCategories = SQLKAB.SQL.GetAllCategories();
            List<SQLKAB.Category> matchingCategories = new List<SQLKAB.Category>();

            string input = Request.QueryString["searchString"];

            foreach (var prod in allProducts)
            {
                if (prod.Name.ToLower().StartsWith(input.ToLower()))
                {
                    matchingProducts.Add(prod);
                }
            }
            
            searchResultDiv.InnerHtml = "";

            foreach (var product in matchingProducts)
            {
                searchResultDiv.InnerHtml += "<h2><a href='details.aspx?PID=" + product.ID + "'>" + product.Name.ToString() + "</a></h2>\n";
            }
        }
    }
}