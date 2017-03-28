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
    }
}