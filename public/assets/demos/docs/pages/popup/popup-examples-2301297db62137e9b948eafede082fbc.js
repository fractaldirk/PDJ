// popup examples
$(document).on("pageinit",function(){function e(e,t,n,r){var i=$(window).width()-30,s=$(window).height()-30,o=2*n,u=2*r,a=e+o+u,f=t+o+u,l,c;return a<i&&f<s?(c=a,l=f):a/i>f/s?(c=i,l=i/a*f):(l=s,c=s/f*a),{width:c-(o+u),height:l-(o+u)}}$(".photopopup").on({popupbeforeposition:function(){var e=$(window).height()-60+"px";$(".photopopup img").css("max-height",e)}}),$(".ui-popup iframe").attr("width",0).attr("height","auto"),$("#popupVideo").on({popupbeforeposition:function(){var t=e(497,298,15,1),n=t.width,r=t.height;$("#popupVideo iframe").attr("width",n).attr("height",r)},popupafterclose:function(){$("#popupVideo iframe").attr("width",0).attr("height",0)}}),$("#popupMap iframe").contents().find("#map_canvas").css({width:0,height:0}),$("#popupMap").on({popupbeforeposition:function(){var t=e(480,320,0,1),n=t.width,r=t.height;$("#popupMap iframe").attr("width",n).attr("height",r),$("#popupMap iframe").contents().find("#map_canvas").css({width:n,height:r})},popupafterclose:function(){$("#popupMap iframe").attr("width",0).attr("height",0),$("#popupMap iframe").contents().find("#map_canvas").css({width:0,height:0})}}),$("#popupPanel").on({popupbeforeposition:function(){var e=$(window).height();$("#popupPanel").css("height",e)}}),$("#popupPanel button").on("click",function(){$("#popupPanel").popup("close")})});