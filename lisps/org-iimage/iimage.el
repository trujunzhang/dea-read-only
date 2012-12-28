<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US">
<!-- git web interface version 1.6.5.GIT, (C) 2005-2006, Kay Sievers <kay.sievers@vrfy.org>, Christian Gierke -->
<!-- git core binaries version 1.6.5.GIT -->
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
<meta name="generator" content="gitweb/1.6.5.GIT git/1.6.5.GIT"/>
<meta name="robots" content="index, nofollow"/>
<title>Public Git Hosting - emacs.git/blob - lisp/iimage.el</title>
<script type="text/javascript">/* <![CDATA[ */
function fixBlameLinks() {
	var allLinks = document.getElementsByTagName("a");
	for (var i = 0; i < allLinks.length; i++) {
		var link = allLinks.item(i);
		if (link.className == 'blamelink')
			link.href = link.href.replace("/blame/", "/blame_incremental/");
	}
}
/* ]]> */</script>
<base href="http://repo.or.cz/w" />
<link rel="stylesheet" type="text/css" href="http://repo.or.cz/gitweb.css"/>
<link rel="alternate" title="emacs.git - history of lisp/iimage.el - RSS feed" href="http://repo.or.cz/w/emacs.git/rss?f=lisp/iimage.el" type="application/rss+xml" />
<link rel="alternate" title="emacs.git - history of lisp/iimage.el - RSS feed (no merges)" href="http://repo.or.cz/w/emacs.git/rss?f=lisp/iimage.el;opt=--no-merges" type="application/rss+xml" />
<link rel="alternate" title="emacs.git - history of lisp/iimage.el - Atom feed" href="http://repo.or.cz/w/emacs.git/atom?f=lisp/iimage.el;opt=--no-merges" type="application/atom+xml" />
<link rel="alternate" title="emacs.git - history of lisp/iimage.el - Atom feed (no merges)" href="http://repo.or.cz/w/emacs.git/atom?f=lisp/iimage.el;opt=--no-merges" type="application/atom+xml" />
<link rel="shortcut icon" href="http://repo.or.cz/git-favicon.png" type="image/png" />
<script src="http://repo.or.cz/gitweb.js" type="text/javascript"></script>
</head>
<body>
<div class="page_header">
<a title="git homepage" href="http://git-scm.com/"><img src="http://repo.or.cz/git-logo.png" width="72" height="27" alt="git" class="logo"/></a><a href="http://repo.or.cz/w">repo.or.cz</a> / <a href="http://repo.or.cz/w/emacs.git">emacs.git</a> / blob
</div>
<form method="get" action="http://repo.or.cz/w/emacs.git" enctype="application/x-www-form-urlencoded">
<div class="search">
<input name="a" type="hidden" value="search" />
<input name="h" type="hidden" value="HEAD" />
<select name="st" >
<option selected="selected" value="commit">commit</option>
<option value="grep">grep</option>
<option value="author">author</option>
<option value="committer">committer</option>
<option value="pickaxe">pickaxe</option>
</select><sup><a href="http://repo.or.cz/w/emacs.git/search_help">?</a></sup> search:
<input type="text" name="s"  />
<span title="Extended regular expression"><label><input type="checkbox" name="sr" value="1" />re</label></span></div>
</form>
<div class="page_nav">
<a href="http://repo.or.cz/w/emacs.git">summary</a> | <a href="http://repo.or.cz/w/emacs.git/shortlog">log</a> | <a href="http://repo.or.cz/git-browser/by-commit.html?r=emacs.git">graphiclog</a> | <a href="http://repo.or.cz/w/emacs.git/commit/HEAD">commit</a> | <a href="http://repo.or.cz/w/emacs.git/commitdiff/HEAD">commitdiff</a> | <a href="http://repo.or.cz/w/emacs.git/tree/HEAD">tree</a> | <a href="http://repo.or.cz/editproj.cgi?name=emacs.git">edit</a> | <a href="http://repo.or.cz/regproj.cgi?fork=emacs.git">fork</a><br/>
<a href="http://repo.or.cz/w/emacs.git/blame/HEAD:/lisp/iimage.el">blame</a> | <a href="http://repo.or.cz/w/emacs.git/history/HEAD:/lisp/iimage.el">history</a> | <a href="http://repo.or.cz/w/emacs.git/blob_plain/HEAD:/lisp/iimage.el">raw</a> | <a href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el">HEAD</a><br/>
</div>
<div class="header">
<a class="title" href="http://repo.or.cz/w/emacs.git/commit/HEAD">epg: Support pinentry-curses</a>
</div>
<div class="page_path"><a title="tree root" href="http://repo.or.cz/w/emacs.git/tree/HEAD">[emacs.git]</a> / <a title="lisp" href="http://repo.or.cz/w/emacs.git/tree/HEAD:/lisp">lisp</a> / <a title="lisp/iimage.el" href="http://repo.or.cz/w/emacs.git/blob_plain/HEAD:/lisp/iimage.el">iimage.el</a><br/></div>
<div class="page_body">
<div class="pre"><a id="l1" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l1" class="linenr">   1</a> ;;;&nbsp;iimage.el&nbsp;---&nbsp;Inline&nbsp;image&nbsp;minor&nbsp;mode.</div>
<div class="pre"><a id="l2" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l2" class="linenr">   2</a> </div>
<div class="pre"><a id="l3" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l3" class="linenr">   3</a> ;;&nbsp;Copyright&nbsp;(C)&nbsp;2004-2012&nbsp;&nbsp;Free&nbsp;Software&nbsp;Foundation,&nbsp;Inc.</div>
<div class="pre"><a id="l4" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l4" class="linenr">   4</a> </div>
<div class="pre"><a id="l5" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l5" class="linenr">   5</a> ;;&nbsp;Author:&nbsp;KOSEKI&nbsp;Yoshinori&nbsp;&lt;kose@meadowy.org&gt;</div>
<div class="pre"><a id="l6" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l6" class="linenr">   6</a> ;;&nbsp;Maintainer:&nbsp;KOSEKI&nbsp;Yoshinori&nbsp;&lt;kose@meadowy.org&gt;</div>
<div class="pre"><a id="l7" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l7" class="linenr">   7</a> ;;&nbsp;Keywords:&nbsp;multimedia</div>
<div class="pre"><a id="l8" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l8" class="linenr">   8</a> </div>
<div class="pre"><a id="l9" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l9" class="linenr">   9</a> ;;&nbsp;This&nbsp;file&nbsp;is&nbsp;part&nbsp;of&nbsp;GNU&nbsp;Emacs.</div>
<div class="pre"><a id="l10" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l10" class="linenr">  10</a> </div>
<div class="pre"><a id="l11" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l11" class="linenr">  11</a> ;;&nbsp;GNU&nbsp;Emacs&nbsp;is&nbsp;free&nbsp;software:&nbsp;you&nbsp;can&nbsp;redistribute&nbsp;it&nbsp;and/or&nbsp;modify</div>
<div class="pre"><a id="l12" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l12" class="linenr">  12</a> ;;&nbsp;it&nbsp;under&nbsp;the&nbsp;terms&nbsp;of&nbsp;the&nbsp;GNU&nbsp;General&nbsp;Public&nbsp;License&nbsp;as&nbsp;published&nbsp;by</div>
<div class="pre"><a id="l13" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l13" class="linenr">  13</a> ;;&nbsp;the&nbsp;Free&nbsp;Software&nbsp;Foundation,&nbsp;either&nbsp;version&nbsp;3&nbsp;of&nbsp;the&nbsp;License,&nbsp;or</div>
<div class="pre"><a id="l14" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l14" class="linenr">  14</a> ;;&nbsp;(at&nbsp;your&nbsp;option)&nbsp;any&nbsp;later&nbsp;version.</div>
<div class="pre"><a id="l15" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l15" class="linenr">  15</a> </div>
<div class="pre"><a id="l16" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l16" class="linenr">  16</a> ;;&nbsp;GNU&nbsp;Emacs&nbsp;is&nbsp;distributed&nbsp;in&nbsp;the&nbsp;hope&nbsp;that&nbsp;it&nbsp;will&nbsp;be&nbsp;useful,</div>
<div class="pre"><a id="l17" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l17" class="linenr">  17</a> ;;&nbsp;but&nbsp;WITHOUT&nbsp;ANY&nbsp;WARRANTY;&nbsp;without&nbsp;even&nbsp;the&nbsp;implied&nbsp;warranty&nbsp;of</div>
<div class="pre"><a id="l18" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l18" class="linenr">  18</a> ;;&nbsp;MERCHANTABILITY&nbsp;or&nbsp;FITNESS&nbsp;FOR&nbsp;A&nbsp;PARTICULAR&nbsp;PURPOSE.&nbsp;&nbsp;See&nbsp;the</div>
<div class="pre"><a id="l19" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l19" class="linenr">  19</a> ;;&nbsp;GNU&nbsp;General&nbsp;Public&nbsp;License&nbsp;for&nbsp;more&nbsp;details.</div>
<div class="pre"><a id="l20" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l20" class="linenr">  20</a> </div>
<div class="pre"><a id="l21" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l21" class="linenr">  21</a> ;;&nbsp;You&nbsp;should&nbsp;have&nbsp;received&nbsp;a&nbsp;copy&nbsp;of&nbsp;the&nbsp;GNU&nbsp;General&nbsp;Public&nbsp;License</div>
<div class="pre"><a id="l22" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l22" class="linenr">  22</a> ;;&nbsp;along&nbsp;with&nbsp;GNU&nbsp;Emacs.&nbsp;&nbsp;If&nbsp;not,&nbsp;see&nbsp;&lt;http://www.gnu.org/licenses/&gt;.</div>
<div class="pre"><a id="l23" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l23" class="linenr">  23</a> </div>
<div class="pre"><a id="l24" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l24" class="linenr">  24</a> ;;;&nbsp;Commentary:</div>
<div class="pre"><a id="l25" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l25" class="linenr">  25</a> </div>
<div class="pre"><a id="l26" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l26" class="linenr">  26</a> ;;&nbsp;Iimage&nbsp;is&nbsp;a&nbsp;minor&nbsp;mode&nbsp;that&nbsp;displays&nbsp;images,&nbsp;when&nbsp;image-filename</div>
<div class="pre"><a id="l27" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l27" class="linenr">  27</a> ;;&nbsp;exists&nbsp;in&nbsp;the&nbsp;buffer.</div>
<div class="pre"><a id="l28" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l28" class="linenr">  28</a> ;;&nbsp;http://www.netlaputa.ne.jp/~kose/Emacs/iimage.html</div>
<div class="pre"><a id="l29" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l29" class="linenr">  29</a> ;;</div>
<div class="pre"><a id="l30" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l30" class="linenr">  30</a> ;;&nbsp;**&nbsp;Display&nbsp;images&nbsp;in&nbsp;*Info*&nbsp;buffer.</div>
<div class="pre"><a id="l31" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l31" class="linenr">  31</a> ;;</div>
<div class="pre"><a id="l32" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l32" class="linenr">  32</a> ;;&nbsp;(add-hook&nbsp;'info-mode-hook&nbsp;'iimage-mode)</div>
<div class="pre"><a id="l33" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l33" class="linenr">  33</a> ;;</div>
<div class="pre"><a id="l34" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l34" class="linenr">  34</a> ;;&nbsp;.texinfo:&nbsp;&nbsp;&nbsp;@file{file://foo.png}</div>
<div class="pre"><a id="l35" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l35" class="linenr">  35</a> ;;&nbsp;.info:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`file://foo.png'</div>
<div class="pre"><a id="l36" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l36" class="linenr">  36</a> ;;</div>
<div class="pre"><a id="l37" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l37" class="linenr">  37</a> ;;&nbsp;**&nbsp;Display&nbsp;images&nbsp;in&nbsp;Wiki&nbsp;buffer.</div>
<div class="pre"><a id="l38" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l38" class="linenr">  38</a> ;;</div>
<div class="pre"><a id="l39" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l39" class="linenr">  39</a> ;;&nbsp;(add-hook&nbsp;'wiki-mode-hook&nbsp;'iimage-mode)</div>
<div class="pre"><a id="l40" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l40" class="linenr">  40</a> ;;</div>
<div class="pre"><a id="l41" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l41" class="linenr">  41</a> ;;&nbsp;wiki-file:&nbsp;&nbsp;&nbsp;[[foo.png]]</div>
<div class="pre"><a id="l42" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l42" class="linenr">  42</a> </div>
<div class="pre"><a id="l43" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l43" class="linenr">  43</a> ;;;&nbsp;Code:</div>
<div class="pre"><a id="l44" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l44" class="linenr">  44</a> </div>
<div class="pre"><a id="l45" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l45" class="linenr">  45</a> (eval-when-compile</div>
<div class="pre"><a id="l46" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l46" class="linenr">  46</a> &nbsp;&nbsp;(require&nbsp;'image-file))</div>
<div class="pre"><a id="l47" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l47" class="linenr">  47</a> </div>
<div class="pre"><a id="l48" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l48" class="linenr">  48</a> (defgroup&nbsp;iimage&nbsp;nil</div>
<div class="pre"><a id="l49" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l49" class="linenr">  49</a> &nbsp;&nbsp;&quot;Support&nbsp;for&nbsp;inline&nbsp;images.&quot;</div>
<div class="pre"><a id="l50" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l50" class="linenr">  50</a> &nbsp;&nbsp;:version&nbsp;&quot;22.1&quot;</div>
<div class="pre"><a id="l51" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l51" class="linenr">  51</a> &nbsp;&nbsp;:group&nbsp;'image)</div>
<div class="pre"><a id="l52" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l52" class="linenr">  52</a> </div>
<div class="pre"><a id="l53" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l53" class="linenr">  53</a> (defcustom&nbsp;iimage-mode-image-search-path&nbsp;nil</div>
<div class="pre"><a id="l54" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l54" class="linenr">  54</a> &nbsp;&nbsp;&quot;List&nbsp;of&nbsp;directories&nbsp;to&nbsp;search&nbsp;for&nbsp;image&nbsp;files&nbsp;for&nbsp;iimage-mode.&quot;</div>
<div class="pre"><a id="l55" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l55" class="linenr">  55</a> &nbsp;&nbsp;:type&nbsp;'(choice&nbsp;(const&nbsp;nil)&nbsp;(repeat&nbsp;directory))</div>
<div class="pre"><a id="l56" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l56" class="linenr">  56</a> &nbsp;&nbsp;:group&nbsp;'iimage)</div>
<div class="pre"><a id="l57" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l57" class="linenr">  57</a> </div>
<div class="pre"><a id="l58" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l58" class="linenr">  58</a> (defvar&nbsp;iimage-mode-image-filename-regex</div>
<div class="pre"><a id="l59" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l59" class="linenr">  59</a> &nbsp;&nbsp;(concat&nbsp;&quot;[-+./_0-9a-zA-Z]+\\.&quot;</div>
<div class="pre"><a id="l60" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l60" class="linenr">  60</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(regexp-opt&nbsp;(nconc&nbsp;(mapcar&nbsp;#'upcase</div>
<div class="pre"><a id="l61" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l61" class="linenr">  61</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;image-file-name-extensions)</div>
<div class="pre"><a id="l62" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l62" class="linenr">  62</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;image-file-name-extensions)</div>
<div class="pre"><a id="l63" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l63" class="linenr">  63</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t)))</div>
<div class="pre"><a id="l64" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l64" class="linenr">  64</a> </div>
<div class="pre"><a id="l65" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l65" class="linenr">  65</a> (defcustom&nbsp;iimage-mode-image-regex-alist</div>
<div class="pre"><a id="l66" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l66" class="linenr">  66</a> &nbsp;&nbsp;`((,(concat&nbsp;&quot;\\(`?file://\\|\\[\\[\\|&lt;\\|`\\)?&quot;</div>
<div class="pre"><a id="l67" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l67" class="linenr">  67</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;\\(&quot;&nbsp;iimage-mode-image-filename-regex&nbsp;&quot;\\)&quot;</div>
<div class="pre"><a id="l68" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l68" class="linenr">  68</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;\\(\\]\\]\\|&gt;\\|'\\)?&quot;)&nbsp;.&nbsp;2))</div>
<div class="pre"><a id="l69" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l69" class="linenr">  69</a> &nbsp;&nbsp;&quot;Alist&nbsp;of&nbsp;filename&nbsp;REGEXP&nbsp;vs&nbsp;NUM.</div>
<div class="pre"><a id="l70" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l70" class="linenr">  70</a> Each&nbsp;element&nbsp;looks&nbsp;like&nbsp;(REGEXP&nbsp;.&nbsp;NUM).</div>
<div class="pre"><a id="l71" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l71" class="linenr">  71</a> NUM&nbsp;specifies&nbsp;which&nbsp;parenthesized&nbsp;expression&nbsp;in&nbsp;the&nbsp;regexp.</div>
<div class="pre"><a id="l72" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l72" class="linenr">  72</a> </div>
<div class="pre"><a id="l73" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l73" class="linenr">  73</a> Examples&nbsp;of&nbsp;image&nbsp;filename&nbsp;patterns&nbsp;to&nbsp;match:</div>
<div class="pre"><a id="l74" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l74" class="linenr">  74</a> &nbsp;&nbsp;&nbsp;&nbsp;file://foo.png</div>
<div class="pre"><a id="l75" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l75" class="linenr">  75</a> &nbsp;&nbsp;&nbsp;&nbsp;`file://foo.png'</div>
<div class="pre"><a id="l76" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l76" class="linenr">  76</a> &nbsp;&nbsp;&nbsp;&nbsp;\\[\\[foo.gif]]</div>
<div class="pre"><a id="l77" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l77" class="linenr">  77</a> &nbsp;&nbsp;&nbsp;&nbsp;&lt;foo.png&gt;</div>
<div class="pre"><a id="l78" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l78" class="linenr">  78</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;foo.JPG</div>
<div class="pre"><a id="l79" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l79" class="linenr">  79</a> &quot;</div>
<div class="pre"><a id="l80" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l80" class="linenr">  80</a> &nbsp;&nbsp;:type&nbsp;'(alist&nbsp;:key-type&nbsp;regexp&nbsp;:value-type&nbsp;integer)</div>
<div class="pre"><a id="l81" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l81" class="linenr">  81</a> &nbsp;&nbsp;:group&nbsp;'iimage)</div>
<div class="pre"><a id="l82" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l82" class="linenr">  82</a> </div>
<div class="pre"><a id="l83" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l83" class="linenr">  83</a> (defvar&nbsp;iimage-mode-map</div>
<div class="pre"><a id="l84" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l84" class="linenr">  84</a> &nbsp;&nbsp;(let&nbsp;((map&nbsp;(make-sparse-keymap)))</div>
<div class="pre"><a id="l85" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l85" class="linenr">  85</a> &nbsp;&nbsp;&nbsp;&nbsp;(define-key&nbsp;map&nbsp;&quot;\C-l&quot;&nbsp;'iimage-recenter)</div>
<div class="pre"><a id="l86" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l86" class="linenr">  86</a> &nbsp;&nbsp;&nbsp;&nbsp;map)</div>
<div class="pre"><a id="l87" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l87" class="linenr">  87</a> &nbsp;&nbsp;&quot;Keymap&nbsp;used&nbsp;in&nbsp;`iimage-mode'.&quot;)</div>
<div class="pre"><a id="l88" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l88" class="linenr">  88</a> </div>
<div class="pre"><a id="l89" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l89" class="linenr">  89</a> (defun&nbsp;iimage-recenter&nbsp;(&amp;optional&nbsp;arg)</div>
<div class="pre"><a id="l90" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l90" class="linenr">  90</a> &nbsp;&nbsp;&quot;Re-draw&nbsp;images&nbsp;and&nbsp;recenter.&quot;</div>
<div class="pre"><a id="l91" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l91" class="linenr">  91</a> &nbsp;&nbsp;(interactive&nbsp;&quot;P&quot;)</div>
<div class="pre"><a id="l92" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l92" class="linenr">  92</a> &nbsp;&nbsp;(iimage-mode-buffer&nbsp;nil)</div>
<div class="pre"><a id="l93" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l93" class="linenr">  93</a> &nbsp;&nbsp;(iimage-mode-buffer&nbsp;t)</div>
<div class="pre"><a id="l94" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l94" class="linenr">  94</a> &nbsp;&nbsp;(recenter&nbsp;arg))</div>
<div class="pre"><a id="l95" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l95" class="linenr">  95</a> </div>
<div class="pre"><a id="l96" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l96" class="linenr">  96</a> ;;;###autoload</div>
<div class="pre"><a id="l97" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l97" class="linenr">  97</a> (define-obsolete-function-alias&nbsp;'turn-on-iimage-mode&nbsp;'iimage-mode&nbsp;&quot;24.1&quot;)</div>
<div class="pre"><a id="l98" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l98" class="linenr">  98</a> </div>
<div class="pre"><a id="l99" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l99" class="linenr">  99</a> (defun&nbsp;turn-off-iimage-mode&nbsp;()</div>
<div class="pre"><a id="l100" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l100" class="linenr"> 100</a> &nbsp;&nbsp;&quot;Unconditionally&nbsp;turn&nbsp;off&nbsp;iimage&nbsp;mode.&quot;</div>
<div class="pre"><a id="l101" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l101" class="linenr"> 101</a> &nbsp;&nbsp;(interactive)</div>
<div class="pre"><a id="l102" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l102" class="linenr"> 102</a> &nbsp;&nbsp;(iimage-mode&nbsp;0))</div>
<div class="pre"><a id="l103" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l103" class="linenr"> 103</a> </div>
<div class="pre"><a id="l104" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l104" class="linenr"> 104</a> (defun&nbsp;iimage-modification-hook&nbsp;(beg&nbsp;end)</div>
<div class="pre"><a id="l105" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l105" class="linenr"> 105</a> &nbsp;&nbsp;&quot;Remove&nbsp;display&nbsp;property&nbsp;if&nbsp;a&nbsp;display&nbsp;region&nbsp;is&nbsp;modified.&quot;</div>
<div class="pre"><a id="l106" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l106" class="linenr"> 106</a> &nbsp;&nbsp;;;(debug-print&nbsp;&quot;ii1&nbsp;begin&nbsp;%d,&nbsp;end&nbsp;%d\n&quot;&nbsp;beg&nbsp;end)</div>
<div class="pre"><a id="l107" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l107" class="linenr"> 107</a> &nbsp;&nbsp;(let&nbsp;((inhibit-modification-hooks&nbsp;t)</div>
<div class="pre"><a id="l108" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l108" class="linenr"> 108</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(beg&nbsp;(previous-single-property-change&nbsp;end&nbsp;'display</div>
<div class="pre"><a id="l109" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l109" class="linenr"> 109</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nil&nbsp;(line-beginning-position)))</div>
<div class="pre"><a id="l110" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l110" class="linenr"> 110</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(end&nbsp;(next-single-property-change&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;beg&nbsp;'display</div>
<div class="pre"><a id="l111" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l111" class="linenr"> 111</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nil&nbsp;(line-end-position))))</div>
<div class="pre"><a id="l112" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l112" class="linenr"> 112</a> &nbsp;&nbsp;&nbsp;&nbsp;(when&nbsp;(and&nbsp;beg&nbsp;end&nbsp;(plist-get&nbsp;(text-properties-at&nbsp;beg)&nbsp;'display))</div>
<div class="pre"><a id="l113" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l113" class="linenr"> 113</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;;;(debug-print&nbsp;&quot;ii2&nbsp;begin&nbsp;%d,&nbsp;end&nbsp;%d\n&quot;&nbsp;beg&nbsp;end)</div>
<div class="pre"><a id="l114" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l114" class="linenr"> 114</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(remove-text-properties&nbsp;beg&nbsp;end</div>
<div class="pre"><a id="l115" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l115" class="linenr"> 115</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'(display&nbsp;nil&nbsp;modification-hooks&nbsp;nil)))))</div>
<div class="pre"><a id="l116" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l116" class="linenr"> 116</a> </div>
<div class="pre"><a id="l117" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l117" class="linenr"> 117</a> (defun&nbsp;iimage-mode-buffer&nbsp;(arg)</div>
<div class="pre"><a id="l118" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l118" class="linenr"> 118</a> &nbsp;&nbsp;&quot;Display&nbsp;images&nbsp;if&nbsp;ARG&nbsp;is&nbsp;non-nil,&nbsp;undisplay&nbsp;them&nbsp;otherwise.&quot;</div>
<div class="pre"><a id="l119" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l119" class="linenr"> 119</a> &nbsp;&nbsp;(let&nbsp;((image-path&nbsp;(cons&nbsp;default-directory&nbsp;iimage-mode-image-search-path))</div>
<div class="pre"><a id="l120" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l120" class="linenr"> 120</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;file)</div>
<div class="pre"><a id="l121" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l121" class="linenr"> 121</a> &nbsp;&nbsp;&nbsp;&nbsp;(with-silent-modifications</div>
<div class="pre"><a id="l122" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l122" class="linenr"> 122</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(save-excursion</div>
<div class="pre"><a id="l123" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l123" class="linenr"> 123</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(goto-char&nbsp;(point-min))</div>
<div class="pre"><a id="l124" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l124" class="linenr"> 124</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(dolist&nbsp;(pair&nbsp;iimage-mode-image-regex-alist)</div>
<div class="pre"><a id="l125" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l125" class="linenr"> 125</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(while&nbsp;(re-search-forward&nbsp;(car&nbsp;pair)&nbsp;nil&nbsp;t)</div>
<div class="pre"><a id="l126" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l126" class="linenr"> 126</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(when&nbsp;(and&nbsp;(setq&nbsp;file&nbsp;(match-string&nbsp;(cdr&nbsp;pair)))</div>
<div class="pre"><a id="l127" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l127" class="linenr"> 127</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(setq&nbsp;file&nbsp;(locate-file&nbsp;file&nbsp;image-path)))</div>
<div class="pre"><a id="l128" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l128" class="linenr"> 128</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;;;&nbsp;FIXME:&nbsp;we&nbsp;don't&nbsp;mark&nbsp;our&nbsp;images,&nbsp;so&nbsp;we&nbsp;can't&nbsp;reliably</div>
<div class="pre"><a id="l129" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l129" class="linenr"> 129</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;;;&nbsp;remove&nbsp;them&nbsp;either&nbsp;(we&nbsp;may&nbsp;leave&nbsp;some&nbsp;of&nbsp;ours,&nbsp;and&nbsp;we</div>
<div class="pre"><a id="l130" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l130" class="linenr"> 130</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;;;&nbsp;may&nbsp;remove&nbsp;other&nbsp;packages's&nbsp;display&nbsp;properties).</div>
<div class="pre"><a id="l131" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l131" class="linenr"> 131</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(if&nbsp;arg</div>
<div class="pre"><a id="l132" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l132" class="linenr"> 132</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(add-text-properties&nbsp;(match-beginning&nbsp;0)&nbsp;(match-end&nbsp;0)</div>
<div class="pre"><a id="l133" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l133" class="linenr"> 133</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`(display&nbsp;,(create-image&nbsp;file)</div>
<div class="pre"><a id="l134" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l134" class="linenr"> 134</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;modification-hooks</div>
<div class="pre"><a id="l135" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l135" class="linenr"> 135</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(iimage-modification-hook)))</div>
<div class="pre"><a id="l136" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l136" class="linenr"> 136</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(remove-text-properties&nbsp;(match-beginning&nbsp;0)&nbsp;(match-end&nbsp;0)</div>
<div class="pre"><a id="l137" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l137" class="linenr"> 137</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'(display&nbsp;modification-hooks))))))))))</div>
<div class="pre"><a id="l138" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l138" class="linenr"> 138</a> </div>
<div class="pre"><a id="l139" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l139" class="linenr"> 139</a> ;;;###autoload</div>
<div class="pre"><a id="l140" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l140" class="linenr"> 140</a> (define-minor-mode&nbsp;iimage-mode&nbsp;nil</div>
<div class="pre"><a id="l141" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l141" class="linenr"> 141</a> &nbsp;&nbsp;:group&nbsp;'iimage&nbsp;:lighter&nbsp;&quot;&nbsp;iImg&quot;&nbsp;:keymap&nbsp;iimage-mode-map</div>
<div class="pre"><a id="l142" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l142" class="linenr"> 142</a> &nbsp;&nbsp;(iimage-mode-buffer&nbsp;iimage-mode))</div>
<div class="pre"><a id="l143" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l143" class="linenr"> 143</a> </div>
<div class="pre"><a id="l144" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l144" class="linenr"> 144</a> (provide&nbsp;'iimage)</div>
<div class="pre"><a id="l145" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l145" class="linenr"> 145</a> </div>
<div class="pre"><a id="l146" href="http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/iimage.el#l146" class="linenr"> 146</a> ;;;&nbsp;iimage.el&nbsp;ends&nbsp;here</div>
</div><div class="page_footer">
<div class="page_footer_text">Emacs repository mirror</div>
<a class="rss_logo" title="history of lisp/iimage.el RSS feed" href="http://repo.or.cz/w/emacs.git/rss?f=lisp/iimage.el">RSS</a>
<a class="rss_logo" title="history of lisp/iimage.el Atom feed" href="http://repo.or.cz/w/emacs.git/atom?f=lisp/iimage.el">Atom</a>
</div>
</body>
</html>