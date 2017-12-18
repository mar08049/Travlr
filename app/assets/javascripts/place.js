//render a index list of things page


//render show page with 'next' option



//load comments using json
$(function(){
  $("a.load_comments").on("click", function(e){
    $("a.load_comments").hide();
    $.getJSON(this.href).success(function(json){
      var $ul = $("div.comments ul")
      $ul.html("")
      json.forEach(function(comment){
        $ul.append("<li>" + comment.description + "</li>");
        $ul.append("<li>" + "-" + comment.name + "</li>" + "<br>" + "<br>");
      })
    })
    e.preventDefault();
  })
})

//create a new comment
$(function(){
  $("#new_comment").on("submit", function(e){
    url = this.action
    console.log(url)

    data = {
      'authenticity_token': $("input[name='authenticity_token']").val(), 'comment': {
        'description': $("#comment_description").val(), 'name': $("#comment_name").val()
      }
    };
    $.ajax({
      type:"POST",
      url: url,
      data: data,
      success: function(response){
        $("#comment_description").val("");
        $("#comment_name").val("");
        $("Submit").attr("disabled", false)
        var $ul = $("div.comments ul")
        $ul.append(response);
      }
    });



    e.preventDefault();
  })
});

//Create an object
class Comment{
  constructor(name, description, place_id) {
    this.name = name;
    this.description= description;
    this.place_id = place_id;
  }
}

//create a prototype
Comment.prototype.makeComment = function() {
  console.log(`${this.name}-${this.description}`);
}
