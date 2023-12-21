using System;
using System.Collections.Generic;

namespace EFPrintersWebApp.Models;

public partial class User
{
    public int Id { get; set; }

    public string Username { get; set; } = null!;

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string Password { get; set; } = null!;

    public int OfficeId { get; set; }

    public virtual ICollection<MaterialChange> MaterialChanges { get; set; } = new List<MaterialChange>();

    public virtual Office Office { get; set; } = null!;
}
