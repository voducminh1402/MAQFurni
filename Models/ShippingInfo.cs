using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace MAQFurni.Models
{
    [Table("ShippingInfo")]
    public partial class ShippingInfo
    {
        [Required]
        [StringLength(120)]
        public string FullName { get; set; }
        [Required]
        [StringLength(200)]
        public string Address { get; set; }
        [Required]
        [StringLength(100)]
        public string City { get; set; }
        [Required]
        [StringLength(100)]
        public string State { get; set; }
        [Required]
        [StringLength(22)]
        public string Phone { get; set; }
        [Column(TypeName = "ntext")]
        public string Note { get; set; }
        [Key]
        [Column("OrderID")]
        [StringLength(50)]
        public string OrderId { get; set; }
        [Column("StatusID")]
        public int StatusId { get; set; }

        [ForeignKey(nameof(OrderId))]
        [InverseProperty("ShippingInfo")]
        public virtual Order Order { get; set; }
        [ForeignKey(nameof(StatusId))]
        [InverseProperty(nameof(ShippingStatus.ShippingInfos))]
        public virtual ShippingStatus Status { get; set; }
    }
}
