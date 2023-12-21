using System;
using System.Collections.Generic;

namespace EFPrintersWebApp.Models;

public partial class Office
{
    public int Id { get; set; }

    public string City { get; set; } = null!;

    public string Street { get; set; } = null!;

    public string ZipCode { get; set; } = null!;

    public string Municipality { get; set; } = null!;

    public string Code { get; set; } = null!;

    public virtual ICollection<Printer> Printers { get; set; } = new List<Printer>();

    public virtual ICollection<Stock> Stocks { get; set; } = new List<Stock>();

    public virtual ICollection<User> Users { get; set; } = new List<User>();
}
