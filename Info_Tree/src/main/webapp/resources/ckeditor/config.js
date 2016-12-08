/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	 config.uiColor = '#AADC6E';
	 config.language = 'kr';
	 
   
	    
	    //font config
	    config.font_defaultLabel = '굴림';
	    config.font_names = '굴림/굴림;Apple SD 산돌고딕 Neo/Apple SD 산돌고딕 Neo;나눔고딕/나눔고딕;나눔명조/나눔명조;Gungsuh/Gungsuh;Arial/Arial;Tahoma/Tahoma;Verdana/Verdana';
	    
	    config.toolbar_MyToolBar =
	    	[
	    	        ['Source'],
	    	    ['Cut','Copy','Paste','PasteText','PasteFromWord','-','SpellChecker', 'Scayt'],
	    	    ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],                
	    	    '/',
	    	    ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
	    	    ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote','CreateDiv'],
	    	    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
	    	    ['Link','Unlink','Anchor'],
	    	    ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar'],
	    	    '/',
	    	    ['Styles','Format','Font','FontSize'],
	    	    ['TextColor','BGColor'],
	    	    ['Maximize','-','About']
	    	];

	    	config.toolbar = 'MyToolBar';
	    
};
