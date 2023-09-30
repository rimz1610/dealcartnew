
class Cart {
    constructor() {
        this.Currency = new String;
     /*   this.AddedDate = new Date;*/
        this.lstAccomodation = new Array();
        this.lstProduct = new Array();
        this.lst9DayTour = new Array();
        this.lstEvent = new Array();
    }

    SetValues(obj) {
        obj && Object.assign(this, obj);
    }
}

class EventBooking {
    constructor() {
        this.Id = new Int32Array;
        this.EventId = new Int32Array;
        this.BookingId = new Int32Array;
        this.BookingDate = new String;
        this.EventBookingDate = new String;
        this.strBookingDate = new Date;
        this.AdultTickets = new Int32Array;
        this.ChildTickets = new Int32Array;       
        this.FamilyTickets = new Int32Array;
        this.CostumeTickets = new Int32Array;
        this.VIPTickets1 = new Int32Array;
        this.VIPTickets2 = new Int32Array;
        this.AdultHiTea = new Int32Array;
        this.AdultHiTeaTime = new Date;
        this.strAdultHiTeaTime = new String;
        this.ChildHiTea = new Int32Array;
        this.PrivateCatered = new String;
        this.PrivateCateredAdditionals = new Int32Array;
        this.PrivateCateredShift = new String;
        this.PrivateCateredType = new String;
        this.PrivateCateredQty = new Int32Array;
        this.PrivateCateredPersonCount = new Int32Array;
        this.ItemTotalPrice = new Int32Array;
        this.strItemTotalPrice = new String;
        this.Umbrella = new Int32Array;
        this.PicnicBasket = new Int32Array;
        this.VIPAdmissionTicketsCaption1 = new String;
        this.VIPAdmissionTicketsCaption2 = new String;
     
       

        this.Type = new String;
        this.Index;
        this.UmbrellaPrice;
        this.AdultTicketsPrice;
        this.ChildTicketsPrice;
        this.CostumeTicketsPrice;
        this.FamilyTicketsPrice;
        this.VIPTicketsPrice1;
        this.VIPTicketsPrice2;
        this.AdultHiTeaPrice;
        this.ChildHiTeaPrice;
        this.PrivateCateredPrice;
        this.PrivateCateredAdditionalsPrice;
        this.PicnicBasketPrice;
        this.BeautyMakeupPrice;
        this.Name;
        this.Description;
        this.ShortDescription;
    }

    SetValues(obj) {
        obj && Object.assign(this, obj);
    }
}

class TourBooking {
    constructor() {
        this.Id = new Int32Array;
        this.EvenId = new Int32Array;
        this.TourId = new Int32Array;
        this.Name = new String;
        this.NoOfPassenger = new Int32Array;   
        this.DeptDate = new String;
        this.FullDate = new String;
        this.DeptCity = new String;
        this.Currency = new String;      
        this.RoomType = new String;
        this.Amount = new Int32Array;
      
      
        this.Index;
    }

    SetValues(obj) {
        obj && Object.assign(this, obj);
    }
}




class TourPassengerBooking {
    constructor() {
       
        this.Id = new Int32Array;    
        this.Title = new String;
        this.FirstName = new String;
        this.LastName = new String;
        this.Email = new String;
        this.Phone = new String;
        this.Location = new String;

      
    }

    SetValues(obj) {
        obj && Object.assign(this, obj);
    }
}

class ResourceBooking {
    constructor() { 
    
    

        this.Id = new Int32Array;
        this.RoomId = new Int32Array;    
        this.CheckInDate = new Date;
        this.CheckOutDate = new Date;
        this.ResourceName = new String;
        this.CleaningFees = new Int32Array;
        this.NoofNightStay = new Int32Array;
        this.MaxPerson = new Int32Array;    
        this.ItemTotalPrice = new Int32Array;
        this.Details = new String;
        this.isValid;


      

        this.Index;
          }

    SetValues(obj) {
        obj && Object.assign(this, obj);
    }
}

class ProductBooking {
    constructor() {
        this.Id = new Int32Array;
        this.Descripton = new String;
        this.ProductName = new String;
        this.CategoryName = new String;
        this.Size = new String;
        this.Quantity = new Int32Array;
        this.ItemTotalPrice = new Int32Array;
        this.Inventory = new Int32Array;
        this.ProductPrice = new Int32Array;
        this.ItemProductPrice = new String;
        this.NZDPrice = new Int32Array;
        this.Currency = new String;
        this.Index;
    }

    SetValues(obj) {
        obj && Object.assign(this, obj);
    }
}

class testModel {
    constructor() {
        this.age;
        this.firstName;
        this.lastName;
        this.phone;
    }

    SetValues(obj) {
        obj && Object.assign(this, obj);
        //this.age = obj.age ? obj.age : this.age;
      
    }

    GetValue() {
        //var obj = {};
        //obj.age = this.age;
        //obj.firstName = this.firstName;
        //obj.lastName = this.lastName;
        //obj.phone = this.phone;

        return { age: this.age, firstName: this.firstName, lastName: this.lastName, phone: this.phone };
    }
}
