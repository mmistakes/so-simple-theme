 /*
 * +Gallery Javascript Photo gallery v0.8.5
 * http://plusgallery.net/
 *
 * Copyright 2013, Jeremiah Martin | Twitter: @jeremiahjmartin
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html

 */


$.ajaxSetup({ cache: false });
/*
SLIDEFADE
------------------------------------------------------------------------------------------------------*/

/* Custom plugin for a slide/in out animation with a fade - JJM */

(function ($) {
	$.fn.slideFade = function (speed, callback) {
		var slideSpeed;
		for (var i = 0; i < arguments.length; i++) {
			if (typeof arguments[i] == "number") {
				slideSpeed  = arguments[i];
			}
			else {
				var callBack = arguments[i];
			}
		}
		if(!slideSpeed) {
			slideSpeed = 500;
		}
		this.animate({
				opacity: 'toggle',
				height: 'toggle'
			}, slideSpeed,
			function(){
				if( typeof callBack != "function" ) { callBack = function(){}; }
				callBack.call(this);
			}
		);
  };
})( jQuery );

(function ($){
	$.fn.plusGallery = function(options){
		var lmnt = this;
		if(lmnt.length === 0) { return false; }
		var pg = {
			/*user defined Defaults*/
			imagePath: 'images/plusgallery',
			type: 'google',
			albumTitle: false, //show the album title in single album mode
			albumLimit: 16, //Limit amout of albums to load initially.
			limit: 30, //Limit of photos to load for gallery / more that 60 is dumb, separate them into different albums
			apiKey: '', //used with Flickr
			exclude: null,
			include: null,

			
			/*don't touch*/
			imgArray: [],
			titleArray: [],
			t: '', //timer
			idx: 0,
			imgCount: 0,
			imgTotal: 0,
			winWidth: 1024, //resets
			touch: false,
			titleText: '',
			
			init: function(){
				var _doc = $(document);
				//check for touch device
				if ("ontouchstart" in document.documentElement) {
					window.scrollTo(0, 1);
					pg.touch = true;
				}
				
				pg.winWidth = $(window).width();
				

				//reset some shit in case there is another copy that was loaded.
				$('#pgzoomview').remove();
				//Unbind everything first? 
				_doc.off("click", ".pgalbumlink, #pgthumbhome, .pgthumb, .pgzoomarrow, .pgzoomclose, #pgzoomview, #pgzoomslide, .pgzoomimg");


				pg.getDataAttr();
				
				pg.writeHTML();
				if(pg.albumId !== null || pg.type == 'instagram'){
					//load single Album
					pg.loadSingleAlbum();
				}
				else {
					pg.loadAlbumData();
				}
				




				//attach loadGallery to the album links
				_doc.on("click", ".pgalbumlink",function(e){
					e.preventDefault();
					$(this).append('<span class="pgloading"></span>');
					var galleryURL = this.href;
					var galleryTitle = $(this).children('span').html();
					pg.loadGallery(galleryURL,galleryTitle);
				});
				
				_doc.on("click", "#pgthumbhome",function(e){
					e.preventDefault();
					$('#pgthumbview').slideFade(700);
					$('#pgalbums').slideFade(700);
				});
				
				//attach links load detail image
				_doc.on('click','.pgthumb',function(e){
					e.preventDefault();
					var idx = $('.pgthumb').index(this);
					pg.loadZoom(idx);
				});
				
				
				/*zoom events*/
				_doc.on('click','.pgzoomarrow',function(e){
					e.preventDefault();
					var dir = this.rel;
					pg.prevNext(dir);
					return false;
				});
				
				_doc.on('click','.pgzoomclose',function(e){
					e.preventDefault();
					pg.unloadZoom();
				});
				_doc.on("click", "#pgzoomview",function(e){
					e.preventDefault();
					pg.unloadZoom();
				});
				
				
				_doc.on("click", "#pgzoomslide",function(){
					pg.unloadZoom();
				});
				
				_doc.on("click", ".pgzoomimg",function(){
					return false;
				});
				
				clearTimeout(pg.t);
			},
			
			/*--------------------------
			
				get all the user defined
				variables from the HTML element
			
			----------------------------*/
			getDataAttr: function(){
				lmnt.attr('data-userid');
				//Gallery User Id *required
				var dataAttr = lmnt.attr('data-userid');
				if(dataAttr) {
					pg.userId = dataAttr;
				}
				else {
					alert('You must enter a valid User ID');
					return false;
				}
				
				//Gallery Type *required
				dataAttr = lmnt.attr('data-type');
				if(dataAttr) {
					pg.type = dataAttr;
				}
				else {
					alert('You must enter a data type.');
					return false;
				}
				
				//Limit on the amount photos per gallery
				dataAttr = lmnt.attr('data-limit');
				if(dataAttr) {
					pg.limit = dataAttr;
				}
				
				//Limit on the amount albums
				dataAttr = lmnt.attr('data-album-limit');
				if(dataAttr) {
					pg.albumLimit = dataAttr;
				}
				
				//album id to exclude
				dataAttr = lmnt.attr('data-exclude');
				if(dataAttr) {
					pg.exclude = dataAttr.split(',');
				}

				//album ids to include
				dataAttr = lmnt.attr('data-include');
				if(dataAttr) {
					pg.include = dataAttr.split(',');
				}
				
				//Api key - used with Flickr
				dataAttr = lmnt.attr('data-api-key');
				if(dataAttr) {
					pg.apiKey = dataAttr;
				}
				
				
				//Access Token - used with instagram / Facebook
				dataAttr = lmnt.attr('data-access-token');
				if(dataAttr) {
					pg.accessToken = dataAttr;
				}
				dataAttr = lmnt.attr('data-album-id');
				if(dataAttr) {
					pg.albumId = dataAttr;
					
					//show hide the album title if we are in single gallery mode
					titleAttr = lmnt.attr('data-album-title');
					
					if(titleAttr == 'true') {
						pg.albumTitle = true;
					} else {
						pg.albumTitle = false;
					}
				}
				else {
					pg.albumTitle = true;
					pg.albumId = null;
				}
				
				dataAttr = lmnt.attr('data-credit');
				if(dataAttr == 'false') {
					pg.credit = false;
				}
				else {
					pg.credit = true;
				}

				//Image path
                dataAttr = lmnt.attr('data-image-path');
                if(dataAttr) {
                    pg.imagePath = dataAttr;
                }
			},
			
			/*--------------------------
			
				set up the initial HTML
			
			----------------------------*/
			writeHTML: function(){
        var touchClass;
				if(pg.touch){
					touchClass = 'touch';
					lmnt.addClass('touch');
				}
				else {
					touchClass = 'no-touch';
					lmnt.addClass('no-touch');
				}
				
				
				lmnt.append(
					'<ul id="pgalbums" class="clearfix"></ul>' +
					'<div id="pgthumbview">' +
						'<ul id="pgthumbs" class="clearfix"></ul>' +
					'</div>'
				);
				$('body').prepend(
					'<div id="pgzoomview" class="pg ' + touchClass + '">' +
						'<a href="#" rel="previous" id="pgzoomclose" title="Close">Close</a>' +
						'<a href="#" rel="previous" id="pgprevious" class="pgzoomarrow" title="previous">Previous</a>' +
						'<a href="#" rel="next" id="pgnext" class="pgzoomarrow" title="Next">Next</a>' +
						'<div id="pgzoomscroll">' +
							'<ul id="pgzoom"></ul>' +
						'</div>' +
					'</div>'
					);
				
				lmnt.addClass('pg');
				
				if(pg.credit === true) {
					lmnt.append('<div id="pgcredit"><a href="http://www.plusgallery.net" target="_blank" title="Powered by +GALLERY"><span>+</span>Gallery</a></div>');
				}
				
				//console.log('pg.albumTitle: ' + pg.albumTitle);
				
				if(pg.albumTitle === true) {
					$('#pgthumbview').prepend('<ul id="pgthumbcrumbs" class="clearfix"><li id="pgthumbhome">&laquo;</li></ul>');
				}
			},
			
			
			/*--------------------------
			
				Load up Album Data JSON
				before Albums
			
			----------------------------*/
			loadAlbumData: function() {
        var albumURL;
				switch(pg.type)
				{
				case 'google':
					albumURL = 'https://picasaweb.google.com/data/feed/base/user/' + pg.userId + '?alt=json&kind=album&hl=en_US&max-results=' + pg.albumLimit + '&callback=?';
					break;
				case 'flickr':
					albumURL = 'http://api.flickr.com/services/rest/?&method=flickr.photosets.getList&api_key=' + pg.apiKey + '&user_id=' + pg.userId + '&format=json&jsoncallback=?';
					break;
				case 'facebook':
					albumURL = 'https://graph.facebook.com/' + pg.userId + '/albums?limit=' + pg.albumLimit + '&access_token=' + pg.accessToken + '&callback=?';

					break;
				case 'instagram':
					//we ain't got no albums in instagram
					albumURL = null;
					break;
		
				default:
					alert('Please define a gallery type.');
				}
				
				
				
				$.getJSON(albumURL,function(json) {
						lmnt.addClass('loaded');
            var objPath,
                albumTotal,
                galleryImage,
                galleryTitle,
                galleryJSON;

						switch(pg.type)
						{
						//have to load differently for for google/facebook/flickr
						case 'google':
						
							objPath = json.feed.entry;
							albumTotal = objPath.length;
									
							if(albumTotal > pg.albumLimit) {
								albumTotal = pg.albumLimit;
							}
							
							//remove excluded galleries if there are any.
							//albumTotal = albumTotal - pg.exclude.length;
						
							
							if(albumTotal > 0){
								$.each(objPath,function(i,obj){
									//obj is entry
									if(i < albumTotal){
										galleryTitle = obj.title.$t;
                    galleryJSON = obj.link[0].href;
										galleryImage = obj.media$group.media$thumbnail[0].url;
										galleryImage = galleryImage.replace('s160','s210');
									
										pg.loadAlbums(galleryTitle,galleryImage,galleryJSON,i);
									}
			
								});
							}
							else { //else if albumTotal == 0
								alert('There are either no results for albums with this user ID or there was an error loading the data. \n' + galleryJSON);
							}
							
						break;
						case 'flickr':
							objPath = json.photosets.photoset;
							albumTotal = objPath.length;
									
							if(albumTotal > pg.albumLimit) {
								albumTotal = pg.albumLimit;
							}
									
							if(albumTotal > 0 ) {
								$.each(objPath,function(i,obj){
									//obj is entry
									if(i < albumTotal){
										galleryTitle = obj.title._content;
										galleryImage = 'http://farm' + obj.farm + '.staticflickr.com/' + obj.server + '/' + obj.primary + '_' + obj.secret + '_n.jpg';
										galleryJSON = 'http://api.flickr.com/services/rest/?&method=flickr.photosets.getPhotos&api_key=' + pg.apiKey + '&photoset_id=' + obj.id + '=&format=json&jsoncallback=?';
				
										pg.loadAlbums(galleryTitle,galleryImage,galleryJSON);
									}
								});
							}
							else { //else if albumTotal == 0
								alert('There are either no results for albums with this user ID or there was an error loading the data. \n' + galleryJSON);
							}
							
						break;
						case 'facebook':
							objPath = json.data;
							albumTotal = objPath.length;
									
							if(albumTotal > pg.albumLimit) {
								albumTotal = pg.albumLimit;
							}
									
							if(albumTotal > 0) {
								$.each(objPath,function(i,obj){
									if(i < albumTotal){
										galleryTitle = obj.name;
										galleryJSON = 'https://graph.facebook.com/' + obj.id + '/photos?limit=' + pg.limit + '&access_token=' + pg.accessToken;
										galleryImage = 'http://graph.facebook.com/' + obj.id + '/picture?type=album';
										pg.loadAlbums(galleryTitle,galleryImage,galleryJSON);
									}
									
								});
							}
							else {
								alert('There are either no results for albums with this user ID or there was an error loading the data. \n' + albumURL);
							}
							
							break;
						}
		
				});
			},
			
			
			/*--------------------------
			
				Load all albums to the page
			
			----------------------------*/
			loadAlbums: function(galleryTitle,galleryImage,galleryJSON) {
				var displayAlbum = true;
        var imgHTML;
				
				//exclude albums if pg.exclude is set
        if(pg.exclude !== null) {
          $.each(pg.exclude,function(index, value){ //exclude albums if pg.exclude is set
            if(galleryJSON.indexOf(value) > 0){
              displayAlbum = false;
            }
          });
        }


        //include only specified albums if pg.include is set
        if(pg.include !== null) {
          displayAlbum = false;
          $.each(pg.include,function(index, value){ //exclude albums if pg.exclude is set
            if(galleryJSON.indexOf(value) > 0){
              displayAlbum = true;
            }
          });
        }
																	 
																	 
				if (displayAlbum){
          if (pg.type == 'facebook' || pg.type == 'flickr') {
            imgHTML = '<img src="'+ pg.imagePath + '/square.png" style="background-image: url(' + galleryImage + ');" title="' + galleryTitle + '" title="' + galleryTitle + '" class="pgalbumimg">';
					}
					else {
            imgHTML = '<img src="' + galleryImage + '" title="' + galleryTitle + '" title="' + galleryTitle + '" class="pgalbumimg">';
					}
							
					$('#pgalbums').append(
						'<li class="pgalbumthumb">' +
							'<a href="' + galleryJSON + '" class="pgalbumlink">' + imgHTML + '<span class="pgalbumtitle">' + galleryTitle + '</span><span class="pgplus">+</span></a>' +
						'</li>'
					);
				}
				
				
					
			
			}, //End loadAlbums
			
			
			/*--------------------------
			
				Load all the images within
				a specific gallery
			
			----------------------------*/
			
			loadSingleAlbum:function(){
				var url;
				switch(pg.type)
				{
				case 'google':
					url = 'https://picasaweb.google.com/data/feed/base/user/' + pg.userId + '/albumid/' + pg.albumId + '?alt=json&hl=en_US';
					break;
				case 'flickr':
					url = 'http://api.flickr.com/services/rest/?&method=flickr.photosets.getPhotos&api_key=' + pg.apiKey + '&photoset_id=' + pg.albumId + '=&format=json&jsoncallback=?';
					break;
				case 'facebook':
					url = 'https://graph.facebook.com/' + pg.albumId + '/photos?limit=' + pg.limit + '&access_token=' + pg.accessToken;
					break;
				case 'instagram':
					url = 'https://api.instagram.com/v1/users/' + pg.userId + '/media/recent/?access_token=' + pg.accessToken + '&count=' + pg.limit;
					break;
				}
				
				pg.loadGallery(url);
				lmnt.addClass('loaded');
				$('#pgthumbhome').hide();
				
			},
			
			/*--------------------------
			
				Load all the images within
				a specific gallery
			
			----------------------------*/
			loadGallery: function(url,title){
				var obPath,
						imgTitle,
						imgSrc,
						imgTh,
						imgBg = '',
            thumbsLoaded = 0,
            zoomWidth,
            flickrImgExt;

				pg.imgArray = [];
				pg.titleArray = [];
				$('#pgzoom').empty();
				$.ajax({
					url: url,
					cache: false,
					dataType: "jsonp",
					success: function(json){
						$('.crumbtitle').remove();
						$('#pgthumbs').empty();
						if(title === undefined){
							title = '&nbsp;';
						}
						$('#pgthumbcrumbs').append('<li class="crumbtitle">' + title + '</li>');
					
						switch(pg.type)
						{
						case 'google':
							objPath = json.feed.entry;
							break;
						case 'flickr':
							objPath = json.photoset.photo;
							break;
						case 'facebook':
							objPath = json.data;
							break;
						case 'instagram':
							objPath = json.data;
							break;
						}
						
										
						pg.imgTotal = objPath.length;
						//limit the results
						if(pg.limit < pg.imgTotal){
							pg.imgTotal = pg.limit;
						}
						
						if(pg.imgTotal === 0) {
							alert('Please check your photo permissions,\nor make sure there are photos in this gallery.');
						}

						if(pg.winWidth > 1100) {
              zoomWidth = 1024;
							flickrImgExt = '_b';
						} else if(pg.winWidth > 620) {
							zoomWidth = 768;
							flickrImgExt = '_b';
						} else {
							zoomWidth = 540;
							flickrImgExt = '_z';
						}


						$.each(objPath,function(i,obj){
							//limit the results
							
							if(i < pg.limit) {
								switch(pg.type)
								{
								case 'google':
									imgTitle = obj.title.$t;
									imgSrc = obj.media$group.media$content[0].url;
									var lastSlash = imgSrc.lastIndexOf('/');
									var imgSrcSubString =imgSrc.substring(lastSlash);
									
									//show the max width image 1024 in this case
									imgSrc = imgSrc.replace(imgSrcSubString, '/s' + zoomWidth + imgSrcSubString);
									
									imgTh = obj.media$group.media$thumbnail[1].url;
									imgTh = imgTh.replace('s144','s160-c');
									break;
								case 'flickr':
									imgTitle = obj.title;
									imgSrc = 'http://farm' + obj.farm + '.staticflickr.com/' + obj.server + '/' + obj.id + '_' + obj.secret + flickrImgExt + '.jpg';
									imgTh = 'http://farm' + obj.farm + '.staticflickr.com/' + obj.server + '/' + obj.id + '_' + obj.secret + '_q.jpg';
									break;
								case 'facebook':
									imgTitle = obj.name;
									imgSrc = obj.images[1].source;
									imgTh = pg.imagePath + '/square.png';
									imgBg = ' style="background: url(' + obj.images[3].source + ') no-repeat 50% 50%; background-size: cover;"';
									break;
								case 'instagram':
									if(obj.caption !== null){
										imgTitle = obj.caption.text;
									}
									imgSrc = obj.images.standard_resolution.url;
									imgTh = obj.images.low_resolution.url;
									break;
								}

								
								if(!imgTitle) {
									imgTitle = '';
								}
										
								pg.imgArray[i] = imgSrc;
								pg.titleArray[i] = imgTitle;
								
								$('#pgthumbs').append('<li class="pgthumb"><a href="' + imgSrc + '"><img src="' + imgTh + '" id="pgthumbimg' + i + '" class="pgthumbimg" alt="' + imgTitle + '" title="' + imgTitle + '"' + imgBg + '></a></li>');
								
								//check to make sure all the images are loaded and if so show the thumbs
								$('#pgthumbimg' + i).load(function(){
									thumbsLoaded++;
									if(thumbsLoaded == pg.imgTotal) {
										$('#pgalbums').slideFade(700,function(){
										$('.pgalbumthumb .pgloading').remove();
									});
									$('#pgthumbview').slideFade(700);
									}
							});
							} //end if(i < pg.limit)
						}); //end each
					}, //end success
					error: function(jqXHR, textStatus, errorThrown){
						console.log('Error: \njqXHR:' + jqXHR + '\ntextStatus: ' + textStatus + '\nerrorThrown: '  + errorThrown);
					}
				});
			}, //End loadGallery
			
			zoomIdx: null, //the zoom index
			zoomImagesLoaded: [],
			zoomScrollDir: null,
			zoomScrollLeft: 0,
			loadZoom: function(idx){
				pg.zoomIdx = idx;
				pg.winWidth = $(window).width();
				var pgZoomView = $('#pgzoomview'),
						pgZoomScroll = $('#pgzoomscroll'),
						pgPrevious = $('#pgprevious'),
						pgNext = $('#pgnext'),
						pgZoom = $('#pgzoom'),
						pgZoomHTML = '',
						totalImages = pg.imgArray.length;
				pgZoomView.addClass('fixed');
				
				//show/hide the prev/next links
				if(idx === 0) {
					pgPrevious.hide();
				}
				
				if(idx == totalImages - 1) {
					pgNext.hide();
				}
		
				var pgzoomWidth = pg.imgArray.length * pg.winWidth;
				$('#pgzoom').width(pgzoomWidth);
				
				var scrollLeftInt = parseInt(idx * pg.winWidth);
				
					
				pgZoomView.fadeIn(function(){
					//this has gotta come in after the fade or iOS blows up.
					
					$(window).on('resize',pg.resizeZoom);
					
					$.each(pg.imgArray,function(i){
						pgZoomHTML = pgZoomHTML  + '<li class="pgzoomslide loading" id="pgzoomslide' + i + '" style="width: ' + pg.winWidth + 'px;"><div class="pgzoomspacer"></div><span class="pgzoomcaption">' + pg.titleArray[i] + '</span></li>';
		
						if(i + 1 == pg.imgArray.length) {
							//at the end of the loop
								$('#pgzoom').html(pgZoomHTML);
								
								pg.zoomKeyPress();
								$('#pgzoomscroll').scrollLeft(scrollLeftInt);
								pg.zoomScrollLeft = scrollLeftInt;
								pg.loadZoomImg(idx);
								pg.zoomScroll();
								//load siblings
								if((idx - 1) >= 0){
								pg.loadZoomImg(idx - 1);
								}
								
								if((idx + 1) < pg.imgArray.length){
									pg.loadZoomImg(idx + 1);
								}
							}
						});
					});
			},
			
			
			loadZoomImg:function(idx){
				if($('#pgzoomimg' + idx).length === 0){
					$('#pgzoomslide' + idx + ' .pgzoomspacer').after('<img src="' + pg.imgArray[idx] + '" data-src="' + pg.imgArray[idx] + '" title="' + pg.titleArray[idx] + '" alt="' + pg.titleArray[idx] + '" id="pgzoomimg' + idx + '" class="pgzoomimg">');
					$('#pgzoomimg' + idx).load(function(){
						$(this).addClass('active');
					});
				}
			},
			
			zoomScroll:function(){
				var pgPrevious = $('#pgprevious'),
						pgNext = $('#pgnext'),
						scrollTimeout,
						canLoadZoom = true;
						
		
				$('#pgzoomscroll').on('scroll',function(){
					currentScrollLeft = $(this).scrollLeft();
					if(canLoadZoom === true) {
						canLoadZoom = false;
						scrollTimeout = setTimeout(function(){
							if(currentScrollLeft === 0){
								pgPrevious.fadeOut();
							}
							else {
								pgPrevious.fadeIn();
							}
							
							if(currentScrollLeft >= (pg.imgTotal - 1) * pg.winWidth){
							pgNext.fadeOut();
							}
							else {
								pgNext.fadeIn();
							}
							
							/*Check if we have scrolled left and if so load up the zoom image*/
							if(currentScrollLeft % pg.zoomScrollLeft > 20 || (currentScrollLeft > 0 && pg.zoomScrollLeft === 0)){
								pg.zoomScrollLeft = currentScrollLeft;
								var currentIdx = pg.zoomScrollLeft / pg.winWidth;
								
								var currentIdxCeil = Math.ceil(currentIdx);
								var currentIdxFloor = Math.floor(currentIdx);
								
								//Lazy load siblings on scroll.
								if(!pg.zoomImagesLoaded[currentIdxCeil]) {
									pg.loadZoomImg(currentIdxCeil);
								}
								if(!pg.zoomImagesLoaded[currentIdxFloor]){
									pg.loadZoomImg(currentIdxFloor);
								}
							}
							canLoadZoom = true;
						},200);
					}
				});
			},
			
			zoomKeyPress: function(){
				$(document).on('keyup','body',function(e){
					if(e.which == 27){
						pg.unloadZoom();
					}
					else
					if(e.which == 37){
						pg.prevNext('previous');
					}
					else
					if(e.which == 39){
						pg.prevNext('next');
					}
				});
			},
			
			resizeZoom: function(){
				pg.winWidth = $(window).width();
				var pgzoomWidth = pg.imgArray.length * pg.winWidth;
				$('#pgzoom').width(pgzoomWidth);
				$('.pgzoomslide').width(pg.winWidth);
				
				var scrollLeftInt = parseInt(pg.zoomIdx * pg.winWidth);
				
				$('#pgzoomscroll').scrollLeft(scrollLeftInt);
			},
			
			unloadZoom: function(){
				$(document).off('keyup','body');
				$(window).off('resize',pg.resizeZoom);
				$('#pgzoomscroll').off('scroll');
				$('#pgzoomview').fadeOut(function(){
					$('#pgzoom').empty();
					$('#pgzoomview').off('keyup');
					$('#pgzoomview').removeClass('fixed');
				});
					
			},
			
			prevNext: function(dir){
				var currentIdx = $('#pgzoomscroll').scrollLeft() / pg.winWidth;
				
				if(dir == "previous"){
					pg.zoomIdx = Math.round(currentIdx)  - 1;
				}
				else {
					pg.zoomIdx = Math.round(currentIdx) + 1;
				}
				
				var newScrollLeft = pg.zoomIdx * pg.winWidth;
				
				$('#pgzoomscroll').stop().animate({scrollLeft:newScrollLeft});
			}
		};
		
		$.extend(pg, options);
		pg.init();
	};
})( jQuery );




















