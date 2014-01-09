<script>
$(function(){
	$('#flipcountdownbox1').flipcountdown();
	$('#flipcountdownbox2').flipcountdown({showHour:false,showMinute:false,showSecond:true});
	$('#flipcountdownbox3').flipcountdown({tzoneOffset:3,showSecond:false});
	$('#flipcountdownbox4').flipcountdown({am:true});
	$('#flipcountdownbox5').flipcountdown({speedFlip:30});
	$('#flipcountdownbox6').flipcountdown({time:function(){
		return new Date('5/10/2012 12:34:23');
	}});
})
</script>
<header>
	<h1>jquery.flipCountDown Plugin <small>jQuery plugin flip count down timer,clock or counter</small></h1>
	<p>Unusual retro clock count down plugin for jQuery <a href="https://github.com/xdan/flipcountdown/">Source</a> or <a href="https://github.com/xdan/flipcountdown/archive/master.zip">Download</a></p>
</header>
<hr>
<h2>Until the new year left</h2>
<table id="until_the_new_year_left" style="border:0px;">
	<tr>
		<td style="width:110px;text-align:center;"><strong>Days</strong></td>
		<td style="width:120px;text-align:center;"><strong>Hours</strong></td>
		<td style="width:110px;text-align:center;"><strong>Minutes</strong></td>
		<td style="width:130px;text-align:center;"><strong>Seconds</strong></td>
	</tr>
	<tr>
		<td colspan="4"><span id="new_year"></span></td>
	</tr>
</table>
<script>
$(function(){
	var NY = Math.round((new Date('1/01/2015 00:00:01')).getTime()/1000);
	$('#new_year').flipcountdown({	
		size:'lg',
		tick:function(){
			var nol = function(h){
				return h>9?h:'0'+h;
			}
			var	range  	= NY-Math.round((new Date()).getTime()/1000),
				secday = 86400, sechour = 3600,
				days 	= parseInt(range/secday),
				hours	= parseInt((range%secday)/sechour),
				min		= parseInt(((range%secday)%sechour)/60),
				sec		= ((range%secday)%sechour)%60;
			return nol(days)+' '+nol(hours)+' '+nol(min)+' '+nol(sec);
		}
	});
});
</script>
<h2>Fast start</h2>
<p>Add in html page</p><pre><code data-language="html">&lt;script type=&quot;text/javascript&quot; src=&quot;jquery.min.js&quot;&gt;&lt;/script&gt;
&lt;script type=&quot;text/javascript&quot; src=&quot;jquery.flipcountdown.js&quot;&gt;&lt;/script&gt;
&lt;link rel=&quot;stylesheet&quot; type=&quot;text/css&quot; href=&quot;jquery.flipcountdown.css&quot; /&gt;</code></pre>
	<p>add div element</p>
<pre><code data-language="html">&lt;div id=&quot;flipcountdownbox1&quot;&gt;&lt;/div&gt;</code></pre>
	<p>and init flipcountdown</p>
	<pre><code data-language="javascript">$(function(){
	$('#flipcountdownbox1').flipcountdown();
})</code></pre>
<p>Result</p>
<div id="flipcountdownbox1"></div>
<h2>Settings</h2>
<hr>
<p>- Sizes (use bootstrap sizes notation)</p>
<pre><code data-language="javascript">$(&quot;#flipcountdownbox1&quot;).flipcountdown({
	size:&quot;lg&quot;
});</code></pre>
<div><strong>lg</strong>-large</div>
<div id="flipcountdownbox_lg"></div>
<div><strong>md</strong>-middle, default</div>
<div id="flipcountdownbox_md"></div>
<div><strong>sm</strong>-small</div>
<div id="flipcountdownbox_sm"></div>
<div><strong>xs</strong>-Extra small</div>
<div id="flipcountdownbox_xs"></div>
<script>
$(function(){
	$('#flipcountdownbox_lg').flipcountdown({size:'lg'});
	$('#flipcountdownbox_md').flipcountdown({size:'md'});
	$('#flipcountdownbox_sm').flipcountdown({size:'sm'});
	$('#flipcountdownbox_xs').flipcountdown({size:'xs'});
})
</script>
<hr>
<p>- Hide second or minute or hour</p>
<pre><code data-language="javascript">$(&quot;#flipcountdownbox1&quot;).flipcountdown({
	showHour:false,
	showMinute:false,
	showSecond:true
});</code></pre>
<div id="flipcountdownbox2"></div>
<hr>
<p>- offset timezone</p>
<pre><code data-language="javascript">$(&quot;#flipcountdownbox3&quot;).flipcountdown({
	tzoneOffset:3,
	showSecond:false
});</code></pre>
<div id="flipcountdownbox3"></div>
<hr>
<p>- 12 format hours</p>
<pre><code data-language="javascript">$(&quot;#flipcountdownbox4&quot;).flipcountdown({am:true});</code></pre>
<div id="flipcountdownbox4"></div>
<hr>
<p>- speed animate flip digit (multiply 6 must by less than 1000) default 60</p>
<pre><code data-language="javascript">$(&quot;#flipcountdownbox5&quot;).flipcountdown({speedFlip:30});</code></pre>
<div id="flipcountdownbox5"></div>
<hr>
<p>- set time</p>
<pre><code data-language="javascript">$('#flipcountdownbox6').flipcountdown({tick:function(){
	return new Date('5.10.2012 12:34:23');
}});</code></pre>
<div id="flipcountdownbox6"></div>
<hr>
<p>- Counter</p>
<pre><code data-language="javascript">$(function(){
	var i = 1;
	$(&#39;#retroclockbox_counter&#39;).flipcountdown({
		tick:function(){
			return i++;
		}
	});
})</code></pre>
<div id="retroclockbox_counter"></div>
<script>
$(function(){
	var i = 1;
	$('#retroclockbox_counter').flipcountdown({
		tick:function(){
			return i++;
		}
	});
})
</script>
<hr>
<p>- Float</p>
<pre><code data-language="javascript">$(&#39;#retroclockbox_float&#39;).flipcountdown({size:&#39;lg&#39;,tick:22.3434});</code></pre>
<div id="retroclockbox_float"></div>
<script>
$(function(){
	$('#retroclockbox_float').flipcountdown({size:'lg',tick:22.3434});
});
</script>

<hr>
<p> - Until The New Year Example</p>
<pre><code data-language="javascript">$(function(){
 var NY = Math.round((new Date(&#39;1/01/2015 00:00:01&#39;)).getTime()/1000);
 $(&#39;#new_year&#39;).flipcountdown({	
	size:&#39;lg&#39;,
	tick:function(){
		var nol = function(h){
			return h>9?h:&#39;0&#39;+h;
		}
		var	range  	= 	NY-Math.round((new Date()).getTime()/1000),
			secday	= 	86400, sechour = 3600,
			days	= 	parseInt(range/secday),
			hours	= 	parseInt((range%secday)/sechour),
			min	= 	parseInt(((range%secday)%sechour)/60),
			sec	= 	((range%secday)%sechour)%60;
		return nol(days)+&#39; &#39;+nol(hours)+&#39; &#39;+nol(min)+&#39; &#39;+nol(sec);
	}
 });
});</code></pre>

<a href="#until_the_new_year_left">The result on the top of the page</a>