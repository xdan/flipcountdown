<script>
$(function(){
	$('#flipcountdownbox1').flipcountdown();
	$('#flipcountdownbox2').flipcountdown({showHour:false,showMinute:false,showSecond:true});
	$('#flipcountdownbox3').flipcountdown({tzoneOffset:3,showSecond:false});
	$('#flipcountdownbox4').flipcountdown({am:true});
	$('#flipcountdownbox5').flipcountdown({speedFlip:50});
	$('#flipcountdownbox6').flipcountdown({time:function(){
		return new Date('5/10/2012 12:34:23');
	}});
})
</script>
<header>
	<h1>jquery.flipCountDown Plugin <small>jQuery plugin flip count down timer or clock</small></h1>
	<p>Unusual retro clock count down plugin for jQuery <a href="https://github.com/xdan/flipcountdown/">Source</a> or <a href="https://github.com/xdan/flipcountdown/archive/master.zip">Download</a></p>
</header>
<h2>Fast start</h2>
<p>Add in html page</p><pre><code data-language="javascript">&lt;script type=&quot;text/javascript&quot; src=&quot;jquery.min.js&quot;&gt;&lt;/script&gt;
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
<pre >$(function(){
	$(&quot;#flipcountdownbox1&quot;).flipcountdown({
		size:&quot;lg&quot;
	});
})</pre>
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
<pre><code data-language="javascript">$(function(){
	$('#flipcountdownbox1').flipcountdown({
		showHour:false,
		showMinute:false,
		showSecond:true
	});
})</code></pre>
<div id="flipcountdownbox2"></div>
<hr>
<p>- offset timezone</p>
<pre><code data-language="javascript">$(function(){
	$('#flipcountdownbox3').flipcountdown({
		tzoneOffset:3,
		showSecond:false
	});
})</code></pre>
<div id="flipcountdownbox3"></div>
<hr>
<p>- 12 format hours</p>
<pre><code data-language="javascript">$(function(){
	$('#flipcountdownbox4').flipcountdown({am:true});
})</code></pre>
<div id="flipcountdownbox4"></div>
<hr>
<p>- speed animate flip digit (multiply 6 must by less than 1000) default 100</p>
<pre><code data-language="javascript">$(function(){
	$('#flipcountdownbox5').flipcountdown({speedFlip:50});
})</code></pre>
<div id="flipcountdownbox5"></div>
<p>- set time</p>
<pre><code data-language="javascript">function(){
	$('#flipcountdownbox6').flipcountdown({time:function(){
		return new Date('5.10.2012 12:34:23');
	}});
})</code></pre>
<div id="flipcountdownbox6"></div>
