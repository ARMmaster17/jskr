using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace jskr.Models
{
    public class Lead
    {
        public int Id { get; set; }
        public List<Event> Events { get; set; }
        public Source LeadSource { get; set; }
        public string Url { get; set; }
        public string Company { get; set; }
        public string Role { get; set; }
        public float Salary { get; set; }
        public float Hourly { get; set; }
        public string Location { get; set; }
        public string State { get; set; }
        public string ReserchNotes { get; set; }

    }
}
