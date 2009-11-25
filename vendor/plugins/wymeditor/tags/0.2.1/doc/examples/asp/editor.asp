﻿<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
 * WYMeditor : what you see is What You Mean web-based editor
 * Copyright (C) 2006 Jean-François Hovinne - Daniel Reszka
 * Use of WYMeditor is granted by the terms of the MIT License (http://www.opensource.org/licenses/mit-license.php).
 *
 * For further information visit:
 * 		http://www.wymeditor.org/
 *
 * File Name:
 *		editor.asp
 *		Main editor container. ASP example.
 *		See the documentation for more info.
 *
 * File Authors:
 * 		Jean-François Hovinne (jf.hovinne@wymeditor.org)
-->

<html>
<head>
<title>WYMeditor</title>
<link rel="stylesheet" type="text/css" href="skins/editor-skin.css" />
<script type="text/javascript" src="util.js"></script>
<script type="text/javascript" src="config.js"></script>
<script type="text/javascript" src="wym.js"></script>
</head>

<body class="editor" onload="init();" onfocusout="bCleanPaste=false;displayPasteCleanup(true)">
<div id="topdiv">

<div id="header">
<a href="http://www.wymeditor.org/"><img id="logo-main" src="images/wym-editor.png" width="127" height="19" alt="WYMeditor logo" /></a>
</div>

<form method="post" action="action.asp">

<!-- caretpos keeps cursor position -->
<input type="hidden" name="caretpos" id="caretpos" value="0" />

	<!-- for debugging purposes -->
	<div id="m_debug">
	<a id="m_remove_attrs" title="Remove all attributes from selected element (for debugging purposes)" href="#" onclick="removeAttrs();getCleanHTML()">Remove All Attributes</a>
	<a id="m_cursor_pos" title="Get cursor position (for debugging purposes)" href="#" onclick="window.status=getCaretPos()">Cursor Position</a>
	<a id="m_selected_element" title="Get selected element (for debugging purposes)" href="#" onclick="window.status=selectedId()">Selected Element</a>
	</div>


<div id="toolbars">

 	<!-- basic commands -->
	<div id="m_basic">
	<a id="m_strong" title="Strong" href="#" onclick="execCommand('Bold');getCleanHTML()">Strong</a>
	<a id="m_italic" title="Italics" href="#" onclick="execCommand('Italic');getCleanHTML()">Italic</a>
	<a id="m_sup" title="Supercript" href="#" onclick="execCommand('Superscript');getCleanHTML()">Superscript</a>
	<a id="m_sub" title="Subscript" href="#" onclick="execCommand('Subscript');getCleanHTML()">Subscript</a>
	<!-- we must remove class attribute before converting from P to OL or UL -->
	<a id="m_ordered_list" title="Ordered list" href="#" onclick="removeClassAttr();execCommand('InsertOrderedList');getCleanHTML()">Ordered List</a>
	<a id="m_unordered_list" title="Unordered list" href="#" onclick="removeClassAttr();execCommand('InsertUnorderedList');getCleanHTML()">Unordered List</a>
	</div>

	<!-- objects : link, image, table -->
	<div id="m_objects">
	<a id="m_link" title="Create link" href="#" onclick="openDialog('link');getCleanHTML()">Link</a>
	<a id="m_unlink" title="Unlink" href="#" onclick="execCommand('Unlink');getCleanHTML()">Unlink</a>
	<a id="m_image" title="Insert image" href="#" onclick="openDialog('image');getCleanHTML()">Image</a>
	<a id="m_table" title="Insert table" href="#" onclick="openDialog('table');getCleanHTML()">Table</a>
	</div>

	<!-- table : advanced commands -->
	<div id="m_table_advanced">
	<a id="m_table_insert_row_after" title="Insert new row after current row" href="#" onclick="table_insertObject('ROW',false);getCleanHTML()">Insert Row After</a>
	<a id="m_table_insert_row_before" title="Insert new row before current row" href="#" onclick="table_insertObject('ROW',true);getCleanHTML()">Insert Row Before</a>
	<a id="m_table_insert_col_after" title="Insert new column after current column" href="#" onclick="table_insertObject('COL',false);getCleanHTML()">Insert Col After</a>
	<a id="m_table_insert_col_before" title="Insert new column before current column" href="#" onclick="table_insertObject('COL',true);getCleanHTML()">Insert Col Before</a>
	<a id="m_table_delete_row" title="Delete current row" href="#" onclick="table_deleteObject('ROW');getCleanHTML()">Delete Row</a>
	<a id="m_table_delete_col" title="Delete current column" href="#" onclick="table_deleteObject('COL');getCleanHTML()">Delete Col</a>
	</div>

	<!-- advanced commands  -->
	<div id="m_advanced">
	<a id="m_html" title="View source code" href="#" onclick="getCleanHTML();htmlVisible()">Show / Hide HTML</a>
	<a id="m_preview" title="Open preview" href="#" onclick="openPreview()">Preview</a>
	</div>
</div>

<div id="panels">
	<!-- containers (h1..h6, pre, ...) -->
	<div id="m_containers">
	<h2>Containers</h2>
	<a id="m_paragraph" href="#" onclick="setContainer('P');getCleanHTML()">Paragraph</a>
	<a id="m_h1" href="#" onclick="setContainer('H1');getCleanHTML()">Heading 1</a>
	<a id="m_h2" href="#" onclick="setContainer('H2');getCleanHTML()">Heading 2</a>
	<a id="m_h3" href="#" onclick="setContainer('H3');getCleanHTML()">Heading 3</a>
	<a id="m_h4" href="#" onclick="setContainer('H4');getCleanHTML()">Heading 4</a>
	<a id="m_h5" href="#" onclick="setContainer('H5');getCleanHTML()">Heading 5</a>
	<a id="m_h6" href="#" onclick="setContainer('H6');getCleanHTML()">Heading 6</a>
	<a id="m_pre" href="#" onclick="setContainer('PRE');getCleanHTML()">Preformatted</a>
	<a id="m_blockquote" href="#" onclick="setContainer('BLOCKQUOTE');getCleanHTML()">Blockquote</a>
	</div>

	<!-- classes : setClass(class name,list of allowed containers,list of conflicting classes) -->
	<div id="m_class">
	<h2>Classes</h2>
	<a id="m_remove_class" href="#" onclick="removeClassAttr();getCleanHTML();displayClasses()">Remove Classes</a>
	<h3>Common</h3>
	<a href="#" name="hidden-note" onclick="setClass('hidden-note','*','*');getCleanHTML()">note (hidden)</a>
	<h3>Paragraph</h3>
	<a href="#" name="important" onclick="setClass('important','P','*');getCleanHTML()">important</a>
	<a href="#" name="date" onclick="setClass('date','P,DIV','*');getCleanHTML()">date</a>
	<a href="#" name="block" onclick="setClass('block','P,DIV','*');getCleanHTML()">side block</a>
	<h3>Image</h3>
	<a href="#" name="border" onclick="setClass('border','IMG','');getCleanHTML()">border</a>
	</div>

	<!-- custom panel -->
	<div id="m_custom">
	<h2>Special</h2>
	<a href="#" title="Insert WYMeditor's description" onclick="insertAtCursor(custom_values['wym_editor_description']);getCleanHTML()">Insert WYMeditor's description</a>
	<a href="#" title="Insert template" onclick="openDialog('template');getCleanHTML()">Insert template</a>
	</div>
	
	<!-- miscellaneous -->
	<div id="m_misc">
	<h2>Info</h2>
	Copy-Paste clean up:<span id="m_paste_cleanup_flag_on">ON</span><span id="m_paste_cleanup_flag_off">OFF</span>
	</div>
</div>

<!-- the editor - saveCaret saves cursor position - setImgEvent handles click on images -->
<div contentEditable name="editor" id="editor"
	onbeforedeactivate="saveCaret()"
	onkeyup="saveCaret();displayClasses()"
	onclick="saveCaret();release();setImgEvent();displayClasses()"
	oncopy="bCleanPaste=true;displayPasteCleanup(false)"
	oncut="bCleanPaste=true;displayPasteCleanup(false)"
	onbeforepaste="event.returnValue=false"
	onpaste="pasteData()"
	ondrop="event.returnValue=false"
	onresizestart="event.returnValue=false">

<h1>WYMeditor</h1>
<h2>What is WYMeditor ?</h2>
<p><strong>WYMeditor</strong> is a web-based <acronym title="What You See Is What You Mean">WYSIWYM</acronym> editor.</p>
<p class="block"><strong>WYMeditor</strong>'s main concept is to leave details of the document's visual layout, and to concentrate on its structure and meaning, while trying to give the user as much comfort as possible (at least as <acronym title="What You See Is What You Get">WYSIWYG</acronym> editors).</p>
<p><strong>WYMeditor</strong> has been created to generate a perfectly structured <acronym title="eXtensible HyperText Markup Language">XHTML</acronym> code, to conform to the W3C specifications and to facilitate further processing by modern applications.</p>
<p>With <strong>WYMeditor</strong>, the code can't be contaminated by visual informations like font styles and weights, borders, colors, ...<br />
The end-user defines content meaning ; this will then determine its rendering. The result is easy and quick maintenance of the information.</p>
<p>As the code is compliant to W3C specifications, you can for example process it using a <acronym title="eXtensible Stylesheet Language Transformation">XSLT</acronym> (at the client or the server side), giving you a wide range of applications.</p>

<p><strong>WYMeditor</strong> is released under the <a href="http://www.opensource.org/licenses/mit-license.php" title="About the M.I.T. license">Open Source MIT license</a> and is maintained by <a href="http://www.hovinne.com/" title="Jean-François Hovinne">Jean-François Hovinne</a> and <a href="http://www.pixarea.com/" title="Daniel Reszka">Daniel Reszka</a>. If you want to contribute, don't hesitate to <a href="http://www.wymeditor.org/" title="WYMeditor website">contact us</a>.</p>
<p>Our goal is to create a XHTML web-based editor which will be usable on many platforms, with the help of the Open Source Community.</p>
<p>WYMeditor has been initially created to be part of our own CMS, <a href="http://www.wymsite.org" title="WYMsite project homepage">WYMsite</a>, a XML-based Content Management System which tries to be easy to use and at the same time to conform to the W3C recommendations.</p>

<p>
<a href="http://sourceforge.net" title="SourceForge website"><img src="http://sourceforge.net/sflogo.php?group_id=148869&amp;type=1" width="88" height="31" border="0" alt="SourceForge.net Logo" id="sourceforge-logo" /></a>
</p>

</div>

<!-- html value -->
<textarea name="txthtml" id="txthtml" cols="100" rows="20" onkeyup="setHTML()" style="display:none"></textarea>

<br />
<input type="submit" onclick="getCleanHTML()" />
</form>

</div>
</body>
</html>
