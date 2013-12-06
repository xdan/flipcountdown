/*
	Script: jQuery.xdretroclock.js
	Plug-in for jQuery retro clock
*/

/*
	Author:
		Valeriy Chupurnov <leroy@xdan.ru>, <http://xdan.ru>
	License:
		LGPL - Lesser General Public License

	Posted <http://xdan.ru/project/xdretroclock/index.html>
*/
(function($){
jQuery.fn.xdRetroClock = jQuery.fn.xdretroclock = function(options){
	var settings = {
		digitImages: 6,
		digitWidth: 53,
		digitHeight: 77,
		showHour:true,
		showMinute:true,
		showSecond:true,
		am:false,
		tzoneOffset:0,
		speedFlip:100,
		time:function(){
			return new Date();
		},
	};
	var getmt =  function (up){
		return (-(((up)?up-1:9)*options.digitImages-1)*options.digitHeight);
	}
	var div = function(val, by){
		return (val - val % by) / by;
	}
	var current = {
		"h1": -1,
		"h2": -1,
		"m1": -1,
		"m2": -1,
		"s1": -1,
		"s2": -1
	};
	options = $.extend(settings,options);
	var setmargin = function($box, mt, rec){
		if( rec==1 )$box.css('margin-top',mt+'px');
		$box.css('margin-top',(mt-options.digitHeight)+'px' );
		if( rec<options.digitImages )
			setTimeout(function(){
				setmargin($box,mt-options.digitHeight,++rec);	
			},options.speedFlip);
	}

	var calcTime = function($box){
		var now = options.time();
		var	h = (now.getHours()+options.tzoneOffset)%(options.am?12:24),
		h1 = div(h,10),
		h2 = h%10,
		m1 = div(now.getMinutes() , 10),
		m2 = now.getMinutes() % 10,
		s1 = div(now.getSeconds() , 10),
		s2 = now.getSeconds() % 10;
		if( options.showHour && h2 != current.h2 ){
			setmargin($box.find('.hourRight div'),getmt(h2),1);
			current.h2 = h2;
		}
		if( options.showHour && h1 != current.h1){
			setmargin($box.find('.hourLeft div'),getmt(h1),1);
			current.h1 = h1;
		}
		if( options.showMinute && m2 != current.m2){
			setmargin($box.find('.minuteRight div'),getmt(m2),1);
			current.m2 = m2;
		}
		if( options.showMinute && m1 != current.m1){
			setmargin($box.find('.minuteLeft div'),getmt(m1),1);
			current.m1 = m1;
		}
		
	    if ( options.showSecond && s2 != current.s2){
			setmargin($box.find('.secondRight div'),getmt(s2),1);
			current.s2 = s2;
		}
		if ( options.showSecond && s1 != current.s1){
			setmargin($box.find('.secondLeft div'),getmt(s1),1);
			current.s1 = s1;
		}
	}
	return this.each(function(){
		var $box = $(this);
		$box.addClass('retroclock')
		if( options.showHour )
			$box.append('<div class="xddigit hourLeft"><div></div></div>')
				.append('<di  class="xddigit hourRight"><div></div></div>');
		if( options.showHour && (options.showMinute || options.showSecond) )
			$box.append('<div class="rcSeparator">:</div>');
		if( options.showMinute )
			$box.append('<div class="xddigit minuteLeft"><div></div></div>')
				.append('<div class="xddigit minuteRight"><div></div></div>');
		if( options.showMinute && options.showSecond )
			$box.append('<div class="rcSeparator">:</div>');
		if( options.showSecond )
			$box.append('<div class="xddigit secondLeft"><div></div></div>')
				.append('<div class="xddigit secondRight"><div></div></div>');
		if( options.showHour || options.showMinute || options.showSecond )
			$box.append('<div style="clear:both;float:none;"></div>');
		setInterval(function(){
			calcTime($box);
		},1000)
		calcTime($box);
	});
}
})(jQuery);