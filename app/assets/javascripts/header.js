$(document).ready(function(){
	var navLink = document.querySelector( ".header-account-menu .header-nav-link" );
	var subNav = document.querySelector( ".header-account-menu .sub-nav" );

	navLink.addEventListener( "click", function(){
		$(subNav).toggleClass("active");
	} );
});