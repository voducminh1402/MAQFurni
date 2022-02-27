using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace MAQFurni.Models
{
    [Table("ShippingStatus")]
    public partial class ShippingStatus
    {
        public ShippingStatus()
        {
            ShippingInfos = new HashSet<ShippingInfo>();
        }

        [Key]
        [Column("StatusID")]
        public int StatusId { get; set; }
        [Required]
        [StringLength(20)]
        public string StatusName { get; set; }

        [InverseProperty(nameof(ShippingInfo.Status))]
        public virtual ICollection<ShippingInfo> ShippingInfos { get; set; }
    }
}
