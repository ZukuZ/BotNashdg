var Bot = function(settings) {
	this.settings = settings;
	this.viewer_id = settings.viewer_id;
	this.friends = settings.friends;
	this.auth_key = settings.auth_key;
	this.url = settings.url;
	this.methods = {
		0: {
			method: 'init',
			delay: 0
		},
		25: {
			method: 'regChange',
			delay: 3000
		},
		23: {
			method: 'jobReward',
			delay: 3000
		},
		7: {
			method: 'loadFriends',
			delay: 0
		},
		67: {
			method: 'getInvites',
			delay: 0
		},
		1: {
			method: 'taskInfo',
			delay: 4000
		},
		65: {
			method: 'loadMap',
			delay: 0
		},
		32: {
			method: 'syncTask',
			delay: 4000
		},
		11: {
			method: 'createFight',
			delay: 3000
		},
		12: {
			method: 'syncFight',
			delay: 500
		},
		10: {
			method: 'npcInfo',
			delay: 3000
		},
		9: {
			method: 'npcInfo',
			delay: 3000
		},
		29: {
			method: 'callFriends',
			delay: 0
		},
		8: {
			method: 'visitFriend',
			delay: 4000
		},
		16: {
			method: 'getQuests',
			delay: 0
		},
		2: {
			method: 'getShop',
			delay: 0
		},
		39: {
			method: 'userInfo',
			delay: 3000
		},
		5: {
			method: 'setItems',
			delay: 1000
		},
		31: {
			method: 'levelUp',
			delay: 0
		}
	};

	this.levels = [0, 90, 200, 430, 800, 1200, 1600, 2100, 2800, 3600, 4700, 6100, 7900, 10300, 13500, 17500, 22600, 29500, 38300, 50000, 65000, 84000, 109000, 140000, 185000, 240000, 290000, 345000, 415000, 500000, 600000, 715000, 860000, 1000000, 1240000, 1500000, 1800000, 2150000, 2550000, 3030000, 3600000, 4300000, 5130000, 6110000, 7260000, 8594000, 10134000, 11834000, 13789000, 16029000, 18579000, 21479000, 24814000, 28644000, 33044000, 38104000, 43914000, 50594000, 58183100, 66910000, 76946000, 88480000, 101750000, 117010000, 134560000, 154740000, 177950000, 204640000, 235330000, 270620000, 306620000, 343620000, 381120000, 419120000, 457620000, 496620000, 536020000];
};
Bot.prototype = _.create(EventEmitter.prototype, {
	"constructor": Bot
});
Bot.prototype.auth = function() {
	var self = this;
	var params = {};
	var attributes = {
		id: "bot"
	};
	var flashvars = {
		viewer_id: self.viewer_id,
		auth_key: self.auth_key,
		friends: self.friends
	}
	params.menu = "false";
	params.name = "bot";
	params.allownetworking = "all";
	params.allowscriptaccess = "always";
	params.wmode = "window";
	self.once('ready', function() {
		self.external = window.document['bot'] || window['bot'] || document.embeds['bot'];
	});
	swfobject.embedSWF(self.url, "bot", "0", "0", "9.0.0", false, flashvars, params, attributes);
	self.once('f0', self.preAuth);
};
Bot.prototype.preAuth = function(user) {
	var self = this;
	if (user.udata && user.udata.id) {
		self.user_data = user.udata;
		self.map_data = user.map_data;
		self.fight_data = user.fight_data;
		self.npc = user.npc;
		if (self.npc.temp_npc && self.npc.temp_npc.id != 0) {
			self.npc['npc_' + self.npc.temp_npc.id].region_id = self.npc.temp_npc.region_id;
			self.npc['npc_' + self.npc.temp_npc.id].region_num = self.npc.temp_npc.region_num ? self.npc.temp_npc.region_num : 1;
		};
		self.fight_data = user.fight_data;
		self.user_data.dmgi = self.user_data['var1408'];
		self.emit('auth');
	} else {
		self.emit('authError');
	};
};
Bot.prototype.callapi = function(method, params, cb) {
	var self = this;
	var m = self.methods[method];
	if (!m) return cb('error method', null);
	if (_.isString(params)) {
		setTimeout(function() {
			self.external.callApi(m.method, params)
		}, m.delay);
	} else {
		setTimeout(function() {
			self.external.callApi(m.method, JSON.stringify(params));
		}, m.delay);
	};
	cb && self.once('f' + method, function(res) {
		cb(null, res);
	});
};
Bot.prototype.levelUp = function(cb) {
	var self = this;
	if (self.user_data.exp >= self.levels[self.user_data.lvl + 1]) {
		self.callapi(31, {
			t: self.user_data.lvl + 1
		}, cb);
	} else {
		cb(null, 'ok');
	};
};
Bot.prototype.checkFriends = function(list) {
	var self = this;
	self.activeFriends = list.filter(function(f) {
		return f.l_time < 864000 && f.id != self.viewer_id;
	}).map(function(f) {
		return f.id;
	});
};
Bot.prototype.loadMap = function(params) {
	var self = this;
	var temp = {},
		my_map = {},
		map_data = self.map_data,
		user_data = self.user_data;

	map_data.list.forEach(function(m) {
		if (m.id == 1) {
			temp[m.id] = m;
			return;
		};
		if (m.id == 10) {
			temp[m.id] = m;
			return;
		};
		if (user_data['carma_' + (m.id - 1)] >= m.req_rep && user_data['car1_lvl'] >= m.req_car) {
			temp[m.id] = m;
		};
	});
	if (!(params && params['map2'] && params['map2'].list && params['map2'].list.length == 15)) {
		temp[10] = null;
	};
	for (var t in temp) {
		if (temp[t]) {
			my_map[t] = temp[t];
		};
	};
	self.my_map = map_data.list; //my_map;
};
Bot.prototype.jobReward = function(cb) {
	var self = this;

	function rewardOne(params, cb) {
		async.waterfall([

			function(next) {
				if (params.time_left > 0) {
					return cb(null, 'no time');
				};
				if (self.user_data.region_id != params.region_id) {
					self.callapi(25, {
						id: params.region_id,
						map_id: self.my_map[params.region_id].map
					}, next);
				} else {
					next(null, {
						res: 1,
						region_id: params.region_id
					});
				};
			},


			function(_0x3d9ex4, next) {
				if (_0x3d9ex4.res == 1) {
					self.user_data.region_id = _0x3d9ex4.id;
					next(null, 'region ' + params.region_id);
				} else {
					next('error region', null);
				};
			},


			function(_0x3d9ex17, next) {
				if (params.time_left > 0) {
					return cb(null, 'no time');
				};
				self.callapi(23, params, next);
			}
		], function(_0x3d9ex18, _0x3d9ex17) {
			cb(null, _0x3d9ex17);
		});
	};
	async.series(self.user_data.jobs.map(function(params) {
		return _.bind(rewardOne, this, params);
	}), function(_0x3d9ex18, _0x3d9exb) {
		cb(null);
	});
};
Bot.prototype.taskReward = function(cb) {
	var self = this;
	var _0x3d9ex19 = self.settings.task.locId;
	if (self.user_data.en < 3) {
		return cb(null, 'ok');
	};
	async.waterfall([

		function(next) {
			if (self.user_data.region_id != _0x3d9ex19) {
				self.callapi(25, {
					id: _0x3d9ex19,
					map_id: self.my_map[_0x3d9ex19].map
				}, next);
			} else {
				next(null, {
					res: 1,
					region_id: _0x3d9ex19
				});
			};
		},


		function(_0x3d9ex4, next) {
			if (_0x3d9ex4.res == 1) {
				self.user_data.region_id = _0x3d9ex4.id;
				next(null, 'region ' + _0x3d9ex19);
			} else {
				next('error region', null);
			};
		},


		function(_0x3d9ex17, next) {
			self.callapi(1, {
				region: _0x3d9ex19,
				num: 1
			}, next);
		},


		function(_0x3d9ex4, next) {
			var _0x3d9ex1a = {},
				_0x3d9ex13 = 0,
				_0x3d9ex1b = false;
			if (_0x3d9ex4.length > 0) {
				var _0x3d9ex1c = self.user_data.en;
				_0x3d9ex4.forEach(function(_0x3d9ex1d) {
					_0x3d9ex1a['t' + _0x3d9ex13] = 0;
					while (true) {
						if ((_0x3d9ex1a['t' + _0x3d9ex13] + _0x3d9ex1d.val) < _0x3d9ex1d.max_val && (_0x3d9ex1c - _0x3d9ex1d.req_en) >= 0) {
							_0x3d9ex1a['t' + _0x3d9ex13] = _0x3d9ex1a['t' + _0x3d9ex13] + 1;
							_0x3d9ex1c -= _0x3d9ex1d.req_en;
							_0x3d9ex1b = true;
						} else {
							break;
						};
					};
					_0x3d9ex13++;
				});
				if (_0x3d9ex1b) {
					return self.callapi(32, _0x3d9ex1a, next);
				};
				next(null, 'ok');
			};
		}
	], function(_0x3d9ex18, _0x3d9ex17) {
		cb(null, _0x3d9ex17);
	});
};
Bot.prototype.visitFriends = function(cb) {
	var self = this,
		_0x3d9ex1e = 0;
	var _0x3d9exc = _.sample(self.activeFriends, 20);

	function _0x3d9ex1f(_0x3d9ex18, cb) {
		var _0x3d9ex20 = _0x3d9exc[_0x3d9ex1e];
		_0x3d9ex1e++;
		async.waterfall([

			function(next) {
				self.callapi(39, {
					id: _0x3d9ex20
				}, next);
			},


			function(_0x3d9ex7, next) {
				if (_0x3d9ex7.l_time < 864000) {
					self.callapi(8, {
						id: _0x3d9ex20
					}, next);
				} else {
					next(null, {
						reward: {}
					});
				};
			},


			function(_0x3d9ex4, next) {
				if (_0x3d9ex4.reward) {
					next(null, _0x3d9ex4);
				} else {
					next('limit', _0x3d9ex4);
				};
			}
		], function(_0x3d9ex18, _0x3d9ex17) {
			cb(_0x3d9ex18, _0x3d9ex17);
		});
	};
	async.timesSeries(_0x3d9exc.length, _0x3d9ex1f, function(_0x3d9ex18, _0x3d9ex21) {
		cb(null);
	});
};
Bot.prototype.changeWeapon = function(_0x3d9ex18, cb) {
	var self = this;
	var _0x3d9ex22 = _.sample(_.where(self.user_data.items, function(_0x3d9ex13) {
		return (_0x3d9ex13.broken < 0 && (_0x3d9ex13.buyed == 1));
	}));
	if (_0x3d9ex22) {
		self.callapi(5, {
			weapon: _0x3d9ex22.id,
			torso: self.user_data.torso,
			hat: self.user_data.hat,
			pants: self.user_data.pants,
			armor: self.user_data.armor,
			stuff: self.user_data.stuff,
			boots: self.user_data.boots,
			gloves: self.user_data.gloves
		}, function(_0x3d9ex18, _0x3d9exa) {
			self.user_data.weapon = _0x3d9exa.weapon;
			self.emit('changeWeapon', _0x3d9exa.weapon);
			cb && cb(null, _0x3d9exa);
		});
	} else {
		cb && cb('no weapon', null);
		self.emit('allWeaponBroken', null);
	};
};
Bot.prototype.getFight = function(_0x3d9ex18, cb) {
	var self = this;
	if (self.user_data.weapon == 0) {
		return self.changeWeapon(null, cb);
	};
	if (self.fight_data && self.fight_data.active != 0) {
		self.once('endFight', function(_0x3d9ex17) {
			cb(null, _0x3d9ex17);
		});
		return self.syncFight();
	};
	setTimeout(function() {
		var _0x3d9ex23, _0x3d9ex24, _0x3d9ex25 = 0,
			_0x3d9ex26 = 0,
			fid = 0;
		var _0x3d9ex27 = _.filter(self.settings.npc, function(_0x3d9ex24) {
			if (_0x3d9ex24.create == true) {
				if (!self.npc['npc_' + _0x3d9ex24.id]) {
					return false;
				};
				if ((typeof _0x3d9ex24.createStartTime != 'undefined') && (typeof _0x3d9ex24.createEndTime != 'undefined')) {
					var _0x3d9ex28 = (new Date()).getHours();
					_0x3d9ex28 = (_0x3d9ex28 >= 24) ? _0x3d9ex28 - 24 : _0x3d9ex28;
					if (_0x3d9ex28 >= Number(_0x3d9ex24.createStartTime) && _0x3d9ex28 < Number(_0x3d9ex24.createEndTime)) {
						return true;
					} else {
						return false;
					};
				};
				return true;
			} else {
				return false;
			};
		});
		if (_0x3d9ex27.length) {
			_0x3d9ex23 = _0x3d9ex27[0].id;
			_0x3d9ex26 = _0x3d9ex27[0].clan ? self.user_data.clan_id : 0;
			_0x3d9ex24 = self.npc['npc_' + _0x3d9ex23];
		} else {
			var _0x3d9ex29 = self.friends_requests,
				_0x3d9ex2a = false;
			if (_0x3d9ex29 && _.size(_0x3d9ex29)) {
				var _0x3d9ex2b = _.max(_.filter(_0x3d9ex29, function(_0x3d9ex13) {
					if (_0x3d9ex13['v5'] != 0 && _0x3d9ex13['v5'] != self.user_data.clan_id) {
						return false;
					};
					if (!self.npc['npc_' + _0x3d9ex13['v2']]) {
						return false;
					};
					var _0x3d9ex2a = (_0x3d9ex13['d1'] >= 300);
					if (self.npc.temp_npc.id == _0x3d9ex13['v2']) {
						_0x3d9ex2a = false;
					};
					if (_0x3d9ex2a) {
						return false;
					};
					var _0x3d9ex2c = _.find(self.settings.npc, {
						id: _0x3d9ex13['v2']
					});
					if (!_0x3d9ex2c) {
						return false;
					};
					if (!_0x3d9ex2c.join) {
						return false;
					};
					if (_0x3d9ex2c.joinclan && _0x3d9ex13['v5'] != self.user_data.clan_id) {
						return false;
					};
					if ((typeof _0x3d9ex2c.joinStartTime != 'undefined') && (typeof _0x3d9ex2c.joinEndTime != 'undefined')) {
						var _0x3d9ex28 = (new Date()).getHours();
						_0x3d9ex28 = (_0x3d9ex28 >= 24) ? _0x3d9ex28 - 24 : _0x3d9ex28;
						if (_0x3d9ex28 >= Number(_0x3d9ex2c.joinStartTime) && _0x3d9ex28 < Number(_0x3d9ex2c.joinEndTime)) {
							return true;
						} else {
							return false;
						};
					};
					return true;
				}), 'd1');
			} else {
				return cb(null, 'next');
			};
			if (_0x3d9ex2b) {
				_0x3d9ex26 = _0x3d9ex2b['v5'];
				_0x3d9ex24 = self.npc['npc_' + _0x3d9ex2b['v2']];
				_0x3d9ex25 = _0x3d9ex2b.uid, fid = _0x3d9ex2b['v3'];
				self.friends_requests = _.reject(self.friends_requests, function(_0x3d9ex2d) {
					return _0x3d9ex2d.uid == _0x3d9ex2b.uid;
				});
				if (!_0x3d9ex24) {
					return cb(null, 'next');
				};
			} else {
				return cb(null, 'next');
			};
		};
		async.waterfall([

			function(next) {
				if ((self.user_data.region_id != _0x3d9ex24.region_id) && (_0x3d9ex25 == 0)) {
					self.callapi(25, {
						id: _0x3d9ex24.region_id,
						map_id: self.my_map[_0x3d9ex24.region_id].map
					}, next);
				} else {
					next(null, {
						res: 1,
						region_id: _0x3d9ex24.region_id
					});
				};
			},


			function(_0x3d9ex4, next) {
				if (_0x3d9ex4.res == 1) {
					self.user_data.region_id = _0x3d9ex4.id;
					next(null, _0x3d9ex4);
				} else {
					next('error region', null);
				};
			},


			function(_0x3d9exa, next) {
				self.callapi(10, {
					region_id: _0x3d9ex24.region_id,
					region_num: _0x3d9ex24.region_num,
					interfere: _0x3d9ex25,
					fid: fid,
					id: _0x3d9ex24.id,
					type: 1
				}, next);
			},


			function(_0x3d9ex4, next) {
				self.fight_data = _0x3d9ex4;
				var _0x3d9ex2a, _0x3d9ex2c = _.find(self.settings.npc, {
					id: _0x3d9ex24.id
				});
				if (_0x3d9ex2c.nolimit) {
					_0x3d9ex2a = (_0x3d9ex4['var3238'] >= 100);
				} else {
					_0x3d9ex2a = (_0x3d9ex4['var3238'] >= _0x3d9ex4['var3827']);
				};
				if (_0x3d9ex2a) {
					self.settings.npc = _.reject(self.settings.npc, function(_0x3d9ex2e) {
						return _0x3d9ex24.id == _0x3d9ex2e.id;
					});
					return next('limit', _0x3d9ex4);
				};
				self.callapi(11, {
					id: _0x3d9ex24.id,
					type: '1',
					interfere: _0x3d9ex25,
					fid: fid,
					is_friend: '0',
					clan_fight: _0x3d9ex26
				}, next);
			},


			function(_0x3d9ex4, next) {
				var invLog = (_0x3d9ex25 == 0) ? '' : (' по приглашению от id' + _0x3d9ex25);
				if (_0x3d9ex4.val == '1') {
					self.fight_data.fight_id = _0x3d9ex4.fight_id;
					self.fight_data.time = 1;
					self.fight_data.active = 2;
					self.fight_data.hp = _0x3d9ex4.hp;
					self.emit('startFight', 'Зашли в бой с ' + self.npc['npc_' + self.fight_data.id].name + invLog);
					if (_0x3d9ex4.hp >= 0) {
						var _0x3d9ex2c = _.find(self.settings.npc, {
							id: Number(self.fight_data.id)
						});
						if (_0x3d9ex2c && _0x3d9ex2c.callFriends) {
							self.callapi(29, '', next);
						} else {
							next(null, 'next');
						};
					};
				} else {
					next('error fight create', _0x3d9ex4);
				};
			},


			function(_0x3d9ex4, next) {
				self.emit('syncFightCb', {
					hp: self.fight_data.hp,
					my_hp: (self.user_data.endur + self.user_data.endur_items) * 15,
					result: 2
				});
				self.once('endFight', function() {
					next(null, _0x3d9ex4);
				});
			}
		], function(_0x3d9ex18, _0x3d9ex17) {
			cb(null, _0x3d9ex17);
		});
	}, 5000);
};
Bot.prototype.syncFight = function(_0x3d9ex2f, self0, self1) {
	var _0x3d9ex2f = _0x3d9ex2f ? _0x3d9ex2f : 0,
		self0 = self0 ? self0 : 0,
		self1 = self1 ? self1 : 0;
	this.callapi(12, {
		skill_0: _0x3d9ex2f,
		skill_1: 0,
		skill_2: 0,
		skill_3: 0,
		skill_4: 0,
		cons_1: 0,
		cons_2: 0,
		cons_3: 0,
		cons_4: 0,
		cons_5: 0,
		damage_done: self0,
		damage_get: self1,
		round: _0x3d9ex2f
	});
};
setTimeout(function() {
	$('#iframe_data_form').submit();
	return false;
}, _.random(1600000, 1800000));
if (friends.search(String(viewer_id)) == -1) {
	friends += (',' + viewer_id);
};
var Settings = {},
	Logs = [];
var settings = {
	viewer_id: viewer_id,
	auth_key: auth_key,
	friends: friends,
	access_token: access_token,
	url: swfsrc,
	npc: [],
	task: null,
	visit: false,
	rulet: false,
	jobs: false,
	run: false
};
(function(self4) {
	self4.fn.serializeWithChkBoxArray = function() {
		var self5 = self4(this).find('select').add(self4(this).find('input[type!=checkbox]')).serializeArray();
		self4(this).find('input[type=checkbox]').each(function() {
			self5.push({
				name: this.name,
				value: this.checked ? true : false
			});
		});
		return self5;
	};
	self4.fn.serializeWithChkBox = function() {
		var self5 = self4(this).find('select').add(self4(this).find('input[type!=checkbox]')).serialize();
		self4(this).find('input[type=checkbox]').each(function() {
			if (this.checked) {
				self5 += '&' + this.name + '=true';
			};
		});
		return self5;
	};
})(jQuery);
var botlog = function(_0x3d9exa) {
	Logs = Logs.slice(-500);
	Logs.push({
		d: _.now(),
		m: _0x3d9exa
	});
	var self7 = '';
	for (var _0x3d9ex13 = Logs.length - 1; _0x3d9ex13 >= 0; _0x3d9ex13--) {
		var self8 = Logs[_0x3d9ex13];
		self7 += (new Date(self8.d)).toLocaleString() + '   ' + self8.m + '\x0A';
	};
	$('#bot-log').html(self7);
	console.log(_0x3d9exa);
	br.storage.set(viewer_id + '_logs', Logs);
};
var settingsOnChange = function() {
	$('#save-settings').prop('disabled', false);
};
var saveBotSettings = function(selfb) {
	$('#save-settings').prop('disabled', true);
	var selfc = $('#settings-form').serializeWithChkBoxArray();
	var selfd = {
			npc: []
		},
		selfe = {};
	selfc.map(function(selff) {
		if (selff.name && selff.value) {
			if (selff.name.search('npc') == -1) {
				selfd[selff.name] = selff.value;
			} else {
				var _0x3d9ex20 = selff.name.replace(/\D/gi, '');
				var _0x3d9ex40 = selff.name.replace('npc' + _0x3d9ex20 + '-', '');
				if (!selfe[_0x3d9ex20]) {
					selfe[_0x3d9ex20] = {};
				};
				selfe[_0x3d9ex20][_0x3d9ex40] = selff.value;
			};
		};
	});
	for (var _0x3d9ex24 in selfe) {
		if (selfe[_0x3d9ex24].join || selfe[_0x3d9ex24].create) {
			var _0x3d9ex41 = {
				id: _0x3d9ex24
			};
			for (var _0x3d9ex42 in selfe[_0x3d9ex24]) {
				_0x3d9ex41[_0x3d9ex42] = selfe[_0x3d9ex24][_0x3d9ex42];
			};
			selfd.npc.push(_0x3d9ex41);
		};
	};
	if (selfd.task) {
		selfd.task = {
			locId: selfd.locId,
			flId: 1
		};
	};
	selfd.run = Settings.run;
	br.storage.set(viewer_id + '_settings', selfd);
	botlog('НАСТРОЙКИ ИЗМЕНЕНЫ');
	$('#iframe_data_form').submit();
	return false;
};
var resetBotSettings = function(selfb) {
	Settings = {};
	for (var _0x3d9ex42 in settings) {
		Settings[_0x3d9ex42] = Settings[_0x3d9ex42] ? Settings[_0x3d9ex42] : settings[_0x3d9ex42];
	};
	br.storage.set(viewer_id + '_settings', Settings);
	botlog('НАСТРОЙКИ ИЗМЕНЕНЫ');
	$('#iframe_data_form').submit();
	return false;
};
var changeStatus = function() {
	Settings.run = Settings.run ? false : true;
	br.storage.set(viewer_id + '_settings', Settings);
	botlog('БОТ ' + (Settings.run ? 'ЗАПУЩЕН' : 'ОСТАНОВЛЕН'));
	$('#iframe_data_form').submit();
	return false;
};

function Render(_0x3d9ex46, _0x3d9ex47, _0x3d9ex48, settings, _0x3d9ex49) {
	var _0x3d9ex4a = _.forEach(_0x3d9ex48, function(_0x3d9ex12) {
		_0x3d9ex12.npcs = _.filter(_0x3d9ex47, function(_0x3d9ex24) {
			if (_0x3d9ex24.dungeon_boss) {
				return false;
			};
			if (_0x3d9ex24.region_id == _0x3d9ex12.id) {
				return true;
			};
		});
		return _0x3d9ex12;
	});
	var _0x3d9ex4b = {},
		self7 = '';
	_.forEach(settings.npc, function(_0x3d9ex24) {
		_0x3d9ex4b[_0x3d9ex24.id] = _0x3d9ex24;
	});
	for (var _0x3d9ex13 = _0x3d9ex49.length - 1; _0x3d9ex13 >= 0; _0x3d9ex13--) {
		var self8 = _0x3d9ex49[_0x3d9ex13];
		self7 += (new Date(self8.d)).toLocaleString() + '   ' + self8.m + '\x0A';
	};
	$.get('/jade/invasionclient.jade', function(_0x3d9exa) {
		jade.render(_0x3d9exa, {
			udata: _0x3d9ex46,
			npcdata: _0x3d9ex4b,
			mapdata: _0x3d9ex48,
			settings: settings,
			data: JSON.stringify({
				viewer_id: viewer_id,
				auth_key: auth_key,
				friends: friends,
				version: version,
				access_token: access_token
			})
		}, function(_0x3d9ex18, _0x3d9exb) {
			$('#main').html(_0x3d9exb);
			$('#settings-form').bind('change', settingsOnChange);
			$('#bot-log').html(self7);
		});
	});
};
(function() {
	var _0x3d9ex4c = br.storage.get(viewer_id + '_settings');
	var _0x3d9ex4d = br.storage.get(viewer_id + '_logs');
	if (_0x3d9ex4c) {
		Settings = _0x3d9ex4c;
	};
	if (_0x3d9ex4d) {
		Logs = _0x3d9ex4d;
	};
	for (var _0x3d9ex42 in settings) {
		Settings[_0x3d9ex42] = Settings[_0x3d9ex42] ? Settings[_0x3d9ex42] : settings[_0x3d9ex42];
	};
	Settings.viewer_id = settings.viewer_id;
	Settings.url = settings.url;
	Settings.auth_key = settings.auth_key;
	Settings.friends = settings.friends;
	Settings.npc = Settings.npc.map(function(_0x3d9ex24) {
		for (var _0x3d9ex13 in _0x3d9ex24) {
			_0x3d9ex24[_0x3d9ex13] = Number(_0x3d9ex24[_0x3d9ex13]);
		};
		return _0x3d9ex24;
	});
})();
var _b = new Bot(Settings);

function cbCall(_0x3d9ex50, _0x3d9ex4) {
	var _0x3d9ex4 = _0x3d9ex4 ? JSON.parse(unescape(_0x3d9ex4)) : {};
	_b && _b.emit(_0x3d9ex50, _0x3d9ex4);
};

function message(_0x3d9ex52) {
	_b.lastMessage = _0x3d9ex52;
};
_b.auth();
_b.once('ready', function() {
	$('#main').html('<center><h4><i class="fa fa-refresh fa-spin"></i>&nbsp;&nbsp;Загрузка</h4></center>');
});
_b.once('authError', function() {
	var self = this;
	console.log('authError');
	setTimeout(function() {
		var _0x3d9ex53 = 'Ошибка авторизации в игре!';
		if (self.lastMessage) {
			_0x3d9ex53 = self.lastMessage;
		};
		$('#main').html('<center><h5>' + _0x3d9ex53 + '</h5></center>');
	}, 1000);
});
_b.once('auth', function() {
	var self = this;
	console.log('auth');
	async.auto({
		f65: _.bind(self.callapi, self, 65, undefined),
		f16: _.bind(self.callapi, self, 16, undefined),
		f2: _.bind(self.callapi, self, 2, undefined),
		f7: _.bind(self.callapi, self, 7, undefined)
	}, function(_0x3d9ex18, _0x3d9ex54) {
		self.checkFriends(_0x3d9ex54['f7']);
		self.loadMap(_0x3d9ex54['f65']);
		Render(self.user_data, self.npc, self.my_map, self.settings, Logs);
		if (!self.settings.run) {
			return;
		};
		var _0x3d9ex55 = [_.bind(self.levelUp, self)];
		if (self.settings.jobs) {
			_0x3d9ex55.push(_.bind(self.jobReward, self));
		};
		if (self.settings.visit) {
			_0x3d9ex55.push(_.bind(self.visitFriends, self));
		};
		if (self.settings.task && self.settings.task.locId) {
			_0x3d9ex55.push(_.bind(self.taskReward, self));
		};
		async.series(_.shuffle(_0x3d9ex55), function(_0x3d9ex18, _0x3d9ex54) {
			console.log('all jobs done');
			async.timesSeries(1000000, _.bind(self.getFight, self), function(_0x3d9ex18, _0x3d9ex21) {
				console.log('some error');
			});
		});
	});
});
_b.on('jobRewardCb', function(_0x3d9ex4) {
	if (_0x3d9ex4.got_reward) {
		botlog(_0x3d9ex4.name + '. Прибыль собрана');
	};
});
_b.on('syncTaskCb', function(_0x3d9ex4) {
	if (_0x3d9ex4.result == 1) {
		botlog('Миссии пройдены');
	};
});
_b.on('visitFriendCb', function(_0x3d9ex4) {
	if (_0x3d9ex4.reward) {
		botlog('Обыскали друга');
	};
});
_b.on('getInvitesCb', function(_0x3d9ex4) {
	this.friends_requests = _0x3d9ex4.friends_requests;
});
_b.on('systemError', function(_0x3d9ex4) {
	botlog('Системная ошибка. Перезапустите БОТ.');
});
_b.on('syncFightCb', function(_0x3d9ex4) {
	var _0x3d9ex56 = _0x3d9ex4;
	var self = this;
	self.fight_data.active = _0x3d9ex56.result;
	self.fight_data.hp = _0x3d9ex56.hp;
	for (var _0x3d9ex13 in _0x3d9ex4) {
		self.fight_data[_0x3d9ex13] = _0x3d9ex4[_0x3d9ex13];
	};
	if (_0x3d9ex56.broken == 1) {
		var _0x3d9ex57 = self.user_data.weapon;
		for (var _0x3d9ex13 in self.user_data.items) {
			if (self.user_data.items[_0x3d9ex13].id == _0x3d9ex57) {
				self.user_data.items[_0x3d9ex13].broken = 1;
			};
		};
		self.user_data.weapon = 0;
		self.emit('broken', _0x3d9ex57);
	};
	if (_0x3d9ex56.result == 1 || _0x3d9ex56.result == 3) {
		self.syncFight();
		self.fight_data.time = 0;
		self.fight_data.active = 0;
		return self.emit('endFight', _0x3d9ex4);
	};
	if (self.fight_data.active == 0) {
		return;
	};
	fightInfo();
	$('#fight-log').show();
	var _0x3d9ex24 = Math.floor(_0x3d9ex4.my_hp / self.fight_data.dmg);
	if (_0x3d9ex24 > 40) {
		_0x3d9ex24 = _.random(30, 40);
	};
	var self0 = [],
		_0x3d9ex58 = 0,
		_0x3d9ex59 = self.user_data.luck / 1800 + 0.4;
	for (var _0x3d9ex13 = 0; _0x3d9ex13 < _0x3d9ex24; _0x3d9ex13++) {
		self0.push(Math.random() < _0x3d9ex59 ? self.user_data.dmgi * 2 : self.user_data.dmgi);
	};
	for (var _0x3d9ex13 = 0; _0x3d9ex13 < _0x3d9ex24; _0x3d9ex13++) {
		_0x3d9ex58 += self0[_0x3d9ex13];
		if (_0x3d9ex4.hp < _0x3d9ex58) {
			_0x3d9ex24 = _0x3d9ex13 + 1;
			break;
		};
	};
	var _0x3d9ex5a = _.random(100, 300) * _0x3d9ex24;
	if (_0x3d9ex24 != 0) {
		return setTimeout(function() {
			self.syncFight(_0x3d9ex24, _0x3d9ex58, self.fight_data.dmg * _0x3d9ex24);
		}, _0x3d9ex5a);
	} else {
		return setTimeout(function() {
			self.syncFight();
		}, 40000);
	};
});
_b.on('callFriendsCb', function(_0x3d9ex4) {
	botlog('Выслали приглашение в бой');
});
_b.on('endFight', function() {
	botlog('Бой закончен');
	$('#fight-log').hide();
});
_b.on('broken', function() {
	botlog('Оружие сломано');
});
_b.on('changeWeapon', function() {
	botlog('Сменили оружие');
});
_b.on('allWeaponBroken', function() {
	botlog('Все доступное оружие сломано!');
});
_b.on('startFight', function(_0x3d9exa) {
	botlog(_0x3d9exa);
	fightInfo();
	$('#fight-log').show();
});
var fightInfo = function() {
	fd = _b.fight_data;
	var _0x3d9ex5c = Math.floor(fd.mhp / 300);
	var _0x3d9ex5d = _b.npc['npc_' + fd.id] ? _b.npc['npc_' + fd.id].name : fd.id;
	$('#fight-time').html('Время: ' + (new Date(2 * 60 * 60 * 1000 - (fd.time * 1000))).toUTCString().split(' ')[4]);
	var _0x3d9ex46 = '<tr><td><b>№</b></td><td><b>ID</b></td><td><b>Ник</b></td><td><b>Урон</b></td></tr>',
		_0x3d9ex13 = 0,
		_0x3d9ex5e = 0;
	fd.log = _.sortBy(fd.log, 'dd').reverse();
	fd.log.forEach(function(_0x3d9ex5f) {
		if (!_.isArray(_0x3d9ex5f)) {
			_0x3d9ex5e = _0x3d9ex5f.id == _b.viewer_id ? _0x3d9ex5f.dd : _0x3d9ex5e;
			_0x3d9ex46 += '<tr><td>' + (++_0x3d9ex13) + '</td><td><a target="_blank" href="http://vk.com/id' + _0x3d9ex5f.id + '">' + _0x3d9ex5f.id + '</a></td><td>' + _0x3d9ex5f.name + '</td><td style="color:' + (_0x3d9ex5f.dd > _0x3d9ex5c ? 'green' : 'red') + '">' + _0x3d9ex5f.dd + '</td></tr>';
		};
	});
	$('#fight-info').html(_0x3d9ex46);
	$('#fight-hp').html('<b>Ваш урон / норма: </b> ' + _0x3d9ex5e + ' / ' + _0x3d9ex5c);
	$('#fight-name').html(_0x3d9ex5d + ' (Здоровье: ' + fd.hp + ' / ' + fd.mhp + ')');
};
setInterval(function() {
	if (_b && _b.fight_data && _b.fight_data.active) {
		_b.fight_data.time = _b.fight_data.time + 1;
		$('#fight-time').html('Время: ' + (new Date(2 * 60 * 60 * 1000 - (_b.fight_data.time * 1000))).toUTCString().split(' ')[4]);
	};
}, 1000);