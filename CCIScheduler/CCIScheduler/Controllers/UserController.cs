using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CCIScheduler.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {

            var userList = new List<CCIScheduler.Database.User>
            {

                new CCIScheduler.Database.User(1, "Cody")
            };



            return View(userList);
        }
    }
}