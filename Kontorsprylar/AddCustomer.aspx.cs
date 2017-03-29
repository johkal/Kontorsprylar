using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQLKAB;

namespace Kontorsprylar
{
    public partial class AddCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string fname = Request["fname"];
            string lname = Request["lname"];
            string mail = Request["mail"];
            string passw = Request["passw"];
            string phone = Request["phone"];
            string address = Request["address"];
            string floor = Request["floor"];
            string portcode = Request["portcode"];
            string city = Request["city"];
            string zip = Request["zip"];

            string AddOK = SQL.AddCustomer(fname, lname, mail, passw, phone, address, floor, portcode, city, zip);

            info.Text = AddOK;
        }
    }
}