(function(){$(function(){return"placeholder"in document.createElement("input")||$("input[placeholder]").each(function(){var e;return e=$(this).attr("placeholder"),this.value===""&&(this.value=e),$(this).focus(function(){if(this.value===e)return this.value=""}).blur(function(){if($.trim(this.value)==="")return this.value=e})}),$("form").submit(function(){return $(this).find("input[placeholder]").each(function(){if(this.value===$(this).attr("placeholder"))return this.value=""})})})}).call(this);