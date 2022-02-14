using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace TPTWOWJINN.Authorization
{
    public class AuthorizationFilter : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext context)

        {
            if (context.HttpContext.Session["UserName"] == null || context.HttpContext.Session["UserName"].ToString() == "")
            {
                RouteValueDictionary routeDic = new RouteValueDictionary();
                routeDic.Add("controller", "Account");
                routeDic.Add("action", "AdminLogin");

                context.Result = new RedirectToRouteResult(routeDic);
            }
            
            base.OnActionExecuting(context);
        }
    }
}                                                   