using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Doviz.Core
{
    public class BaseClass
    {
        public void TryCatchKullan(Action -action)
        {
            try
            {
                -action();
            }
            catch (Exception)
            {
                //Loglama işlemleri
            }
        }
    }
}
