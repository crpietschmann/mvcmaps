using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MvcMaps.Utils
{
    public static class GuidUtils
    {
        public static string NewShortGuid()
        {
            return Convert.ToBase64String(Guid.NewGuid().ToByteArray())
                .Substring(0, 22)
                .Replace("/", "")
                .Replace("+", "")
                .Replace("-", "");
        }
    }
}
