using DealCart.BLL.Interfaces;
using DealCart.BLL.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace DealCart.Controllers
{
    public class OrderController : Controller
    {

        public readonly IHttpContextAccessor _con;
        private readonly IOrder _order;
        private readonly IProduct _product;
        public OrderController(IOrder order,IProduct product, IHttpContextAccessor contextAccessor)
        {
            _order = order;
            _product=product;
            _con = contextAccessor;

        }
        public async Task<IActionResult> List()
        {
            if (_con.HttpContext.Session.GetString("UserName") != null)
            { 
                return View(await _order.GetAllOrders());
            }
            else
            {
                return RedirectToAction("Login", "Admin");
            }

        }


        public IActionResult FilterOrders(string SearchPaymentMethod,  string SearchPaymentStatus)
        {
            List<OrderViewModel> list = _order.SearchOrders(SearchPaymentMethod, SearchPaymentStatus);
            return PartialView("_BookingList", list);
        }


        [HttpPatch]
        public async Task<IActionResult> Cancel(int orderId)
        {
            return Ok(await _order.CancelOrder(orderId));
        }

        [HttpPost]

        public JsonResult Details(int orderId)
        {
            BookingOrderVM model = _order.GetOrderDetails(orderId);
            var data = new { result = true, list = model };
            return Json(data);
        }


        [HttpPost]
        public JsonResult EditOrder(OrderEditViewModel model)
        {

            bool result = _order.EditOrderDetails(model);

            return Json(result);

        }




        [HttpGet]
        public async Task<IActionResult> PartialPaymentReciever([FromQuery] int orderId)
        {
            return PartialView("_PartialPaymentReceiver", await _order.GetPartialPaymentDetail(orderId));
        }

        //For saving Bank Payment 
        [HttpPost]
        public async Task<IActionResult> SaveManualPayment(OrderPartialPaymentModel model)
          
        {
            try
            {
                bool result = await  _order.SaveManualPayment(model);
               
            }
            catch { }
            return RedirectToAction(nameof(List));
        }

    }
}
