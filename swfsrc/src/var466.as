package
{
   import flash.events.Event;
   import var516.var528;
   import var475.var748;
   import var475.var911;
   import flash.net.URLRequest;
   import flash.net.URLLoader;
   import flash.net.URLVariables;
   import flash.net.URLRequestMethod;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import var475.var757;
   import var475.var568;
   import var475.var1172;
   import var475.var906;
   import var475.var1093;
   import var475.var1089;
   import var475.var808;
   import var475.var1008;
   import flash.net.URLLoaderDataFormat;
   import vk.api.serialization.json.JSON;
   import flash.events.ErrorEvent;
   
   public class var466 extends Object
   {
      
      public function var466()
      {
         var _loc1_:String = null;
         this.var3572 = new Array();
         this.executing_urls = new Array();
         super();
      }
      
      public var main_url:String = "";
      
      private var var2275:String = "";
      
      public var var3881:String = "";
      
      public var auth_string:String = "";
      
      private var var3572:Array;
      
      private var executing_urls:Array;
      
      public function var3309(param1:String) : void
      {
         this.main_url = param1 + "invasion.php";
         this.var3881 = param1 + "img/";
      }
      
      public function var3516(param1:String) : void
      {
         this.var2275 = param1 + "invasion.php";
      }
      
      public function var4049(param1:String) : void
      {
         this.auth_string = param1;
      }
      
      private function var1244(param1:int) : Boolean
      {
         if(this.executing_urls["url_" + param1] == null)
         {
            return false;
         }
         Main.var1235.var1669("Дубль на запрос: " + param1);
         return true;
      }
      
      public function var2534(param1:int, param2:Function) : void
      {
         var url_id:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var upgr_type:int = param1;
         var handler_func:Function = param2;
         url_id = 59;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = {
                  "type":upgr_type,
                  "val":Number(_loc2_.a.@res),
                  "m1":Number(_loc2_.a.@m1),
                  "m2":Number(_loc2_.a.@m2),
                  "m3":Number(_loc2_.a.@m3),
                  "m4":Number(_loc2_.a.@m4),
                  "m7":Number(_loc2_.a.@m7)
               };
               handler_func(_loc3_);
            };
            hash_string = upgr_type + "njaw";
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.main_url,"&t=" + upgr_type + "&g_sig=" + hash,init);
         }
      }
      
      public function var2725(param1:Object, param2:Function) : void
      {
         var url_id:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var data:Object = param1;
         var handler_func:Function = param2;
         url_id = 58;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:int = Number(_loc2_.a.@res);
               if(_loc3_ != 1)
               {
                  data = null;
               }
               handler_func(data);
            };
            hash_string = data.descr + "xmdwj";
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.main_url,"&t=" + data.descr + "&g_sig=" + hash,init);
         }
      }
      
      public function var3709(param1:var748, param2:Function) : void
      {
         var url_id:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var clan_data:var748 = param1;
         var handler_func:Function = param2;
         url_id = 56;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:int = Number(_loc2_.a.@res);
               handler_func(_loc3_);
            };
            hash_string = clan_data.id.toString() + "dS4w";
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.main_url,"&t=" + clan_data.id.toString() + "&g_sig=" + hash,init);
         }
      }
      
      public function clan_add_cash(param1:Object, param2:Function) : void
      {
         var url_id:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var data:Object = param1;
         var handler_func:Function = param2;
         url_id = 57;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc3_:Object = null;
               var _loc2_:XML = get_answer(url_id,param1);
               if(Number(_loc2_.a.@res) == 1)
               {
                  _loc3_ = data;
               }
               else
               {
                  _loc3_ = null;
               }
               handler_func(_loc3_);
            };
            hash_string = data.cash_type + "" + data.val + "bfhaa";
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.main_url,"&t=" + data.cash_type + "&t1=" + data.val + "&g_sig=" + hash,init);
         }
      }
      
      public function var2622(param1:var911, param2:Function) : void
      {
         var url_id:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var member_data:var911 = param1;
         var handler_func:Function = param2;
         url_id = 54;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:int = Number(_loc2_.a.@res);
               handler_func(member_data,_loc3_);
            };
            hash_string = member_data.clan_id + member_data.id.toString() + "vzdwff";
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.main_url,"&t=" + member_data.id.toString() + "&t1=" + member_data.clan_id.toString() + "&g_sig=" + hash,init);
         }
      }
      
      public function var2298(param1:var911, param2:String) : void
      {
         var url_id:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var member_data:var911 = param1;
         var handler_func:String = param2;
         url_id = 52;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:int = Number(_loc2_.a.@res);
               if(_loc3_ == 1)
               {
                  Main.var1235[handler_func](member_data);
               }
               else
               {
                  Main.var1235[handler_func](null);
               }
            };
            hash_string = member_data.clan_id + member_data.id.toString() + "d54z";
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.main_url,"&t=" + member_data.id.toString() + "&t1=" + member_data.clan_id.toString() + "&g_sig=" + hash,init);
         }
      }
      
      public function var3058(param1:int, param2:Function) : void
      {
         var url_id:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var clan_id:int = param1;
         var handler_func:Function = param2;
         url_id = 49;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:var748 = new var748();
               _loc3_ = xml_clandata_toobj(_loc2_.clan);
               if(_loc2_.war != undefined)
               {
                  _loc3_.war_data = xml_clan_war_data(_loc2_.war);
               }
               else
               {
                  _loc3_.war_data = null;
               }
               handler_func(_loc3_);
            };
            hash_string = clan_id.toString() + "hsK18";
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.main_url,"&t1=" + clan_id.toString() + "&g_sig=" + hash,init);
         }
      }
      
      public function var2447(param1:var911, param2:int, param3:Function) : void
      {
         var url_id:int = 0;
         var member_data:var911 = param1;
         var new_rank:int = param2;
         var handler_func:Function = param3;
         url_id = 60;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               if(Number(_loc2_.a.@res) == 1)
               {
                  member_data.clan_rank = new_rank;
               }
               handler_func(member_data);
            };
            this.var1247(url_id,this.main_url,"&t=" + member_data.id + "&t1=" + new_rank,init);
         }
      }
      
      public function var2493(param1:var748, param2:Function) : void
      {
         var url_id:int = 0;
         var clan_data:var748 = param1;
         var handler_func:Function = param2;
         url_id = 51;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc3_:String = null;
               var _loc2_:XML = get_answer(url_id,param1);
               if(Number(_loc2_.a.@res) > 0)
               {
                  clan_data.id = Number(_loc2_.a.@res);
                  clan_data.var1314 = new Array();
                  clan_data.var1314["list"] = new Array();
                  _loc3_ = "u" + clan_data.var1798;
                  clan_data.var1314[_loc3_] = Main.var1235.user_data;
                  clan_data.var1314["list"].push(clan_data.var1314[_loc3_]);
               }
               else if(Number(_loc2_.a.@res) == -1)
               {
                  Main.var1235.show_message("Клан с таким названием уже существует! Попробуй другое.");
               }
               
               handler_func(clan_data);
            };
            this.var1247(url_id,this.main_url,"&t=" + clan_data.name,init);
         }
      }
      
      public function var2606(param1:Function) : void
      {
         var url_id:int = 0;
         var func:Function = param1;
         url_id = 75;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               func(Number(_loc2_.a.@res));
            };
            this.var1247(url_id,this.main_url,"",init);
         }
      }
      
      public function var2608(param1:var748, param2:Function) : void
      {
         var url_id:int = 0;
         var clan_data:var748 = param1;
         var func:Function = param2;
         url_id = 68;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               if(Number(_loc2_.a.@res) > 0)
               {
                  func();
               }
               else if(Number(_loc2_.a.@res) == -1)
               {
                  Main.var1235.show_message("Клан с таким названием уже существует! Попробуй другое.");
               }
               
            };
            this.var1247(url_id,this.main_url,"&t=" + clan_data.name,init);
         }
      }
      
      public function var3854(param1:Function) : void
      {
         var url_id:int = 0;
         var handler_func:Function = param1;
         url_id = 50;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Array = new Array();
               _loc3_["list"] = new Array();
               var _loc4_:int = _loc2_.clan.length();
               var _loc5_:* = 0;
               while(_loc5_ < _loc4_)
               {
                  _loc3_["clan" + _loc2_.clan[_loc5_].@id] = xml_clandata_toobj(_loc2_.clan[_loc5_]);
                  _loc3_["list"].push(_loc3_["clan" + _loc2_.clan[_loc5_].@id]);
                  _loc5_++;
               }
               var _loc6_:Array = new Array();
               if(_loc2_.inv != undefined)
               {
                  _loc5_ = 0;
                  while(_loc5_ < _loc2_.inv.length())
                  {
                     _loc6_.push({
                        "id":Number(_loc2_.inv[_loc5_].@cid),
                        "sender":_loc2_.inv[_loc5_].@sid,
                        "time":_loc2_.inv[_loc5_].@t,
                        "clan_data":xml_clandata_toobj(_loc2_.inv[_loc5_].clan)
                     });
                     _loc5_++;
                  }
               }
               handler_func(_loc3_,_loc6_);
            };
            this.var1247(url_id,this.main_url,"",init);
         }
      }
      
      public function var3589(param1:int, param2:Function) : void
      {
         var url_id:int = 0;
         var cat:int = param1;
         var handler_func:Function = param2;
         url_id = 34;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc5_:* = undefined;
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Array = new Array();
               var _loc4_:Array = new Array();
               for each(_loc5_ in _loc2_.u)
               {
                  _loc3_["u" + String(_loc5_.@id)] = {
                     "id":String(_loc5_.@id),
                     "lvl":int(_loc5_.@lvl),
                     "points":int(_loc5_.@p),
                     "name":String(_loc5_.@n),
                     "num":int(_loc5_.@num)
                  };
                  _loc4_.push(String(_loc5_.@id));
               }
               handler_func({
                  "users":_loc3_,
                  "order":_loc4_
               });
            };
            this.var1247(url_id,this.main_url,"&t=" + cat,init);
         }
      }
      
      public function var2936(param1:var911, param2:Function, param3:Boolean = false, param4:Function = null) : void
      {
         var url_id:int = 0;
         var data:var911 = param1;
         var handler_func:Function = param2;
         var open_external:Boolean = param3;
         var add_func:Function = param4;
         url_id = 39;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:var911 = xml_char_to_obj(_loc2_.u,data);
               _loc3_.items = new Array();
               var _loc4_:int = _loc2_.i.length();
               var _loc5_:* = 0;
               while(_loc5_ < _loc4_)
               {
                  _loc3_.items.push(xml_item_to_obj(_loc2_.i[_loc5_]));
                  _loc5_++;
               }
               handler_func(_loc3_,open_external,add_func);
            };
            this.var1247(url_id,this.main_url,"&t=" + data.id,init);
         }
      }
      
      public function var4043(param1:Object, param2:String) : void
      {
         var url_id:int = 0;
         var data:Object = param1;
         var handler_func:String = param2;
         url_id = 47;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = data;
               var _loc4_:int = _loc2_.r_top.u.length();
               _loc3_.rating_data = new Array();
               var _loc5_:* = 0;
               while(_loc5_ < _loc4_)
               {
                  _loc3_.rating_data.push({
                     "id":String(_loc2_.r_top.u[_loc5_].@id),
                     "val":Number(_loc2_.r_top.u[_loc5_].@val),
                     "nick":_loc2_.r_top.u[_loc5_].@name
                  });
                  _loc5_++;
               }
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t1=" + data.val,init);
         }
      }
      
      public function var3349(param1:Object, param2:String) : void
      {
         var url_id:int = 0;
         var data:Object = param1;
         var handler_func:String = param2;
         url_id = 35;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = new Object();
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t1=" + data.music + "&t2=" + data.sound_effects,init);
         }
      }
      
      public function var2659(param1:String, param2:String) : void
      {
         var url_id:int = 0;
         var res_url:String = null;
         var sdata:String = null;
         var parametersUrlRequest:URLRequest = null;
         var loader:URLLoader = null;
         var new_nickname:String = param1;
         var handler_func:String = param2;
         url_id = 38;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = new Object();
               _loc3_.result = Number(_loc2_.a.@res);
               _loc3_.name = new_nickname;
               Main.var1235[handler_func](_loc3_);
            };
            res_url = this.main_url;
            sdata = "<data><n>" + new_nickname + "</n></data>";
            parametersUrlRequest = new URLRequest(res_url);
            parametersUrlRequest.data = new URLVariables(this.auth_string);
            parametersUrlRequest.data.d = new Date().getTime();
            parametersUrlRequest.data.i = url_id;
            parametersUrlRequest.data.t = new_nickname;
            parametersUrlRequest.contentType = "application/x-www-form-urlencoded";
            parametersUrlRequest.method = URLRequestMethod.POST;
            loader = new URLLoader();
            loader.addEventListener(Event.COMPLETE,init);
            loader.addEventListener(IOErrorEvent.IO_ERROR,this.sendError);
            loader.addEventListener(IOErrorEvent.NETWORK_ERROR,this.sendError);
            loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.sendError);
            loader.load(parametersUrlRequest);
         }
      }
      
      public function var3258(param1:Object, param2:String) : void
      {
         var url_id:int = 0;
         var ref:String = null;
         var abp:String = null;
         var flash_vars:Object = param1;
         var handler_func:String = param2;
         url_id = 0;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var sub_init:Function = null;
               var e:Event = param1;
               sub_init = function(param1:XML):void
               {
                  var _loc13_:var757 = null;
                  var _loc27_:var568 = null;
                  var _loc28_:Object = null;
                  var _loc29_:Object = null;
                  var _loc30_:Object = null;
                  var _loc31_:var1172 = null;
                  var _loc33_:* = undefined;
                  var _loc34_:Object = null;
                  var _loc35_:Object = null;
                  var _loc36_:String = null;
                  var _loc37_:String = null;
                  var _loc38_:String = null;
                  var _loc39_:String = null;
                  var _loc40_:String = null;
                  var _loc41_:String = null;
                  var _loc2_:Object = new Object();
                  var _loc3_:var911 = new var911();
                  _loc3_.id = String(param1.u.@id);
                  _loc3_.name = param1.u.@name;
                  _loc3_.var2215 = Math.floor(Number(param1.u.@bd) / 86400);
                  _loc3_.var2821 = Number(param1.u.@soc_t);
                  _loc3_.l_time = Number(param1.u.@l_t);
                  _loc3_.news = Number(param1.u.@news);
                  _loc3_.cnews = Number(param1.u.@cnews);
                  _loc3_.exp = Number(param1.u.@exp);
                  _loc3_.lvl = Number(param1.u.@lvl);
                  _loc3_.var2474 = Number(param1.u.@lvl);
                  _loc3_.region_id = Number(param1.u.@loc);
                  _loc3_.var1690 = Number(param1.u.@locm);
                  _loc3_.arena_delay = Number(param1.u.@pvp_d);
                  _loc3_.var2440 = Number(param1.u.@ar_a);
                  var _loc4_:Object = var502.var2846(_loc3_.exp);
                  _loc3_.var1878 = _loc4_.prev_exp;
                  _loc3_.var2082 = _loc4_.nex_exp;
                  _loc3_.lottery = Number(param1.u.@lott);
                  _loc3_.en = Number(param1.u.@en);
                  _loc3_.money1 = Number(param1.u.@money1);
                  _loc3_.money2 = Number(param1.u.@money2);
                  _loc3_.money3 = Number(param1.u.@money3);
                  _loc3_.money4 = Number(param1.u.@money4);
                  _loc3_.skill_1 = Number(param1.u.@s1);
                  _loc3_.skill_2 = Number(param1.u.@s2);
                  _loc3_.skill_3 = Number(param1.u.@s3);
                  _loc3_.skill_4 = Number(param1.u.@s4);
                  _loc3_.skill_5 = Number(param1.u.@s5);
                  _loc3_.skill_6 = Number(param1.u.@s6);
                  _loc3_.carma_1 = Number(param1.u.@r1);
                  _loc3_.carma_2 = Number(param1.u.@r2);
                  _loc3_.carma_3 = Number(param1.u.@r3);
                  _loc3_.carma_4 = Number(param1.u.@r4);
                  _loc3_.carma_5 = Number(param1.u.@r5);
                  _loc3_.carma_6 = Number(param1.u.@r6);
                  _loc3_.carma_7 = Number(param1.u.@r7);
                  _loc3_.carma_8 = Number(param1.u.@r8);
                  _loc3_.carma_9 = Number(param1.u.@r9);
                  _loc3_.carma_10 = Number(param1.u.@r10);
                  _loc3_.carma_11 = Number(param1.u.@r11);
                  _loc3_.key_1 = Number(param1.u.@k1);
                  _loc3_.key_2 = Number(param1.u.@k2);
                  _loc3_.key_3 = Number(param1.u.@k3);
                  _loc3_.key_4 = Number(param1.u.@k4);
                  _loc3_.key_5 = Number(param1.u.@k5);
                  _loc3_.key_6 = Number(param1.u.@k6);
                  _loc3_.key_7 = Number(param1.u.@k7);
                  _loc3_.key_8 = Number(param1.u.@k8);
                  _loc3_.endur = Number(param1.u.@end);
                  _loc3_.luck = Number(param1.u.@luck);
                  _loc3_.endur_items = Number(param1.u.@endi);
                  _loc3_.luck_items = Number(param1.u.@lucki);
                  _loc3_.var1408 = Number(param1.u.@dmgi);
                  _loc3_.car1_lvl = Number(param1.u.@car1_lvl);
                  _loc3_.hair = Number(param1.u.@a1);
                  _loc3_.beard = Number(param1.u.@a2);
                  _loc3_.eyebrow = Number(param1.u.@a3);
                  _loc3_.nose = Number(param1.u.@a4);
                  _loc3_.elems = Number(param1.u.@a5);
                  _loc3_.item1 = Number(param1.u.@item1);
                  _loc3_.item2 = Number(param1.u.@item2);
                  _loc3_.item3 = Number(param1.u.@item3);
                  _loc3_.item5 = Number(param1.u.@item5);
                  var _loc5_:var906 = new var906();
                  _loc5_.music = Number(param1.u.@set1);
                  _loc5_.sound_effects = Number(param1.u.@set2);
                  _loc5_.setup_npc = param1.u.@set3;
                  if(!(param1.dgift == undefined) && Number(param1.dgift[0]) > 0)
                  {
                     Main.var1235.var3252(Number(param1.dgift[0]));
                  }
                  var _loc6_:Number = param1.i.length();
                  _loc3_.items = new Array();
                  var _loc7_:* = 0;
                  while(_loc7_ < _loc6_)
                  {
                     _loc3_.items[_loc7_] = xml_item_to_obj(param1.i[_loc7_]);
                     _loc7_++;
                  }
                  _loc3_.room = Number(param1.u.@room);
                  _loc3_.weapon = Number(param1.u.@d2);
                  _loc3_.torso = Number(param1.u.@d3);
                  _loc3_.hat = Number(param1.u.@d4);
                  _loc3_.pants = Number(param1.u.@d5);
                  _loc3_.armor = Number(param1.u.@d6);
                  _loc3_.stuff = Number(param1.u.@d7);
                  _loc3_.boots = Number(param1.u.@d8);
                  _loc3_.gloves = Number(param1.u.@d9);
                  var _loc8_:Number = param1.ur.length();
                  _loc3_.var1785 = new Array();
                  _loc3_.var1785.push({
                     "id":1,
                     "buyed":1
                  });
                  _loc7_ = 0;
                  while(_loc7_ < _loc8_)
                  {
                     _loc34_ = new Object();
                     _loc34_.id = Number(param1.ur[_loc7_].@id);
                     _loc34_.buyed = Number(param1.ur[_loc7_].@b);
                     _loc3_.var1785.push(_loc34_);
                     _loc7_++;
                  }
                  var _loc9_:Number = param1.j.length();
                  _loc3_.jobs = new Array();
                  _loc7_ = 0;
                  while(_loc7_ < _loc9_)
                  {
                     _loc35_ = new Object();
                     _loc35_.lvl = Number(param1.j[_loc7_].@lvl);
                     _loc35_.region_id = Number(param1.j[_loc7_].@r);
                     _loc35_.region_num = Number(param1.j[_loc7_].@rn);
                     _loc35_.time_left = Number(param1.j[_loc7_].@t);
                     if(_loc35_.time_left < 0)
                     {
                        _loc35_.time_left = 0;
                     }
                     _loc3_.jobs.push(_loc35_);
                     _loc7_++;
                  }
                  var _loc10_:Number = param1.dnpc.length();
                  _loc3_.var1659 = new Object();
                  _loc7_ = 0;
                  while(_loc7_ < _loc10_)
                  {
                     _loc36_ = "npc_" + param1.dnpc[_loc7_].@id;
                     _loc3_.var1659[_loc36_] = new Object();
                     _loc3_.var1659[_loc36_].id = Number(param1.dnpc[_loc7_].@id);
                     _loc3_.var1659[_loc36_].cnt = Number(param1.dnpc[_loc7_].@c);
                     _loc7_++;
                  }
                  _loc3_.raids_cnt = Number(param1.raids_cnt.@v);
                  var _loc11_:Number = param1.raid.length();
                  var _loc12_:Object = new Object();
                  _loc12_["list"] = new Array();
                  _loc7_ = 0;
                  while(_loc7_ < _loc11_)
                  {
                     _loc37_ = "raid" + param1.raid[_loc7_].@id;
                     _loc12_[_loc37_] = xml_raid_to_obj(param1.raid[_loc7_]);
                     _loc12_["list"].push(_loc12_[_loc37_]);
                     _loc7_++;
                  }
                  if(param1.uraid != undefined)
                  {
                     _loc13_ = xml_uraid_to_obj(param1.uraid);
                  }
                  var _loc14_:Number = param1.map.length();
                  var _loc15_:Object = new Object();
                  _loc15_["list"] = new Array();
                  _loc7_ = 0;
                  while(_loc7_ < _loc14_)
                  {
                     _loc38_ = "map_" + param1.map[_loc7_].@id;
                     _loc15_[_loc38_] = new Object();
                     _loc15_[_loc38_].id = Number(param1.map[_loc7_].@id);
                     _loc15_[_loc38_].name = param1.map[_loc7_].@n;
                     _loc15_[_loc38_].req_car = Number(param1.map[_loc7_].@d1);
                     _loc15_[_loc38_].req_rep = Number(param1.map[_loc7_].@d2);
                     _loc15_[_loc38_].req_bossid = Number(param1.map[_loc7_].@d3);
                     _loc15_[_loc38_].map = Number(param1.map[_loc7_].@m);
                     _loc15_["list"].push(_loc15_[_loc38_]);
                     _loc7_++;
                  }
                  var _loc16_:Number = param1.npc.length();
                  var _loc17_:Object = new Object();
                  _loc17_.id_array = new Array();
                  _loc7_ = 0;
                  while(_loc7_ < _loc16_)
                  {
                     _loc39_ = "npc_" + param1.npc[_loc7_].@id;
                     _loc17_[_loc39_] = new var1093();
                     _loc17_[_loc39_].id = Number(param1.npc[_loc7_].@id);
                     _loc17_[_loc39_].region_id = Number(param1.npc[_loc7_].@rid);
                     _loc17_[_loc39_].region_num = Number(param1.npc[_loc7_].@rn);
                     _loc17_[_loc39_].swc = param1.npc[_loc7_].@swc;
                     _loc17_[_loc39_].name = param1.npc[_loc7_].@n;
                     _loc17_[_loc39_].descr = param1.npc[_loc7_].@dscr;
                     _loc17_[_loc39_].dungeon_boss = Number(param1.npc[_loc7_].@d);
                     _loc17_[_loc39_].is_flimit = Number(param1.npc[_loc7_].@fl);
                     _loc17_[_loc39_].type = Number(param1.npc[_loc7_].@t);
                     _loc17_.id_array.push(Number(param1.npc[_loc7_].@id));
                     _loc7_++;
                  }
                  _loc17_.temp_npc = new Object();
                  _loc17_.temp_npc.id = Number(param1.npc_tmp.@id);
                  _loc17_.temp_npc.region_id = Number(param1.npc_tmp.@rid);
                  _loc17_.temp_npc.time_left = Number(param1.npc_tmp.@tl);
                  var _loc18_:Number = param1.npc_g.length();
                  var _loc19_:Object = new Object();
                  _loc7_ = 0;
                  while(_loc7_ < _loc18_)
                  {
                     _loc39_ = "npc_" + param1.npc_g[_loc7_].@npc;
                     if(!(_loc17_[_loc39_] == null) && !(_loc17_[_loc39_] == undefined))
                     {
                        _loc17_[_loc39_].group_data = {
                           "id":Number(param1.npc_g[_loc7_].@id),
                           "pos":Number(param1.npc_g[_loc7_].@pos)
                        };
                        if(_loc19_["group_" + param1.npc_g[_loc7_].@id] == undefined || _loc19_["group_" + param1.npc_g[_loc7_].@id] == null)
                        {
                           _loc19_["group_" + param1.npc_g[_loc7_].@id] = new Array();
                        }
                        _loc19_["group_" + param1.npc_g[_loc7_].@id].push(Number(param1.npc_g[_loc7_].@npc));
                     }
                     _loc7_++;
                  }
                  var _loc20_:Number = param1.skill.length();
                  var _loc21_:Array = new Array();
                  _loc7_ = 0;
                  while(_loc7_ < _loc20_)
                  {
                     _loc40_ = "skill_" + param1.skill[_loc7_].@id;
                     _loc21_[_loc40_] = new Object();
                     _loc21_[_loc40_].id = Number(param1.skill[_loc7_].@id);
                     _loc21_[_loc40_].name = param1.skill[_loc7_].@name;
                     _loc21_[_loc40_].descr = param1.skill[_loc7_].@descr;
                     _loc21_[_loc40_].max_lvl = Number(param1.skill[_loc7_].@mlvl);
                     _loc21_[_loc40_].cost_k = Number(param1.skill[_loc7_].@cost_k);
                     _loc21_[_loc40_].price1 = Number(param1.skill[_loc7_].@p1);
                     _loc21_[_loc40_].plus_dmg = Number(param1.skill[_loc7_].@d1);
                     _loc21_[_loc40_].cut_edmg = Number(param1.skill[_loc7_].@d4);
                     _loc21_[_loc40_].instant = Number(param1.skill[_loc7_].@d5);
                     _loc21_[_loc40_].continues = Number(param1.skill[_loc7_].@d6);
                     _loc21_[_loc40_].block = Number(param1.skill[_loc7_].@d7);
                     _loc21_[_loc40_].add_rage_limit = Number(param1.skill[_loc7_].@d8);
                     _loc21_[_loc40_].add_rage = Number(param1.skill[_loc7_].@d9);
                     _loc21_[_loc40_].passive = Number(param1.skill[_loc7_].@d10);
                     _loc7_++;
                  }
                  var _loc22_:Number = param1.task.length();
                  var _loc23_:Array = new Array();
                  _loc7_ = 0;
                  while(_loc7_ < _loc22_)
                  {
                     _loc41_ = "task_" + param1.task[_loc7_].@id;
                     _loc23_[_loc41_] = new Object();
                     _loc23_[_loc41_].id = Number(param1.task[_loc7_].@id);
                     _loc23_[_loc41_].region_id = Number(param1.task[_loc7_].@rid);
                     _loc23_[_loc41_].name = param1.task[_loc7_].@name;
                     _loc23_[_loc41_].swc_pic = Number(param1.task[_loc7_].@swc);
                     _loc7_++;
                  }
                  var _loc24_:Number = param1.room.length();
                  var _loc25_:Array = new Array();
                  _loc7_ = 0;
                  while(_loc7_ < _loc24_)
                  {
                     _loc34_ = new Object();
                     _loc34_.id = Number(param1.room[_loc7_].@id);
                     _loc34_.name = param1.room[_loc7_].@name;
                     _loc34_.descr = param1.room[_loc7_].@descr;
                     _loc34_.price1 = Number(param1.room[_loc7_].@p1);
                     _loc34_.price2 = Number(param1.room[_loc7_].@p2);
                     _loc34_.price3 = Number(param1.room[_loc7_].@p3);
                     _loc34_.price4 = Number(param1.room[_loc7_].@p4);
                     _loc34_.boss_id = Number(param1.room[_loc7_].@boss);
                     _loc25_.push(_loc34_);
                     _loc7_++;
                  }
                  var _loc26_:var1089 = xml_char_to_obj(param1.fight.u);
                  _loc26_.time = Number(param1.fight.@time);
                  _loc26_.id = String(param1.fight.@eid);
                  _loc26_.hp = Number(param1.fight.@hp);
                  _loc26_.mhp = Number(param1.fight.@mhp);
                  _loc26_.fight_id = Number(param1.fight.@fid);
                  _loc26_.clan_fight = Number(param1.fight.@clan);
                  if(Number(param1.fight.@dmg) > 0)
                  {
                     _loc26_.dmg = Number(param1.fight.@dmg);
                  }
                  if(_loc26_.hp > 0)
                  {
                     _loc3_.hp = Number(param1.fight.@myhp);
                     _loc3_.rage = Number(param1.fight.@myr);
                  }
                  _loc3_.dd = Number(param1.fight.@mydd);
                  _loc26_.type = Number(param1.fight.@type);
                  _loc26_.reward = reward_to_object(param1.fight.r);
                  _loc26_.active = Number(param1.fight.@res);
                  _loc26_.log = xml_fight_log_to_array(param1.fight.l);
                  _loc2_.new_player = Number(param1.new_player.@res);
                  if(param1.promo != undefined)
                  {
                     _loc27_ = reward_to_object(param1.promo.r);
                  }
                  for each(_loc29_ in param1.u_ach)
                  {
                     _loc28_ = new Object();
                     _loc28_.id = int(_loc29_.@id);
                     _loc28_.value = int(_loc29_.@val);
                     _loc28_.lvl = int(_loc29_.@lvl);
                     _loc3_.achieve[_loc28_.id] = _loc28_;
                  }
                  _loc30_ = new Object();
                  _loc30_ = new Array();
                  for each(_loc29_ in param1.ach)
                  {
                     _loc28_ = new Object();
                     _loc28_.id = int(_loc29_.@id);
                     _loc28_.name = String(_loc29_.@name);
                     _loc28_.descr = String(_loc29_.@descr);
                     _loc28_.cat_id = int(_loc29_.@cat_id);
                     _loc28_.accumulation = Boolean(int(_loc29_.@accum));
                     _loc28_.req_val1 = int(_loc29_.@r1);
                     _loc28_.req_val2 = int(_loc29_.@r2);
                     _loc28_.req_val3 = int(_loc29_.@r3);
                     _loc28_.req_val4 = int(_loc29_.@r4);
                     _loc28_.req_val5 = int(_loc29_.@r5);
                     _loc28_.req_val6 = int(_loc29_.@r6);
                     _loc30_[_loc28_.id] = _loc28_;
                  }
                  _loc31_ = new var1172();
                  _loc31_.var1362["region" + _loc3_.region_id] = xml_rating_to_array(1,param1.r_top);
                  if(param1.clan != undefined)
                  {
                     _loc3_.clan_data = xml_clandata_toobj(param1.clan);
                     _loc3_.clan_rank = Number(param1.u.@clan_r);
                     _loc3_.clan_id = Number(_loc3_.clan_data.id);
                  }
                  var _loc32_:Object = new Object();
                  for each(_loc33_ in param1.stck)
                  {
                     _loc32_[int(_loc33_.@id)] = {
                        "item_num":int(_loc33_.@id),
                        "cnt":int(_loc33_.@cnt),
                        "gold_price":int(_loc33_.@prc),
                        "life_time":int(_loc33_.@lt),
                        "chance":Number(_loc33_.@c)
                     };
                  }
                  if(param1.u_stck.length() > 0)
                  {
                     _loc3_.var1535 = {
                        "item_num":int(param1.u_stck[0].@id),
                        "remain_time":int(param1.u_stck[0].@rt)
                     };
                  }
                  _loc2_.udata = _loc3_;
                  _loc2_.setups = _loc5_;
                  _loc2_.map_data = _loc15_;
                  _loc2_.fight_data = _loc26_;
                  _loc2_.quests_data = null;
                  _loc2_.rooms_data = _loc25_;
                  _loc2_.tasks_data = _loc23_;
                  _loc2_.shop_data = null;
                  _loc2_.skills_data = _loc21_;
                  _loc2_.npc = _loc17_;
                  _loc2_.npc_groups = _loc19_;
                  _loc2_.ratings = _loc31_;
                  _loc2_.raids_data = _loc12_;
                  _loc2_.user_raid_data = _loc13_;
                  _loc2_.promo_reward = _loc27_;
                  _loc2_.ach = _loc30_;
                  _loc2_.stocks = _loc32_;
                  Main.var1235[handler_func](_loc2_);
               };
               var xml_f_load:XML = get_answer(url_id,e,sub_init);
            };
            ref = "";
            if(String(flash_vars["referrer"]).indexOf("ad_group_post") >= 0)
            {
               ref = String(flash_vars["referrer"]).substring(14);
            }
            abp = '352407221afb776e3143e8a1a0577885';
            this.var1247(url_id,this.main_url,"&ref=" + ref + "&t=" + abp,init);
         }
      }
      
      public function var2697(param1:var748, param2:Function) : void
      {
         var url_id:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var clan_data:var748 = param1;
         var handler_func:Function = param2;
         url_id = 46;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               if(Number(_loc2_.a.@res) == 0)
               {
                  clan_data = null;
               }
               handler_func(clan_data);
            };
            hash_string = clan_data.id + "bska";
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.main_url,"&t=" + clan_data.id + "&g_sig=" + hash,init);
         }
      }
      
      public function var2484(param1:var748, param2:String) : void
      {
         var url_id:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var clan_data:var748 = param1;
         var handler_func:String = param2;
         url_id = 55;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               if(Number(_loc2_.a.@res) == 0)
               {
                  clan_data = null;
               }
               Main.var1235[handler_func](clan_data);
            };
            hash_string = clan_data.id + "fhJa";
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.main_url,"&t=" + clan_data.id + "&g_sig=" + hash,init);
         }
      }
      
      private function xml_clandata_toobj(param1:*) : var748
      {
         var _loc3_:* = 0;
         var _loc4_:Array = null;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:String = null;
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc10_:* = 0;
         var _loc2_:var748 = new var748();
         _loc2_.id = Number(param1.@id);
         _loc2_.name = param1.@name;
         _loc2_.var1798 = param1.@leader;
         _loc2_.members_cnt = Number(param1.@mcnt);
         _loc2_.rank = Number(param1.@r);
         _loc2_.rating_1 = Number(param1.@r1);
         _loc2_.upgrade_1 = Number(param1.@u1);
         _loc2_.upgrade_2 = Number(param1.@u2);
         _loc2_.upgrade_3 = Number(param1.@u3);
         _loc2_.upgrade_4 = Number(param1.@u4);
         _loc2_.upgrade_5 = Number(param1.@u5);
         _loc2_.upgrade_6 = Number(param1.@u6);
         _loc2_.upgrade_7 = Number(param1.@u7);
         _loc2_.upgrade_8 = Number(param1.@u8);
         _loc2_.upgrade_9 = Number(param1.@u9);
         _loc2_.upgrade_10 = Number(param1.@u10);
         _loc2_.del = int(param1.@del);
         _loc2_.money1 = Number(param1.@m1);
         _loc2_.money2 = Number(param1.@m2);
         _loc2_.money3 = Number(param1.@m3);
         _loc2_.money4 = Number(param1.@m4);
         _loc2_.money7 = Number(param1.@m7);
         _loc2_.descr = param1.@descr;
         _loc2_.var1895 = Number(param1.@lprot);
         _loc2_.war_protection = Math.max(0,Number(param1.@prot));
         _loc2_.var1663 = new var748();
         _loc2_.var1663.id = Number(param1.@ww);
         _loc2_.var1663.name = String(param1.@wwn);
         _loc2_.var2762 = Number(param1.@wi);
         if(Number(param1.@wt) > 0 && Number(param1.@wt) < var27.var382)
         {
            _loc2_.war_time_til_end = var27.var382 - Number(param1.@wt);
         }
         else
         {
            _loc2_.war_time_til_end = 0;
         }
         if(param1.info != undefined)
         {
            _loc3_ = param1.info.c.length();
            _loc4_ = new Array();
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               if(_loc4_["u" + param1.info.c[_loc5_].@id] == null)
               {
                  _loc4_["u" + param1.info.c[_loc5_].@id] = new Object();
               }
               _loc4_["u" + param1.info.c[_loc5_].@id]["m" + param1.info.c[_loc5_].@t] = Number(param1.info.c[_loc5_].@v);
               _loc5_++;
            }
            _loc2_.var1648 = _loc4_;
         }
         if(param1.mmbrs != undefined)
         {
            _loc4_ = new Array();
            _loc4_["list"] = new Array();
            _loc6_ = param1.mmbrs.u.length();
            _loc5_ = 0;
            while(_loc5_ < _loc6_)
            {
               _loc7_ = "u" + param1.mmbrs.u[_loc5_].@id;
               if(Main.var1235.user_data.id == String(param1.mmbrs.u[_loc5_].@id))
               {
                  _loc4_[_loc7_] = Main.var1235.user_data;
               }
               else
               {
                  _loc4_[_loc7_] = this.xml_char_to_obj(param1.mmbrs.u[_loc5_]);
               }
               _loc4_["list"].push(_loc4_[_loc7_]);
               _loc5_++;
            }
            _loc2_.var1314 = _loc4_;
         }
         if(param1.inv != undefined)
         {
            _loc8_ = new Array();
            _loc8_["list"] = new Array();
            _loc6_ = param1.inv.u.length();
            _loc5_ = 0;
            while(_loc5_ < _loc6_)
            {
               _loc7_ = "u" + param1.inv.u[_loc5_].@id;
               _loc8_[_loc7_] = this.xml_char_to_obj(param1.inv.u[_loc5_]);
               _loc8_["list"].push(_loc8_[_loc7_]);
               _loc5_++;
            }
            _loc2_.var1425 = _loc8_;
         }
         if(param1.hist != undefined)
         {
            _loc9_ = new Array();
            _loc10_ = param1.hist.h.length();
            _loc5_ = 0;
            while(_loc5_ < _loc10_)
            {
               _loc9_.push({
                  "date":param1.hist.h[_loc5_].@d,
                  "etype":Number(param1.hist.h[_loc5_].@t),
                  "val1":param1.hist.h[_loc5_].@v1,
                  "val2":param1.hist.h[_loc5_].@v2,
                  "val3":param1.hist.h[_loc5_].@v3,
                  "val4":param1.hist.h[_loc5_].@v4
               });
               _loc5_++;
            }
            _loc2_.var2005 = _loc9_;
         }
         return _loc2_;
      }
      
      private function xml_fight_log_to_array(param1:*) : Array
      {
         var _loc5_:String = null;
         var _loc2_:Array = new Array();
         var _loc3_:Number = param1.length();
         _loc2_["list"] = new Array();
         var _loc4_:* = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = "u" + param1[_loc4_].@id;
            _loc2_[_loc5_] = new var911(param1[_loc4_].@id);
            _loc2_[_loc5_].dd = Number(param1[_loc4_].@dd);
            _loc2_[_loc5_].name = param1[_loc4_].@n;
            _loc2_["list"].push(_loc2_[_loc5_]);
            _loc4_++;
         }
         return _loc2_;
      }
      
      private function xml_rating_to_array(param1:int, param2:*) : Array
      {
         var _loc4_:* = 0;
         var _loc5_:var1089 = null;
         var _loc6_:* = 0;
         var _loc7_:var1089 = null;
         var _loc3_:Array = new Array();
         _loc3_["list"] = new Array();
         if(param1 == 1)
         {
            _loc4_ = param2.u.length();
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               if(_loc3_["u" + param2.u[_loc6_].@id] == null)
               {
                  _loc7_ = this.xml_char_to_obj(param2.u[_loc6_]);
               }
               else
               {
                  _loc7_ = _loc3_["u" + param2.u[_loc6_].@id];
               }
               _loc7_.rating_score = Number(param2.u[_loc6_].@val);
               if(Number(param2.u[_loc6_].@is_top) == 1)
               {
                  _loc5_ = _loc7_;
               }
               else
               {
                  _loc3_["list"].push(_loc7_);
                  _loc3_["u" + _loc7_.id] = _loc7_;
               }
               _loc6_++;
            }
            _loc3_["list"].sortOn("rating_score",Array.NUMERIC | Array.DESCENDING);
            if(_loc5_ != null)
            {
               _loc3_["list"].unshift(_loc5_);
               _loc3_["u" + _loc5_.id] = _loc5_;
            }
         }
         return _loc3_;
      }
      
      public function var2787(param1:Object, param2:String) : void
      {
         var url_id:int = 0;
         var data:Object = param1;
         var handler_func:String = param2;
         url_id = 8;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = data;
               if(_loc2_.r != undefined)
               {
                  _loc3_.reward = reward_to_object(_loc2_.r);
               }
               else
               {
                  _loc3_.reward = null;
               }
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t=" + data.id,init);
         }
      }
      
      public function var3788(param1:Object, param2:String) : void
      {
         var url_id:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var data:Object = param1;
         var handler_func:String = param2;
         url_id = 22;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = data;
               _loc3_.id = Number(_loc2_.j.@id);
               _loc3_.name = _loc2_.j.@n;
               _loc3_.time = Number(_loc2_.j.@t);
               _loc3_.max_lvl = Number(_loc2_.j.@mlvl);
               _loc3_.requirements = new Object();
               _loc3_.swc = Number(_loc2_.j.@swc);
               _loc3_.rew_koeff = Number(_loc2_.j.@rk);
               _loc3_.requirements.boss_id = Number(_loc2_.j.@rb);
               _loc3_.requirements.key_num = Number(_loc2_.j.@rkey);
               if(_loc2_.r != undefined)
               {
                  _loc3_.reward = reward_to_object(_loc2_.r);
               }
               Main.var1235[handler_func](_loc3_);
            };
            hash_string = "" + data.region_id + data.region_num + "dS4";
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.main_url,"&g_sig=" + hash + "&t1=" + data.region_id + "&t2=" + data.region_num,init);
         }
      }
      
      public function var2093(param1:Object, param2:String) : void
      {
         var url_id:int = 0;
         var data:Object = param1;
         var handler_func:String = param2;
         url_id = 25;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = data;
               _loc3_.res = Number(_loc2_.r.@res);
               if(_loc3_.res == 1)
               {
                  _loc3_.region_rating = xml_rating_to_array(1,_loc2_.r_top);
               }
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t=" + data.id + "&t1=" + data.map_id,init);
         }
      }
      
      public function var3533(param1:int, param2:String) : void
      {
         var url_id:int = 0;
         var car_id:int = param1;
         var handler_func:String = param2;
         url_id = 27;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = new Object();
               _loc3_.id = car_id;
               _loc3_.upgrade = Number(_loc2_.a.@u);
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t=" + car_id,init);
         }
      }
      
      public function var3391(param1:int, param2:int, param3:String) : void
      {
         var url_id:int = 0;
         var type:int = param1;
         var item_id:int = param2;
         var handler_func:String = param3;
         url_id = 26;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = new Object();
               _loc3_.item_id = item_id;
               _loc3_.result = Number(_loc2_.a.@res);
               _loc3_.type = type;
               _loc3_.upgrade = Number(_loc2_.a.@u);
               _loc3_.price = Number(_loc2_.a.@p);
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t=" + type + "&t1=" + item_id,init);
         }
      }
      
      public function var3317(param1:Object, param2:String) : void
      {
         var url_id:int = 0;
         var data:Object = param1;
         var handler_func:String = param2;
         url_id = 33;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = data;
               _loc3_.result = Number(_loc2_.res.@id);
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t=" + data.id,init);
         }
      }
      
      public function var3949(param1:int, param2:String) : void
      {
         var url_id:int = 0;
         var skill_id:int = param1;
         var handler_func:String = param2;
         url_id = 14;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = new Object();
               _loc3_.res = Number(_loc2_.a.@r);
               if(_loc3_.res == 1)
               {
                  _loc3_.id = Number(_loc2_.a.@id);
                  _loc3_.lvl = Number(_loc2_.a.@lvl);
                  _loc3_.m1 = Number(_loc2_.a.@m1);
               }
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t=" + skill_id,init);
         }
      }
      
      public function var3501(param1:Object, param2:String) : void
      {
         var url_id:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var data:Object = param1;
         var handler_func:String = param2;
         url_id = 24;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = data;
               _loc3_.res = Number(_loc2_.j.@ok);
               _loc3_.id = Number(_loc2_.j.@id);
               _loc3_.lvl = Number(_loc2_.j.@lvl);
               _loc3_.key_num = Number(_loc2_.j.@rkey);
               _loc3_.key_price = Number(_loc2_.j.@rprice);
               Main.var1235[handler_func](_loc3_);
            };
            hash_string = "" + data.region_id + data.region_num + "ja6";
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.main_url,"&g_sig=" + hash + "&t1=" + data.region_id + "&t2=" + data.region_num,init);
         }
      }
      
      public function var3476(param1:Object, param2:String) : void
      {
         var url_id:int = 0;
         var data:Object = param1;
         var handler_func:String = param2;
         url_id = 28;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = data;
               if(_loc2_.r != undefined)
               {
                  _loc3_.reward = reward_to_object(_loc2_.r);
               }
               var _loc4_:Number = _loc2_.lot.length();
               _loc3_.items = new Object();
               var _loc5_:* = 0;
               var _loc6_:* = 0;
               while(_loc6_ < _loc4_)
               {
                  _loc5_ = _loc6_ + 1;
                  _loc3_.items["i_" + _loc5_] = reward_to_object(_loc2_.lot[_loc6_]);
                  _loc3_.items["i_" + _loc5_].id = Number(_loc2_.lot[_loc6_].@id);
                  _loc6_++;
               }
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t1=" + data.id,init);
         }
      }
      
      public function var2369(param1:Object, param2:String) : void
      {
         var url_id:int = 0;
         var data:Object = param1;
         var handler_func:String = param2;
         url_id = 23;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = data;
               _loc3_.id = Number(_loc2_.j.@id);
               _loc3_.name = String(_loc2_.j.@n);
               _loc3_.time = Number(_loc2_.j.@t);
               _loc3_.lvl = Number(_loc2_.j.@lvl);
               if(_loc2_.r != undefined)
               {
                  _loc3_.got_reward = reward_to_object(_loc2_.r);
               }
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t1=" + data.region_id + "&t2=" + data.region_num,init,false);
         }
      }
      
      public function var3248(param1:Array, param2:Function) : void
      {
         var c_part:int = 0;
         var req_arr:Array = null;
         var rparts:int = 0;
         var url_id:int = 0;
         var init:Function = null;
         var friends_arr:Array = param1;
         var handler_func:Function = param2;
         c_part = 1;
         req_arr = new Array();
         rparts = Math.max(1,Math.ceil(friends_arr["list"].length / var27.var460));
         url_id = 7;
         if(!this.var1244(url_id))
         {
            var cycle_request:Function = function(param1:*):void
            {
               var _loc3_:String = null;
               var _loc2_:String = main_url;
               _loc3_ = "<data>";
               var _loc4_:int = (param1 - 1) * var27.var460;
               var _loc5_:int = friends_arr["list"].length - 1;
               var _loc6_:int = Math.min(param1 * var27.var460 - 1,_loc5_);
               var _loc7_:int = _loc4_;
               while(_loc7_ <= _loc6_)
               {
                  if(friends_arr["list"][_loc7_] != null)
                  {
                     _loc3_ = _loc3_ + ("<u>" + friends_arr["list"][_loc7_].id + "</u>");
                  }
                  _loc7_++;
               }
               _loc3_ = _loc3_ + "<u1>154374</u1>";
               _loc3_ = _loc3_ + "</data>";
               var _loc8_:URLRequest = new URLRequest(_loc2_);
               _loc8_.data = new URLVariables(auth_string);
               _loc8_.data.f_data = _loc3_;
               _loc8_.data.i = url_id;
               _loc8_.data.t = param1;
               _loc8_.contentType = "application/x-www-form-urlencoded";
               _loc8_.method = URLRequestMethod.POST;
               var _loc9_:URLLoader = new URLLoader();
               _loc9_.addEventListener(Event.COMPLETE,init);
               _loc9_.addEventListener(IOErrorEvent.IO_ERROR,sendError);
               _loc9_.addEventListener(IOErrorEvent.NETWORK_ERROR,sendError);
               _loc9_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,sendError);
               _loc9_.load(_loc8_);
            };
            init = function(param1:Event):void
            {
               var _loc6_:String = null;
               var _loc7_:Object = null;
               var _loc8_:Object = null;
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:int = _loc2_.u.length();
               var _loc4_:* = 0;
               while(_loc4_ < _loc3_)
               {
                  _loc6_ = "u" + String(_loc2_.u[_loc4_].@id);
                  if(friends_arr[_loc6_] != undefined)
                  {
                     if(!(_loc2_.u[_loc4_].@name == undefined) && !(_loc2_.u[_loc4_].@name == ""))
                     {
                        friends_arr[_loc6_].name = _loc2_.u[_loc4_].@name;
                     }
                     friends_arr[_loc6_].lvl = Number(_loc2_.u[_loc4_].@lvl);
                     friends_arr[_loc6_].hair = Number(_loc2_.u[_loc4_].@a1);
                     friends_arr[_loc6_].beard = Number(_loc2_.u[_loc4_].@a2);
                     friends_arr[_loc6_].eyebrow = Number(_loc2_.u[_loc4_].@a3);
                     friends_arr[_loc6_].nose = Number(_loc2_.u[_loc4_].@a4);
                     friends_arr[_loc6_].elems = Number(_loc2_.u[_loc4_].@a5);
                     friends_arr[_loc6_].room = Number(_loc2_.u[_loc4_].@room);
                     friends_arr[_loc6_].weapon = Number(_loc2_.u[_loc4_].@d2);
                     friends_arr[_loc6_].torso = Number(_loc2_.u[_loc4_].@d3);
                     friends_arr[_loc6_].hat = Number(_loc2_.u[_loc4_].@d4);
                     friends_arr[_loc6_].pants = Number(_loc2_.u[_loc4_].@d5);
                     friends_arr[_loc6_].armor = Number(_loc2_.u[_loc4_].@d6);
                     friends_arr[_loc6_].stuff = Number(_loc2_.u[_loc4_].@d7);
                     friends_arr[_loc6_].boots = Number(_loc2_.u[_loc4_].@d8);
                     friends_arr[_loc6_].gloves = Number(_loc2_.u[_loc4_].@d9);
                     friends_arr[_loc6_].l_time = Number(_loc2_.u[_loc4_].@l_t);
                     friends_arr[_loc6_].looted = Number(_loc2_.u[_loc4_].@loot);
                     friends_arr[_loc6_].is_friend = 1;
                  }
                  _loc4_++;
               }
               var _loc5_:int = _loc2_.ur.length();
               _loc4_ = 0;
               while(_loc4_ < _loc5_)
               {
                  _loc7_ = new Object();
                  _loc7_.id = Number(_loc2_.ur[_loc4_].id);
                  _loc7_.uid = String(_loc2_.ur[_loc4_].uid);
                  _loc7_.type = Number(_loc2_.ur[_loc4_].t);
                  _loc7_.v1 = Number(_loc2_.ur[_loc4_].v1);
                  _loc7_.v2 = Number(_loc2_.ur[_loc4_].v2);
                  _loc7_.v3 = Number(_loc2_.ur[_loc4_].v3);
                  _loc7_.v5 = Number(_loc2_.ur[_loc4_].v5);
                  _loc7_.d1 = Number(_loc2_.ur[_loc4_].d1);
                  req_arr.push(_loc7_);
                  _loc4_++;
               }
               c_part++;
               if(c_part > rparts)
               {
                  friends_arr.list.sortOn("lvl",Array.NUMERIC | Array.DESCENDING);
                  _loc8_ = new Object();
                  _loc8_.friends = friends_arr;
                  _loc8_.friends_requests = req_arr;
                  handler_func(_loc8_);
               }
               else
               {
                  cycle_request(c_part);
               }
            };
            cycle_request(c_part);
         }
      }
      
      public function var3342(param1:Array, param2:String) : void
      {
         var c_part:int = 0;
         var req_arr:Array = null;
         var rparts:int = 0;
         var url_id:int = 0;
         var init:Function = null;
         var friends_arr:Array = param1;
         var handler_func:String = param2;
         c_part = 1;
         req_arr = new Array();
         rparts = Math.max(1,Math.ceil(friends_arr["list"].length / var27.var460));
         if(rparts > 15)
         {
            rparts = 15;
         }
         url_id = 67;
         if(!this.var1244(url_id))
         {
            if(friends_arr != null)
            {
               var cycle_request:Function = function(param1:*):void
               {
                  var _loc2_:String = null;
                  var _loc3_:String = null;
                  var _loc4_:* = 0;
                  var _loc5_:* = 0;
                  var _loc6_:* = 0;
                  var _loc7_:* = 0;
                  var _loc8_:URLRequest = null;
                  var _loc9_:URLLoader = null;
                  if(Main.var1235.is_active)
                  {
                     executing_urls["url_" + url_id] = 1;
                     _loc2_ = main_url;
                     _loc3_ = "<data>";
                     _loc4_ = (param1 - 1) * var27.var460;
                     _loc5_ = friends_arr["list"].length - 1;
                     _loc6_ = Math.min(param1 * var27.var460 - 1,_loc5_);
                     _loc7_ = _loc4_;
                     while(_loc7_ <= _loc6_)
                     {
                        if(friends_arr["list"][_loc7_] != null)
                        {
                           _loc3_ = _loc3_ + ("<u>" + friends_arr["list"][_loc7_].id + "</u>");
                        }
                        _loc7_++;
                     }
                     _loc3_ = _loc3_ + "</data>";
                     _loc8_ = new URLRequest(_loc2_);
                     _loc8_.data = new URLVariables(auth_string);
                     _loc8_.data.d = new Date().getTime();
                     _loc8_.data.i = url_id;
                     _loc8_.data.sdata = _loc3_;
                     _loc8_.data.t = 33;
                     _loc8_.contentType = "application/x-www-form-urlencoded";
                     _loc8_.method = URLRequestMethod.POST;
                     _loc9_ = new URLLoader();
                     _loc9_.addEventListener(Event.COMPLETE,init);
                     _loc9_.addEventListener(IOErrorEvent.IO_ERROR,sendError);
                     _loc9_.addEventListener(IOErrorEvent.NETWORK_ERROR,sendError);
                     _loc9_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,sendError);
                     _loc9_.load(_loc8_);
                  }
                  else
                  {
                     Main.var1235.show_message("Вы долгое время отсутствовали и соединение с сервером потеряно. Для возобновления - перезайдите в игру.");
                  }
               };
               init = function(param1:Event):void
               {
                  var _loc5_:Object = null;
                  var _loc6_:Object = null;
                  var _loc2_:XML = get_answer(url_id,param1);
                  var _loc3_:int = _loc2_.ur.length();
                  var _loc4_:* = 0;
                  while(_loc4_ < _loc3_)
                  {
                     _loc5_ = new Object();
                     _loc5_.id = Number(_loc2_.ur[_loc4_].id);
                     _loc5_.uid = String(_loc2_.ur[_loc4_].uid);
                     _loc5_.type = Number(_loc2_.ur[_loc4_].t);
                     _loc5_.v1 = Number(_loc2_.ur[_loc4_].v1);
                     _loc5_.v2 = Number(_loc2_.ur[_loc4_].v2);
                     _loc5_.v3 = Number(_loc2_.ur[_loc4_].v3);
                     _loc5_.v5 = Number(_loc2_.ur[_loc4_].v5);
                     _loc5_.d1 = Number(_loc2_.ur[_loc4_].d1);
                     req_arr.push(_loc5_);
                     _loc4_++;
                  }
                  c_part++;
                  if(c_part > rparts)
                  {
                     _loc6_ = new Object();
                     _loc6_.friends_requests = req_arr;
                     Main.var1235[handler_func](_loc6_);
                  }
                  else
                  {
                     cycle_request(c_part);
                  }
               };
               cycle_request(c_part);
            }
         }
      }
      
      public function var3504(param1:Function) : void
      {
         var url_id:int = 0;
         var handler_func:Function = param1;
         url_id = 21;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = new Object();
               _loc3_.d1 = Number(_loc2_.a.@d1);
               _loc3_.d2 = Number(_loc2_.a.@d2);
               handler_func(_loc3_);
            };
            this.var1247(url_id,this.main_url,"",init);
         }
      }
      
      public function var3354(param1:String) : void
      {
         var url_id:int = 0;
         var handler_func:String = param1;
         url_id = 2;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Number = _loc2_.c.length();
               var _loc4_:Number = _loc2_.i.length();
               var _loc5_:Array = new Array();
               var _loc6_:* = 0;
               while(_loc6_ < _loc3_)
               {
                  _loc5_[_loc6_] = new Object();
                  _loc5_[_loc6_].id = Number(_loc2_.c[_loc6_].@cid);
                  _loc5_[_loc6_].name = _loc2_.c[_loc6_].@name;
                  _loc5_[_loc6_].swcname = _loc2_.c[_loc6_].@swcname;
                  _loc5_[_loc6_].type = Number(_loc2_.c[_loc6_].@type);
                  _loc6_++;
               }
               var _loc7_:Array = new Array();
               _loc6_ = 0;
               while(_loc6_ < _loc4_)
               {
                  _loc7_[_loc6_] = new Object();
                  _loc7_[_loc6_].key = _loc6_;
                  _loc7_[_loc6_].id = Number(_loc2_.i[_loc6_].@id);
                  _loc7_[_loc6_].name = _loc2_.i[_loc6_].@name;
                  _loc7_[_loc6_].fit = Number(_loc2_.i[_loc6_].@fit);
                  _loc7_[_loc6_].swc_id = Number(_loc2_.i[_loc6_].@swc_id);
                  _loc7_[_loc6_].descr = _loc2_.i[_loc6_].@dsc;
                  _loc7_[_loc6_].pic = _loc2_.i[_loc6_].@pic;
                  _loc7_[_loc6_].pic_data = null;
                  _loc7_[_loc6_].price1 = Number(_loc2_.i[_loc6_].@p1);
                  _loc7_[_loc6_].price2 = Number(_loc2_.i[_loc6_].@p2);
                  _loc7_[_loc6_].price3 = Number(_loc2_.i[_loc6_].@p3);
                  _loc7_[_loc6_].price4 = Number(_loc2_.i[_loc6_].@p4);
                  _loc7_[_loc6_].cat = Number(_loc2_.i[_loc6_].@cat);
                  _loc7_[_loc6_].anim = Number(_loc2_.i[_loc6_].@anm);
                  _loc7_[_loc6_].quality = Number(_loc2_.i[_loc6_].@qual);
                  _loc7_[_loc6_].is_new = Number(_loc2_.i[_loc6_].@isnew);
                  _loc7_[_loc6_].is_personal = Number(_loc2_.i[_loc6_].@is_p);
                  _loc7_[_loc6_].lock_boss = Number(_loc2_.i[_loc6_].@l1);
                  _loc7_[_loc6_].lock_money2 = Number(_loc2_.i[_loc6_].@l2);
                  _loc7_[_loc6_].lock_money3 = Number(_loc2_.i[_loc6_].@l3);
                  _loc7_[_loc6_].lock_lvl = Number(_loc2_.i[_loc6_].@l4);
                  _loc7_[_loc6_].lock_lottery = Number(_loc2_.i[_loc6_].@l5);
                  _loc7_[_loc6_].lock_raid = Number(_loc2_.i[_loc6_].@l6);
                  _loc7_[_loc6_].dmg = Number(_loc2_.i[_loc6_].@d2);
                  _loc7_[_loc6_].endur = Number(_loc2_.i[_loc6_].@d4);
                  _loc7_[_loc6_].luck = Number(_loc2_.i[_loc6_].@d5);
                  _loc6_++;
               }
               Main.var1235[handler_func](_loc5_,_loc7_);
            };
            this.var1247(url_id,this.main_url,"",init);
         }
      }
      
      public function var2613(param1:var748, param2:Function) : void
      {
         var url_id:int = 0;
         var enemy_clan_data:var748 = param1;
         var handler_func:Function = param2;
         url_id = 70;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:int = Number(_loc2_.res);
               if(_loc3_ == 0)
               {
                  enemy_clan_data = null;
               }
               handler_func(enemy_clan_data);
            };
            this.var1247(url_id,this.main_url,"&t1=" + enemy_clan_data.id,init);
         }
      }
      
      public function var2835(param1:String, param2:Object) : void
      {
         var url_id:int = 0;
         var handler_func:String = param1;
         var open_params:Object = param2;
         url_id = 9;
         var target_params:String = "&t=1";
         if(open_params != null)
         {
            if(open_params.type == 1)
            {
               url_id = 10;
               target_params = "&t1=" + open_params.region_id + "&t2=" + open_params.region_num + "&t3=" + open_params.interfere + "&t4=" + open_params.id + "&t5=" + open_params.type+"&fid="+open_params.fid;
            }
            else if(open_params.type == 0)
            {
               url_id = 9;
               target_params = "&t=0&t1=" + open_params.id.toString();
            }
            else if(open_params.type == 3)
            {
               url_id = 10;
               target_params = "&t4=" + open_params.id + "&t5=" + open_params.type;
            }
            
            
         }
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:var1089 = xml_char_to_obj(_loc2_.u);
               _loc3_.var2236 = Number(_loc2_.norew.@val);
               if(_loc2_.fight != undefined)
               {
                  _loc3_.clan_fight = Number(_loc2_.fight.@clan);
               }
               if(open_params != null)
               {
                  _loc3_.type = open_params.type;
                  if(open_params.name != null)
                  {
                     _loc3_.name = open_params.name;
                  }
                  _loc3_.photo_medium = "";
                  _loc3_.interfere = open_params.interfere;
               }
               else
               {
                  _loc3_.type = 0;
               }
               if(_loc2_.r != undefined)
               {
                  _loc3_.reward = reward_to_object(_loc2_.r);
               }
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,target_params,init);
         }
      }
      
      public function var3401(param1:int, param2:Function) : void
      {
         var url_id:int = 0;
         var war_id:int = param1;
         var handler_func:Function = param2;
         url_id = 74;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc3_:var808 = null;
               var _loc2_:XML = get_answer(url_id,param1);
               if(_loc2_.war != undefined)
               {
                  _loc3_ = xml_clan_war_data(_loc2_.war);
               }
               handler_func(_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t=" + war_id,init);
         }
      }
      
      public function var2761(param1:Object, param2:Function) : void
      {
         var url_id:int = 0;
         var doors_data:Object = param1;
         var handler_func:Function = param2;
         url_id = 78;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               if(int(_loc2_.res.@v) == 0)
               {
                  doors_data = null;
               }
               handler_func(doors_data);
            };
            this.var1247(url_id,this.main_url,"&t1=" + doors_data.d1 + "&t2=" + doors_data.d2 + "&t3=" + doors_data.d3,init,false);
         }
      }
      
      public function var2592(param1:int, param2:Function) : void
      {
         var url_id:int = 0;
         var chest_id:int = param1;
         var handler_func:Function = param2;
         url_id = 79;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc3_:Object = null;
               var _loc2_:XML = get_answer(url_id,param1);
               if(Number(_loc2_.res.@v) == 1)
               {
                  _loc3_ = new Object();
                  _loc3_.reward = reward_to_object(_loc2_.r);
                  _loc3_.step_reward = reward_to_object(_loc2_.rstep.r);
               }
               handler_func(_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t=" + chest_id,init,false);
         }
      }
      
      public function var2760(param1:int, param2:Function) : void
      {
         var url_id:int = 0;
         var pos:int = param1;
         var handler_func:Function = param2;
         url_id = 77;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc3_:Object = null;
               var _loc2_:XML = get_answer(url_id,param1);
               if(int(_loc2_.res.@v) == 1)
               {
                  _loc3_ = new Object();
                  _loc3_.new_pos = pos;
                  _loc3_.reward = reward_to_object(_loc2_.r);
                  _loc3_.step_reward = reward_to_object(_loc2_.rstep.r);
               }
               handler_func(_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t=" + pos,init,false);
         }
      }
      
      public function var2817(param1:Function) : void
      {
         var url_id:int = 0;
         var handler_func:Function = param1;
         url_id = 80;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc3_:var568 = null;
               var _loc2_:XML = get_answer(url_id,param1);
               if(int(_loc2_.res.@v) == 1)
               {
                  _loc3_ = reward_to_object(_loc2_.r);
               }
               handler_func(_loc3_);
            };
            this.var1247(url_id,this.main_url,"",init);
         }
      }
      
      public function var2716(param1:var1008, param2:Function) : void
      {
         var url_id:int = 0;
         var raid_data:var1008 = param1;
         var handler_func:Function = param2;
         url_id = 76;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc3_:var757 = null;
               var _loc2_:XML = get_answer(url_id,param1);
               if(_loc2_.uraid != undefined)
               {
                  _loc3_ = xml_uraid_to_obj(_loc2_.uraid);
               }
               handler_func(_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t=" + raid_data.id,init);
         }
      }
      
      public function var2255(param1:var808, param2:Function) : void
      {
         var url_id:int = 0;
         var war_data:var808 = param1;
         var handler_func:Function = param2;
         url_id = 71;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc3_:var808 = null;
               var _loc2_:XML = get_answer(url_id,param1);
               if(_loc2_.war != undefined)
               {
                  _loc3_ = xml_clan_war_data(_loc2_.war);
               }
               handler_func(_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t=" + war_data.war_id,init);
         }
      }
      
      private function xml_clan_war_data(param1:*) : var808
      {
         var _loc2_:var808 = new var808();
         _loc2_.war_id = Number(param1.@id);
         _loc2_.var3599 = String(param1.@t);
         _loc2_.status = Number(param1.@status);
         _loc2_.my_war_dd = Number(param1.@mdd);
         _loc2_.last_cw_death = Number(param1.@mdie);
         _loc2_.clan1_id = Number(param1.@c1id);
         _loc2_.clan2_id = Number(param1.@c2id);
         _loc2_.clan1_dmg = Number(param1.@c1dd);
         _loc2_.clan2_dmg = Number(param1.@c2dd);
         _loc2_.clan1_reward = Number(param1.@c1rew);
         _loc2_.loot1 = Number(param1.@l1);
         _loc2_.loot2 = Number(param1.@l2);
         _loc2_.loot3 = Number(param1.@l3);
         _loc2_.loot4 = Number(param1.@l4);
         _loc2_.loot7 = Number(param1.@l7);
         _loc2_.var2942 = Number(param1.@initer);
         _loc2_.var3705 = Number(param1.@win);
         var _loc3_:int = param1.u.length();
         _loc2_.clan1_ulog = new Array();
         var _loc4_:* = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_.clan1_ulog.push({
               "id":String(param1.u[_loc4_].@id),
               "dd":Number(param1.u[_loc4_].@dd)
            });
            _loc4_++;
         }
         _loc2_.clan1_ulog.sortOn("dd",Array.NUMERIC | Array.DESCENDING);
         return _loc2_;
      }
      
      public function var2301(param1:Function) : void
      {
         var url_id:int = 0;
         var handler_func:Function = param1;
         url_id = 69;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = new Object();
               _loc3_.result = Number(_loc2_.a.@res);
               _loc3_.enemy_data = xml_char_to_obj(_loc2_.u);
               _loc3_.hp = Number(_loc2_.fight.@hp);
               _loc3_.en_skill = Number(_loc2_.fight.@es);
               _loc3_.my_hp = Number(_loc2_.fight.@myhp);
               _loc3_.my_rage = Number(_loc2_.fight.@myr);
               handler_func(_loc3_);
            };
            this.var1247(url_id,this.main_url,"",init);
         }
      }
      
      public function var3494(param1:Object, param2:String) : void
      {
         var url_id:int = 0;
         var hash_rand:String = null;
         var hash_string:String = null;
         var hash:String = null;
         var enemy_data:Object = param1;
         var handler_func:String = param2;
         url_id = 11;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = new Object();
               if(_loc2_.r != undefined)
               {
                  _loc3_.cost = null;
                  _loc3_.cost = reward_to_object(_loc2_.r);
               }
               _loc3_.val = Number(_loc2_.a.@val);
               if(_loc2_.fight != undefined)
               {
                  _loc3_.hp = Number(_loc2_.fight.@hp);
                  _loc3_.fight_id = Number(_loc2_.fight.@fid);
                  _loc3_.dmg = Number(_loc2_.fight.@dmg);
               }
               else
               {
                  _loc3_.fight_id = 0;
                  _loc3_.hp = -1;
                  _loc3_.dmg = 0;
               }
               _loc3_.clan_fight = Number(_loc2_.fight.@clan);
               Main.var1235[handler_func](_loc3_);
            };
            hash_rand = "354754";
            hash_string = "" + hash_rand + "" + enemy_data.id + "" + enemy_data.type + "" + enemy_data.is_friend + "" + enemy_data.interfere;
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.main_url,"&g_sig=" + hash + "&t=" + enemy_data.id + "&t2=" + enemy_data.type + "&t3=" + enemy_data.is_friend + "&t4=" + enemy_data.interfere + "&t5=" + enemy_data.clan_fight + "&r=" + hash_rand +"&fid="+enemy_data.fid,init);
         }
      }
      
      public function var3542(param1:Object, param2:String) : void
      {
         var url_id:int = 0;
         var tasks_params:Object = param1;
         var handler_func:String = param2;
         url_id = 1;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Number = _loc2_.t.length();
               var _loc4_:Array = new Array();
               var _loc5_:* = 0;
               while(_loc5_ < _loc3_)
               {
                  _loc4_[_loc5_] = new Object();
                  _loc4_[_loc5_].id = Number(_loc2_.t[_loc5_].@id);
                  _loc4_[_loc5_].name = _loc2_.t[_loc5_].@name;
                  _loc4_[_loc5_].swc_pic = Number(_loc2_.t[_loc5_].@swc);
                  _loc4_[_loc5_].req_en = Number(_loc2_.t[_loc5_].@req_en);
                  _loc4_[_loc5_].reward = reward_to_object(_loc2_.t[_loc5_]);
                  _loc4_[_loc5_].max_val = Number(_loc2_.t[_loc5_].@max_val);
                  _loc4_[_loc5_].val = Number(_loc2_.t[_loc5_].@val);
                  _loc5_++;
               }
               Main.var1235[handler_func](_loc4_);
            };
            this.var1247(url_id,this.main_url,"&t2=" + tasks_params.region + "&t3=" + tasks_params.num,init);
         }
      }
      
      public function var3690(param1:String) : void
      {
         var url_id:int = 0;
         var handler_func:String = param1;
         url_id = 16;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Number = _loc2_.q.length();
               var _loc4_:Array = new Array();
               var _loc5_:* = 0;
               while(_loc5_ < _loc3_)
               {
                  _loc4_[_loc5_] = new Object();
                  _loc4_[_loc5_].id = Number(_loc2_.q[_loc5_].@id);
                  _loc4_[_loc5_].name = _loc2_.q[_loc5_].@n;
                  _loc4_[_loc5_].big_descr = _loc2_.q[_loc5_].@d1;
                  _loc4_[_loc5_].have = Number(_loc2_.q[_loc5_].@d2);
                  _loc4_[_loc5_].need = Number(_loc2_.q[_loc5_].@d3);
                  _loc4_[_loc5_].cond_1 = Number(_loc2_.q[_loc5_].@d4);
                  _loc4_[_loc5_].type = Number(_loc2_.q[_loc5_].@t);
                  _loc4_[_loc5_].skip_price = Number(_loc2_.q[_loc5_].@s);
                  _loc4_[_loc5_].swc = Number(_loc2_.q[_loc5_].@swc);
                  _loc4_[_loc5_].is_new = Number(_loc2_.q[_loc5_].@is_new);
                  _loc4_[_loc5_].reward = new var568();
                  _loc4_[_loc5_].reward.exp = Number(_loc2_.q[_loc5_].@r1);
                  _loc4_[_loc5_].reward.m1 = Number(_loc2_.q[_loc5_].@r2);
                  _loc4_[_loc5_].reward.m2 = Number(_loc2_.q[_loc5_].@r3);
                  _loc4_[_loc5_].reward.m3 = Number(_loc2_.q[_loc5_].@r4);
                  _loc4_[_loc5_].reward.m4 = Number(_loc2_.q[_loc5_].@r5);
                  _loc5_++;
               }
               Main.var1235[handler_func](_loc4_);
            };
            this.var1247(url_id,this.main_url,"",init);
         }
      }
      
      public function var2404(param1:Object, param2:String) : void
      {
         var url_id:int = 0;
         var add_param:String = null;
         var data:Object = param1;
         var handler_func:String = param2;
         url_id = 17;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc6_:Object = null;
               var _loc7_:Object = null;
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = new Object();
               if(_loc2_.r != undefined)
               {
                  _loc3_.reward = null;
                  _loc3_.reward = reward_to_object(_loc2_.r);
               }
               _loc3_.closed_quests = new Array();
               var _loc4_:Number = _loc2_.cl_q.length();
               var _loc5_:* = 0;
               while(_loc5_ < _loc4_)
               {
                  _loc6_ = new Object();
                  _loc6_.id = Number(_loc2_.cl_q[_loc5_].@id);
                  _loc6_.skip = Number(_loc2_.cl_q[_loc5_].@skip);
                  _loc3_.closed_quests.push(_loc6_);
                  _loc5_++;
               }
               _loc3_.new_quests = new Array();
               _loc4_ = _loc2_.new_q.length();
               _loc5_ = 0;
               while(_loc5_ < _loc4_)
               {
                  _loc7_ = new Object();
                  _loc7_.id = Number(_loc2_.new_q[_loc5_].@id);
                  _loc7_.name = _loc2_.new_q[_loc5_].@n;
                  _loc7_.big_descr = _loc2_.new_q[_loc5_].@d1;
                  _loc7_.have = 0;
                  _loc7_.need = Number(_loc2_.new_q[_loc5_].@d3);
                  _loc7_.cond_1 = Number(_loc2_.new_q[_loc5_].@d4);
                  _loc7_.type = Number(_loc2_.new_q[_loc5_].@t);
                  _loc7_.skip_price = Number(_loc2_.new_q[_loc5_].@s);
                  _loc7_.swc = Number(_loc2_.new_q[_loc5_].@swc);
                  _loc7_.is_new = Number(_loc2_.new_q[_loc5_].@is_new);
                  _loc7_.reward = new var568();
                  _loc7_.reward.exp = Number(_loc2_.new_q[_loc5_].@r1);
                  _loc7_.reward.m1 = Number(_loc2_.new_q[_loc5_].@r2);
                  _loc7_.reward.m2 = Number(_loc2_.new_q[_loc5_].@r3);
                  _loc7_.reward.m3 = Number(_loc2_.new_q[_loc5_].@r4);
                  _loc7_.reward.m4 = Number(_loc2_.new_q[_loc5_].@r5);
                  _loc3_.new_quests.push(_loc7_);
                  _loc5_++;
               }
               Main.var1235[handler_func](_loc3_);
            };
            add_param = "";
            if(!(data == null) && data.skip == true)
            {
               add_param = "&skip=" + data.id;
            }
            this.var1247(url_id,this.main_url,"" + add_param,init);
         }
      }
      
      public function var2643(param1:int, param2:Function) : void
      {
         var url_id:int = 0;
         var map_id:int = param1;
         var handler_func:Function = param2;
         url_id = 66;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = new Object();
               _loc3_.res = 0;
               if(_loc2_.r != undefined)
               {
                  _loc3_.res = 1;
                  _loc3_.reward = reward_to_object(_loc2_.r);
               }
               handler_func(_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t=" + map_id,init);
         }
      }
      
      public function var4008(param1:Function) : void
      {
         var url_id:int = 0;
         var handler_func:Function = param1;
         url_id = 65;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc4_:* = 0;
               var _loc5_:* = 0;
               var _loc6_:String = null;
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = new Object();
               if(!(_loc2_.umap == undefined) && _loc2_.umap.length() > 0)
               {
                  _loc4_ = _loc2_.umap.length();
                  _loc5_ = 0;
                  while(_loc5_ < _loc4_)
                  {
                     _loc6_ = "map" + _loc2_.umap[_loc5_].@m;
                     if(_loc3_[_loc6_] == null)
                     {
                        _loc3_[_loc6_] = new Object();
                        _loc3_[_loc6_]["list"] = new Array();
                     }
                     _loc3_[_loc6_]["p" + _loc2_.umap[_loc5_].@p] = 1;
                     _loc3_[_loc6_]["list"].push(Number(_loc2_.umap[_loc5_].@p));
                     _loc5_++;
                  }
               }
               handler_func(_loc3_);
            };
            this.var1247(url_id,this.main_url,"",init);
         }
      }
      
      public function var2667(param1:String, param2:String) : void
      {
         var url_id:int = 0;
         var setups:String = param1;
         var handler_func:String = param2;
         url_id = 42;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = new Object();
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t=" + setups,init);
         }
      }
      
      public function var1859(param1:Object, param2:String, param3:String) : void
      {
         var url_id:int = 0;
         var tdata:Object = param1;
         var handler_func:String = param2;
         var onCompleteHandler:String = param3;
         url_id = 32;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = new Object();
               if(_loc2_.r != undefined)
               {
                  _loc3_.reward = reward_to_object(_loc2_.r);
               }
               _loc3_.result = Number(_loc2_.a.@res);
               _loc3_.en = Number(_loc2_.a.@en);
               Main.var1235[handler_func](_loc3_,onCompleteHandler);
            };
            this.var1247(url_id,this.main_url,"&t1=" + tdata.t0 + "&t2=" + tdata.t1 + "&t3=" + tdata.t2 + "&t4=" + tdata.t3 + "&t5=" + tdata.t4 + "&t6=" + tdata.t5 + "&t7=" + tdata.t6 + "&t8=" + tdata.t2,init);
         }
      }
      
      public function var2256(param1:Object, param2:String) : void
      {
         var url_id:int = 0;
         var set_data:Object = param1;
         var handler_func:String = param2;
         url_id = 5;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = new Object();
               if(_loc2_.a != undefined)
               {
                  _loc3_.res = Number(_loc2_.a.@r);
                  _loc3_.weapon = Number(_loc2_.a.@d2);
                  _loc3_.torso = Number(_loc2_.a.@d3);
                  _loc3_.hat = Number(_loc2_.a.@d4);
                  _loc3_.pants = Number(_loc2_.a.@d5);
                  _loc3_.armor = Number(_loc2_.a.@d6);
                  _loc3_.stuff = Number(_loc2_.a.@d7);
                  _loc3_.boots = Number(_loc2_.a.@d8);
                  _loc3_.gloves = Number(_loc2_.a.@d9);
               }
               else
               {
                  _loc3_.res = 0;
               }
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t2=" + set_data.weapon + "&t3=" + set_data.torso + "&t4=" + set_data.hat + "&t5=" + set_data.pants + "&t6=" + set_data.armor + "&t7=" + set_data.stuff + "&t8=" + set_data.boots + "&t9=" + set_data.gloves,init);
         }
      }
      
      public function slot_item_dress(param1:Object, param2:String) : void
      {
         var url_id:int = 0;
         var item_data:Object = param1;
         var handler_func:String = param2;
         url_id = 6;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = item_data;
               if(_loc2_.a != undefined)
               {
                  _loc3_.res = Number(_loc2_.a.@r);
                  _loc3_.id = Number(_loc2_.a.@i);
                  _loc3_.slot = Number(_loc2_.a.@s);
               }
               else
               {
                  _loc3_.res = 0;
               }
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t=" + item_data.id,init);
         }
      }
      
      public function var3826(param1:int, param2:String) : void
      {
         var url_id:int = 0;
         var data:int = param1;
         var handler_func:String = param2;
         url_id = 31;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = new Object();
               _loc3_.result = Number(_loc2_.a.@res);
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t=" + data,init);
         }
      }
      
      public function shop_item_buy(param1:Object, param2:String) : void
      {
         var url_id:int = 0;
         var item_data:Object = param1;
         var handler_func:String = param2;
         url_id = 4;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = item_data;
               if(_loc2_.i != undefined)
               {
                  _loc3_.id = Number(_loc2_.i.@id);
                  _loc3_.slot = Number(_loc2_.i.@s);
                  _loc3_.buyed = 1;
                  _loc3_.broken = 0;
                  _loc3_.upgrade = 0;
               }
               else
               {
                  _loc3_ = null;
               }
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t=" + item_data.id,init);
         }
      }
      
      public function var2674(param1:Object, param2:String) : void
      {
         var url_id:int = 0;
         var item_data:Object = param1;
         var handler_func:String = param2;
         url_id = 30;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = item_data;
               if(_loc2_.i != undefined)
               {
                  _loc3_.id = Number(_loc2_.i.@id);
                  _loc3_.slot = Number(_loc2_.i.@s);
                  _loc3_.buyed = 0;
               }
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t=" + item_data.id,init);
         }
      }
      
      public function var2428(param1:Boolean, param2:Function) : void
      {
         var url_id:int = 0;
         var t:int = 0;
         var reward:Boolean = param1;
         var func:Function = param2;
         url_id = 37;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = new Object();
               if(_loc2_.r != undefined)
               {
                  _loc3_.reward = reward_to_object(_loc2_.r);
               }
               _loc3_.answer = 1;
               func(_loc3_);
            };
            t = 3;
            if(reward == false)
            {
               t = 2;
            }
            this.var1247(url_id,this.main_url,"&t=" + t,init);
         }
      }
      
      public function var3554(param1:Object, param2:String) : void
      {
         var url_id:int = 0;
         var data:Object = param1;
         var handler_func:String = param2;
         url_id = 3;
         if(!this.var1244(url_id))
         {
            var init:Function = function(param1:Event):void
            {
               var _loc2_:XML = get_answer(url_id,param1);
               var _loc3_:Object = new Object();
               _loc3_.id = data.id;
               _loc3_.answer = Number(_loc2_.a.@r);
               _loc3_.price = Number(_loc2_.a.@p);
               _loc3_.next_price = Number(_loc2_.a.@p1);
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t=" + data.id,init);
         }
      }
      
      public function var2411(param1:String, param2:String) : void
      {
         var url_id:int = 0;
         var init:Function = null;
         var params:String = null;
         var hash_string:String = null;
         var hash:String = null;
         var data:String = param1;
         var handler_func:String = param2;
         url_id = 53;
         if(!this.var1244(url_id))
         {
            init = function(param1:Event):void
            {
               var _loc2_:XML = null;
               var _loc3_:Object = null;
               _loc2_ = get_answer(url_id,param1);
               _loc3_ = new Object();
               _loc3_.result = Number(_loc2_.a.@res);
               Main.var1235[handler_func](_loc3_);
            };
            params = "";
            if(data != "")
            {
               params = params + ("&t=" + data);
            }
            hash_string = data;
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.main_url,"" + params + "&g_sig=" + hash,init);
         }
      }
      
      public function var2164(param1:String, param2:String) : void
      {
         var url_id:int = 0;
         var init:Function = null;
         var params:String = null;
         var data:String = param1;
         var handler_func:String = param2;
         url_id = 29;
         if(!this.var1244(url_id))
         {
            init = function(param1:Event):void
            {
               var _loc2_:XML = null;
               var _loc3_:Object = null;
               _loc2_ = get_answer(url_id,param1);
               _loc3_ = new Object();
               _loc3_.result = Number(_loc2_.a.@res);
               Main.var1235[handler_func](_loc3_);
            };
            params = "";
            if(data != "")
            {
               params = params + ("&t=" + data);
            }
            this.var1247(url_id,this.main_url,params,init);
         }
      }
      
      public function var2339(param1:Function) : void
      {
         var url_id:int = 0;
         var init:Function = null;
         var handler_func:Function = param1;
         url_id = 73;
         if(!this.var1244(url_id))
         {
            init = function(param1:Event):void
            {
               var _loc2_:XML = null;
               var _loc3_:var808 = null;
               _loc2_ = get_answer(url_id,param1);
               _loc3_ = xml_clan_war_data(_loc2_.war);
               handler_func(_loc3_);
            };
            this.var1247(url_id,this.main_url,"",init,false);
         }
      }
      
      public function var2767(param1:Object, param2:Function) : void
      {
         var url_id:int = 0;
         var init:Function = null;
         var data:Object = param1;
         var handler_func:Function = param2;
         url_id = 72;
         if(!this.var1244(url_id))
         {
            init = function(param1:Event):void
            {
               var _loc2_:XML = null;
               var _loc3_:Object = null;
               _loc2_ = get_answer(url_id,param1);
               _loc3_ = data;
               _loc3_.result = Number(_loc2_.a.@res);
               if(_loc3_.result == 0)
               {
               }
               if(_loc2_.fight != undefined)
               {
                  _loc3_.hp = Number(_loc2_.fight.@hp);
                  _loc3_.my_hp = Number(_loc2_.fight.@myhp);
                  _loc3_.my_rage = Number(_loc2_.fight.@myr);
                  _loc3_.en_skill = Number(_loc2_.fight.@es);
               }
               else
               {
                  _loc3_.hp = -1;
               }
               _loc3_.clan_war_stats = xml_clan_war_data(_loc2_.war);
               if(_loc2_.r != undefined)
               {
                  _loc3_.reward = reward_to_object(_loc2_.r);
               }
               handler_func(_loc3_);
            };
            this.var1247(url_id,this.main_url,"&s0=" + data.skill_0 + "&s1=" + data.skill_1 + "&s2=" + data.skill_2 + "&s3=" + data.skill_3 + "&s4=" + data.skill_4 + "&c1=" + data.cons_1 + "&c2=" + data.cons_2 + "&c3=" + data.cons_3 + "&c4=" + data.cons_4 + "&c5=" + data.cons_5 + "&m0=" + Main.var1235.user_data.luck + "&r=" + data.round + "&dd=" + data.damage_done + "&dg=" + data.damage_get,init,false);
         }
      }
      
      public function var1636(param1:Object, param2:Function) : void
      {
         var url_id:int = 0;
         var init:Function = null;
         var hash_rand:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var data:Object = param1;
         var handler_func:Function = param2;
         url_id = 12;
         if(!this.var1244(url_id))
         {
            init = function(param1:Event):void
            {
               var _loc2_:XML = null;
               var _loc3_:Object = null;
               _loc2_ = get_answer(url_id,param1);
               _loc3_ = data;
               _loc3_.result = Number(_loc2_.a.@res);
               if(_loc2_.fight != undefined)
               {
                  _loc3_.hp = Number(_loc2_.fight.@hp);
                  _loc3_.my_hp = Number(_loc2_.fight.@myhp);
                  _loc3_.my_rage = Number(_loc2_.fight.@myr);
               }
               else
               {
                  _loc3_.hp = -1;
               }
               _loc3_.log = xml_fight_log_to_array(_loc2_.l);
               if(_loc2_.r != undefined)
               {
                  _loc3_.reward = reward_to_object(_loc2_.r);
                  if(_loc2_.rstep != undefined)
                  {
                     _loc3_.step_reward = reward_to_object(_loc2_.rstep.r);
                  }
               }
               _loc3_.broken = Number(_loc2_.broken.@v);
               _loc3_.arena_delay = Number(_loc2_.a.@pvp_d);
               handler_func(_loc3_);
            };
            hash_rand = var502.var1270(1000000);
            hash_string = "" + Main.var1235.user_data.luck + hash_rand + data.skill_0 + data.skill_1 + data.skill_2 + data.skill_3 + data.skill_4 + data.cons_1 + data.cons_2 + data.cons_3 + data.cons_4 + data.round + data.damage_done + data.damage_get + "dK31";
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.main_url,"&g_sig=" + hash + "&r1=" + hash_rand + "&s0=" + data.skill_0 + "&s1=" + data.skill_1 + "&s2=" + data.skill_2 + "&s3=" + data.skill_3 + "&s4=" + data.skill_4 + "&c1=" + data.cons_1 + "&c2=" + data.cons_2 + "&c3=" + data.cons_3 + "&c4=" + data.cons_4 + "&c5=" + data.cons_5 + "&m0=" + Main.var1235.user_data.luck + "&r=" + data.round + "&dd=" + data.damage_done + "&dg=" + data.damage_get,init,false);
         }
      }
      
      public function var2951(param1:Object, param2:Function) : void
      {
         var url_id:int = 0;
         var init:Function = null;
         var hash_rand:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var data:Object = param1;
         var func:Function = param2;
         url_id = 18;
         if(!this.var1244(url_id))
         {
            init = function(param1:Event):void
            {
               var _loc2_:XML = null;
               var _loc3_:Object = null;
               _loc2_ = get_answer(url_id,param1);
               _loc3_ = new Object();
               _loc3_.result = Number(_loc2_.a.@r);
               _loc3_.value = Number(_loc2_.a.@v);
               _loc3_.item_key = _loc2_.a.@key;
               _loc3_.money_key = _loc2_.a.@mn;
               _loc3_.price = Number(_loc2_.a.@p);
               _loc3_.id = data.id;
               func(_loc3_);
            };
            hash_rand = var502.var1270(1000000);
            hash_string = "" + hash_rand + "" + data.id;
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.main_url,"&t=" + data.id + "&t2=" + data.cnt + "&r=" + hash_rand + "&g_sig=" + hash,init,false);
         }
      }
      
      public function var4055(param1:Object, param2:String) : void
      {
         var url_id:int = 0;
         var init:Function = null;
         var data:Object = param1;
         var handler_func:String = param2;
         url_id = 19;
         if(!this.var1244(url_id))
         {
            init = function(param1:Event):void
            {
               var _loc2_:XML = null;
               var _loc3_:Object = null;
               _loc2_ = get_answer(url_id,param1);
               _loc3_ = new Object();
               _loc3_.result = Number(_loc2_.a.@r);
               _loc3_.hp2 = Number(_loc2_.a.@v1);
               _loc3_.heal = Number(_loc2_.a.@v2);
               _loc3_.id = Number(data.id);
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t=" + data.id,init);
         }
      }
      
      public function var4173(param1:Object, param2:String) : void
      {
         var url_id:int = 0;
         var init:Function = null;
         var data:Object = param1;
         var handler_func:String = param2;
         url_id = 19;
         if(!this.var1244(url_id))
         {
            init = function(param1:Event):void
            {
               var _loc2_:XML = null;
               var _loc3_:Object = null;
               _loc2_ = get_answer(url_id,param1);
               _loc3_ = new Object();
               _loc3_.result = Number(_loc2_.a.@r);
               _loc3_.hp1 = Number(_loc2_.a.@v1);
               _loc3_.d1 = Number(_loc2_.a.@v2);
               _loc3_.id = Number(data.id);
               _loc3_.end = Number(_loc2_.a.@end);
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,"&t=" + data.id,init);
         }
      }
      
      public function var2535(param1:int, param2:Function) : void
      {
         var url_id:int = 0;
         var init:Function = null;
         var hash_rand:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var room_id:int = param1;
         var handler_func:Function = param2;
         url_id = 41;
         if(!this.var1244(url_id))
         {
            init = function(param1:Event):void
            {
               var _loc2_:XML = null;
               var _loc3_:Object = null;
               _loc2_ = get_answer(url_id,param1);
               _loc3_ = new Object();
               _loc3_.result = Number(_loc2_.res);
               _loc3_.room_id = room_id;
               handler_func(_loc3_);
            };
            hash_rand = var502.var1270(1000000);
            hash_string = "" + hash_rand + "" + room_id;
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.main_url,"&room=" + room_id + "&r=" + hash_rand + "&g_sig=" + hash,init);
         }
      }
      
      public function var2739(param1:int, param2:String) : void
      {
         var url_id:int = 0;
         var init:Function = null;
         var room_id:int = param1;
         var handler_func:String = param2;
         url_id = 40;
         if(!this.var1244(url_id))
         {
            init = function(param1:Event):void
            {
               var _loc2_:XML = null;
               var _loc3_:Object = null;
               _loc2_ = get_answer(url_id,param1);
               _loc3_ = new Object();
               _loc3_.result = Number(_loc2_.res);
               _loc3_.room_id = room_id;
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,"&room=" + room_id,init);
         }
      }
      
      public function var2173(param1:Object, param2:String) : void
      {
         var url_id:int = 0;
         var init:Function = null;
         var data:Object = param1;
         var handler_func:String = param2;
         url_id = 15;
         if(!this.var1244(url_id))
         {
            init = function(param1:Event):void
            {
               var _loc2_:XML = null;
               var _loc3_:Object = null;
               _loc2_ = get_answer(url_id,param1);
               _loc3_ = new Object();
               _loc3_.res = Number(_loc2_.a.@res);
               _loc3_.a1 = Number(_loc2_.a.@a1);
               _loc3_.a2 = Number(_loc2_.a.@a2);
               _loc3_.a3 = Number(_loc2_.a.@a3);
               _loc3_.a4 = Number(_loc2_.a.@a4);
               _loc3_.a5 = Number(_loc2_.a.@a5);
               Main.var1235[handler_func](_loc3_);
            };
            this.var1247(url_id,this.main_url,"&a1=" + data.hair + "&a2=" + data.beard + "&a3=" + data.eyebrow + "&a4=" + data.nose + "&a5=" + data.elems,init);
         }
      }
      
      private function var1247(param1:int, param2:String, param3:String, param4:Function, param5:Boolean = true) : void
      {
         var _loc6_:URLRequest = null;
         var _loc7_:URLLoader = null;
         if(Main.var1235.is_active)
         {
            var param3:String = param3 + ("&i=" + param1);
            this.executing_urls["url_" + param1] = 1;
            if(param5)
            {
               Main.var1235.var2353();
            }
            _loc6_ = new URLRequest(param2);
            _loc6_.contentType = "application/x-www-form-urlencoded";
            _loc6_.data = new URLVariables(this.auth_string + param3);
            _loc6_.data.d = new Date().getTime() + "1";
            _loc6_.method = URLRequestMethod.POST;
            _loc7_ = new URLLoader();
            _loc7_.dataFormat = URLLoaderDataFormat.TEXT;
            _loc7_.addEventListener(Event.COMPLETE,param4);
            _loc7_.addEventListener(IOErrorEvent.IO_ERROR,this.sendError);
            _loc7_.addEventListener(IOErrorEvent.NETWORK_ERROR,this.sendError);
            _loc7_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.sendError);
            _loc7_.load(_loc6_);
         }
         else
         {
            Main.var1235.show_message("Вы долгое время отсутствовали и соединение с сервером потеряно. Для возобновления - перезайдите в игру.");
         }
      }
      
      private function reward_to_object(param1:*) : var568
      {
         var _loc2_:var568 = null;
         _loc2_ = new var568();
         _loc2_.items = new Array();
         if(Number(param1.@item) != 0)
         {
            _loc2_.items[0] = {
               "item_id":Number(param1.@item),
               "item_type":Number(param1.@type)
            };
         }
         if(param1.i.length() > 0)
         {
            _loc2_.items.push({
               "item_id":Number(param1.i[0].@id),
               "item_type":0
            });
         }
         _loc2_.m1 = Number(param1.@m1);
         _loc2_.m2 = Number(param1.@m2);
         _loc2_.m3 = Number(param1.@m3);
         _loc2_.m4 = Number(param1.@m4);
         _loc2_.i1 = Number(param1.@i1);
         _loc2_.i2 = Number(param1.@i2);
         _loc2_.i3 = Number(param1.@i3);
         _loc2_.i5 = Number(param1.@i5);
         _loc2_.en = Number(param1.@en);
         _loc2_.exp = Number(param1.@exp);
         _loc2_.rep1 = Number(param1.@c1);
         _loc2_.rep2 = Number(param1.@c2);
         _loc2_.rep3 = Number(param1.@c3);
         _loc2_.rep4 = Number(param1.@c4);
         _loc2_.rep5 = Number(param1.@c5);
         _loc2_.rep6 = Number(param1.@c6);
         _loc2_.rep7 = Number(param1.@c7);
         _loc2_.rep8 = Number(param1.@c8);
         _loc2_.rep9 = Number(param1.@c9);
         _loc2_.rep10 = Number(param1.@c10);
         _loc2_.rep11 = Number(param1.@c11);
         _loc2_.key_1 = Number(param1.@k1);
         _loc2_.key_2 = Number(param1.@k2);
         _loc2_.key_3 = Number(param1.@k3);
         _loc2_.key_4 = Number(param1.@k4);
         _loc2_.key_5 = Number(param1.@k5);
         _loc2_.key_6 = Number(param1.@k6);
         _loc2_.key_7 = Number(param1.@k7);
         _loc2_.key_8 = Number(param1.@k8);
         _loc2_.bscore = Number(param1.@bscore);
         return _loc2_;
      }
      
      private function get_answer(param1:int, param2:Event, param3:Function = null) : XML
      {
         var _loc4_:URLLoader = null;
         var _loc5_:XML = null;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         this.executing_urls["url_" + param1] = null;
         Main.var1235.var2117();
         _loc4_ = param2.target as URLLoader;
         _loc5_ = new XML(_loc4_.data);
         if(param3 != null)
         {
            param3(_loc5_);
         }
         if(!(_loc5_.msg == undefined) && !(_loc5_.msg == ""))
         {
            Main.var1235.show_message(_loc5_.msg);
         }
         _loc6_ = _loc5_.quest.length();
         if(_loc6_ > 0)
         {
            _loc8_ = 0;
            while(_loc8_ < _loc6_)
            {
               Main.var1235.var3651({
                  "type":Number(_loc5_.quest[_loc8_].@t),
                  "val":Number(_loc5_.quest[_loc8_].@v),
                  "cond_1":Number(_loc5_.quest[_loc8_].@c)
               });
               _loc8_++;
            }
            Main.var1235.var4023();
         }
         _loc7_ = _loc5_.add_ach.length();
         if(_loc7_ > 0)
         {
            _loc9_ = 0;
            while(_loc9_ < _loc7_)
            {
               Main.var1235.var3126(int(_loc5_.add_ach[_loc9_].@id),int(_loc5_.add_ach[_loc9_].@val));
               _loc9_++;
            }
         }
         if(_loc5_.err != undefined)
         {
            Main.var1235.show_message("Упс! Что-то пошло не так! Обновите страницу с игрой, пожалуйста. Код ошибки (" + _loc5_.err.@v + ")");
         }
         return _loc5_;
      }
      
      private function get_answer_JSON(param1:int, param2:Event) : Object
      {
         var _loc3_:URLLoader = null;
         this.executing_urls["url_" + param1] = null;
         Main.var1235.var2117();
         _loc3_ = URLLoader(param2.target);
         return vk.api.serialization.json.JSON.decode(_loc3_.data);
      }
      
      private function xml_uraid_to_obj(param1:*) : var757
      {
         var _loc2_:var757 = null;
         _loc2_ = new var757();
         _loc2_.id = int(param1.@id);
         _loc2_.atk = int(param1.@atk);
         _loc2_.boss1_status = int(param1.@b1);
         _loc2_.boss2_status = int(param1.@b2);
         _loc2_.boss3_status = int(param1.@b3);
         _loc2_.b1 = Number(param1.@b1p);
         _loc2_.b2 = Number(param1.@b2p);
         _loc2_.b3 = Number(param1.@b3p);
         _loc2_.door1_status = int(param1.@d1);
         _loc2_.door2_status = int(param1.@d2);
         _loc2_.door3_status = int(param1.@d3);
         _loc2_.chest1_status = int(param1.@c1);
         _loc2_.chest2_status = int(param1.@c2);
         _loc2_.chest3_status = int(param1.@c3);
         _loc2_.hp = int(param1.@hp);
         _loc2_.pos = int(param1.@pos);
         _loc2_.time_left = int(param1.@tleft);
         _loc2_.c_reward = this.reward_to_object(param1.r);
         return _loc2_;
      }
      
      private function xml_raid_to_obj(param1:*) : var1008
      {
         var _loc2_:var1008 = null;
         _loc2_ = new var1008();
         _loc2_.id = int(param1.@id);
         _loc2_.name = String(param1.@n);
         _loc2_.descr = String(param1.@d);
         _loc2_.reward = this.reward_to_object(param1.r);
         _loc2_.time_left = int(param1.@til);
         _loc2_.b1_id = int(param1.@b1id);
         _loc2_.b2_id = int(param1.@b2id);
         _loc2_.b3_id = int(param1.@b3id);
         _loc2_.c1 = int(param1.@c1);
         _loc2_.c2 = int(param1.@c2);
         _loc2_.c3 = int(param1.@c3);
         _loc2_.d1 = int(param1.@d1);
         _loc2_.d2 = int(param1.@d2);
         _loc2_.d3 = int(param1.@d3);
         _loc2_.exit_point = int(param1.@ep);
         return _loc2_;
      }
      
      private function xml_item_to_obj(param1:*) : Object
      {
         var _loc2_:Object = null;
         _loc2_ = new Object();
         _loc2_.id = Number(param1.@id);
         _loc2_.upgrade = Number(param1.@u);
         _loc2_.slot_1 = Number(param1.@s1);
         _loc2_.slot_2 = Number(param1.@s2);
         _loc2_.slot_3 = Number(param1.@s3);
         _loc2_.slot_4 = Number(param1.@s4);
         _loc2_.slot_5 = Number(param1.@s5);
         _loc2_.buyed = Number(param1.@o);
         _loc2_.broken = Number(param1.@b);
         return _loc2_;
      }
      
      private function xml_char_to_obj(param1:*, param2:var911 = null) : var1089
      {
         var _loc3_:var1089 = null;
         _loc3_ = new var1089();
         if(param2 != null)
         {
            _loc3_.name = param2.name;
            _loc3_.dd = param2.dd;
         }
         if(!(param1.@name == undefined) && !(param1.@name == ""))
         {
            _loc3_.name = param1.@name;
         }
         _loc3_.descr = param1.@descr;
         _loc3_.wins = Number(param1.@wins);
         _loc3_.var3238 = Number(param1.@w_t);
         _loc3_.var3827 = Number(param1.@lim);
         _loc3_.l_time = Number(param1.@l_t);
         _loc3_.id = String(param1.@id);
         _loc3_.exp = Number(param1.@exp);
         _loc3_.lvl = Number(param1.@lvl);
         _loc3_.clan_rank = Number(param1.@clan_r);
         _loc3_.clan_id = Number(param1.@clan_id);
         _loc3_.clan_fight = Number(param1.@clan);
         _loc3_.endur = Number(param1.@end);
         _loc3_.endur_items = Number(param1.@endi);
         _loc3_.luck = Number(param1.@luck);
         _loc3_.luck_items = Number(param1.@lucki);
         _loc3_.hp = Number(param1.@hp);
         _loc3_.mhp = _loc3_.hp;
         _loc3_.dmg = Number(param1.@dmg);
         _loc3_.var1408 = Number(param1.@dmgi);
         _loc3_.hair = Number(param1.@a1);
         _loc3_.beard = Number(param1.@a2);
         _loc3_.eyebrow = Number(param1.@a3);
         _loc3_.nose = Number(param1.@a4);
         _loc3_.elems = Number(param1.@a5);
         _loc3_.room = Number(param1.@room);
         _loc3_.weapon = Number(param1.@d2);
         _loc3_.torso = Number(param1.@d3);
         _loc3_.hat = Number(param1.@d4);
         _loc3_.pants = Number(param1.@d5);
         _loc3_.armor = Number(param1.@d6);
         _loc3_.stuff = Number(param1.@d7);
         _loc3_.boots = Number(param1.@d8);
         _loc3_.gloves = Number(param1.@d9);
         if(!(param1.@swc == undefined) && !(param1.@swc == ""))
         {
            _loc3_.swc_link = param1.@swc;
         }
         else
         {
            _loc3_.swc_link = null;
         }
         if(!(param1.@dung == undefined) && !(param1.@dung == ""))
         {
            _loc3_.dungeon_boss = Number(param1.@dung);
         }
         else
         {
            _loc3_.dungeon_boss = 0;
         }
         if(!(param1.@swc_att == undefined) && !(param1.@swc_att == ""))
         {
            _loc3_.swc_att = param1.@swc_att;
         }
         else
         {
            _loc3_.swc_att = "attack_type_3";
         }
         return _loc3_;
      }
      
      private function sendError(param1:ErrorEvent) : void
      {
         this.executing_urls = new Array();
         Main.var1235.var2117();
         Main.var1235.var1669(param1.toString());
      }
      
      public function var2209(param1:String, param2:String, param3:String, param4:Function) : void
      {
         var url_id:int = 0;
         var init:Function = null;
         var hash_rand:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var api_id:String = param1;
         var sender:String = param2;
         var msg:String = param3;
         var handler_func:Function = param4;
         url_id = 1001;
         if(!this.var1244(url_id))
         {
            init = function(param1:Event):void
            {
               executing_urls["url_" + url_id] = null;
               handler_func();
            };
            hash_rand = var502.var1270(1000000);
            hash_string = "" + hash_rand + "" + sender + "" + msg + "" + api_id;
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.var2275,"&g_sig=" + hash + "&t=" + sender + "&t1=" + msg + "&api=" + api_id + "&r=" + hash_rand,init,false);
         }
      }
      
      public function var2567(param1:String, param2:Function) : void
      {
         var url_id:int = 0;
         var init:Function = null;
         var hash_rand:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var api_id:String = param1;
         var handler_func:Function = param2;
         init = function(param1:Event):void
         {
            handler_func(get_answer_JSON(url_id,param1));
         };
         url_id = 1002;
         hash_rand = var502.var1270(1000000);
         hash_string = "" + hash_rand + "" + api_id;
         hash = var528.hash(hash_string);
         this.var1247(url_id,this.var2275,"&g_sig=" + hash + "&api=" + api_id + "&r=" + hash_rand,init,false);
      }
      
      public function var2532(param1:String, param2:int, param3:String, param4:Function) : void
      {
         var url_id:int = 0;
         var init:Function = null;
         var hash_rand:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var api_id:String = param1;
         var fight_id:int = param2;
         var nick:String = param3;
         var handler_func:Function = param4;
         url_id = 1003;
         if(!this.var1244(url_id))
         {
            init = function(param1:Event):void
            {
               var _loc2_:XML = null;
               _loc2_ = get_answer(url_id,param1);
               if(!(_loc2_.nick == undefined) && !(_loc2_.nick == ""))
               {
                  handler_func(String(_loc2_.nick));
               }
            };
            hash_rand = var502.var1270(1000000);
            hash_string = "" + hash_rand + "" + fight_id + "" + nick + "" + api_id;
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.var2275,"&g_sig=" + hash + "&t=" + fight_id + "&t1=" + nick + "&api=" + api_id + "&r=" + hash_rand,init);
         }
      }
      
      public function var2754(param1:int, param2:int, param3:Function) : void
      {
         var url_id:int = 0;
         var init:Function = null;
         var hash_rand:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var ach_id:int = param1;
         var next_lvl:int = param2;
         var handler_func:Function = param3;
         url_id = 44;
         if(!this.var1244(url_id))
         {
            init = function(param1:Event):void
            {
               handler_func(get_answer_JSON(url_id,param1));
            };
            hash_rand = var502.var1270(1000000);
            hash_string = "" + hash_rand + "" + ach_id + "" + next_lvl;
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.main_url,"&g_sig=" + hash + "&t=" + ach_id + "&t1=" + next_lvl + "&r=" + hash_rand,init);
         }
      }
      
      public function var2554(param1:int, param2:int, param3:Function) : void
      {
         var url_id:int = 0;
         var init:Function = null;
         var hash_rand:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var ach_group_id:int = param1;
         var value:int = param2;
         var handler_func:Function = param3;
         url_id = 45;
         if(!this.var1244(url_id))
         {
            init = function(param1:Event):void
            {
               handler_func(get_answer_JSON(url_id,param1));
            };
            hash_rand = var502.var1270(1000000);
            hash_string = "" + hash_rand + "" + String(Main.var1235.user_data.id) + "" + ach_group_id + "" + value + "Hfdr1";
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.main_url,"&g_sig=" + hash + "&t=" + String(Main.var1235.user_data.id) + "&t1=" + ach_group_id + "&t2=" + value + "&r=" + hash_rand,init);
         }
      }
      
      public function var2494(param1:Function) : void
      {
         var url_id:int = 0;
         var init:Function = null;
         var handler_func:Function = param1;
         url_id = 48;
         if(!this.var1244(url_id))
         {
            init = function(param1:Event):void
            {
               var _loc2_:XML = null;
               var _loc3_:Object = null;
               var _loc4_:Object = null;
               _loc2_ = get_answer(url_id,param1);
               _loc3_ = new Object();
               if(!(_loc2_.single_sale == undefined) && int(_loc2_.single_sale[0].@id) > 0)
               {
                  _loc3_.id = int(_loc2_.single_sale[0].@id);
                  _loc3_.percent = int(_loc2_.single_sale[0].@p);
                  _loc3_.time = int(_loc2_.single_sale[0].@t);
                  _loc3_.current_time = int(_loc2_.single_sale[0].@t2);
                  _loc3_.single = int(_loc2_.single_sale[0].@s);
               }
               _loc4_ = {"single":_loc3_};
               handler_func(_loc4_);
            };
            this.var1247(url_id,this.main_url,"",init);
         }
      }
      
      public function var2550(param1:int, param2:Function) : void
      {
         var url_id:int = 0;
         var init:Function = null;
         var hash_rand:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var item_num:int = param1;
         var func:Function = param2;
         url_id = 61;
         if(!this.var1244(url_id))
         {
            init = function(param1:Event):void
            {
               var _loc2_:XML = null;
               var _loc3_:Object = null;
               _loc2_ = get_answer(url_id,param1);
               if(!(_loc2_.u_stck == undefined) && int(_loc2_.u_stck[0].@id) > 0)
               {
                  _loc3_ = new Object();
                  _loc3_ = {
                     "item_num":int(_loc2_.u_stck[0].@id),
                     "remain_time":int(_loc2_.u_stck[0].@rt)
                  };
                  func(_loc3_);
               }
            };
            hash_rand = var502.var1270(1000000);
            hash_string = "" + hash_rand + "" + item_num + "" + String(Main.var1235.user_data.id);
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.main_url,"&g_sig=" + hash + "&t=" + item_num + "&t1=" + String(Main.var1235.user_data.id) + "&r=" + hash_rand,init);
         }
      }
      
      public function var2646(param1:Object, param2:Function) : void
      {
         var url_id:int = 0;
         var init:Function = null;
         var hash_rand:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var data:Object = param1;
         var func:Function = param2;
         url_id = 62;
         if(!this.var1244(url_id))
         {
            init = function(param1:Event):void
            {
               var _loc2_:XML = null;
               var _loc3_:Object = null;
               _loc2_ = get_answer(url_id,param1);
               _loc3_ = new Object();
               _loc3_.result = Number(_loc2_.a.@r);
               _loc3_.value = Number(_loc2_.a.@v);
               _loc3_.item_key = _loc2_.a.@key;
               _loc3_.money_key = _loc2_.a.@mn;
               _loc3_.price = Number(_loc2_.a.@p);
               _loc3_.id = data.id;
               func(_loc3_);
            };
            hash_rand = var502.var1270(1000000);
            hash_string = "" + hash_rand + "" + data.id;
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.main_url,"&t=" + data.id + "&rnd=" + hash_rand + "&g_sig=" + hash,init,false);
         }
      }
      
      public function var2530(param1:int, param2:Function) : void
      {
         var url_id:int = 0;
         var init:Function = null;
         var hash_rand:int = 0;
         var hash_string:String = null;
         var hash:String = null;
         var key_id:int = param1;
         var handler_func:Function = param2;
         url_id = 63;
         if(!this.var1244(url_id))
         {
            init = function(param1:Event):void
            {
               var _loc2_:XML = null;
               var _loc3_:var568 = null;
               _loc2_ = get_answer(url_id,param1);
               if(Number(_loc2_.res) > 0)
               {
                  _loc3_ = reward_to_object(_loc2_.r);
                  _loc3_["key_" + key_id] = -1 * Number(_loc2_.res);
                  handler_func(_loc3_);
               }
            };
            hash_rand = var502.var1270(1000000);
            hash_string = "" + hash_rand + "" + key_id;
            hash = var528.hash(hash_string);
            this.var1247(url_id,this.main_url,"&t=" + key_id + "&r=" + hash_rand + "&g_sig=" + hash,init);
         }
      }
   }
}
