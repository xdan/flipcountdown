/** 
 * @preserve jQuery flipcountdown plugin v2.0.0
 * @homepage http://xdsoft.net/jqplugins/flipcountdown/
 * (c) 2013, Chupurnov Valeriy.
 */
(function($){
jQuery.fn.flipCountDown = jQuery.fn.flipcountdown = function( _options ){
	var default_options = {
			showHour:true,
			showMinute:true,
			showSecond:true,
			am:false,
			showMinute:true,
			showSecond:true,
			am:false,
			tzoneOffset:0,
			speedFlip:100,
			time:function(){
				return new Date();
			},
			size:'md'
		},
		sizes = {
			lg:77,
			md:52,
			sm:35,
			xs:24
		}, 
		div = function(val, by){
			return (val - val % by) / by;
		}
		
		createFlipCountDown = function( $box ){
			var flipcountdown 		= $('<div class="xdsoft_flipcountdown"></div>'),
				hourBoxLeft 	= $('<div class="xdsoft_digit"></div>'),
				hourBoxRight 	= $('<div class="xdsoft_digit"></div>'),
				
				minuteBoxLeft 	= $('<div class="xdsoft_digit"></div>'),
				minuteBoxRight 	= $('<div class="xdsoft_digit"></div>'),
				
				secondBoxLeft 	= $('<div class="xdsoft_digit"></div>'),
				secondBoxRight 	= $('<div class="xdsoft_digit"></div>'),
				
				separator1 		= $('<div class="xdsoft_digit xdsoft_separator"></div>'),
				separator2 		= $('<div class="xdsoft_digit xdsoft_separator"></div>'),
				
				options = $.extend({},default_options),
				
				timer = 0,
				
				heightDigit = 77,
				
				current = {
					"h1": -1,
					"h2": -1,
					"m1": -1,
					"m2": -1,
					"s1": -1,
					"s2": -1
				},
				
				_getmt =  function ( up ){
					return (-(((up)?up-1:9)*6-1)*heightDigit);
				},
				
				_setMargin = function( box, mt, rec){
					if( rec==1 )
						box.css('background-position-y',mt+'px');
					box.css('background-position-y',(mt-heightDigit)+'px' );
					if( rec<6 )
						setTimeout(function(){
							_setMargin(box,mt-heightDigit,++rec);	
						},options.speedFlip);
				},
				
				_calcTime = function(){
					var now = options.time(),
						h = (now.getHours()+options.tzoneOffset)%(options.am?12:24),
						h1 = div(h,10),
						h2 = h%10,
						m1 = div(now.getMinutes() , 10),
						m2 = now.getMinutes() % 10,
						s1 = div(now.getSeconds() , 10),
						s2 = now.getSeconds() % 10;
					
					if( options.showHour && h2 != current.h2 ){
						_setMargin(hourBoxRight,_getmt(h2),1);
						current.h2 = h2;
					}
					if( options.showHour && h1 != current.h1 ){
						_setMargin(hourBoxLeft,_getmt(h1),1);
						current.h1 = h1;
					}
					if( options.showMinute && m2 != current.m2 ){
						_setMargin(minuteBoxRight,_getmt(m2),1);
						current.m2 = m2;
					}
					if( options.showMinute && m1 != current.m1 ){
						_setMargin(minuteBoxLeft,_getmt(m1),1);
						current.m1 = m1;
					}
					
					if ( options.showSecond && s2 != current.s2 ){
						_setMargin(secondBoxRight,_getmt(s2),1);
						current.s2 = s2;
					}
					if ( options.showSecond && s1 != current.s1 ){
						_setMargin(secondBoxLeft,_getmt(s1),1);
						current.s1 = s1;
					}
				};
				
			flipcountdown
				.append(hourBoxLeft)
				.append(hourBoxRight)
				.append(separator1)
				.append(minuteBoxLeft)
				.append(minuteBoxRight)
				.append(separator2)
				.append(secondBoxLeft)
				.append(secondBoxRight)
				.append('<div class="xdsoft_clearex"></div>')
				
				.on('xdinit.xdsoft',function(){
					if( !(options.showHour || options.showMinute || options.showSecond) )
						options.showHour = options.showMinute = options.showSecond = true;
						
					flipcountdown
						.find('.xdsoft_digit,.xdsoft_separator')
							.hide();
					
					if( options.showHour ){
						hourBoxLeft.show();
						hourBoxRight.show();
					}
							
					if( options.showHour && (options.showMinute || options.showSecond) )
						separator1.show();
					
					if( options.showMinute ){
						minuteBoxLeft.show();
						minuteBoxRight.show();
					}
					
					if( options.showMinute && options.showSecond )
						separator2.show();
					
					if( options.showSecond ){
						secondBoxLeft.show();
						secondBoxRight.show();
					}
					
					clearInterval(timer);
					
					timer = setInterval(_calcTime,1000);
					
					_calcTime();
				});
				
			$box.setOptions = function( _options ){
				options = $.extend({},options,_options);
				if( !sizes[options.size] )
					options.size = 'lg';
				heightDigit = sizes[options.size];
				flipcountdown
					.addClass('xdsoft_size_'+options.size)
					.trigger('xdinit.xdsoft');
			};
			$box.append(flipcountdown);
		};	
	return this.each(function(){
		var $box = $(this);
		if( !$box.hasClass('xdsoft') ){
			$box.addClass('xdsoft')
			createFlipCountDown($box);
		}
		$box.setOptions(_options);
	});
}
})(jQuery);