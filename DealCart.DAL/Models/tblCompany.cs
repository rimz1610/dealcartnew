using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.DAL.Models
{
    public class tblCompany
    {
        [Key]
        public int ID { get; set; }

        [Required]
        public string Name { get; set; }

        public string? Logo { get; set; }
     
        public string Facebook { get; set; }

        [Required]
        public string Contact{ get; set; }

        public string Instagram { get; set; }

        public string Email { get; set; }

        public string Twitter { get; set; }

        public string Address { get; set; }

       
        public DateTime CreatedDate { get; set; } = DateTime.Now;
        public DateTime? UpdatedDate { get; set; }


    }
}
