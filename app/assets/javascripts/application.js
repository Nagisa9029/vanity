// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs

//= require jquery
//= require bootstrap-sprockets
//= require_tree .
//= require jquery_nested_form


//= humberger

$(document).ready(function() {
  $(".drawer").drawer();
});


//= アコーディオンメニュー
$(function(){
  var DURATION = 200; //アニメーションのスピード設定
  //開閉する処理
  function accordionToggle(element){
    $(element)
      .toggleClass('is-active') //クラスの追加
      .next('.js−accordion-panel') //.js−accordion-panelを指定
      .stop().slideToggle(200, 'swing'); //スライドの処理を実行
  }

  $('.js−accordion').on('click', function(e){
    e.preventDefault();
    var self = this;
    //クリックした項目が開いていない場合
    if(!$(self).hasClass('is-active')){
      //すでに開いている項目を開閉する
      accordionToggle('.js−accordion.is-active');
    }
    //クリックされた項目の開閉を行う
    accordionToggle(self);
  });
});


//= Change header
$(document).ready(function(){
var _window = $(window),
    _header = $('.site-header'),
    headerChange = $('.header-change'),
    heroBottom;

_window.on('scroll',function(){
    heroBottom = $('.hero').height();
    if(_window.scrollTop() > heroBottom){
        headerChange.addClass('show');
    }
    else{
        headerChange.removeClass('show');
    }
});

_window.trigger('scroll');
});


//*MENU Book スライダー
$(document).ready(function() {
    /*リスト要素の順番を反転*/
    /*var li = $('#contentsList li').toArray().reverse();
    $('#contentsList').empty().append(li);*/
    /*アコーディオンの設定*/
    $("#contentsList").zAccordion({
        timeout: 10000,
        slideWidth: 460,
        width: 760,
        height: 600,
        speed: 500,
        startingSlide: 0,
        slideClass: "frame",
        slideOpenClass: "frame-open",
        slideClosedClass: "frame-closed",
        slidePreviousClass: "frame-previous",
        easing: "easeInOutCubic",
        invert: true
    });
});


/*======================================================
初期設定
======================================================*/
//ページトップボタンのdiv要素id名
var pagetopID = "pagetopBtn";
//ページトップボタンが表示されるスクロール位置
var pagetop = 50;
//スクロール停止からページトップボタンが表示されるまでの時間
var delay = 500;
//ページトップボタンが表示する速度
var showSpeed = 1000;
//ページトップボタンが隠れる速度
var hideSpeed = 100;
//スクロールの速度
var scrollSpeed = 1000;

/*======================================================
ドキュメント読み込み後の処理
======================================================*/
$(document).ready(function() {

    //選択枠を隠す
    $('a').focus(function(e){this.blur()});

    //ページトップボタンのid名に#を追加
    pagetopID = "#" + pagetopID;

    //ページトップボタンの初期設定
    $(pagetopID).rotate(180);

    //スクロール、リサイズごとに実行される処理
    function onScroll(event) {
        $(pagetopID)
            .stopTime()
            .trigger("scrollStart")
            .oneTime(delay, function(){$(this).trigger("timerFinished")});
    }

    //スクロール、リサイズイベントに関数をbind
    $(window).bind("scroll resize", onScroll);

    //ページトップボタンを表示する
    $(pagetopID).bind("timerFinished", function(event){
        if($(window).scrollTop() >= pagetop){
            $(this).addClass("show").rotate({
                duration: showSpeed,
                animateTo: 90,
                easing: $.easing.easeOutElastic,
                callback:function(){
                }
            });
        }
    });

    //ページトップボタンを隠す
    $(pagetopID).bind("scrollStart", function(event){
        if($(this).hasClass("show")){
            $(this).removeClass("show").rotate({
                duration: hideSpeed,
                animateTo: 180,
                easing: $.easing.easeOutQuart,
                callback:function(){
                }
            });
        }
    });

});

/*======================================================
辞書表示
======================================================*/
$(function(){
  $("a.open").click(function(){
    $("#floatWindow").fadeIn("fast");
    return false;
  });
  $("#floatWindow a.close").click(function(){
    $("#floatWindow").fadeOut("fast");
    return false;
  });
});






$(function(){
window.addEventListener('DOMContentLoaded', function() {
  var swiper = new Swiper('.home .swiper-container', {
    pagination: '.swiper-pagination',
    paginationClickable: true,
    nextButton: '.swiper-button-next',
    prevButton: '.swiper-button-prev',
    loop: true,
    speed: 2000,
    autoplay: 10000,
    spaceBetween: 10,
    effect: 'coverflow'
  });
}, false);
});

$(function(){
window.addEventListener('DOMContentLoaded', function() {
  var swiper = new Swiper('.sub .swiper-container', {
    pagination: '.swiper-pagination',
    paginationClickable: true,
    nextButton: '.swiper-button-next',
    prevButton: '.swiper-button-prev',
    loop: true,
    speed: 2000,
    autoplay: 5000,
    spaceBetween: 10,
    effect: 'coverflow'
  });
}, false);
});