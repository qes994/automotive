/*!
 * A Toast Box
 * v1.1.4 ©2018 PLDaily <pcd12321@gmail.com> 
 * https://github.com/PLDaily/show-toast#readme
 */
!function(t,o){"object"==typeof exports&&"object"==typeof module?module.exports=o():"function"==typeof define&&define.amd?define([],o):"object"==typeof exports?exports.showToast=o():t.showToast=o()}("undefined"!=typeof self?self:this,function(){return function(t){function o(i){if(e[i])return e[i].exports;var r=e[i]={i:i,l:!1,exports:{}};return t[i].call(r.exports,r,r.exports,o),r.l=!0,r.exports}var e={};return o.m=t,o.c=e,o.d=function(t,e,i){o.o(t,e)||Object.defineProperty(t,e,{configurable:!1,enumerable:!0,get:i})},o.n=function(t){var e=t&&t.__esModule?function(){return t.default}:function(){return t};return o.d(e,"a",e),e},o.o=function(t,o){return Object.prototype.hasOwnProperty.call(t,o)},o.p="/",o(o.s=0)}([function(t,o,e){"use strict";var i="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},r=function(t){return"object"===(void 0===t?"undefined":i(t))&&!!t},n=function(t){return"[object String]"===Object.prototype.toString.call(t)},s=function(t){for(var o=arguments.length,e=Array(o>1?o-1:0),i=1;i<o;i++)e[i-1]=arguments[i];var r=!0,n=!1,s=void 0;try{for(var u,l=e[Symbol.iterator]();!(r=(u=l.next()).done);r=!0){var a=u.value;for(var p in a)t[p]=a[p]}}catch(t){n=!0,s=t}finally{try{!r&&l.return&&l.return()}finally{if(n)throw s}}return t},u=function(t){return t.replace(/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,"")},l={_is_load:!1,showAlertMsgBox:function(t){if(this._is_load)this.doEvent(t);else{var o=[];o.push("zIndex:9999999999"),o.push("padding:12px"),o.push("minWidth:200px"),o.push("borderRadius:5px"),o.push("lineHeight:1.2"),o.push("fontSize:12px"),o.push("color:#FFF"),o.push("boxSizing:border-box"),o.push("backgroundColor:rgba(39, 39, 39, 0.7)"),o.push("position:fixed"),o.push("left:50%"),o.push("transform:translateX(-50%)"),o.push("textAlign:center");var e=document.createDocumentFragment();this.oDiv=document.createElement("div"),this.oDiv.className="show-toast";for(var i=0,r=o.length;i<r;i++){var n=u(o[i].split(":")[0]),s=u(o[i].split(":")[1]);this.oDiv.style[n]=s}e.appendChild(this.oDiv),document.body.appendChild(e),this._is_load=!0,this.doEvent(t)}},doEvent:function(t){var o=this;this.timer&&clearTimeout(this.timer),this.timer=setTimeout(function(){o.oDiv.style.display="none",clearTimeout(o.timer),o.timer=null},t.time),this.oDiv.style.display="block",this.oDiv.innerHTML=t.str,"top"===t.position?(this.oDiv.style.top="50px",this.oDiv.style.bottom="auto",this.oDiv.style.transform="translate(-50%, 0)"):"bottom"===t.position?(this.oDiv.style.bottom="50px",this.oDiv.style.top="auto",this.oDiv.style.transform="translate(-50%, 0)"):(this.oDiv.style.top="50%",this.oDiv.style.bottom="auto",this.oDiv.style.transform="translate(-50%, -50%)")}},a=function(t){var o={};if(r(t))o=t;else{if(!n(t))throw new TypeError("Expected an object or a String");o={str:t}}o=s({str:"success",time:2e3,position:"middle"},o),l.showAlertMsgBox(o)};t.exports=a}])});