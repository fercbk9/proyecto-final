webpackJsonp([4],{VRu4:function(n,l,e){"use strict";Object.defineProperty(l,"__esModule",{value:!0});var t=e("WT6e"),o=function(){},u=e("7DMc"),a=e("bfOx"),i=e("aCT0"),d=function(){function n(n,l){var e=this;this.router=n,this.us=l,this.years=[],this.msj="",this.us.fechas_minimas_maximas().subscribe(function(n){var l;if(void 0!=n)if(l=new Date(n.fecha_minima),new Date(n.fecha_maxima),console.log(l),e.year_minimo=l.getFullYear(),e.year_maximo=l.getFullYear(),e.year_minimo==e.year_maximo)e.years.push(e.year_minimo);else for(var t=e.year_maximo;t>=e.year_minimo;t--)e.years.push(t);else{var o=(new Date).getFullYear();e.years.push(o)}localStorage.setItem("years",JSON.stringify(e.years))})}return n.prototype.ngOnInit=function(){},n.prototype.onLoggedin=function(){var n=this;this.us.login(this.email,this.password).subscribe(function(l){console.log(l),n.mensaje=l.user,null!=n.mensaje.email&&(localStorage.setItem("isLoggedin","true"),localStorage.setItem("token",l.token),localStorage.setItem("id",l.user.id)),n.router.navigate(["/dashboard"])},function(l){n.msj="Error en el login",document.getElementById("boton").click()})},n}(),r=t["\u0275crt"]({encapsulation:0,styles:[["[_nghost-%COMP%]{display:block}.login-page[_ngcontent-%COMP%]{position:absolute;top:0;left:0;right:0;bottom:0;overflow:auto;background:#222;text-align:center;color:#fff;padding:3em}.login-page[_ngcontent-%COMP%]   .col-lg-4[_ngcontent-%COMP%]{padding:0}.login-page[_ngcontent-%COMP%]   .input-lg[_ngcontent-%COMP%]{height:46px;padding:10px 16px;font-size:18px;line-height:1.3333333;border-radius:0}.login-page[_ngcontent-%COMP%]   .input-underline[_ngcontent-%COMP%]{background:0 0;border:none;-webkit-box-shadow:none;box-shadow:none;border-bottom:2px solid rgba(255,255,255,.5);color:#fff;border-radius:0}.login-page[_ngcontent-%COMP%]   .input-underline[_ngcontent-%COMP%]:focus{border-bottom:2px solid #fff;-webkit-box-shadow:none;box-shadow:none}.login-page[_ngcontent-%COMP%]   .rounded-btn[_ngcontent-%COMP%]{border-radius:50px;color:rgba(255,255,255,.8);background:#222;border:2px solid rgba(255,255,255,.8);font-size:18px;line-height:40px;padding:0 25px}.login-page[_ngcontent-%COMP%]   .rounded-btn[_ngcontent-%COMP%]:active, .login-page[_ngcontent-%COMP%]   .rounded-btn[_ngcontent-%COMP%]:focus, .login-page[_ngcontent-%COMP%]   .rounded-btn[_ngcontent-%COMP%]:hover, .login-page[_ngcontent-%COMP%]   .rounded-btn[_ngcontent-%COMP%]:visited{color:#fff;border:2px solid #fff;outline:0}.login-page[_ngcontent-%COMP%]   h1[_ngcontent-%COMP%]{font-weight:300;margin-top:20px;margin-bottom:10px;font-size:36px}.login-page[_ngcontent-%COMP%]   h1[_ngcontent-%COMP%]   small[_ngcontent-%COMP%]{color:rgba(255,255,255,.7)}.login-page[_ngcontent-%COMP%]   .form-group[_ngcontent-%COMP%]{padding:8px 0}.login-page[_ngcontent-%COMP%]   .form-group[_ngcontent-%COMP%]   input[_ngcontent-%COMP%]::-webkit-input-placeholder{color:rgba(255,255,255,.6)!important}.login-page[_ngcontent-%COMP%]   .form-group[_ngcontent-%COMP%]   input[_ngcontent-%COMP%]:-moz-placeholder{color:rgba(255,255,255,.6)!important}.login-page[_ngcontent-%COMP%]   .form-group[_ngcontent-%COMP%]   input[_ngcontent-%COMP%]::-moz-placeholder{color:rgba(255,255,255,.6)!important}.login-page[_ngcontent-%COMP%]   .form-group[_ngcontent-%COMP%]   input[_ngcontent-%COMP%]:-ms-input-placeholder{color:rgba(255,255,255,.6)!important}.login-page[_ngcontent-%COMP%]   .form-content[_ngcontent-%COMP%]{padding:40px 0}.login-page[_ngcontent-%COMP%]   .user-avatar[_ngcontent-%COMP%]{border-radius:50%;border:2px solid #fff}"]],data:{animation:[{type:7,name:"routerTransition",definitions:[{type:0,name:"void",styles:{type:6,styles:{},offset:null},options:void 0},{type:0,name:"*",styles:{type:6,styles:{},offset:null},options:void 0},{type:1,expr:":enter",animation:[{type:6,styles:{transform:"translateY(100%)"},offset:null},{type:4,styles:{type:6,styles:{transform:"translateY(0%)"},offset:null},timings:"0.5s ease-in-out"}],options:null},{type:1,expr:":leave",animation:[{type:6,styles:{transform:"translateY(0%)"},offset:null},{type:4,styles:{type:6,styles:{transform:"translateY(-100%)"},offset:null},timings:"0.5s ease-in-out"}],options:null}],options:{}}]}});function s(n){return t["\u0275vid"](0,[(n()(),t["\u0275eld"](0,0,null,null,47,"div",[["class","login-page"]],[[24,"@routerTransition",0]],null,null,null,null)),(n()(),t["\u0275ted"](-1,null,["\n    "])),(n()(),t["\u0275eld"](2,0,null,null,44,"div",[["class","row justify-content-md-center"]],null,null,null,null,null)),(n()(),t["\u0275ted"](-1,null,["\n        "])),(n()(),t["\u0275eld"](4,0,null,null,41,"div",[["class","col-md-4"]],null,null,null,null,null)),(n()(),t["\u0275ted"](-1,null,["\n            "])),(n()(),t["\u0275eld"](6,0,null,null,0,"img",[["class","user-avatar"],["src","assets/images/logo.png"],["width","150px"]],null,null,null,null,null)),(n()(),t["\u0275ted"](-1,null,["\n            "])),(n()(),t["\u0275eld"](8,0,null,null,1,"h1",[],null,null,null,null,null)),(n()(),t["\u0275ted"](-1,null,["Alimentaci\xf3n Pellicer"])),(n()(),t["\u0275ted"](-1,null,["\n            "])),(n()(),t["\u0275eld"](11,0,null,null,33,"form",[["novalidate",""],["role","form"]],[[2,"ng-untouched",null],[2,"ng-touched",null],[2,"ng-pristine",null],[2,"ng-dirty",null],[2,"ng-valid",null],[2,"ng-invalid",null],[2,"ng-pending",null]],[[null,"submit"],[null,"reset"]],function(n,l,e){var o=!0;return"submit"===l&&(o=!1!==t["\u0275nov"](n,13).onSubmit(e)&&o),"reset"===l&&(o=!1!==t["\u0275nov"](n,13).onReset()&&o),o},null,null)),t["\u0275did"](12,16384,null,0,u.r,[],null,null),t["\u0275did"](13,4210688,null,0,u.k,[[8,null],[8,null]],null,null),t["\u0275prd"](2048,null,u.b,null,[u.k]),t["\u0275did"](15,16384,null,0,u.j,[u.b],null,null),(n()(),t["\u0275ted"](-1,null,["\n                "])),(n()(),t["\u0275eld"](17,0,null,null,21,"div",[["class","form-content"]],null,null,null,null,null)),(n()(),t["\u0275ted"](-1,null,["\n                    "])),(n()(),t["\u0275eld"](19,0,null,null,8,"div",[["class","form-group"]],null,null,null,null,null)),(n()(),t["\u0275ted"](-1,null,["\n                        "])),(n()(),t["\u0275eld"](21,0,null,null,5,"input",[["class","form-control input-underline input-lg"],["id","u"],["name","email"],["placeholder","Email"],["type","email"]],[[2,"ng-untouched",null],[2,"ng-touched",null],[2,"ng-pristine",null],[2,"ng-dirty",null],[2,"ng-valid",null],[2,"ng-invalid",null],[2,"ng-pending",null]],[[null,"ngModelChange"],[null,"input"],[null,"blur"],[null,"compositionstart"],[null,"compositionend"]],function(n,l,e){var o=!0,u=n.component;return"input"===l&&(o=!1!==t["\u0275nov"](n,22)._handleInput(e.target.value)&&o),"blur"===l&&(o=!1!==t["\u0275nov"](n,22).onTouched()&&o),"compositionstart"===l&&(o=!1!==t["\u0275nov"](n,22)._compositionStart()&&o),"compositionend"===l&&(o=!1!==t["\u0275nov"](n,22)._compositionEnd(e.target.value)&&o),"ngModelChange"===l&&(o=!1!==(u.email=e)&&o),o},null,null)),t["\u0275did"](22,16384,null,0,u.c,[t.Renderer2,t.ElementRef,[2,u.a]],null,null),t["\u0275prd"](1024,null,u.g,function(n){return[n]},[u.c]),t["\u0275did"](24,671744,null,0,u.l,[[2,u.b],[8,null],[8,null],[2,u.g]],{name:[0,"name"],model:[1,"model"]},{update:"ngModelChange"}),t["\u0275prd"](2048,null,u.h,null,[u.l]),t["\u0275did"](26,16384,null,0,u.i,[u.h],null,null),(n()(),t["\u0275ted"](-1,null,["\n                    "])),(n()(),t["\u0275ted"](-1,null,["\n\n                    "])),(n()(),t["\u0275eld"](29,0,null,null,8,"div",[["class","form-group"]],null,null,null,null,null)),(n()(),t["\u0275ted"](-1,null,["\n                        "])),(n()(),t["\u0275eld"](31,0,null,null,5,"input",[["class","form-control input-underline input-lg"],["id","p"],["name","password"],["placeholder","Password"],["type","password"]],[[2,"ng-untouched",null],[2,"ng-touched",null],[2,"ng-pristine",null],[2,"ng-dirty",null],[2,"ng-valid",null],[2,"ng-invalid",null],[2,"ng-pending",null]],[[null,"ngModelChange"],[null,"input"],[null,"blur"],[null,"compositionstart"],[null,"compositionend"]],function(n,l,e){var o=!0,u=n.component;return"input"===l&&(o=!1!==t["\u0275nov"](n,32)._handleInput(e.target.value)&&o),"blur"===l&&(o=!1!==t["\u0275nov"](n,32).onTouched()&&o),"compositionstart"===l&&(o=!1!==t["\u0275nov"](n,32)._compositionStart()&&o),"compositionend"===l&&(o=!1!==t["\u0275nov"](n,32)._compositionEnd(e.target.value)&&o),"ngModelChange"===l&&(o=!1!==(u.password=e)&&o),o},null,null)),t["\u0275did"](32,16384,null,0,u.c,[t.Renderer2,t.ElementRef,[2,u.a]],null,null),t["\u0275prd"](1024,null,u.g,function(n){return[n]},[u.c]),t["\u0275did"](34,671744,null,0,u.l,[[2,u.b],[8,null],[8,null],[2,u.g]],{name:[0,"name"],model:[1,"model"]},{update:"ngModelChange"}),t["\u0275prd"](2048,null,u.h,null,[u.l]),t["\u0275did"](36,16384,null,0,u.i,[u.h],null,null),(n()(),t["\u0275ted"](-1,null,["\n                    "])),(n()(),t["\u0275ted"](-1,null,["\n                "])),(n()(),t["\u0275ted"](-1,null,["\n                "])),(n()(),t["\u0275eld"](40,0,null,null,1,"button",[["class","btn rounded-btn btn-block"]],null,[[null,"click"]],function(n,l,e){var t=!0;return"click"===l&&(t=!1!==n.component.onLoggedin()&&t),t},null,null)),(n()(),t["\u0275ted"](-1,null,[" Entrar "])),(n()(),t["\u0275ted"](-1,null,["\n                \xa0\n                "])),(n()(),t["\u0275ted"](-1,null,["\n\n  \n  "])),(n()(),t["\u0275ted"](-1,null,["\n\n            "])),(n()(),t["\u0275ted"](-1,null,["\n        "])),(n()(),t["\u0275ted"](-1,null,["\n    "])),(n()(),t["\u0275ted"](-1,null,["\n"])),(n()(),t["\u0275ted"](-1,null,["\n"])),(n()(),t["\u0275eld"](49,0,null,null,1,"button",[["class","btn btn-primary"],["data-target","#exampleModalLogin"],["data-toggle","modal"],["id","boton"],["type","button"]],[[8,"hidden",0]],null,null,null,null)),(n()(),t["\u0275ted"](-1,null,["\n    Launch demo modal\n  "])),(n()(),t["\u0275ted"](-1,null,["\n"])),(n()(),t["\u0275eld"](52,0,null,null,31,"div",[["aria-hidden","true"],["aria-labelledby","exampleModalLabel"],["class","modal fade"],["id","exampleModalLogin"],["role","dialog"],["tabindex","-1"]],null,null,null,null,null)),(n()(),t["\u0275ted"](-1,null,["\n    "])),(n()(),t["\u0275eld"](54,0,null,null,28,"div",[["class","modal-dialog"],["role","document"]],null,null,null,null,null)),(n()(),t["\u0275ted"](-1,null,["\n      "])),(n()(),t["\u0275eld"](56,0,null,null,25,"div",[["class","modal-content"]],null,null,null,null,null)),(n()(),t["\u0275ted"](-1,null,["\n        "])),(n()(),t["\u0275eld"](58,0,null,null,10,"div",[["class","modal-header"]],null,null,null,null,null)),(n()(),t["\u0275ted"](-1,null,["\n          "])),(n()(),t["\u0275eld"](60,0,null,null,1,"h5",[["class","modal-title"],["id","exampleModalLabel"]],null,null,null,null,null)),(n()(),t["\u0275ted"](-1,null,["Error"])),(n()(),t["\u0275ted"](-1,null,["\n          "])),(n()(),t["\u0275eld"](63,0,null,null,4,"button",[["aria-label","Close"],["class","close"],["data-dismiss","modal"],["type","button"]],null,null,null,null,null)),(n()(),t["\u0275ted"](-1,null,["\n            "])),(n()(),t["\u0275eld"](65,0,null,null,1,"span",[["aria-hidden","true"]],null,null,null,null,null)),(n()(),t["\u0275ted"](-1,null,["\xd7"])),(n()(),t["\u0275ted"](-1,null,["\n          "])),(n()(),t["\u0275ted"](-1,null,["\n        "])),(n()(),t["\u0275ted"](-1,null,["\n        "])),(n()(),t["\u0275eld"](70,0,null,null,4,"div",[["class","modal-body"]],null,null,null,null,null)),(n()(),t["\u0275ted"](-1,null,["\n          "])),(n()(),t["\u0275eld"](72,0,null,null,1,"span",[],null,null,null,null,null)),(n()(),t["\u0275ted"](73,null,["",""])),(n()(),t["\u0275ted"](-1,null,["\n        "])),(n()(),t["\u0275ted"](-1,null,["\n        "])),(n()(),t["\u0275eld"](76,0,null,null,4,"div",[["class","modal-footer"]],null,null,null,null,null)),(n()(),t["\u0275ted"](-1,null,["\n          "])),(n()(),t["\u0275eld"](78,0,null,null,1,"button",[["class","btn btn-danger"],["data-dismiss","modal"],["type","button"]],null,null,null,null,null)),(n()(),t["\u0275ted"](-1,null,["Cerrar"])),(n()(),t["\u0275ted"](-1,null,["\n          \n        "])),(n()(),t["\u0275ted"](-1,null,["\n      "])),(n()(),t["\u0275ted"](-1,null,["\n    "])),(n()(),t["\u0275ted"](-1,null,["\n  "]))],function(n,l){var e=l.component;n(l,24,0,"email",e.email),n(l,34,0,"password",e.password)},function(n,l){var e=l.component;n(l,0,0,void 0),n(l,11,0,t["\u0275nov"](l,15).ngClassUntouched,t["\u0275nov"](l,15).ngClassTouched,t["\u0275nov"](l,15).ngClassPristine,t["\u0275nov"](l,15).ngClassDirty,t["\u0275nov"](l,15).ngClassValid,t["\u0275nov"](l,15).ngClassInvalid,t["\u0275nov"](l,15).ngClassPending),n(l,21,0,t["\u0275nov"](l,26).ngClassUntouched,t["\u0275nov"](l,26).ngClassTouched,t["\u0275nov"](l,26).ngClassPristine,t["\u0275nov"](l,26).ngClassDirty,t["\u0275nov"](l,26).ngClassValid,t["\u0275nov"](l,26).ngClassInvalid,t["\u0275nov"](l,26).ngClassPending),n(l,31,0,t["\u0275nov"](l,36).ngClassUntouched,t["\u0275nov"](l,36).ngClassTouched,t["\u0275nov"](l,36).ngClassPristine,t["\u0275nov"](l,36).ngClassDirty,t["\u0275nov"](l,36).ngClassValid,t["\u0275nov"](l,36).ngClassInvalid,t["\u0275nov"](l,36).ngClassPending),n(l,49,0,!0),n(l,73,0,e.msj)})}var g=t["\u0275ccf"]("app-login",d,function(n){return t["\u0275vid"](0,[(n()(),t["\u0275eld"](0,0,null,null,1,"app-login",[],null,null,null,s,r)),t["\u0275did"](1,114688,null,0,d,[a.l,i.a],null,null)],function(n,l){n(l,1,0)},null)},{},{},[]),c=e("Xjw4"),p=function(){};e.d(l,"LoginModuleNgFactory",function(){return m});var m=t["\u0275cmf"](o,[],function(n){return t["\u0275mod"]([t["\u0275mpd"](512,t.ComponentFactoryResolver,t["\u0275CodegenComponentFactoryResolver"],[[8,[g]],[3,t.ComponentFactoryResolver],t.NgModuleRef]),t["\u0275mpd"](4608,c.m,c.l,[t.LOCALE_ID,[2,c.s]]),t["\u0275mpd"](4608,u.s,u.s,[]),t["\u0275mpd"](512,c.b,c.b,[]),t["\u0275mpd"](512,a.o,a.o,[[2,a.t],[2,a.l]]),t["\u0275mpd"](512,p,p,[]),t["\u0275mpd"](512,u.p,u.p,[]),t["\u0275mpd"](512,u.e,u.e,[]),t["\u0275mpd"](512,o,o,[]),t["\u0275mpd"](1024,a.j,function(){return[[{path:"",component:d}]]},[])])})}});