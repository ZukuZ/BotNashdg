package  {	
	  import flash.display.MovieClip;
	  import flash.external.ExternalInterface;	
	  import flash.system.Security;
	  import flash.utils.*;
	  import var475.var911;
      import var475.var1089;   
	  import var516.var528;
	  import com.hurlant.util.Base64;
      import com.hurlant.util.Hex;
      import com.hurlant.crypto.Crypto;
      import flash.utils.ByteArray;      
	  
	  public class Main extends MovieClip		
	  {
		public function Main() {					
			super();			
			trace('load');
			var1235 = this;
			this.flashVars = this.stage.loaderInfo.parameters as Object;
			var friends:Array=[];
			var i=0;
			this.friends_arr=new Array();
			this.friends_arr['list']=new Array();
			if(this.flashVars.friends){
			 friends=this.flashVars.friends.split(',');
			}			
			for(i=0;i<friends.length;i++){
				if(friends[i]){
			  		var f=new var911();
			  		f.id=friends[i];
			  		this.friends_arr["u"+friends[i]]=f;
			  		this.friends_arr['list'].push({id:friends[i]});
				}
			}			
			is_active=true;			
			this.gameApi=new var466();
			this.gameApi.var3309(this.main_url);
			this.gameApi.var3516(this.var3547);
			this.gameApi.var4049(this.getAuthString());	
			this.init();			
			Security.allowDomain("*");
		    ExternalInterface.addCallback("callApi",callApi);		    
		    ExternalInterface.call('onReady');
			ExternalInterface.call('cbCall','ready');
		}
	  public function callApi(method:String, param:String):void{	
	   if(this.STOP) return;
	   var data:Object;
	   var self = this;	   
	   if(method=='callFriends'){
			if(param && param!='""'){			
			 this[method](param);
			 }else{
			  this[method]("");
		   }
			return;  
		  }
		  if(param){		  
			data = JSON.parse(param);			
			this[method](data);
		  }else{
			  this[method]();
		  }			  
	  }
	  public function mainTimer():void{
		  this.t=this.t+1;
		  if(this.STOP) return;
		  if(this.t%160==0){
		    this.getInvites();
		  }
	  }
	  public function init():void{
		  this.gameApi.var3258(this.flashVars,'initCb'); //url_id = 0
	  }
	  public function initCb(param1:Object):void{		
		 this.user_data = param1.udata;		 
         this.fight_data = param1.fight_data;     
		 var i;
		 for(i in param1.map_data){
			if(param1.map_data[i].name)
			param1.map_data[i].name=param1.map_data[i].name.toString(); 
		 }
		 var r:Array=new Array(),j;
		 for(j in param1.fight_data.log){			
			  r.push(param1.fight_data.log[j]); 			
		 }				 
		 param1.fight_data.log=r;
		 var jsonString:String = JSON.stringify(param1);//JSON.stringify(param1);
		 ExternalInterface.call('cbCall','initCb',escape(jsonString));
		 ExternalInterface.call('cbCall','f0',escape(jsonString));
		 if(this.user_data && this.user_data.id){
			 trace('User: '+this.user_data.id);
			 trace('Name: '+this.user_data.name);
			 setInterval(this.mainTimer,1000);			 
		 }
		 if(param1.friends_requests && param1.friends_requests.length>0){
		 	var inv:Object={friends_requests:param1.friends_requests};
			getInvitesCb(inv);
		 }
	  }	
	  public function regChange(param:Object):void{ //url_id = 25, param ={id:?,map_id:?}
		 this.gameApi.var2093(param,'regChangeCb');
	  }
	  public function regChangeCb(param1:Object):void{
		 var r:Array=new Array(),i;
		 for(i in param1.region_rating){			
			  r.push(param1.region_rating[i]); 			
		 }				 
		 param1.region_rating=r;
		 var jsonString:String = JSON.stringify(param1);
		 ExternalInterface.call('cbCall','regChangeCb',escape(jsonString));
		 ExternalInterface.call('cbCall','f25',escape(jsonString));
		 this.user_data.region_id = param1.id;
		 trace('region changed to '+param1.id);
		 if(param1.friends_requests && param1.friends_requests.length>0){
		 	var inv:Object={friends_requests:param1.friends_requests};
			getInvitesCb(inv);
		 }
	  }
	   public function jobReward(param:Object):void{ //url_id = 23, param ={region_id:?,region_num:?}
		 this.gameApi.var2369(param,'jobRewardCb');
	  }
	  public function jobRewardCb(param1:Object):void{
		 var jsonString:String = JSON.stringify(param1);
		 ExternalInterface.call('cbCall','jobRewardCb',escape(jsonString));
		 ExternalInterface.call('cbCall','f23',escape(jsonString));
		 if(param1.got_reward != null)
         {
		   trace('job reward');		    
		 }
		  if(param1.friends_requests && param1.friends_requests.length>0){
		 	var inv:Object={friends_requests:param1.friends_requests};
			getInvitesCb(inv);
		 }
	  }
	   public function loadFriends():void{ //url_id = 7, param =null}	     
		 this.gameApi.var3248(this.friends_arr,loadFriendsCb);
	  }
	  public function loadFriendsCb(param1:Object):void{
		 this.friends_arr=param1.friends;
		 var f:Array=new Array(),i;
		 for(i in param1.friends){
			if(i!='list'){
			  f.push(param1.friends[i]); 
			}
		 }				 
		 param1.friends=f;
		 var jsonString:String = JSON.stringify(f);		 
		 ExternalInterface.call('cbCall','loadFriendsCb',escape(jsonString));
		 ExternalInterface.call('cbCall','f7',escape(jsonString));
		 if(param1.friends_requests && param1.friends_requests.length>0){
		 	var inv:Object={friends_requests:param1.friends_requests};
			getInvitesCb(inv);
		 }
	  }
	  public function getInvites():void{ //url_id = 67, param =null}	     
		 this.gameApi.var3342(this.friends_arr,'getInvitesCb');
	  }
	  public function getInvitesCb(param1:Object):void{		
		 var jsonString:String = JSON.stringify(param1);		 
		 ExternalInterface.call('cbCall','getInvitesCb',escape(jsonString));
		 ExternalInterface.call('cbCall','f67',escape(jsonString));
	  }
	  
	  public function setItems(param:Object):void{ //url_id = 5, param ={weapon:?,torso:?,hat:?,pants:?,armor:?,stuff:?,boots:?,gloves:?}	     
		 this.gameApi.var2256(param,'setItemsCb');
	  }
	  public function setItemsCb(param1:Object):void{		
		 var jsonString:String = JSON.stringify(param1);		 
		 ExternalInterface.call('cbCall','setItemsCb',escape(jsonString));
		 ExternalInterface.call('cbCall','f5',escape(jsonString));
	  }
	  
	  public function taskInfo(param:Object):void{ //url_id = 1, param ={region:?,num:?}
		 this.gameApi.var3542(param,'taskInfoCb');
	  }
	  public function taskInfoCb(param1:Object):void{
		 var jsonString:String = JSON.stringify(param1);
		 ExternalInterface.call('cbCall','taskInfoCb',escape(jsonString));
		 ExternalInterface.call('cbCall','f1',escape(jsonString));
		  if(param1.friends_requests && param1.friends_requests.length>0){
		 	var inv:Object={friends_requests:param1.friends_requests};
			getInvitesCb(inv);
		 }
	  }
	   public function levelUp(param:Object):void{  //url_id = 31 , param ={t:level}
		 this.gameApi.var3826(param.t,'levelUpCb');
	  }
	  public function levelUpCb(param1:Object):void{
		 var jsonString:String = JSON.stringify(param1);
		 ExternalInterface.call('cbCall','levelUpCb',escape(jsonString));
		 ExternalInterface.call('cbCall','f31',escape(jsonString));		 
	  }
	  public function loadMap():void{ //url_id = 65, param =null
		 this.gameApi.var4008(loadMapCb);
	  }
	  public function loadMapCb(param1:Object):void{
		 var jsonString:String = JSON.stringify(param1);
		 ExternalInterface.call('cbCall','loadMapCb',escape(jsonString));
		 ExternalInterface.call('cbCall','f65',escape(jsonString));
		  if(param1.friends_requests && param1.friends_requests.length>0){
		 	var inv:Object={friends_requests:param1.friends_requests};
			getInvitesCb(inv);
		 }
	  }
	  public function getQuests():void{ //url_id = 16, param =null
		 this.gameApi.var3690('getQuestsCb');
	  }
	  public function getQuestsCb(param1:Object):void{
		 var jsonString:String = JSON.stringify(param1);
		 ExternalInterface.call('cbCall','getQuestsCb',escape(jsonString));
		 ExternalInterface.call('cbCall','f16',escape(jsonString));
	  }
	  public function userInfo(param:Object):void{ //url_id = 39, param ={id:?}
		 var u:var911=new var911();
		 u.id=param.id;
		 this.gameApi.var2936(u,userInfoCb,false,null);
	  }
	  public function userInfoCb(param1:Object,param2:Boolean = false, param3:Function = null):void{
		 var jsonString:String = JSON.stringify(param1);
		 ExternalInterface.call('cbCall','userInfoCb',escape(jsonString));
		 ExternalInterface.call('cbCall','f39',escape(jsonString));
	  }
	  
	  public function getShop():void{ //url_id = 2, param =null
		 this.gameApi.var3354('getShopCb');
	  }
	  public function getShopCb(param1:Array,param2:Array):void{
		 var jsonString:String = JSON.stringify({p1:param1,p2:param2});
		 ExternalInterface.call('cbCall','getShopCb',escape(jsonString));
		 ExternalInterface.call('cbCall','f2',escape(jsonString));
	  }
	  public function syncTask(param:Object):void{ //url_id = 32, param ={t0:?,t1:?,t2:?,t3:?,t4:?,t5:?}		 
		 this.gameApi.var1859(param,'syncTaskCb','');
	  }
	  public function syncTaskCb(param1:Object,cb2:String):void{
		 var jsonString:String = JSON.stringify(param1);
		 ExternalInterface.call('cbCall','syncTaskCb',escape(jsonString));
		 ExternalInterface.call('cbCall','f32',escape(jsonString));
		  if(param1.friends_requests && param1.friends_requests.length>0){
		 	var inv:Object={friends_requests:param1.friends_requests};
			getInvitesCb(inv);
		 }
		  if(param1.result == 1 && !(this.user_data.en == param1.en))
         {
            this.user_data.en = param1.en;          
         }
	  }
	  public function createFight(param:Object):void{ //url_id = 11, param ={id:?,type:?,is_friend:?,interfere:?,clan_fight:?}		 
		 this.gameApi.var3494(param,'createFightCb');
	  }
	  public function createFightCb(param1:Object):void{
		 var jsonString:String = JSON.stringify(param1);
		 ExternalInterface.call('cbCall','createFightCb',escape(jsonString));
		 ExternalInterface.call('cbCall','f11',escape(jsonString));
	  }
	   public function syncFight(param:Object):void{ //url_id = 12, param ={skill_0:?,skill_1:?,skill_2:?,skill_3:?,skill_4:?,cons_1:?,cons_2:?,cons_3:?,cons_4:?,damage_done:?,damage_get:?,round:?}		 
		 this.gameApi.var1636(param,syncFightCb);
	  }
	  public function syncFightCb(param1:Object):void{
		 var r:Array=new Array(),i;
		 for(i in param1.log){			
			  r.push(param1.log[i]); 			
		 }				 
		 param1.log=r;
		 var jsonString:String = JSON.stringify(param1);
		 ExternalInterface.call('cbCall','syncFightCb',escape(jsonString));
		 ExternalInterface.call('cbCall','f12',escape(jsonString));
	  }
	   public function npcInfo(param:Object):void{ //url_id = 10,9 param ={region_id:?,region_num:?,interfere:?,id:?,type:?}
		 this.gameApi.var2835('npcInfoCb',param);
	  }
	  public function npcInfoCb(param1:Object):void{ 
		 var jsonString:String = JSON.stringify(param1);
		 ExternalInterface.call('cbCall','npcInfoCb',escape(jsonString));
		 ExternalInterface.call('cbCall','f10',escape(jsonString));
		 ExternalInterface.call('cbCall','f9',escape(jsonString));
	  }
	  
	   public function callFriends(param:String):void{ //url_id = 29 param ='ids'
		 this.gameApi.var2164(param,'callFriendsCb');
	  }
	  public function callFriendsCb(param1:Object):void{ 
		 var jsonString:String = JSON.stringify(param1);
		 ExternalInterface.call('cbCall','callFriendsCb',escape(jsonString));
		 ExternalInterface.call('cbCall','f29',escape(jsonString));
	  }
	   public function visitFriend(param:Object):void{ //url_id = 8, param ={id:?}		 
		 this.gameApi.var2787(param,'visitFriendCb');
	  }
	  public function visitFriendCb(param1:Object):void{
		 var jsonString:String = JSON.stringify(param1);
		 ExternalInterface.call('cbCall','visitFriendCb',escape(jsonString));	
		 ExternalInterface.call('cbCall','f8',escape(jsonString));	
	  }
	  public function getAuthString():String{
		  var viewer_id;
		  var auth_key;
		  if(this.flashVars.viewer_id){
			viewer_id=this.flashVars.viewer_id;
		    auth_key= this.flashVars.auth_key;
		  }		  		  		  
		  var n_k= var528.hash("lsnb5s48)hsnsJ3nG" + auth_key + "mJsgpAgfbdjHsgYt" + "nCbhfl65fdhh@h");
		  return 'viewer_id='+viewer_id+'&auth_key='+auth_key+'&n_k='+n_k+'&api_id=3932147';
	  }	
	  public var gameApi:var466;
	  public var t:int=0;
	  public var STOP:Boolean=false;
	  public var flashVars:Object;
	  public var friends_arr:Array;
	  public static var var1235:Main;	  
      private var main_url:String = "/";
      private var var3547:String = "http://46.182.31.151/ChatSrvr/";
      public var api_id:String;	  
	  public var user_data:var911;      
      public var var975:Array;      
      public var fight_data:var1089;
	  public var is_active:Boolean;
	  public function show_message(param1:String, param2:Boolean = true, param3:Function = null, param4:int = 1, param5:Function = null) : void {
		  trace(param1);
		  ExternalInterface.call('console.log',param1);
		  ExternalInterface.call('message',param1);
	   }
	  public function var1669(param1:String) : void {
	  }
	  public function var3252(param1:Number) : void {
	   }	 
	  public function var2353() : void {
	  }
	  public function var2117() : void {
	  }
	  public function var3651(param1:Object) : void {
	  }
	   public function var4023() : void {
	  }
	   public function var3126(param1:int,param2:int) : void {
	  }
	   public function systemError() : void {
	  	this.STOP=true;
		ExternalInterface.call('systemError','{}');

	  }
	}
	
}