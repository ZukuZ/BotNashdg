package
{
   import flash.display.DisplayObject;
   import var516.var528;
   import flash.utils.ByteArray;
   import var475.var748;
   
   public final class var502 extends Object
   {
      
      public function var502()
      {
         super();
      }
      
      public static function var1948(param1:Object) : int
      {
         return 10;
      }
      
      public static function var1899(param1:Number, param2:uint = 0, param3:String = ",", param4:String = " ") : String
      {
         var _loc5_:Array = param1.toFixed(param2).split(".");
         _loc5_[0] = _loc5_[0].replace(new RegExp("\\B(?=(?:\\d{3})+(?!\\d))","g"),param4);
         return _loc5_.join(param3);
      }
      
      public static function var1871(param1:Object) : int
      {
         if(param1 != null)
         {
            return (param1.endur + param1.endur_items) * 15;
         }
         return 0;
      }
      
      public static function var2561(param1:int) : int
      {
         return var27.var391 + param1 * 3;
      }
      
      public static function var1528(param1:*) : void
      {
         var child:DisplayObject = null;
         var container:* = param1;
         try
         {
            if(container.numChildren > 0)
            {
               while(container.numChildren)
               {
                  child = container.getChildAt(container.numChildren - 1);
                  container.removeChild(child);
                  child = null;
               }
            }
         }
         catch(e:*)
         {
         }
      }
      
      public static function var4237(param1:Array, param2:Array) : int
      {
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:Object = null;
         var _loc3_:* = 0;
         if(!(param1 == null) && !(param2 == null))
         {
            _loc4_ = param1.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               if(param1[_loc5_].active == 1)
               {
                  _loc6_ = var502.var1348(param1[_loc5_].id,param2);
                  if(_loc6_ != null)
                  {
                     _loc3_ = _loc3_ + Number(_loc6_.def);
                  }
               }
               _loc5_++;
            }
         }
         return _loc3_;
      }
      
      public static function var3576(param1:String) : String
      {
         var _loc2_:String = var528.hash("lsnb5s48)hsnsJ3nG" + param1 + "mJsgpAgfbdjHsgYt" + "nCbhfl65fdhh@h");						   
         return _loc2_;
      }
      
      public static function var2626(param1:Object) : Object
      {
         var _loc2_:Object = new Object();
         _loc2_.name = param1.name;
         _loc2_.descr = param1.descr;
         if(param1.price1 > 0)
         {
            _loc2_.price1 = param1.price1;
         }
         if(param1.price2 > 0)
         {
            _loc2_.price2 = param1.price2;
         }
         if(param1.price3 > 0)
         {
            _loc2_.price3 = param1.price3;
         }
         if(param1.price4 > 0)
         {
            _loc2_.price4 = param1.price4;
         }
         if(param1.dmg > 0)
         {
            _loc2_.dmg = param1.dmg;
         }
         if(param1.endur > 0)
         {
            _loc2_.endur = param1.endur;
         }
         if(param1.luck > 0)
         {
            _loc2_.luck = param1.luck;
         }
         _loc2_.quality = param1.quality;
         return _loc2_;
      }
      
      public static function var1348(param1:int, param2:Array) : Object
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         if(param1 > 0 && !(param2 == null))
         {
            _loc3_ = param2.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               if(param2[_loc4_].id == param1)
               {
                  return param2[_loc4_];
               }
               _loc4_++;
            }
         }
         return null;
      }
      
      public static function var4534(param1:int, param2:Array) : Object
      {
         var _loc3_:int = param2.length;
         var _loc4_:* = 0;
         while(_loc4_ < _loc3_)
         {
            if(param2[_loc4_].id == param1)
            {
               return param2[_loc4_];
            }
            _loc4_++;
         }
         return null;
      }
      
      public static function var2974(param1:int) : int
      {
         var _loc2_:Number = Math.floor(param1 * param1 / 13);
         return var27.var366 + param1 + _loc2_;
      }
      
      public static function var3150(param1:int, param2:int) : int
      {
         var _loc3_:Number = Math.floor(param2 * param2 / 13);
         return param1 + param2 + _loc3_;
      }
      
      public static function var4572(param1:int, param2:Number, param3:int) : int
      {
         var _loc4_:Number = param1;
         _loc4_ = param1 * (1 - Math.pow(param2,param3)) / (1 - param2);
         return Math.floor(_loc4_);
      }
      
      public static function var1708(param1:int, param2:Number, param3:int) : int
      {
         return Math.floor(param1 * Math.pow(param2,param3 - 1));
      }
      
      public static function var1944(param1:int, param2:Array) : int
      {
         var _loc3_:* = 1;
         if(param1 == 1)
         {
            _loc3_ = param2["cnt"];
         }
         else
         {
            _loc3_ = param1 - 1;
         }
         return _loc3_;
      }
      
      public static function var1943(param1:int, param2:Array) : int
      {
         var _loc3_:* = 1;
         if(param1 == param2["cnt"])
         {
            _loc3_ = 1;
         }
         else
         {
            _loc3_ = param1 + 1;
         }
         return _loc3_;
      }
      
      public static function var1317(param1:int, param2:Object = null) : String
      {
         var _loc3_:* = "";
         var _loc4_:* = "";
         var _loc5_:* = "";
         var _loc6_:* = "";
         var _loc7_:int = Math.floor(param1 / 3600);
         if(_loc7_ < 10)
         {
            _loc4_ = "0" + _loc7_.toString();
         }
         else
         {
            _loc4_ = _loc7_.toString();
         }
         var _loc8_:int = Math.floor((param1 - _loc7_ * 3600) / 60);
         if(_loc8_ < 10)
         {
            _loc5_ = "0" + _loc8_.toString();
         }
         else
         {
            _loc5_ = _loc8_.toString();
         }
         var _loc9_:int = param1 - _loc8_ * 60 - _loc7_ * 3600;
         if(_loc9_ < 10)
         {
            _loc6_ = "0" + _loc9_.toString();
         }
         else
         {
            _loc6_ = _loc9_.toString();
         }
         if(param2 != null)
         {
            if(param2.hrs == true)
            {
               _loc3_ = _loc3_ + (_loc4_ + ":");
            }
            if(param2.min == true)
            {
               _loc3_ = _loc3_ + (_loc5_ + ":");
            }
            if(param2.sec == true)
            {
               _loc3_ = _loc3_ + _loc6_;
            }
         }
         else
         {
            _loc3_ = _loc4_ + ":" + _loc5_ + ":" + _loc6_;
         }
         return _loc3_;
      }
      
      public static function var1270(param1:int) : int
      {
         return int(param1 * Math.random());
      }
      
      public static function var2052(param1:int, param2:Array) : String
      {
         var param1:int = Math.abs(param1) % 100;
         var _loc3_:Number = param1 % 10;
         if(param1 > 10 && param1 < 20)
         {
            return param2[2];
         }
         if(_loc3_ > 1 && _loc3_ < 5)
         {
            return param2[1];
         }
         if(_loc3_ == 1)
         {
            return param2[0];
         }
         return param2[2];
      }
      
      public static function var2781(param1:*) : *
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeObject(param1);
         _loc2_.position = 0;
         return _loc2_.readObject();
      }
      
      public static function var4011(param1:var748, param2:var748, param3:int, param4:int, param5:int) : Object
      {
         var _loc6_:* = 0;
         if(param1.id == param3)
         {
            _loc6_ = param2.rank - param1.rank;
         }
         else
         {
            _loc6_ = param1.rank - param2.rank;
         }
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         if(_loc6_ >= 0)
         {
            _loc7_++;
            _loc8_--;
            if(_loc6_ >= 2)
            {
               _loc7_++;
               _loc8_--;
            }
            if(_loc6_ >= 4)
            {
               _loc7_++;
               _loc8_--;
            }
         }
         else if(_loc6_ >= -4)
         {
            _loc7_++;
            _loc8_--;
         }
         
         var _loc9_:Array = new Array();
         _loc9_["clan" + param1.id] = _loc8_;
         _loc9_["clan" + param2.id] = _loc8_;
         _loc9_["clan" + param3] = _loc7_;
         return _loc9_;
      }
      
      public static function var2846(param1:int) : Object
      {
         var _loc2_:Array = new Array();
         _loc2_[0] = 0;
         _loc2_[1] = 90;
         _loc2_[2] = 200;
         _loc2_[3] = 430;
         _loc2_[4] = 800;
         _loc2_[5] = 1200;
         _loc2_[6] = 1600;
         _loc2_[7] = 2100;
         _loc2_[8] = 2800;
         _loc2_[9] = 3600;
         _loc2_[10] = 4700;
         _loc2_[11] = 6100;
         _loc2_[12] = 7900;
         _loc2_[13] = 10300;
         _loc2_[14] = 13500;
         _loc2_[15] = 17500;
         _loc2_[16] = 22600;
         _loc2_[17] = 29500;
         _loc2_[18] = 38300;
         _loc2_[19] = 50000;
         _loc2_[20] = 65000;
         _loc2_[21] = 84000;
         _loc2_[22] = 109000;
         _loc2_[23] = 140000;
         _loc2_[24] = 185000;
         _loc2_[25] = 240000;
         _loc2_[26] = 290000;
         _loc2_[27] = 345000;
         _loc2_[28] = 415000;
         _loc2_[29] = 500000;
         _loc2_[30] = 600000;
         _loc2_[31] = 715000;
         _loc2_[32] = 860000;
         _loc2_[33] = 1000000;
         _loc2_[34] = 1240000;
         _loc2_[35] = 1500000;
         _loc2_[36] = 1800000;
         _loc2_[37] = 2150000;
         _loc2_[38] = 2550000;
         _loc2_[39] = 3030000;
         _loc2_[40] = 3600000;
         _loc2_[41] = 4300000;
         _loc2_[42] = 5130000;
         _loc2_[43] = 6110000;
         _loc2_[44] = 7260000;
         _loc2_[45] = 8594000;
         _loc2_[46] = 10134000;
         _loc2_[47] = 11834000;
         _loc2_[48] = 13789000;
         _loc2_[49] = 16029000;
         _loc2_[50] = 18579000;
         _loc2_[51] = 21479000;
         _loc2_[52] = 24814000;
         _loc2_[53] = 28644000;
         _loc2_[54] = 33044000;
         _loc2_[55] = 38104000;
         _loc2_[56] = 43914000;
         _loc2_[57] = 50594000;
         _loc2_[58] = 58183100;
         _loc2_[59] = 66910000;
         _loc2_[60] = 76946000;
         _loc2_[61] = 88480000;
         _loc2_[62] = 101750000;
         _loc2_[63] = 117010000;
         _loc2_[64] = 134560000;
         _loc2_[65] = 154740000;
         _loc2_[66] = 177950000;
         _loc2_[67] = 204640000;
         _loc2_[68] = 235330000;
         _loc2_[69] = 270620000;
         _loc2_[70] = 306620000;
         _loc2_[71] = 343620000;
         _loc2_[72] = 381120000;
         _loc2_[73] = 419120000;
         _loc2_[74] = 457620000;
         _loc2_[75] = 496620000;
         _loc2_[76] = 536020000;
         var _loc3_:Object = new Object();
         var _loc4_:int = _loc2_.length;
         var _loc5_:* = 0;
         while(_loc5_ < _loc4_)
         {
            if(_loc2_[_loc5_] > param1)
            {
               _loc3_.lvl = _loc5_ - 1;
               _loc3_.prev_exp = _loc2_[_loc5_ - 1];
               _loc3_.nex_exp = _loc2_[_loc5_];
               return _loc3_;
            }
            _loc5_++;
         }
         return _loc3_;
      }
   }
}
