$(document).ready(function() {
	$("#search").click(searchForm);
	$("#recipe_search").submit(searchRecipe)
});

function searchForm(event){
	event.preventDefault();
	var url = $(this).attr("href");
	$.get(url,function(response){
		$(".container").html(response);
		$("#recipe_search").submit(searchRecipe);
	})
}

function searchRecipe(event){
	if ($("#recipe_search input").val() == ""){
		alert("fill out the form");
		return false;
	}else{
		event.preventDefault();
		var url = $(this).attr("action");
		var data = $(this).serialize();
		$.post(url, data, function(response){
			$(".container").html(response);
			$(".store_recipe").submit(addRecipe);
		});
	};
}

function addRecipe(event){
	event.preventDefault();
	var url = $(this).attr("action");
	var data = $(this).serialize();
	$.post(url, data, function(response){
		$(".container").html(response);
	});
}