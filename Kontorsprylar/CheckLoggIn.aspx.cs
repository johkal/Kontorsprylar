using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQLKAB;

namespace Kontorsprylar
{
    public partial class CheckLoggIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string pwd = Request["pwd"];
            string mail = Request["email"];
            string loginOK = SQL.CheckLogin(pwd, mail);
            if(loginOK == "Success")
                Session["IsLoggedIn"] = true;

            info.Text = loginOK;

        }
    }
}