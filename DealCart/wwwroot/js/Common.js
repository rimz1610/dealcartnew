function SetCartDataIntoLocalStorage(cart) {
    var json = JSON.stringify(cart);
    localStorage.setItem("cartData", json);

    //update cart count
    SetCartItemCount();
}


function GetCartDataFromLocalStorage(type) {
    var json = localStorage.getItem("cartData")
    if (json != null && json != undefined && json != '') {
        var model = JSON.parse(json);
        if (model != null) {
            var cart = new Cart();
            cart.lstAccomodation = model.lstAccomodation;
            cart.lstProduct = model.lstProduct;
            cart.lst9DayTour = model.lst9DayTour;
            cart.lstEvent = model.lstEvent;
            cart.Currency = model.Currency;
            switch (type) {
                case 'A':
                    return cart.lstAccomodation;
                    break;
                case 'P':
                    return cart.lstProduct;
                    break;
                case 'C':
                    return cart.Currency;
                    break;
               
                case 'T':
                    return cart.lst9DayTour;
                    break;
                case 'E':
                    ReIndexing(cart.lstEvent)
                    return cart.lstEvent;
                    break;
                default:
                    return cart;
            }
        }
    }
    return new Cart();
}

function UpdateCart(obj) {
    var cart = GetCartDataFromLocalStorage();

    if (obj.lstAccomodation != null && obj.lstAccomodation.length > 0) {
        cart.lstAccomodation = obj.lstAccomodation;
    }
    if (obj.lstProduct != null && obj.lstProduct.length > 0) {
        cart.lstProduct = obj.lstProduct;
    }
    if (obj.lst9DayTour != null && obj.lst9DayTour.length > 0) {
        cart.lst9DayTour = obj.lst9DayTour;
    }
    if (obj.lstEvent != null && obj.lstEvent.length > 0) {
        cart.lstEvent = obj.lstEvent;
    } 
    cart.SetValues(cart);
    SetCartDataIntoLocalStorage(cart);
    SetCartCurrency();
}


function ClearCartData() {
    localStorage.removeItem("cartData");

    //update cart count
    SetCartItemCount();
}


function PutDataIntoCartAndSaveLocalStorage(obj, type) {
    var cart = GetCartDataFromLocalStorage();
    switch (type) {
        case 'A':
            cart.lstAccomodation.push(obj);
            break;
        case 'P':
            cart.lstProduct.push(obj);
            break;
        case 'C':
            cart.Currency = obj;
            break;
      
        case 'T':
            cart.lst9DayTour.push(obj);
            break;
        case 'E':
            cart.lstEvent.push(obj);
            cart.lstEvent = ReIndexing(cart.lstEvent);
            break;
        default:
        return cart;
    }
    cart.SetValues(cart);
    SetCartDataIntoLocalStorage(cart);
}


function RemoveDataFromCartAndSaveLocalStorage(Index, type) {
    var cart = GetCartDataFromLocalStorage();
    switch (type) {
        case 'A':
            cart.lstAccomodation = cart.lstAccomodation.filter(function (data) {
                return data.Index !== Index;
            });
          
            cart.lstAccomodation = ReIndexing(cart.lstAccomodation);
          
            break;
        case 'P':
            cart.lstProduct = cart.lstProduct.filter(function (data) {
                return data.Index !== Index;
            });
        
            cart.lstProduct = ReIndexing(cart.lstProduct);
            break;
        case 'T':
            cart.lst9DayTour = cart.lst9DayTour.filter(function (data) {
                return data.Index !== Index;
            });
          
            cart.lst9DayTour = ReIndexing(cart.lst9DayTour);
            break;
        case 'E':
            cart.lstEvent = cart.lstEvent.filter(function (data) {
                return data.Index !== Index;
            });
         
            cart.lstEvent = ReIndexing(cart.lstEvent);
            break;    
        default:
            return cart;
    }
  
     
    cart.SetValues(cart);
    SetCartDataIntoLocalStorage(cart);
    SetCartCurrency();
}



function SetCartCurrency() {
    var cart = GetCartDataFromLocalStorage();
    var cartCurrency = new String;
    if (cart.lstAccomodation.length > 0) {
        cartCurrency = 'NZD';
    }
    if (cart.lstEvent.length > 0) {
        cartCurrency = 'NZD';
    }
    if (cart.lst9DayTour.length > 0) {
        cartCurrency = cart.lst9DayTour[0].tour.Currency;
    }
    if (cart.lstProduct.length > 0) {
        cartCurrency = cart.lstProduct[0].Currency;
    }
    cart.Currency = cartCurrency;
    cart.SetValues(cart);
    SetCartDataIntoLocalStorage(cart);
   
}


function GetCartCurrency() {
    var cart = GetCartDataFromLocalStorage();
    var cartCurrency = new String;
    if (cart.lstAccomodation.length > 0) {
        cartCurrency = 'NZD';
    }
    if (cart.lstEvent.length > 0) {
        cartCurrency = 'NZD';
    }
    if (cart.lst9DayTour.length > 0) {
        cartCurrency = cart.lst9DayTour[0].tour.Currency;
    }
    if (cart.lstProduct.length > 0) {
        cartCurrency = cart.lstProduct[0].Currency;
    }
    return cartCurrency;

}

function ReIndexing(lstObj) {
    $.each(lstObj, function (Index, item) {
        item.Index = Index + 1;
    });
    return lstObj;
}


function SetCartItemCount() {
    var count = 0;
    var cart = GetCartDataFromLocalStorage();

    if (cart.lstAccomodation != null && cart.lstAccomodation.length > 0) {
        count += cart.lstAccomodation.length;  
    }
    if (cart.lstProduct != null && cart.lstProduct.length > 0) {
        count += cart.lstProduct.length;
    }
    if (cart.lst9DayTour != null && cart.lst9DayTour.length > 0) {
        count += cart.lst9DayTour.length;
    }
    if (cart.lstEvent != null && cart.lstEvent.length > 0) {
        count += cart.lstEvent.length;
    }
 
    $('.fa-shopping-cart').siblings('span').text(count);
}


function getFormData($form) {
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};

    $.map(unindexed_array, function (n, i) {
        indexed_array[n['name']] = n['value'];

        //change name attribute to get form data
        if (n['name'].indexOf(']') > 0) {
            var newName = changeNameAttribute(n['name']);
            $form.find("[name='" + n['name'] + "']").attr('name', newName)
        }

    });

    return indexed_array;
}


function FormatCurrency(price) {
    var neg = false;
    if (price < 0) {
        neg = true;
        price = Math.abs(price);
    }
    return (neg ? "-$" : '$') + parseFloat(price, 10).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,").toString();
}


function FillFestivalDetails(model) {

    var Details = model.Name + '</br>';

    var maleCostumeSizes = '';
    var femaleCostumeSizes = '';
  
    var otherCostumeSizes = '';
    var brigCostumeSizes = '';
    var femaleSessionTime = '';


    if (model.CostumeSizes && model.CostumeSizes.length > 0) {
        const maleSize = model.CostumeSizes.filter(x => x.Gender == 'M');
        const femaleSize = model.CostumeSizes.filter(x => x.Gender == 'F');
        const costumeSize = model.CostumeSizes.filter(x => x.Gender == 'C');
        const otherSizes = model.CostumeSizes.filter(x => !x.Gender);
        for (var i = 0; i <= 3; i++) {
            var str = '';
            var list = i == 0 ? maleSize
                : i == 1 ? femaleSize
                    : i == 2 ? costumeSize
                        : otherSizes;
            //var list = i == 0 ? maleSize : i == 1 ? femaleSize : otherSizes;
            const small = list.filter(x => x.Size == 'Small').length;
            const medium = list.filter(x => x.Size == 'Medium').length;
            const large = list.filter(x => x.Size == 'Large').length;
            const extraLarge = list.filter(x => x.Size == 'Extra-Large').length;
            const xl = list.filter(x => x.Size == "XL").length;
            const xxl = list.filter(x => x.Size == 'XXL').length;
            const fsmall = list.filter(x => x.Size == 'Female-Small').length;
            const fmedium = list.filter(x => x.Size == 'Female-Medium').length;
            const flarge = list.filter(x => x.Size == 'Female-Large').length;
            const fextraLarge = list.filter(x => x.Size == 'Female-XL').length;
            const msmall = list.filter(x => x.Size == 'Male-Small').length;
            const mmedium = list.filter(x => x.Size == 'Male-Medium').length;
            const mlarge = list.filter(x => x.Size == 'Male-Large').length;        
            const mxl = list.filter(x => x.Size == "Male-XL").length;
            const mxxl = list.filter(x => x.Size == 'Male-XXL').length;
            if (small > 0)
                str += `Small: ${small}, `;
            if (medium > 0)
                str += `Medium: ${medium}, `;
            if (large > 0)
                str += `Large: ${large}, `;
            if (extraLarge > 0)
                str += `Extra-Large: ${extraLarge}, `;
            if (xl > 0)
                str += `XL: ${xl}, `;
            if (xxl > 0)
                str += `XXL: ${xxl}, `;
            if (fsmall > 0)
                str += `Female-Small: ${fsmall}, `;
            if (fmedium > 0)
                str += `Female-Medium: ${fmedium}, `;
            if (flarge > 0)
                str += `Female-Large: ${flarge}, `;
            if (fextraLarge > 0)
                str += `Female-XL: ${fextraLarge}, `;
            if (msmall > 0)
                str += `Male-Small: ${msmall}, `;
            if (mmedium > 0)
                str += `Male-Medium: ${mmedium}, `;
            if (mlarge > 0)
                str += `Male-Large: ${mlarge}, `;
            if (mxl > 0)
                str += `Male-XL: ${mxl}, `;
            if (mxxl > 0)
                str += `Male-XXL: ${mxxl}, `;
           
            str = str?.trim() || '';

            str = str.endsWith(',') ? str.substring(0, str.length - 1) : str;

            if (i == 0) {
                maleCostumeSizes = str;
            } else if (i == 1) {
                femaleCostumeSizes = str;
            } else if (i == 2) {
                brigCostumeSizes = str;
              
            }
            else {
              
                otherCostumeSizes = str;
            }
        }

    }
    if (model.lstBeautyMakeUp != null && model.lstBeautyMakeUp.length > 0) {
      
        const femaleBeautyTime = model.lstBeautyMakeUp.filter(x => x.Type == 'F')[0]?.TimeText;
        var str = '';
        str = 'Makeup Session at '+femaleBeautyTime;

        str = str?.trim() || '';

         /*   str = str.endsWith(',') ? str.substring(0, str.length - 1) : str;*/
        femaleSessionTime = str;
          
        }

    


    if (model.AdultTickets > 0 && model.EventId<3  && model.AdultTickets != null && model.AdultTickets != undefined) {


        Details += 'Admission Ticket(s): <span class="">' + model.AdultTickets + '</span>';
        if (otherCostumeSizes) {
            Details += `, ${otherCostumeSizes}`;
        }
    }
    //For other events

    if (model.AdultTickets > 0 && model.EventId > 2 && model.AdultTickets != null && model.AdultTickets != undefined) {
        Details += 'Adult Admission Ticket(s): <span class="">' + model.AdultTickets + '</span>';
    
    }
  
    if (model.ChildTickets > 0 && model.ChildTickets != null && model.ChildTickets != undefined) {
        if (model.AdultTickets > 0)  {
            Details += ', Child Admission Ticket(s): <span class="">' + model.ChildTickets + '</span>';
        }
        else {
            Details += 'Child Admission Ticket(s): <span class="">' + model.ChildTickets + '</span>';
        }
    }


    if (model.FamilyTickets > 0 && model.FamilyTickets != null && model.FamilyTickets != undefined) {
        if (model.AdultTickets > 0 || model.ChildTickets > 0 ) {
            Details += ', Family Admission Ticket(s): <span class="">' + model.FamilyTickets + '</span>';
        }
        else {
            Details += 'Family Admission Ticket(s): <span class="">' + model.FamilyTickets + '</span>';
        }
    }

    if (model.CostumeTickets > 0 && model.CostumeTickets != null && model.CostumeTickets != undefined) {
        if (model.AdultTickets > 0 || model.ChildTickets > 0 || model.FamilyTickets > 0) {

            Details += ', Costume Ticket(s): <span class="">' + model.CostumeTickets + '</span>';
            if (brigCostumeSizes) {
                Details += `, ${brigCostumeSizes}`;
            }
        }
        else {
            Details += 'Costume Ticket(s): <span class="">' + model.CostumeTickets + '</span>';
            if (brigCostumeSizes) {
                Details += `, ${brigCostumeSizes}`;
            }
        }

    }


    if (model.VIPTickets1 != null && model.VIPTickets1 != undefined && model.VIPTickets1 > 0) {

        if (model.AdultTickets > 0 || model.FamilyTickets > 0 || model.ChildTickets > 0 || model.CostumeTickets > 0) {

            Details += ', ' + model.VIPAdmissionTicketsCaption1 + ': ' + model.VIPTickets1;
            if (maleCostumeSizes)
                Details += `, ${maleCostumeSizes}`;
        }
        else {
            Details += model.VIPAdmissionTicketsCaption1 + ': ' + model.VIPTickets1;
            if (maleCostumeSizes)
                Details += `, ${maleCostumeSizes}`;
        }
    }

    if (model.VIPTickets2 != null && model.VIPTickets2 != undefined && model.VIPTickets2 > 0) {

        if (model.AdultTickets > 0 || model.VIPTickets1 > 0 || model.FamilyTickets > 0 || model.ChildTickets > 0 || model.CostumeTickets > 0) {
            Details += ', ' + model.VIPAdmissionTicketsCaption2 + ': ' + model.VIPTickets2;
            if (femaleSessionTime)
                Details += `, ${femaleSessionTime}`;
            if (femaleCostumeSizes)
                Details += `, ${femaleCostumeSizes}`;
        }
        else {
            Details += model.VIPAdmissionTicketsCaption2 + ': ' + model.VIPTickets2;
            if (femaleSessionTime)
                Details += `, ${femaleSessionTime}`;
            if (femaleCostumeSizes)
                Details += `, ${femaleCostumeSizes}`;
        }
    }

    if (model.AdultHiTea > 0 && model.EventId < 3) {
        if (model.AdultTickets > 0 || model.VIPTickets1 > 0 || model.VIPTickets2 > 0 || model.FamilyTickets > 0 || model.ChildTickets > 0 || model.CostumeTickets > 0) {

            Details += ', ' + 'High Tea(s): ' + ' <span class="">' + model.AdultHiTea + '</span>' + ' at ' + model.strAdultHiTeaTime;


        }
        else {
            Details += 'High Tea(s): ' + ' <span class="">' + model.AdultHiTea + '</span>' + ' at ' + model.strAdultHiTeaTime;

        }
    }
    if (model.EventId > 2 && (model.AdultHiTea > 0 || model.ChildHiTea > 0)) {
        if (model.AdultHiTea > 0 && model.ChildHiTea == 0) {
            if (model.AdultTickets > 0 || model.VIPTickets1 > 0 || model.VIPTickets2 > 0 || model.FamilyTickets > 0 || model.ChildTickets > 0 || model.CostumeTickets > 0) {

                Details += ', ' + 'Adult High Tea(s): ' + ' <span class="">' + model.AdultHiTea + '</span>' + ' at ' + model.strAdultHiTeaTime;
            }
            else {
                Details += 'Adult High Tea(s): ' + ' <span class="">' + model.AdultHiTea + '</span>'+ ' at ' + model.strAdultHiTeaTime;
            }
        }
        if (model.AdultHiTea > 0 && model.ChildHiTea > 0) {
            if (model.AdultTickets > 0 || model.VIPTickets1 > 0 || model.VIPTickets2 > 0 || model.FamilyTickets > 0 || model.ChildTickets > 0 || model.CostumeTickets > 0) {

                Details += ', ' + 'Adult High Tea(s): ' + ' <span class="">' + model.AdultHiTea + '</span>' + ', Child High Tea(s): ' + ' <span class="">' + model.ChildHiTea + '</span>'   + ' at ' + model.strAdultHiTeaTime;
            }
            else {
                Details += 'Adult High Tea(s): ' + ' <span class="">' + model.AdultHiTea + '</span>' + ', Child High Tea(s): ' + ' <span class="">' + model.ChildHiTea + '</span>' + ' at ' + model.strAdultHiTeaTime;

            }
        }

        if (model.ChildHiTea > 0 && model.AdultHiTea ==0) {
            if ( model.AdultTickets > 0 || model.VIPTickets1 > 0 || model.VIPTickets2 > 0 || model.FamilyTickets > 0 || model.ChildTickets > 0 || model.CostumeTickets > 0) {

                Details += ', ' + 'Child High Tea(s): ' + ' <span class="">' + model.ChildHiTea + '</span>' + ' at ' + model.strAdultHiTeaTime;
            }
            else {
                Details += 'Child High Tea(s): ' + ' <span class="">' + model.ChildHiTea + '</span>' + ' at ' + model.strAdultHiTeaTime;
            }
        }
    }
      
    



    if (model.Umbrella != null && model.Umbrella != undefined && model.Umbrella > 0) {
        if (model.ChildHiTea > 0 > 0|| model.AdultHiTea > 0 || model.AdultTickets > 0 || model.VIPTickets1 > 0 || model.VIPTickets2 > 0 || model.FamilyTickets > 0 || model.ChildTickets > 0 || model.CostumeTickets > 0) {
            Details += ', ' + 'Umbrella(s): ' + model.Umbrella;
        } else {
            Details += 'Umbrella(s): ' + model.Umbrella;
        }

    }

    if (model.PicnicBasket != null && model.PicnicBasket != undefined && model.PicnicBasket > 0) {
        if (model.ChildHiTea > 0 > 0 || model.AdultHiTea > 0 || model.AdultTickets > 0 || model.Umbrella > 0 || model.VIPTickets2 > 0 || model.VIPTickets1 > 0 || model.FamilyTickets > 0 || model.ChildTickets > 0 || model.CostumeTickets > 0) {
            Details += ', ' + 'Picnic Basket(s): ' + model.PicnicBasket;
        }
        else {
            Details += 'Picnic Basket(s): ' + model.PicnicBasket;
        }
    }


    if (model.lstBeautyMakeUp != null && model.lstBeautyMakeUp.length > 0) { 
        var lstitem = model.lstBeautyMakeUp.filter(x => x.Type != 'F');


        $.each(lstitem, function (key, value) {

            if (value.Time != null && value.Time != undefined && value.Location != null && value.Location != undefined && value.Persons != null && value.Persons != undefined) {
                var count = key + 1;
                if (key == 0) {
                    Details += '</br>' + 'Beauty Makeup Session(s): ' + '</br>';
                }
                Details += 'Session ' + count + ': ' + '<span class=""> Time: ' + value.TimeText + '</span>' + ', ';
                Details += '<span class="">No. of Person(s): ' + value.Persons + '</span>' + ', ';
                Details += '<span class=""> Location: ' + value.Location + '</span>';
            }
            Details += '</br>'
        });
    }
   

    return Details;
}


function FillAccommodationDetails(model) {
    return model.Details;
    //var Details = '';

    //Details = ' ' + model.ResourceName + ':' + " For " + model.NoofNightStay + " Night(s) " + model.CheckInDate + " - " + model.CheckOutDate
    //return Details;


}


function FillProductDetails(model) {
    var Details = '';
    Details = ' ' + model.ProductName + " * " + model.Quantity + " @ " + model.ItemProductPrice
    return Details;
}


function FillTourDetails(model) {

    var Details = "";
    const str = model.tour.DeptDate;
    const [day, month, year] = str.split('/');

    const monthNames = ["Jan", "Febr", "Mar", "Apr", "May", "June",
        "July", "Aug", "Sept", "Oct", "Nov", "Dec"
    ];
    const weekday = ["Sun", "Mond", "Tues", "Wedn", "Thurs", "Fri", "Sat"];
    const fulldate = new Date(+year, +month - 1, +day);

    var week = weekday[fulldate.getDay()];
    var date = fulldate.getDate();
    var cmonth = monthNames[fulldate.getMonth()];
    var cyear = fulldate.getFullYear();

    var dateformat = week + " " + date + " " + cmonth + " " + cyear;

    Details = model.tour.Name + '</br>' + 'Passenger(s): ' + model.tour.NoOfPassenger + ", Departure Date: " + model.tour.FullDate + ", Room Type: " + model.tour.RoomType;
    var passengerslist = model.tourpassengerarray;


    $.each(passengerslist, function (key, value) {
        Details += '</br>';
        var count = key + 1;
        Details += 'Passenger ' + count + ":  " + value.Title + ". " + value.FirstName + " " + value.LastName + ", " + value.Email + ", " + value.Phone + ", " + value.Location;

    });


    return Details;
}


function GetUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
    return false;
};

function getUrlVars() {
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}

const ShowMessage = async (message, type = 'success') => {
    return Swal.fire({
        icon: type,
        title: message,
        type: type
    });
}

const SomethingWentWrong = () => {
    ShowMessage('Something went wrong.').then(s => {

    });
}

