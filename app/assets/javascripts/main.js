$(document).ready(function(){

/**
 * Character Counter for inputs and text areas
 */
$('textarea#micropost_content').each(function(){
  // max length
  var max_length = 140;
  // set max characters
	$('form.new_micropost div.counter').html( max_length + ' characters');
	// bind on key up event
	$(this).keyup(function(){
		// get new length of characters
		var new_length = max_length - $(this).val().length;
    // if max characters
    if(new_length < 0){
      new_length = 0;
      $(this).val($(this).val().substring(0, max_length));
    }
    // update
		$('form.new_micropost div.counter').html( new_length + ' characters');
  });
});

});