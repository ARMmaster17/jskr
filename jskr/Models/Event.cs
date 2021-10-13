using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace jskr.Models
{
    public class Event
    {
        public int Id { get; set; }
        public string Type { get; set; }
        [DataType(DataType.DateTime)]
        public DateTime Date { get; set; }
        public string Comments { get; set; }
    }
}
